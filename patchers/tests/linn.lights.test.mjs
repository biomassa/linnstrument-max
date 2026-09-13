// Tests for patchers/linn.lights.js outside Max. Run: node patchers/tests/linn.lights.test.mjs
import { readFileSync, writeFileSync, mkdtempSync, mkdirSync, readdirSync, existsSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = readFileSync(new URL("../linn.lights.js", import.meta.url), "utf8");
const SCL = fileURLToPath(new URL("../SCL/", import.meta.url));

// --- stand-ins for Max's JS objects ---

class File {
	constructor(path, mode) {
		this.path = path;
		this.mode = mode;
		this.buf = "";
		if (mode === "write") {
			// like Max's File: an existing file keeps its bytes past what is written, unless eof is set
			try { this.old = readFileSync(path, "utf8"); } catch { this.old = ""; }
			this.position = 0;
			this.eof = this.old.length;
			this.isopen = true;
			return;
		}
		try {
			this.lines = readFileSync(path, "utf8").split("\n");
			if (this.lines.at(-1) === "") this.lines.pop();
			this.isopen = true;
		} catch {
			this.isopen = false;
		}
		this.position = 0;
		this.eof = this.isopen ? this.lines.length : 0;
	}
	readline() { return this.lines[this.position++]; }
	writestring(s) { this.buf += s; this.position += s.length; this.eof = Math.max(this.eof, this.position); }
	close() {
		if (this.mode === "write") writeFileSync(this.path, (this.buf + this.old.slice(this.buf.length)).slice(0, this.eof));
		this.isopen = false;
	}
}

class Folder {
	constructor(dir) {
		try { this.names = readdirSync(dir).sort(); } catch { this.names = []; }
		this.i = 0;
		this.typelist = [];
	}
	get end() { return this.i >= this.names.length; }
	get filename() { return this.names[this.i]; }
	next() { this.i++; }
	close() {}
}

class Dict {
	static all = new Map();
	constructor(name) {
		if (!Dict.all.has(name)) Dict.all.set(name, new Map());
		this.m = Dict.all.get(name);
	}
	contains(k) { return this.m.has(k); }
	get(k) { return this.m.get(k); }
	set(k, v) { this.m.set(k, v); }
	clear() { this.m.clear(); }
	getkeys() { const k = [...this.m.keys()]; return k.length === 0 ? null : k.length === 1 ? k[0] : k; } // as Max's
}

// a fake scheduler: tasks run when the test advances time
function scheduler() {
	let now = 0;
	const pending = [];
	class Task {
		constructor(fn, obj) { this.fn = fn; this.obj = obj; this.at = null; this.interval = 0; this.repeating = false; }
		schedule(ms = 0) { this.at = now + ms; this.repeating = false; add(this); }
		repeat() { this.at = now + this.interval; this.repeating = true; add(this); }
		cancel() { this.at = null; this.repeating = false; }
	}
	const add = (t) => { if (!pending.includes(t)) pending.push(t); };
	// run everything due within ms of simulated time
	const advance = (ms) => {
		const end = now + ms;
		for (;;) {
			const due = pending.filter((t) => t.at !== null && t.at <= end).sort((a, b) => a.at - b.at)[0];
			if (!due) break;
			now = due.at;
			if (due.repeating) due.at = now + Math.max(1, due.interval);
			else { due.at = null; pending.splice(pending.indexOf(due), 1); }
			due.fn.call(due.obj);
		}
		now = end;
	};
	return { Task, advance };
}

// a fake LinnStrument: answers NRPN 299 queries from its state and applies NRPN writes
function device(state) {
	const cc = { msb: 0, lsb: 0, vmsb: 0 };
	let buf = [];
	const written = [];
	return {
		state,
		written,
		bytes(b, reply) {
			buf.push(b);
			if (buf.length < 3) return;
			const [s, n, v] = buf;
			buf = [];
			if ((s & 0xf0) !== 0xb0) return;
			if (n === 99) cc.msb = v;
			else if (n === 98) cc.lsb = v;
			else if (n === 6) cc.vmsb = v;
			else if (n === 38) {
				const p = (cc.msb << 7) | cc.lsb, val = (cc.vmsb << 7) | v;
				if (p === 299) {
					if (val in state) {
						const x = state[val];
						[[0xb0, 99, val >> 7], [0xb0, 98, val & 127], [0xb0, 6, x >> 7], [0xb0, 38, x & 127]].forEach((m) => m.forEach(reply));
					}
				} else {
					state[p] = val;
					written.push([p, val]);
				}
			}
		},
	};
}

function load(devState, filepath) {
	Dict.all = new Map(); // each test starts with an empty linn.lights.settings
	const out = [];
	const status = [];
	const posts = [];
	const { Task, advance } = scheduler();
	// a project folder with patchers/ and reference/backups/, as in the repo
	const root = mkdtempSync(join(tmpdir(), "linnlights-"));
	const dir = join(root, "reference", "backups");
	mkdirSync(dir, { recursive: true });
	const ctx = { inlet: 0, File, Folder, Dict, Task, posts, post: (s) => posts.push(s), outlet: null, patcher: { filepath: filepath ?? join(root, "patchers", "linn.lights.maxpat") } };
	const dev = devState ? device({ ...devState }) : null; // own copy: sends change the device state
	const reply = (b) => { ctx.inlet = 1; ctx.msg_int(b); };
	ctx.outlet = (i, ...a) => {
		if (i === 0) { out.push(a[0]); if (dev) dev.bytes(a[0], reply); }
		else status.push(a.flat());
	};
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	const msg = (name, ...args) => { ctx.inlet = 0; ctx[name](...args); };
	return { ctx, out, status, posts, advance, msg, dir, dev };
}

// arrays made inside the vm context have another Array prototype; copy them for deepEqual
const plain = (x) => JSON.parse(JSON.stringify(x));
// group raw bytes into 3-byte CC messages
const ccs = (bytes) => { const r = []; for (let i = 0; i + 2 < bytes.length; i += 3) r.push(bytes.slice(i, i + 3)); return r; };
const nrpn = (p, v) => [[0xb0, 99, p >> 7], [0xb0, 98, p & 127], [0xb0, 6, v >> 7], [0xb0, 38, v & 127], [0xb0, 101, 127], [0xb0, 100, 127]];
const has = (list, seq) => {
	const a = list.map((m) => m.join(" ")), b = seq.map((m) => m.join(" "));
	for (let i = 0; i + b.length <= a.length; i++) if (b.every((x, j) => a[i + j] === x)) return i;
	return -1;
};

let t;

// NRPN encoding: six CCs on channel 1, as linnkit sends
t = load();
assert.deepEqual(plain(t.ctx.nrpnBytes(263, 12)), nrpn(263, 12).flat());

// readable parameters: both splits, without the query and the silent sequencer actions
t = load();
const readable = t.ctx.readableParams();
assert.equal(readable.length, 197);
assert.ok(!readable.includes(299) && !readable.includes(62) && readable.includes(19) && readable.includes(119) && readable.includes(263));

// rows: root 60 on row 4, column 1, moved to fit MIDI 0..127 (linnkit layout.RootLow)
t = load();
assert.deepEqual(plain(t.ctx.rowStarts(5)), [45, 50, 55, 60, 65, 70, 75, 80]);
assert.deepEqual(plain(t.ctx.rowStarts(13)), [12, 25, 38, 51, 64, 77, 90, 103]); // 21 + 115 > 127, so low = 127 - 115
assert.deepEqual(plain(t.ctx.rowStarts(25)), [0, 25, 50, 75, 100, 125, 150, 175]); // cannot fit: low stays >= 0

// a relative path, as the scale menu sends with the prefix SCL/, is read from the patcher's folder
t = load();
{
	const scl = join(t.dir, "..", "..", "patchers", "SCL");
	mkdirSync(scl, { recursive: true });
	writeFileSync(join(scl, "31-edo.scl"), readFileSync(SCL + "31-edo.scl"));
	t.msg("scale", "SCL/31-edo.scl");
	assert.deepEqual(t.status[0], ["scale", "31-edo.scl", 31]);
}

// the backup folder: reference/backups/ in the repo, else the patch's folder, else none (never saved)
assert.equal(load(null, "/Volumes/x/stuff/linn.lights.maxpat").ctx.backupDir(), "/Volumes/x/stuff/");
t = load(null, "");
assert.equal(t.ctx.backupDir(), "");
assert.equal(t.ctx.hasBackup(), false);
assert.equal(t.ctx.writeJSON("lights-slot2.json", {}), false);
assert.ok(t.status.some((m) => m[0] === "error" && String(m[1]).includes("save the patch")));

// scale settings: defaults per scale, changes remembered per scale in the dict
t = load();
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.slice(0, 5), [["scale", "31-edo.scl", 31], ["scheme", "root"], ["offset", 10], ["rootcolor", "magenta"], ["bend", 48]]); // 10: linnkit's best
t.msg("offset", 12);
t.msg("scale", SCL + "ji_7.scl");
t.status.length = 0;
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.find((m) => m[0] === "offset"), ["offset", 12]);

