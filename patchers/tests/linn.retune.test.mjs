// Tests for patchers/linn.retune.js outside Max. Run: node patchers/tests/linn.retune.test.mjs
import { readFileSync, writeFileSync, existsSync, mkdtempSync, mkdirSync } from "node:fs";
import { tmpdir } from "node:os";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = readFileSync(new URL("../linn.retune.js", import.meta.url), "utf8");

// stand-in for Max's File object, in bytes: position and eof count bytes; readline() returns
// one line without its "\n" (a "\r" is kept, as a CRLF file has it); writing needs the folder
class File {
	constructor(path, mode = "read") {
		this.path = path;
		this.mode = mode;
		this.position = 0;
		if (mode === "write") {
			this.data = [];
			this.isopen = existsSync(dirname(path));
			this.eof = 0;
			return;
		}
		try {
			this.data = [...readFileSync(path)];
			this.isopen = true;
		} catch {
			this.data = [];
			this.isopen = false;
		}
		this.eof = this.data.length;
	}
	readline() {
		let e = this.data.indexOf(10, this.position);
		if (e < 0) e = this.data.length;
		const s = Buffer.from(this.data.slice(this.position, e)).toString("utf8");
		this.position = e + 1;
		return s;
	}
	readbytes(n) {
		const b = this.data.slice(this.position, this.position + n);
		this.position += b.length;
		return b;
	}
	writebytes(b) {
		this.data.splice(this.position, b.length, ...b);
		this.position += b.length;
		this.eof = Math.max(this.eof, this.position);
	}
	close() {
		if (this.mode === "write" && this.isopen) writeFileSync(this.path, Buffer.from(this.data.slice(0, this.eof)));
		this.isopen = false;
	}
}

// a fake clock and Task: time moves only when a test calls advance(ms)
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
	return { Task, advance, now: () => now };
}

function load(filepath) {
	const out = [];
	const posts = [];
	const clock = scheduler();
	const ctx = {
		inlet: 0, File, posts, Task: clock.Task, Date: { now: clock.now },
		post: (s) => posts.push(s), outlet: (i, ...a) => out.push([i, ...a.flat()]),
		...(filepath && { patcher: { filepath } }),
	};
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	const bytes = (...b) => { ctx.inlet = 0; b.forEach((x) => ctx.msg_int(x)); };
	const table = (hz) => { ctx.inlet = 1; ctx.list(...hz); ctx.inlet = 0; };
	const take = () => out.splice(0).filter((m) => m[0] === 0).map((m) => m.slice(2));
	return { ctx, out, bytes, table, take, advance: clock.advance };
}

// channels are 1-based in these helpers
const on = (ch, n, v) => [0x90 | (ch - 1), n, v];
const off = (ch, n, v) => [0x80 | (ch - 1), n, v];
// expected 14-bit bend for an offset in semitones at range r
const bend = (semis, r = 48) => Math.max(0, Math.min(16383, 8192 + Math.round((semis / r) * 8192)));
const bendMsg = (ch, v) => [0xe0 | (ch - 1), v & 0x7f, v >> 7];
// mtof @mid 60 @ref 60 @base 261.625565 with an equal scale of n steps per octave
const edo = (n) => Array.from({ length: 128 }, (_, k) => 261.625565 * 2 ** ((k - 60) / n));
// the same for a scale given as cents of degrees 1..N (last = period)
const scl = (c) => Array.from({ length: 128 }, (_, k) => {
	const d = k - 60, N = c.length, q = Math.floor(d / N), r = d - q * N;
	return 261.625565 * 2 ** ((q * c[N - 1] + (r ? c[r - 1] : 0)) / 1200);
});
const close = (a, b) => assert.deepEqual(a.map((m) => m.join(" ")), b.map((m) => m.join(" ")));
const step31 = 1200 / 31 / 100; // semitones

let t;

// 12-TET default: note passes with a centred bend; the first note goes on channel 2
t = load();
t.bytes(...on(2, 60, 100));
close(t.take(), [bendMsg(2, 8192), on(2, 60, 100)]);

