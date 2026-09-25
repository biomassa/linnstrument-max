// Tests for patchers/linn.curvemidi.js outside Max. Run: node patchers/tests/linn.curvemidi.test.mjs
import { readFileSync } from "node:fs";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = readFileSync(new URL("../linn.curvemidi.js", import.meta.url), "utf8");

function load(args = ["linn.curvemidi.js", "test_curves"]) {
	const out = [];
	const dots = [];
	const posts = [];
	const ctx = { jsarguments: args, post: (s) => posts.push(s), outlet: (i, b) => out.push(b), messnamed: (...a) => dots.push(a) };
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	const bytes = (...b) => b.flat().forEach((x) => ctx.msg_int(x));
	return { ctx, out, dots, posts, bytes };
}

let t;

// linear curves (the default): every byte passes unchanged, for every value
t = load();
const all = [];
for (let v = 1; v < 128; v++) all.push([0x91, 60, v], [0x81, 60, v]);
for (let v = 0; v < 128; v++) all.push([0xd1, v], [0xa1, 60, v], [0xb1, 74, v], [0xb1, 1, v], [0xe1, v, 64]);
all.push([0x91, 60, 0], [0xc1, 5], [0xf8], [0xf0, 0x7d, 1, 2, 0xf7]);
t.bytes(all.flat());
assert.deepEqual(t.out, all.flat(), "linear: byte for byte");

// running status comes out with the status written again (the same messages)
t = load();
t.bytes(0xe1, 0, 64, 1, 64, 2, 64);
assert.deepEqual(t.out, [0xe1, 0, 64, 0xe1, 1, 64, 0xe1, 2, 64]);

// curves: strike -> note-on velocity (never 0), lift -> note-off velocity, press -> channel and
// poly pressure, slide -> CC 74 only
t = load();
const zero = Array(128).fill(0);
const half = Array(128).fill(0.5);
t.ctx.curve("strike", ...zero);
t.ctx.curve("lift", ...half);
t.ctx.curve("press", ...half);
t.ctx.curve("slide", ...Array(128).fill(1));
t.bytes([0x91, 60, 100], [0xd1, 10], [0xa1, 60, 10], [0xb1, 74, 10], [0xb1, 1, 10], [0xe1, 3, 70], [0x81, 60, 90]);
assert.deepEqual(t.out, [0x91, 60, 1, 0xd1, 64, 0xa1, 60, 64, 0xb1, 74, 127, 0xb1, 1, 10, 0xe1, 3, 70, 0x81, 60, 64]);

// dots (poly): one per held note on strike, press and slide (the voice is the channel), removed when
// its note ends; pressure and Y sent before the note-on show at the note-on; lift is one dot,
// dimmed when no note is held
t = load();
t.bytes([0xd1, 32]);
assert.equal(t.dots.length, 0, "no note on that channel yet");
t.bytes([0x91, 60, 127]);
assert.deepEqual(t.dots.splice(0).map((d) => d.join(" ")), ["test_curves pos strike 1 1 2", `test_curves pos press ${32 / 127} 1 2`, "test_curves pos slide 0 1 2"]);
t.bytes([0x92, 62, 64], [0xb2, 74, 127]);
assert.deepEqual(t.dots.splice(0).map((d) => d.join(" ")), [`test_curves pos strike ${64 / 127} 1 3`, "test_curves pos press 0 1 3", "test_curves pos slide 0 1 3", "test_curves pos slide 1 1 3"]);
t.bytes([0x81, 60, 127]);
assert.deepEqual(t.dots.splice(0).map((d) => d.join(" ")), ["test_curves pos lift 1 1", "test_curves pos strike 0 0 2", "test_curves pos press 0 0 2", "test_curves pos slide 0 0 2"]);
t.bytes([0x92, 62, 0]);
assert.deepEqual(t.dots.splice(0).map((d) => d.join(" ")), ["test_curves pos strike 0 0 3", "test_curves pos press 0 0 3", "test_curves pos slide 0 0 3", "test_curves pos lift 1 0"]);
// no argument: no dots
t = load(["linn.curvemidi.js"]);
t.bytes([0x91, 60, 100]);
assert.equal(t.dots.length, 0);

// bad curves are refused
t = load();
t.ctx.curve("wobble", ...half);
t.ctx.curve("press", 1, 2);
assert.equal(t.posts.length, 2);

console.log("linn.curvemidi: all tests passed");