// root scheme: pads that play degree 0 are lit, everything else off
t = load();
t.msg("scale", SCL + "31-edo.scl");
t.msg("offset", 13);
const surf = t.ctx.surface();
assert.equal(surf[3][9], 6); // offset 13 shifts the rows to fit: row 4 starts at 51, so MIDI 60 (root, magenta) is column 10
let lit = 0;
const rows = t.ctx.rowStarts(13);
for (let r = 0; r < 8; r++) for (let c = 1; c <= 25; c++) {
	const note = rows[r] + c - 1;
	const want = note >= 0 && note <= 127 && (((note - 60) % 31) + 31) % 31 === 0 ? 6 : 0;
	assert.equal(surf[r][c - 1], want, `row ${r + 1} col ${c}`);
	lit += want ? 1 : 0;
}
assert.ok(lit > 0);

// sendlights: slot 2 selected, 200 pads column by column, then CC23 2; nothing else
t = load({});
t.msg("scale", SCL + "31-edo.scl");
t.msg("offset", 13);
t.msg("sendlights");
t.advance(5000);
let sent = ccs(t.out);
assert.equal(has(sent, nrpn(247, 11)), 0);
const pads = sent.slice(6, 6 + 600);
for (let col = 1, i = 0; col <= 25; col++) for (let row = 0; row < 8; row++, i += 3) {
	assert.deepEqual(pads[i], [0xb0, 20, col]);
	assert.deepEqual(pads[i + 1], [0xb0, 21, row]);
	assert.deepEqual(pads[i + 2], [0xb0, 22, surf[row][col - 1]]);
}
assert.deepEqual(sent[606], [0xb0, 23, 2]);
assert.ok(sent.filter((m) => m[1] === 23).every((m) => m[2] === 2), "CC23 only to slot 2");
assert.ok(!t.dev.written.some(([p]) => p === 227 || p === 19), "lights only: no rows, no bend");
assert.ok(t.status.some((m) => m[0] === "verified"), "readback verifies the slot");