// 31-EDO: note 61 = 38.71 c above C4 -> sent as 60 with +0.387 semitones
t = load();
t.table(edo(31));
t.bytes(...on(2, 61, 90));
close(t.take(), [bendMsg(2, bend(step31)), on(2, 60, 90)]);

// 31-EDO: note 90 = 30 steps up = 1161.29 c -> nearest 12-TET note 72, bend -0.387
t = load();
t.table(edo(31));
t.bytes(...on(5, 90, 90));
close(t.take(), [bendMsg(2, bend(30 * step31 - 12)), on(2, 72, 90)]);

// slide in scale steps: +24 steps from note 60 in 31-EDO; the bend follows the note to its output channel
t = load();
t.table(edo(31));
t.bytes(...on(3, 60, 100));
t.take();
t.bytes(0xe2, 0, 96); // input channel 3: 8192 + 4096 = +24 steps
close(t.take(), [bendMsg(2, bend(24 * step31))]);

// unequal JI steps
const ji = [203.91, 386.31, 498.04, 701.96, 884.36, 1088.27, 1200];
t = load();
t.table(scl(ji));
t.bytes(...on(3, 61, 100)); // degree 1 = 203.91 c -> note 62, bend +0.039
close(t.take(), [bendMsg(2, bend(2.0391 - 2)), on(2, 62, 100)]);
t.bytes(0xe2, 43, 65, 0xe2, 0, 64); // some bend, then back to centre: the note returns to degree 1
close(t.take().slice(-1), [bendMsg(2, bend(2.0391 - 2))]);

// half a step between degree 1 and 2 interpolates in cents (range 64: 128 units per step)
t = load();
t.table(scl(ji));
t.ctx.bendrange(64);
t.ctx.synthbend(64);
t.bytes(...on(3, 61, 100));
t.take();
t.bytes(0xe2, 64, 64); // 8192 + 64 = +0.5 step
close(t.take(), [bendMsg(2, bend((203.91 + 386.31) / 2 / 100 - 2, 64))]);

// clamp: +48 steps of a 5-note scale is far past 48 semitones
t = load();
t.table(scl([240, 480, 720, 960, 1200]));
t.bytes(...on(4, 60, 100));
t.take();
t.bytes(0xe3, 127, 127);
close(t.take(), [bendMsg(2, 16383)]);

// note-off uses the sent note; poly pressure, CC and pressure follow the note to its output channel
t = load();
t.table(edo(31));
t.bytes(...on(7, 90, 90));
t.take();
t.bytes(0xa6, 90, 33, 0xb6, 74, 50, 0xd6, 70, ...off(7, 90, 0));
close(t.take(), [[0xa1, 72, 33], [0xb1, 74, 50], [0xd1, 70], off(2, 72, 0)]);

// main channel 1: everything passes through unchanged
t = load();
t.bytes(0xe0, 5, 70, 0xb0, 1, 99, 0xd0, 40);
close(t.take(), [[0xe0, 5, 70], [0xb0, 1, 99], [0xd0, 40]]);

// tail hold: a bend after note-off is not sent; the next note starts from it on the quietest channel
t = load();
t.bytes(...on(2, 60, 100), ...off(2, 60, 0));
t.take();
t.bytes(0xe1, 0, 72); // input channel 2: 9216 = +6 semitones in 12-TET, no note held
close(t.take(), []);
t.bytes(...on(2, 62, 100)); // new note: channel 2 was just used, so it goes to channel 3
close(t.take(), [bendMsg(3, 8192), on(3, 68, 100)]); // 62 + 6 steps: nearest note 68, no residue

// the quietest free channel is chosen: channels 2, 3, 4 used in turn, 3 released first
t = load();
t.bytes(...on(2, 60, 1), ...on(3, 61, 1), ...on(4, 62, 1));
t.bytes(...off(3, 61, 0), ...off(2, 60, 0));
t.take();
t.bytes(...on(5, 63, 1)); // channels 5..16 were never used: 5 comes next
assert.deepEqual(t.take().at(-1), on(5, 63, 1));

