// Tests for patchers/linn.retune.js outside Max. Run: node patchers/tests/linn.retune.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = readFileSync(new URL("../linn.retune.js", import.meta.url), "utf8");

// stand-in for Max's File object: readline() returns one line (CRLF kept, as a file may have it)
class File {
	constructor(path) {
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
	close() { this.isopen = false; }
}

function load() {
	const out = [];
	const posts = [];
	const ctx = { inlet: 0, File, posts, post: (s) => posts.push(s), outlet: (i, ...a) => out.push([i, ...a.flat()]) };
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	const bytes = (...b) => { ctx.inlet = 0; b.forEach((x) => ctx.msg_int(x)); };
	const table = (hz) => { ctx.inlet = 1; ctx.list(...hz); ctx.inlet = 0; };
	const take = () => out.splice(0).filter((m) => m[0] === 0).map((m) => m.slice(2));
	return { ctx, out, bytes, table, take };
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
const SCL = fileURLToPath(new URL("../../SCL/", import.meta.url)); // decodes the space in "Max 9"
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

console.log("linn.retune: all tests passed");