// send: automatic backup first, then Bend Range, rows, lights; readback verifies
const full = {};
for (const p of load().ctx.readableParams()) full[p] = 0;
Object.assign(full, { 19: 24, 119: 24, 227: 5, 247: 1 });
t = load(full);
t.msg("scale", SCL + "31-edo.scl");
t.msg("offset", 13);
t.msg("send");
t.advance(20000);
assert.deepEqual(readdirSync(t.dir).filter((f) => f !== "lights-slot2.json"), ["backup.json"], "one backup file");
const snap = JSON.parse(readFileSync(join(t.dir, "backup.json"), "utf8"));
assert.equal(Object.keys(snap.values).length, 197);
assert.equal(snap.values["19"], 24);
assert.equal(t.dev.state[19], 48);
assert.equal(t.dev.state[119], 48);
assert.equal(t.dev.state[227], 13);
assert.deepEqual([263, 264, 265, 266, 267, 268, 269, 270].map((p) => t.dev.state[p]), [12, 25, 38, 51, 64, 77, 90, 103]);
assert.equal(t.dev.state[247], 11);
sent = ccs(t.out);
assert.ok(has(sent, nrpn(19, 48)) < has(sent, nrpn(227, 13)) && has(sent, nrpn(227, 13)) < has(sent, nrpn(247, 11)), "bend, rows, then lights");
assert.ok(t.status.some((m) => m[0] === "verified"));
// MIDI setup (on by default), both splits, as linnkit's "configure MIDI": Channel Per Note, main channel 1,
// per-note channels 2-16, X/Y/Z on, Y = CC74, Z = channel pressure; checked by the readback too
for (const base of [0, 100]) {
	const at = (p) => t.dev.state[base + p];
	assert.deepEqual([at(0), at(1), at(2)], [1, 1, 0], `split ${base}: mode, main channel, channel 1 off`);
	for (let ch = 2; ch <= 16; ch++) assert.equal(at(1 + ch), 1, `split ${base}: channel ${ch} per note`);
	assert.deepEqual([at(20), at(24), at(39), at(25), at(27), at(28)], [1, 1, 2, 74, 1, 1], `split ${base}: X/Y/Z`);
}
assert.ok(has(sent, nrpn(0, 1)) < has(sent, nrpn(19, 48)), "MIDI setup before the Bend Range");
// midisetup 0: send leaves the MIDI mode and channels alone
t = load(full);
t.msg("scale", SCL + "31-edo.scl");
t.msg("midisetup", 0);
t.msg("send");
t.advance(20000);
assert.ok(!t.dev.written.some(([p]) => p === 0 || p === 100 || p === 39), "no MIDI setup written");
assert.equal(t.dev.state[19], 48);

// restore: writes back only values that differ, never actions; then CC23 on the showing slot
t = load(full);
t.msg("scale", SCL + "31-edo.scl");
t.msg("midisetup", 0); // keeps the list of changed settings short
t.msg("send");
t.advance(20000);
t.out.length = 0;
t.dev.written.length = 0;
t.msg("restore");
t.advance(20000);
assert.deepEqual(t.dev.written.map(([p, v]) => `${p}=${v}`).sort(), ["119=24", "19=24", "227=5", "247=1", "263=0", "264=0", "265=0", "266=0", "267=0", "268=0", "269=0", "270=0"].sort(),
	"restore: " + JSON.stringify(t.status.slice(-3)) + " " + t.posts.join(""));
assert.ok(!t.dev.written.some(([p]) => [234, 243, 245, 62, 63, 64, 65, 66].includes(p)));
assert.ok(t.status.some((m) => m[0] === "restored"));

// no answer (device asleep): backup reports it and send stops before writing
t = load();
t.msg("scale", SCL + "31-edo.scl");
t.msg("send");
t.advance(20000);
assert.ok(t.status.some((m) => m[0] === "error"));
assert.ok(!ccs(t.out).some((m) => m[1] === 22), "no lights sent without a backup");

// status reports a stuck job; reset clears it (queue, readback, pending timers) so nothing fires later
t = load(); // no device: the backup waits for replies that never come
t.msg("scale", SCL + "31-edo.scl");
t.msg("backup");
t.advance(100);
t.status.length = 0;
t.msg("status");
let st = t.status.find((m) => m[0] === "state");
assert.equal(st[1], 1, "busy while the queries go out");
assert.ok(st[2] > 0, "queries still queued");
t.advance(3000); // queries sent; now waiting for the readback timeout
t.status.length = 0;
t.msg("status");
st = t.status.find((m) => m[0] === "state");
assert.deepEqual([st[1], st[2], st[3], st[4]], [1, 0, "0/197", 1], "waiting on one timer for 197 replies");
t.status.length = 0;
t.msg("reset");
t.advance(20000);
assert.deepEqual(t.status.find((m) => m[0] === "state"), ["state", 0, 0, "-", 0]);
assert.ok(!t.status.some((m) => m[0] === "error"), "the cancelled job reports nothing afterwards");
t.msg("backup"); // usable again after reset
t.advance(100);
t.status.length = 0;
t.msg("status");
assert.equal(t.status.find((m) => m[0] === "state")[1], 1);