// when all 15 channels are held, the oldest note is cut and its channel reused
t = load();
for (let i = 0; i < 15; i++) t.bytes(...on(2 + i, 60 + i, 100));
t.take();
t.bytes(...on(2, 80, 100));
close(t.take(), [off(2, 60, 0), on(2, 80, 100)]); // bend unchanged (8192), so not resent

// Y, pressure and bend sent just before a note land on its output channel
t = load();
t.bytes(0xb4, 74, 50, 0xd4, 30, 0xe4, 0, 72); // input channel 5, no note yet: held back
close(t.take(), []);
t.bytes(...on(5, 60, 100));
close(t.take(), [[0xb1, 74, 50], [0xd1, 30], bendMsg(2, 8192), on(2, 66, 100)]); // 60 + 6 steps

// two notes on one input channel get separate channels and their own bends
t = load();
t.table(edo(31));
t.bytes(...on(2, 60, 100), ...on(2, 64, 100)); // note 64 = 4 steps = 154.84 c -> note 62, -0.452
close(t.take(), [bendMsg(2, 8192), on(2, 60, 100), bendMsg(3, bend(4 * step31 - 2)), on(3, 62, 100)]);
t.bytes(0xe1, 0, 96); // +24 steps on input channel 2 moves both notes
close(t.take(), [bendMsg(2, bend(24 * step31)), bendMsg(3, bend(28 * step31 - 2))]);

// pedals go to every output channel (15 of them)
t = load();
t.bytes(0xb1, 64, 127);
const ped = t.take();
assert.equal(ped.length, 15);
assert.ok(ped.every((m) => (m[0] & 0xf0) === 0xb0 && m[1] === 64 && (m[0] & 0x0f) !== 0));

// mainchannel moves the pass-through channel; notes then avoid it
t = load();
t.ctx.mainchannel(16);
t.bytes(0xef, 1, 2); // channel 16 now passes through
close(t.take(), [[0xef, 1, 2]]);
t.bytes(...on(3, 60, 100)); // channel 1 is now in the pool and quietest
assert.deepEqual(t.take().at(-1), on(1, 60, 100));

// panic: note-offs for held notes, bends back to centre
t = load();
t.table(edo(31));
t.bytes(...on(2, 61, 100));
t.take();
t.ctx.panic();
const p = t.take();
assert.deepEqual(p[0], off(2, 60, 0));
assert.ok(p.some((m) => m.join(" ") === bendMsg(2, 8192).join(" ")));

// root <note> <hz> moves degree 0 (mtof mid/ref/base) and reloads the table
t = load();
t.ctx.root(62, 293.664768);
const rootReq = t.out.splice(0).filter((m) => m[0] === 1);
assert.deepEqual(rootReq.slice(0, 3), [[1, "mid", 62], [1, "ref", 62], [1, "base", 293.664768]]);
assert.equal(rootReq[3].length, 129);

// scale <archive name> asks mtof for the archive scale and the 128 notes
t = load();
t.ctx.scale("ji_11");
let req = t.out.splice(0).filter((m) => m[0] === 1);
assert.deepEqual(req[0], [1, "scalename", "ji_11"]);
assert.equal(req[1].length, 129);

// scale <path> reads the .scl and sends it inline (the umenu sends full paths)
const SCL = fileURLToPath(new URL("../SCL/", import.meta.url)); // decodes the space in "Max 9"
const inline = (file) => {
	const t = load();
	t.ctx.scale(SCL + file);
	const r = t.out.splice(0).filter((m) => m[0] === 1);
	assert.deepEqual(r[0], [1, "scalename", "none"]);
	assert.equal(r[1][1], "scale");
	assert.equal(r[2].length, 129);
	return r[1].slice(2); // count, pairs...
};

// mtof's inline format (mtof help): count, then one pair per degree, cents as "c 0", ratios as "num den"
let s = inline("31-edo.scl");
assert.equal(s[0], 31);
assert.equal(s.length, 1 + 2 * 31);
assert.ok(Math.abs(s[1] - 1200 / 31) < 0.001, `31-edo first pitch ${s[1]}`);
assert.equal(s[2], 0);

s = inline("ji_11.scl");
assert.equal(s[0], 11);
assert.deepEqual(s.slice(1, 3), [343, 324]);
assert.ok(s.slice(1).every(Number.isInteger));