// --- slot 2 light pattern: recorded when painted, kept in backups, repainted by restore ---

const padCCs = (sent) => sent.filter((m) => m[1] === 20 || m[1] === 21 || m[1] === 22);
// the 25 x 8 colors in the order they were sent (column by column), as [row][col-1]
const painted = (sent) => {
	const p = padCCs(sent);
	const s = Array.from({ length: 8 }, () => new Array(25).fill(null));
	for (let i = 0; i + 2 < p.length; i += 3) s[p[i + 1][2]][p[i][2] - 1] = p[i + 2][2];
	return s;
};

// sendlights records the pattern; a backup carries it
t = load(full);
t.msg("scale", SCL + "31-edo.scl");
const r31 = plain(t.ctx.surface());
t.msg("sendlights");
t.advance(5000);
const rec = JSON.parse(readFileSync(join(t.dir, "lights-slot2.json"), "utf8"));
assert.deepEqual(rec.pattern, r31);
assert.equal(rec.slot, 2);
assert.equal(rec.scale, "31-edo.scl");
t.msg("backup");
t.advance(20000);
assert.deepEqual(JSON.parse(readFileSync(join(t.dir, "backup.json"), "utf8")).lights.pattern, r31);

// send (22edo) keeps the existing backup and paints another pattern; restore repaints the 31-edo one
t.msg("scale", SCL + "22edo.scl");
t.msg("send");
t.advance(20000);
assert.notDeepEqual(JSON.parse(readFileSync(join(t.dir, "lights-slot2.json"), "utf8")).pattern, r31);
assert.ok(t.status.some((m) => m[0] === "backup" && m[1] === "kept"), "send keeps the first backup");
t.out.length = 0;
t.msg("restore");
t.advance(30000);
sent = ccs(t.out);
assert.ok(has(sent, nrpn(247, 11)) >= 0, "slot 2 shown for painting");
assert.deepEqual(painted(sent), r31, "restore repaints the recorded 31-edo pattern");
const cc23 = sent.filter((m) => m[1] === 23).map((m) => m[2]);
assert.equal(cc23[0], 2, "the repaint is saved to slot 2");
assert.ok(cc23.every((v) => v === 2), "nothing saved to slots 0 or 1");
assert.deepEqual(JSON.parse(readFileSync(join(t.dir, "lights-slot2.json"), "utf8")).pattern, r31, "record follows the restore");
assert.ok(t.status.some((m) => m[0] === "restored"));

// a backup taken while slot 1 was showing: paint slot 2, then show slot 1 again
t = load(full);
t.msg("scale", SCL + "31-edo.scl");
const vals = {};
for (const p of t.ctx.readableParams()) vals[p] = full[p];
vals[247] = 10; // custom slot 1 showing
const p1 = join(t.dir, "2099-01-01T00-00-00.json");
writeFileSync(p1, JSON.stringify({ taken: "x", values: vals, lights: { slot: 2, pattern: r31 } }));
t.dev.state[247] = 11;
t.msg("restore", p1);
t.advance(30000);
sent = ccs(t.out);
assert.deepEqual(painted(sent), r31);
const i11 = has(sent, nrpn(247, 11)), i2 = sent.findIndex((m) => m[1] === 23 && m[2] === 2);
assert.ok(i11 >= 0 && i2 > i11, "show slot 2, paint, save to slot 2");
assert.ok(has(sent.slice(i2), nrpn(247, 10)) >= 0, "then slot 1 shown again");
assert.equal(t.dev.state[247], 10);
assert.ok(!sent.some((m) => m[1] === 23 && m[2] === 0), "slot 0 never saved");

// a backup without a pattern (linnkit's, or older): slot 2 untouched, and a console note
t = load(full);
t.msg("scale", SCL + "31-edo.scl");
const p2 = join(t.dir, "2099-01-01T00-00-01.json");
writeFileSync(p2, JSON.stringify({ taken: "x", values: vals }));
t.msg("restore", p2);
t.advance(30000);
assert.equal(padCCs(ccs(t.out)).length, 0, "no light messages");
assert.ok(t.status.some((m) => m[0] === "lights" && String(m[1]).includes("not in this backup")));

// a shorter rewrite leaves no tail of the older file (Max's File keeps it unless eof is cut)
t = load();
const rw = join(t.dir, "rewrite.json");
t.ctx.writeJSON(rw, { pattern: "x".repeat(200), restored: "/a/long/path/to/backup.json" });
t.ctx.writeJSON(rw, { pattern: "x" });
assert.deepEqual(JSON.parse(readFileSync(rw, "utf8")), { pattern: "x" });

// the record file is never taken for the newest backup
t = load(full);
t.msg("scale", SCL + "31-edo.scl");
t.msg("sendlights");
t.advance(5000);
t.msg("restore"); // no backups yet, only lights-slot2.json
t.advance(1000);
assert.ok(t.status.some((m) => m[0] === "error" && String(m[1]).includes("no backups")));

// --- light schemes, checked pad by pad against grids printed by linnkit (fixtures/linnkit-grids) ---

const FIX = fileURLToPath(new URL("./fixtures/linnkit-grids/", import.meta.url));
// labels as linnkit's text grid prints them: "." only for unlit pads without a label, "!!" outside MIDI 0..127
const printed = (labels, colors) => labels.map((row, r) => row.map((l, c) => (l === "" && colors[r][c] === 0 ? "." : l)));
// linnkit's grid labels -> CC22 colors, per scheme (cmd/linnkit/grid.go, lights/schemes.go)
const labelColor = {
	root: (l) => (l === "R" ? 6 : 0),
	ji: (l) => ({ R: 6, 3: 8, 5: 3, 7: 5, 11: 9, 13: 2 })[l] ?? 0,
	names: (l) => (l === "." || l === "!!" ? 0 : l === "C" ? 6 : l.endsWith("#") ? 5 : l.endsWith("b") ? 3 : 8),
	mos: (l) => ({ R: 6, o: 8 })[l] ?? 0,
};
const fixtures = readFileSync(join(FIX, "README.txt"), "utf8").split("\n").filter((l) => l.startsWith("linnkit grid"));
assert.equal(fixtures.length, 45);
for (const line of fixtures) {
	const [cmd, file] = line.split(/\s+>\s+/);
	const args = cmd.split(/\s+/).slice(2);
	const opt = { offset: 0, scheme: "ji", root: 60, limit: 7 };
	for (let i = 0; i < args.length - 1; i += 2) opt[args[i].slice(1)] = isNaN(args[i + 1]) ? args[i + 1] : Number(args[i + 1]);
	const scl = args[args.length - 1];
	const grid = readFileSync(join(FIX, file.trim()), "utf8").split("\n").filter((l) => /^row \d/.test(l));
	assert.equal(grid.length, 8, file);
	const want = Array.from({ length: 8 }, () => []);
	const wantLabels = Array.from({ length: 8 }, () => []);
	for (const l of grid) {
		const cells = l.split(/\s+/).filter(Boolean);
		want[Number(cells[1]) - 1] = cells.slice(2).map(labelColor[opt.scheme]);
		wantLabels[Number(cells[1]) - 1] = cells.slice(2);
	}
	t = load();
	t.msg("scale", SCL + scl);
	t.msg("root", opt.root);
	t.msg("offset", opt.offset);
	t.msg("limit", opt.limit);
	t.msg("scheme", opt.scheme);
	assert.deepEqual(plain(t.ctx.surface()), want, `${file}: ${cmd}`);
	const colors = plain(t.ctx.surface());
	assert.deepEqual(printed(plain(t.ctx.labelSurface()), colors), wantLabels, `${file} labels`);
}

// the scheme menu accepts linnkit's 13; others are refused
t = load();
t.msg("scale", SCL + "31-edo.scl");
for (const s of ["root", "ji", "names", "mos", "chain", "moskeys", "wijmenga", "kite", "factors", "steps", "nested", "consonance", "harmonics"]) {
	t.msg("scheme", s);
	assert.deepEqual(t.status.filter((m) => m[0] === "scheme").at(-1), ["scheme", s]);
}
t.msg("scheme", "palette");
assert.ok(t.status.some((m) => m[0] === "error" && String(m[1]).includes("palette")));

// root, limit and refhz are stored per scale, with linnkit's defaults (root 60, limit 7, 12-TET pitch)
t = load();
t.msg("scale", SCL + "22edo.scl");
assert.deepEqual(["limit", "root", "refhz"].map((k) => t.status.find((m) => m[0] === k)), [["limit", 7], ["root", 60], ["refhz", 0]]);
t.msg("root", 62);
t.msg("limit", 11);
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.filter((m) => m[0] === "root").at(-1), ["root", 60]);
t.status.length = 0;
t.msg("scale", SCL + "22edo.scl");
assert.deepEqual(["limit", "root"].map((k) => t.status.find((m) => m[0] === k)), [["limit", 11], ["root", 62]]);

// tuning goes to linn.retune: root and its frequency (12-TET pitch unless refhz is set)
t = load();
t.msg("scale", SCL + "22edo.scl");
t.status.length = 0;
t.msg("root", 62);
let tu = t.status.filter((m) => m[0] === "tuning").at(-1);
assert.equal(tu[1], 62);
assert.ok(Math.abs(tu[2] - 440 * 2 ** (-7 / 12)) < 1e-6, `root 62 at ${tu[2]} Hz`);
t.msg("refhz", 290);
tu = t.status.filter((m) => m[0] === "tuning").at(-1);
assert.deepEqual([tu[1], tu[2]], [62, 290]);
t.status.length = 0;
t.msg("scale", SCL + "31-edo.scl"); // every scale change sends its tuning too
assert.deepEqual(t.status.filter((m) => m[0] === "tuning").at(-1), ["tuning", 60, 440 * 2 ** (-9 / 12)]);

// offsetinfo: the row interval in cents and the simplest nearby ratio (linnkit's candidate column)
t = load();
t.msg("scale", SCL + "22edo.scl");
t.msg("offset", 9);
assert.deepEqual(t.status.filter((m) => m[0] === "offsetinfo").at(-1), ["offsetinfo", "9 steps = 491 c ~4/3"]);
t.msg("offset", 7);
assert.deepEqual(t.status.filter((m) => m[0] === "offsetinfo").at(-1), ["offsetinfo", "7 steps = 382 c ~5/4"]);
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.filter((m) => m[0] === "offsetinfo").at(-1), ["offsetinfo", "10 steps = 387 c ~5/4"]); // 31-EDO's default: linnkit's best
t.msg("offset", 1);
assert.deepEqual(t.status.filter((m) => m[0] === "offsetinfo").at(-1), ["offsetinfo", "1 steps = 39 c ~34/33"]); // as linnkit's candidate list