s = inline("22edo.scl");
assert.equal(s[0], 22);
assert.deepEqual(s.slice(1, 3), [54.54545, 0]);
assert.deepEqual(s.slice(-2), [2, 1]);

// a relative path, as the scale menu sends with the prefix SCL/, is read from the patcher's folder
{
	const t = load(join(SCL, "..", "linn.retune.maxpat"));
	t.ctx.scale("SCL/ji_7.scl");
	const r = t.out.splice(0).filter((m) => m[0] === 1);
	assert.deepEqual(r[0], [1, "scalename", "none"]);
	assert.equal(r[1][1], "scale");
	assert.equal(t.ctx.posts.length, 0);
}

// every file in SCL/ parses to its stated count of pairs
for (const f of ["22edo", "31-edo", "ji_11", "ji_13", "ji_17", "ji_7", "ji_7a", "ji_8coh", "ji_9", "ji_9coh"]) {
	const v = inline(f + ".scl");
	assert.equal(v.length, 1 + 2 * v[0], f);
	assert.ok(v.every((x) => Number.isFinite(x)), f);
}

// a missing file posts an error and sends nothing to mtof
t = load();
t.ctx.scale(SCL + "nope.scl");
assert.equal(t.out.filter((m) => m[0] === 1).length, 0);
assert.match(t.ctx.posts.join(""), /can't open/);

// --- synthbend: the synth's per-note bend range, apart from the LinnStrument's (bendrange) ---

// 12-TET synth with bend range 24: the same 31-EDO note, its offset written in 24ths
t = load();
t.table(edo(31));
t.ctx.synthbend(24);
t.bytes(...on(2, 61, 90));
close(t.take(), [bendMsg(2, bend(step31, 24)), on(2, 60, 90)]);

// --- retune 0: the synth loads the scale; notes pass unchanged, bends are converted ---

const native = (hz) => {
	const t = load();
	t.table(hz);
	t.ctx.retune(0);
	t.take();
	t.ctx.posts.length = 0;
	return t;
};

// the note goes out as played, with no bend (switching modes centred every channel already)
t = native(edo(31));
t.bytes(...on(2, 61, 90));
close(t.take(), [on(2, 61, 90)]);

// +24 steps in 31-EDO = 929.03 c: written for the synth's range (48 by default, then 12)
t.bytes(0xe1, 0, 96); // input channel 2: 8192 + 4096
close(t.take(), [bendMsg(2, bend(24 * step31))]);
assert.equal(bend(24 * step31), 9778); // the spec's example
t.ctx.synthbend(12);
close(t.take(), [bendMsg(2, bend(24 * step31, 12))]);
t.bytes(0xe1, 127, 127); // +48 steps = 18.6 semitones: past a range of 12
close(t.take(), [bendMsg(2, 16383)]);

// unequal steps: half a step up from degree 1 (9/8) towards degree 2 (5/4) is 91.2 c,
// interpolated in cents as in retune 1 (bendrange 64: 128 units per step)
t = native(scl(ji));
t.ctx.bendrange(64);
t.bytes(...on(3, 61, 100));
close(t.take(), [on(2, 61, 100)]);
t.bytes(0xe2, 64, 64);
close(t.take(), [bendMsg(2, bend((386.31 - 203.91) / 2 / 100))]);
assert.equal(bend((386.31 - 203.91) / 2 / 100), 8348); // the spec's example

// switching modes releases held notes (they went out with the other mode's note numbers)
t = load();
t.table(edo(31));
t.bytes(...on(2, 61, 90));
t.take();
t.ctx.retune(0);
assert.deepEqual(t.take()[0], off(2, 60, 0));
t.bytes(...on(2, 61, 90));
assert.deepEqual(t.take().at(-1), on(3, 61, 90));

// --- retune 0 writes the scale and a matching .kbm for the synth to load ---

const dir = mkdtempSync(join(tmpdir(), "linnretune-"));
t = load();
t.ctx.kbmdir(dir);
t.ctx.scale(SCL + "ji_7.scl");
assert.ok(!existsSync(join(dir, "ji_7.kbm")), "retune 1 writes nothing");
t.ctx.root(62, 293.664768);
t.ctx.retune(0);
assert.ok(!existsSync(join(dir, "ji_7.kbm")), "switching modes writes nothing either");
t.ctx.exportscale();
assert.deepEqual(readFileSync(join(dir, "ji_7.scl")), readFileSync(SCL + "ji_7.scl"), ".scl copied unchanged");
const n7 = inline("ji_7.scl")[0];
const kbmText = (note, hz) =>
	[
		`! ji_7: degree 0 on MIDI ${note} at ${hz.toFixed(3)} Hz, written by linn.retune`,
		"! Size of map:", n7,
		"! First MIDI note number to retune:", 0,
		"! Last MIDI note number to retune:", 127,
		"! Middle note where the first entry of the mapping is mapped to:", note,
		"! Reference note for which frequency is given:", note,
		"! Frequency to tune the above note to:", hz.toFixed(6),
		"! Scale degree to consider as formal octave:", n7,
		"! Mapping:",
		...Array.from({ length: n7 }, (_, d) => d),
	].join("\n") + "\n";
assert.equal(readFileSync(join(dir, "ji_7.kbm"), "utf8"), kbmText(62, 293.664768));
assert.match(t.ctx.posts.join(""), /wrote .*ji_7\.scl and \.kbm/);
// a new root (or scale, or preset recall) writes nothing until the next export,
// which rewrites the .kbm cut to the new length
t.ctx.root(60, 261.625565);
assert.equal(readFileSync(join(dir, "ji_7.kbm"), "utf8"), kbmText(62, 293.664768));
t.ctx.exportscale();
assert.equal(readFileSync(join(dir, "ji_7.kbm"), "utf8"), kbmText(60, 261.625565));
// exporting works in retune 1 too (a Madrona synth may take the files while the relay is on)
t.ctx.retune(1);
t.ctx.root(62, 293.664768);
t.ctx.exportscale();
assert.equal(readFileSync(join(dir, "ji_7.kbm"), "utf8"), kbmText(62, 293.664768));
// a folder that doesn't exist: a note in the Max Console, nothing breaks
t.ctx.posts.length = 0;
t.ctx.kbmdir(join(dir, "missing"));
t.ctx.exportscale();
assert.match(t.ctx.posts.join(""), /can't write .*does the folder exist/);
// an archive scale has no file to export
t.ctx.kbmdir(dir);
t.ctx.posts.length = 0;
t.ctx.scale("ji_11");
t.ctx.exportscale();
assert.match(t.ctx.posts.join(""), /no \.scl file/);
// the export folder: kbmdir, else the Madrona Labs folder under /Users/<name>/, else the patch's folder
assert.equal(load("/Users/bob/linnstrument/patchers/linn.retune.maxpat").ctx.exportDir(), "/Users/bob/Music/Madrona Labs/Scales/linnstrument/");
assert.equal(load("/Volumes/Music/linnstrument/patchers/linn.retune.maxpat").ctx.exportDir(), "/Volumes/Music/linnstrument/patchers/Madrona/");
{
	const here = mkdtempSync(join(tmpdir(), "linnretune-patch-"));
	mkdirSync(join(here, "Madrona"));
	const t = load(join(here, "linn.retune.maxpat"));
	t.ctx.scale(SCL + "ji_7.scl");
	t.ctx.exportscale();
	assert.ok(existsSync(join(here, "Madrona", "ji_7.scl")) && existsSync(join(here, "Madrona", "ji_7.kbm")));
	assert.match(t.ctx.posts.join(""), /not the synth's Scales folder/);
}
{
	const t = load(); // a patch that was never saved has no folder
	t.ctx.scale(SCL + "ji_7.scl");
	t.ctx.exportscale();
	assert.match(t.ctx.posts.join(""), /no folder to export to/);
}

// --- relay (linn.relay): targets, channels, note range, mono ---

const ccs = (msgs, n) => msgs.filter((m) => (m[0] & 0xf0) === 0xb0 && m[1] === n);

// target k2600: channels 1-16 (no main channel), bend range 24
t = load();
t.table(edo(31));
t.ctx.target("k2600");
t.take();
t.bytes(...on(2, 61, 90));
close(t.take(), [bendMsg(1, bend(step31, 24)), on(1, 60, 90)]);

// 16 notes use channels 1..16; a 17th cuts the oldest
t = load();
t.ctx.target("k2600");
t.take();
for (let i = 0; i < 16; i++) t.bytes(...on(2, 40 + i, 90));
assert.deepEqual(
	t.take().filter((m) => (m[0] & 0xf0) === 0x90).map((m) => (m[0] & 0x0f) + 1),
	Array.from({ length: 16 }, (_, i) => i + 1)
);
t.bytes(...on(2, 70, 90));
assert.deepEqual(t.take()[0], off(1, 40, 0));
// panic: note-offs, all notes off (CC 123) and centred bends on all 16 channels
t.ctx.panic();
assert.equal(ccs(t.take(), 123).length, 16);

// voices 4: notes use channels 1-4 only, a fifth cuts the oldest; the limit stays when the target changes
t = load();
t.ctx.voices(4);
t.ctx.target("k2600");
t.take();
for (let i = 0; i < 4; i++) t.bytes(...on(2, 40 + i, 90));
assert.deepEqual(
	t.take().filter((m) => (m[0] & 0xf0) === 0x90).map((m) => (m[0] & 0x0f) + 1),
	[1, 2, 3, 4]
);
t.bytes(...on(2, 50, 90));
close(t.take(), [off(1, 40, 0), on(1, 50, 90)]);
t.ctx.panic();
assert.equal(ccs(t.take(), 123).length, 4); // panic covers the 4 channels in use
t.ctx.voices(16); // back to all 16
t.take();
for (let i = 0; i < 16; i++) t.bytes(...on(2, 60 + i, 90));
assert.equal(new Set(t.take().filter((m) => (m[0] & 0xf0) === 0x90).map((m) => m[0])).size, 16);

// channels and mainchannel 0 set by hand
t = load();
t.ctx.mainchannel(0);
t.ctx.channels(3, 4);
t.take();
t.bytes(...on(1, 60, 90), ...on(1, 62, 90), ...on(1, 64, 90));
assert.deepEqual(
	t.take().filter((m) => (m[0] & 0xf0) === 0x90 || (m[0] & 0xf0) === 0x80).map((m) => m.join(" ")),
	[on(3, 60, 90), on(4, 62, 90), off(3, 60, 0), on(3, 64, 90)].map((m) => m.join(" "))
);

// notes outside the range are dropped, with their note-off (Mutant Brain: 24-120)
t = load();
t.ctx.target("mutantbrain");
t.take();
t.bytes(...on(2, 20, 90), ...off(2, 20, 0), ...on(2, 121, 90), ...off(2, 121, 0));
close(t.take(), []);

// mono: one voice on channel 1; the newest note sounds, releasing it returns to the one still held
t = load();
t.table(edo(31));
t.ctx.target("mutantbrain");
t.take();
t.bytes(...on(2, 61, 90)); // 38.7 c above C4: note 60 + bend
close(t.take(), [bendMsg(1, bend(step31, 24)), on(1, 60, 90)]);
t.bytes(...on(3, 70, 80)); // 10 steps = 387.1 c: note 64 - 12.9 c; legato: the new note starts first
close(t.take(), [bendMsg(1, bend(10 * step31 - 4, 24)), on(1, 64, 80), off(1, 60, 0)]);
t.bytes(...off(3, 70, 0)); // back to the held note, at its velocity
close(t.take(), [bendMsg(1, bend(step31, 24)), on(1, 60, 90), off(1, 64, 0)]);
t.bytes(...off(2, 61, 0));
close(t.take(), [off(1, 60, 0)]);

// legato 0: the old note ends first (the gate retriggers)
t.ctx.legato(0);
t.bytes(...on(2, 61, 90), ...on(3, 70, 80));
close(t.take(), [on(1, 60, 90), off(1, 60, 0), bendMsg(1, bend(10 * step31 - 4, 24)), on(1, 64, 80)]);
// a bend on the held note that isn't sounding waits; it counts when that note sounds again
t.bytes(0xe1, 0, 72); // input channel 2: +6 steps
close(t.take(), []);
t.bytes(...off(3, 70, 0)); // back to 61 + 6 = 7 steps = 271 c: note 63 - 29 c
close(t.take(), [off(1, 64, 0), bendMsg(1, bend(7 * step31 - 3, 24)), on(1, 63, 90)]);

// legato with the same 12-TET note: only the bend changes
t = load();
t.table(edo(31));
t.ctx.target("mutantbrain");
t.take();
t.bytes(...on(2, 60, 90), ...on(3, 61, 90)); // 0 c and 38.7 c: both note 60
close(t.take(), [on(1, 60, 90), bendMsg(1, bend(step31, 24))]);

// vibrato 1.8: small motions widened, whole pads land exactly (12-TET, bend range 48 in and out)
t = load();
t.ctx.onset(0); // full gain at once (the fade-in is tested below)
t.ctx.vibrato(1.8);
t.bytes(...on(2, 60, 90));
t.take();
t.bytes(0xe1, 64, 64); // 8192 + 64 = 0.375 pad
const warped = 0.375 + (0.8 * Math.sin(0.75 * Math.PI)) / (2 * Math.PI); // 0.465
close(t.take(), [bendMsg(2, bend(warped))]);
t.bytes(0xe1, 0, 72); // 8192 + 1024 = 6 pads: exactly 6 semitones
close(t.take(), [bendMsg(2, bend(6))]);
t.bytes(0xe1, 0, 64); // back to the touch point
close(t.take(), [bendMsg(2, 8192)]);
// the gain is kept between 1 and 3; 1 = the plain bend; whole pads still land at 3
t.ctx.vibrato(5);
t.bytes(0xe1, 64, 64);
close(t.take(), [bendMsg(2, bend(0.375 + (2 * Math.sin(0.75 * Math.PI)) / (2 * Math.PI)))]);
t.bytes(0xe1, 0, 72);
close(t.take(), [bendMsg(2, bend(6))]);
t.bytes(0xe1, 64, 64);
t.take();
t.ctx.vibrato(1);
close(t.take(), [bendMsg(2, bend(0.375))]);

// onset (default 40 ms): after a strike the gain fades in from 1, so a landing finger's wobble
// isn't widened; a finger held still reaches full gain by itself; slides still land exactly
const w = (s, g) => s + ((g - 1) * Math.sin(2 * Math.PI * s)) / (2 * Math.PI);
t = load();
t.ctx.vibrato(2.5);
t.bytes(...on(2, 60, 90));
t.take();
t.bytes(0xe1, 64, 64); // 0.375 pad at the strike: the plain bend
close(t.take(), [bendMsg(2, bend(0.375))]);
t.advance(20); // halfway: gain 1.75
assert.deepEqual(t.take().at(-1), bendMsg(2, bend(w(0.375, 1.75))));
t.advance(20); // 40 ms: full gain 2.5, then the fade stops
assert.deepEqual(t.take().at(-1), bendMsg(2, bend(w(0.375, 2.5))));
t.advance(100);
close(t.take(), []);
t.bytes(0xe1, 0, 72); // 6 pads: exactly 6 semitones at any gain
close(t.take(), [bendMsg(2, bend(6))]);
// a slide right after a new strike lands exactly too
t.bytes(...on(3, 62, 90), 0xe2, 0, 72);
assert.deepEqual(t.take().at(-1), bendMsg(3, bend(6)));
t.advance(50);
t.take();

// realtime bytes (clock, start, continue, stop, ...) are dropped, also inside another message
t = load();
t.bytes(0xfa, 0xf8, 0xfb, 0xfc, 0xfe, 0xff);
close(t.take(), []);
t.bytes(0x91, 0xf8, 60, 100, 0xfc); // a clock byte inside a note-on: the note still goes on
close(t.take(), [bendMsg(2, 8192), on(2, 60, 100)]);

// an unknown target is refused
t.ctx.posts.length = 0;
t.ctx.target("moog");
assert.match(t.ctx.posts.join(""), /unknown target moog/);

console.log("linn.retune: all tests passed");