// legend: what the colors mean, per scheme
t = load();
t.msg("scale", SCL + "31-edo.scl");
t.msg("scheme", "mos");
assert.ok(String(t.status.filter((m) => m[0] === "legend").at(-1)[1]).includes("7 notes, generator 18"));

// one backup file: send makes it only when missing; 'backup' overwrites it on purpose
t = load(full);
t.msg("scale", SCL + "31-edo.scl");
t.msg("send"); // no backup yet: makes it (the device has Bend Range 24)
t.advance(20000);
assert.equal(JSON.parse(readFileSync(join(t.dir, "backup.json"), "utf8")).values["19"], 24);
t.msg("send"); // the device now has 48; the backup still holds the original 24
t.advance(20000);
assert.equal(JSON.parse(readFileSync(join(t.dir, "backup.json"), "utf8")).values["19"], 24);
t.msg("backup"); // explicit backup: new baseline
t.advance(20000);
assert.equal(JSON.parse(readFileSync(join(t.dir, "backup.json"), "utf8")).values["19"], 48);
assert.deepEqual(readdirSync(t.dir).sort(), ["backup.json", "lights-slot2.json"]);

// preview: colors, labels and notes of all pads for linn.preview, sent with every change to the pattern
t = load();
t.msg("scale", SCL + "31-edo.scl");
t.msg("offset", 13);
let pv = JSON.parse(t.status.filter((m) => m[0] === "preview").at(-1)[1]);
assert.deepEqual(pv.colors, plain(t.ctx.surface()));
assert.deepEqual(pv.labels, plain(t.ctx.labelSurface()));
assert.deepEqual(pv.notes[3].slice(0, 3), [51, 52, 53]); // row 4 starts at 51 (offset 13)
assert.equal(pv.labels[3][9], "R"); // middle C
t.msg("scheme", "names");
pv = JSON.parse(t.status.filter((m) => m[0] === "preview").at(-1)[1]);
assert.equal(pv.labels[3][9], "C");
for (const [k, v] of [["offset", 10], ["limit", 5], ["root", 62], ["rootcolor", "red"]]) {
	t.status.length = 0;
	t.msg(k, v);
	assert.ok(t.status.some((m) => m[0] === "preview"), `preview after ${k}`);
}
t.status.length = 0;
t.msg("bend", 24); // Bend Range doesn't change the pattern
assert.ok(!t.status.some((m) => m[0] === "preview"));

// --- row offsets ranked like linnkit (fixtures/linnkit-candidates: linnkit grid --top 25) ---

const CAND = fileURLToPath(new URL("./fixtures/linnkit-candidates/", import.meta.url));
// numbers printed as Go's %.Nf does. Both round the exact binary value correctly; they differ only when
// that value is exactly halfway: Go goes to the even digit (5.625 -> "5.62"), toFixed goes up ("5.63")
const exactHalf = (x, d) => {
	// x = m * 2^e exactly; halfway means x * 10^d * 2 is an odd integer
	const view = new DataView(new ArrayBuffer(8));
	view.setFloat64(0, x);
	const bits = view.getBigUint64(0);
	const expBits = Number((bits >> 52n) & 0x7ffn);
	let m = bits & ((1n << 52n) - 1n);
	let e = -1074;
	if (expBits !== 0) {
		m |= 1n << 52n;
		e = expBits - 1075;
	}
	let n = m * 10n ** BigInt(d) * 2n;
	if (e >= 0) n <<= BigInt(e);
	else {
		const k = 1n << BigInt(-e);
		if (n % k !== 0n) return false;
		n /= k;
	}
	return n % 2n === 1n;
};
const goFixed = (x, d) => {
	if (!exactHalf(x, d)) return x.toFixed(d);
	const lo = Math.floor(x * 10 ** d);
	return ((lo % 2 === 0 ? lo : lo + 1) / 10 ** d).toFixed(d);
};
const candLines = readFileSync(join(CAND, "README.txt"), "utf8").split("\n").filter((l) => l.startsWith("linnkit grid"));
assert.equal(candLines.length, 11);
for (const line of candLines) {
	const [cmd, file] = line.split(/\s+>\s+/);
	const args = cmd.split(/\s+/);
	const rootAt = args.indexOf("--root");
	const rootNote = rootAt > 0 ? Number(args[rootAt + 1]) : 60;
	// "  +10   387 c ~5/4    3.03     2.0 cols    +1 cols, 3 rows   yes   2.47   [tags]"
	const want = readFileSync(join(CAND, file.trim()), "utf8").split("\n")
		.map((l) => l.match(/^\s+\+(\d+)\s+(\d+) c(?: ~(\d+\/\d+))?\s+([\d.]+)\s+(-1|[\d.]+)(?: cols)?\s+([+-]?\d+) cols, (\d+) rows\s+(yes|no)\s+([\d.]+)/))
		.filter(Boolean)
		.map((m) => [Number(m[1]), m[2], m[3] || "", m[4], m[5], Number(m[6]), Number(m[7]), m[8], m[9]]);
	assert.equal(want.length, 25, file);
	t = load();
	t.msg("scale", SCL + args.at(-1));
	const got = plain(t.ctx.candidates(rootNote)).map((c) => [
		c.offset, goFixed(c.cents, 0), c.ratio ? c.ratio.join("/") : "", goFixed(c.periods, 2),
		c.span < 0 ? "-1" : goFixed(c.span, 1), c.move[0], c.move[1], c.fits ? "yes" : "no", goFixed(c.score, 2),
	]);
	assert.deepEqual(got, want, `${file}: ${cmd}`);
}

// a scale with no stored offset starts on the best one; the menu lists all 25, best first, and shows the current one
t = load();
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.filter((m) => m[0] === "offset").at(-1), ["offset", 10]); // linnkit's best for 31-EDO at root 60
const menu = t.status.filter((m) => m[0] === "offsetmenu");
assert.deepEqual(menu[0], ["offsetmenu", "clear"]);
assert.equal(menu.length, 26);
assert.deepEqual(menu[1], ["offsetmenu", "append", "+10  387 c ~5/4"]);
assert.ok(menu.some((m) => m[2] === "+16  619 c ~10/7  (doesn't fit)"));
assert.deepEqual(t.status.filter((m) => m[0] === "offsetindex").at(-1), ["offsetindex", 0]);
// picking the 9th item (+13, the fourth) sets the offset and puts the root back on row 4
t.msg("low", 30);
t.status.length = 0;
t.msg("offsetpick", 8);
assert.deepEqual(t.status.filter((m) => m[0] === "offset").at(-1), ["offset", 13]);
assert.deepEqual(t.status.filter((m) => m[0] === "low").at(-1), ["low", -1]);
assert.deepEqual(t.status.filter((m) => m[0] === "offsetindex").at(-1), ["offsetindex", 8]);
// a stored offset stays; a new root re-ranks (which offsets fit changes)
t.msg("scale", SCL + "22edo.scl");
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.filter((m) => m[0] === "offset").at(-1), ["offset", 13]);
t.status.length = 0;
t.msg("root", 110);
assert.equal(t.status.filter((m) => m[0] === "offsetmenu").length, 26);

// --- every scale's settings as one block (lightsstate out, state in) for a [pattr] ---

const lastBlock = (t) => JSON.parse(t.status.filter((m) => m[0] === "lightsstate").at(-1)[1]);
t = load();
t.msg("scale", SCL + "31-edo.scl");
t.msg("offset", 10);
t.msg("scale", SCL + "22edo.scl");
t.msg("limit", 11);
let block = lastBlock(t); // after each change: all scales, as stored
assert.deepEqual(Object.keys(block).sort(), ["22edo.scl", "31-edo.scl"]);
assert.equal(block["31-edo.scl"].offset, 10);
assert.equal(block["22edo.scl"].limit, 11);
// the block restored (load or preset): every scale replaced, the current scale shown again
block["22edo.scl"].offset = 8;
block["31-edo.scl"].offset = 12;
t.status.length = 0;
t.msg("state", JSON.stringify(block));
assert.deepEqual(t.status.find((m) => m[0] === "offset"), ["offset", 8]);
assert.ok(t.status.some((m) => m[0] === "preview"));
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.filter((m) => m[0] === "offset").at(-1), ["offset", 12]);
// a scale missing from the block goes back to its defaults
t.msg("state", JSON.stringify({ "22edo.scl": block["22edo.scl"] }));
assert.deepEqual(t.status.filter((m) => m[0] === "offset").at(-1), ["offset", 10]); // linnkit's best for 31-EDO
// our own block coming back from [pattr] is ignored (no second dump)
t.msg("offset", 11);
const own = t.status.filter((m) => m[0] === "lightsstate").at(-1)[1];
t.status.length = 0;
t.msg("state", own);
assert.equal(t.status.length, 0);
// a broken block is refused and changes nothing
t.msg("state", "{not json");
assert.ok(t.status.some((m) => m[0] === "error" && String(m[1]).includes("settings block")));
assert.deepEqual(t.status.filter((m) => m[0] === "offset"), []);
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.filter((m) => m[0] === "offset").at(-1), ["offset", 11]);

// --- the schemes in docs/light-schemes.md, checked pad by pad (labels and CC22 colours) and by legend ---

// a grid file with CC colours: 8 label rows, the legend, then 8 CC22 rows; rows indexed row - 1
function readGrid(path) {
	const lines = readFileSync(path, "utf8").split("\n");
	const rows = lines.filter((l) => /^row \d/.test(l));
	assert.equal(rows.length, 16, path);
	const labels = [];
	const colors = [];
	// "row N  " then 25 fixed-width cells: a lit pad without a label is a blank cell
	rows.forEach((l, i) => {
		const w = (l.length - 7) / 25;
		assert.ok(Number.isInteger(w), `${path}: cell width`);
		const cells = Array.from({ length: 25 }, (_, c) => l.slice(7 + c * w, 7 + (c + 1) * w).trim());
		if (i < 8) labels[Number(l[4]) - 1] = cells;
		else colors[Number(l[4]) - 1] = cells.map(Number);
	});
	return [labels, colors, lines[lines.indexOf(rows[7]) + 1]];
}
const lastLegend = (t) => t.status.filter((m) => m[0] === "legend").at(-1)[1];

// linnkit grid -cc on the scales in SCL/ at our default offsets, and variants (fixtures/linnkit-grids-more)
const MORE = fileURLToPath(new URL("./fixtures/linnkit-grids-more/", import.meta.url));
const moreLines = readFileSync(join(MORE, "README.txt"), "utf8").split("\n").filter((l) => l.startsWith("linnkit grid"));
assert.equal(moreLines.length, 105);
for (const line of moreLines) {
	const [cmd, file] = line.split(/\s+>\s+/);
	const args = cmd.split(/\s+/).slice(2);
	const opt = {};
	for (let i = 0; i < args.length - 1; i += 2) opt[args[i].slice(1)] = isNaN(args[i + 1]) ? args[i + 1] : Number(args[i + 1]);
	const [wantLabels, wantColors, wantLegend] = readGrid(join(MORE, file.trim()));
	t = load();
	t.msg("scale", SCL + args.at(-1));
	// low after offset: a new offset resets it
	for (const k of ["root", "offset", "limit", "generator", "mossize", "harmonics", "subharmonics", "low", "scheme"]) if (k in opt) t.msg(k, opt[k]);
	const colors = plain(t.ctx.surface());
	assert.deepEqual(colors, wantColors, `${file} colours: ${cmd}`);
	assert.deepEqual(printed(plain(t.ctx.labelSurface()), colors), wantLabels, `${file} labels`);
	assert.equal(lastLegend(t), wantLegend, `${file} legend`);
}

// linnkit's own goldens (internal/lights/testdata/more): rows +5 degrees, bottom-left MIDI 48, root 60,
// default settings; 12edo and 53edo .scl written as linnkit's test makes them
const GOLD = fileURLToPath(new URL("./fixtures/linnkit-goldens/", import.meta.url));
const golds = readdirSync(GOLD).filter((f) => f.endsWith(".txt"));
assert.equal(golds.length, 54);
for (const file of golds) {
	const [name, scheme] = file.replace(/\.txt$/, "").split(".");
	const [wantLabels, wantColors, wantLegend] = readGrid(join(GOLD, file));
	t = load();
	t.msg("scale", (existsSync(join(GOLD, name + ".scl")) ? GOLD : SCL) + name + ".scl");
	t.msg("scheme", scheme);
	const sw = plain(t.ctx.swatches(t.ctx.settings()));
	const n = sw.length;
	const pads = Array.from({ length: 8 }, (_, r) => Array.from({ length: 25 }, (_, c) => sw[(((48 + 5 * r + c - 60) % n) + n) % n]));
	const colors = pads.map((row) => row.map((p) => p[0]));
	assert.deepEqual(colors, wantColors, `${file} colours`);
	assert.deepEqual(printed(pads.map((row) => row.map((p) => p[1])), colors), wantLabels, `${file} labels`);
	assert.equal(lastLegend(t), wantLegend, `${file} legend`);
}

// generator, mossize, harmonics and subharmonics are stored per scale; harmonics takes 16 or 32 only
t = load();
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(
	["generator", "mossize", "harmonics", "subharmonics"].map((k) => t.status.find((m) => m[0] === k)),
	[["generator", 0], ["mossize", 0], ["harmonics", 16], ["subharmonics", 1]]
);
t.msg("scheme", "moskeys");
t.msg("generator", 2);
t.msg("mossize", 16);
assert.equal(lastLegend(t), "R root  white MOS (16 notes, generator 2)  blue other");
t.msg("harmonics", 20);
assert.ok(t.status.some((m) => m[0] === "error" && String(m[1]).includes("16 or 32")));
t.msg("scale", SCL + "22edo.scl");
assert.deepEqual(t.status.filter((m) => m[0] === "generator").at(-1), ["generator", 0]);
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.filter((m) => m[0] === "mossize").at(-1), ["mossize", 16]);
// the generator wraps mod n: 49 in 31-EDO is 18
t.msg("scheme", "chain");
t.msg("generator", 49);
assert.ok(lastLegend(t).endsWith("(generator 18)"));

// low: the bottom-left pad's note, per scale (default -1 = root on row 4); rows start there and follow
// the offset; a new offset resets it; send writes those rows
t = load();
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.find((m) => m[0] === "low"), ["low", -1]);
t.msg("offset", 13); // before low: a new offset resets low
t.msg("low", 40);
let lowPv = JSON.parse(t.status.filter((m) => m[0] === "preview").at(-1)[1]);
assert.deepEqual(lowPv.notes.map((r) => r[0]), [40, 53, 66, 79, 92, 105, 118, 131]);
assert.equal(lowPv.labels[7][24], "!!"); // 131 + 24: above MIDI 127
t.msg("root", 62); // the rows stay; the root's colour moves
assert.deepEqual(JSON.parse(t.status.filter((m) => m[0] === "preview").at(-1)[1]).notes[0][0], 40);
t.msg("scale", SCL + "22edo.scl");
assert.deepEqual(t.status.filter((m) => m[0] === "low").at(-1), ["low", -1]);
t.msg("scale", SCL + "31-edo.scl");
assert.deepEqual(t.status.filter((m) => m[0] === "low").at(-1), ["low", 40]);
t.msg("offset", 10);
assert.deepEqual(t.status.filter((m) => m[0] === "low").at(-1), ["low", -1]);
assert.equal(JSON.parse(t.status.filter((m) => m[0] === "preview").at(-1)[1]).notes[0][0], 32); // 62 - 3 x 10
t.msg("low", 200);
assert.deepEqual(t.status.filter((m) => m[0] === "low").at(-1), ["low", 127]);

console.log("linn.lights: all tests passed");
