// Tests for patchers/linn.faders.js outside Max. Run: node patchers/tests/linn.faders.test.mjs
import { readFileSync } from "node:fs";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = readFileSync(new URL("../linn.faders.js", import.meta.url), "utf8");

function load(args = ["linn.faders.js", 16]) {
	const out = [];
	const bars = [];
	const midi = [];
	const ctx = { jsarguments: args, notifyclients: () => {}, outlet: (i, ...v) => (i === 9 ? midi.push(v[0]) : i === 8 ? bars.push(v) : out.push([i, Math.round(v[0] * 127)])) }; // values 0..1, compared as CC values
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	const bytes = (...b) => b.flat().forEach((x) => ctx.msg_int(x));
	return { ctx, out, bars, midi, bytes };
}
const plain = (x) => JSON.parse(JSON.stringify(x));

// CC 1-8 on channel 16 go to outlets 0-7
let t = load();
t.bytes(0xbf, 1, 127, 0xbf, 1, 0);
assert.deepEqual(plain(t.out), [[0, 127], [0, 0]]);
t = load();
for (let cc = 1; cc <= 8; cc++) t.bytes(0xbf, cc, cc * 10);
assert.deepEqual(plain(t.out), [[0, 10], [1, 20], [2, 30], [3, 40], [4, 50], [5, 60], [6, 70], [7, 80]]);

// other channels, other CCs, notes and pressure are ignored; running status and realtime bytes work
t = load();
t.bytes([0xb0, 1, 5], [0xbf, 9, 5], [0xbf, 0, 5], [0x9f, 1, 5], [0xdf, 1], [0xbf, 3, 100, 0xf8, 3, 101, 4, 0]);
assert.deepEqual(plain(t.out), [[2, 100], [2, 101], [3, 0]]);

// arguments: channel 1, first CC 20
t = load(["linn.faders.js", 1, 20]);
t.bytes([0xbf, 20, 9], [0xb0, 20, 1], [0xb0, 27, 127], [0xb0, 28, 3]);
assert.deepEqual(plain(t.out), [[0, 1], [7, 127]]);

// no arguments: channel 1, CC 1
t = load(["linn.faders.js"]);
t.bytes([0xb0, 1, 64]);
assert.deepEqual(plain(t.out), [[0, 64]]);

// outlet 8: fader <row> <value> for the preview
t = load();
t.bytes([0xbf, 3, 127]);
assert.deepEqual(JSON.parse(JSON.stringify(t.bars)), [["fader", 2, 1]]);

// kept values: stored (getvalueof), restored and pushed (setvalueof) to the LinnStrument, the
// outlets and the bars; unknown faders (-1) are not sent; faders 1 pushes again, once per turn-on
t = load(["linn.faders.js", 1]);
t.bytes([0xb0, 2, 100], [0xb0, 5, 7]);
assert.deepEqual(JSON.parse(JSON.stringify(t.ctx.getvalueof())), [-1, 100, -1, -1, 7, -1, -1, -1]);
assert.deepEqual(t.midi, [], "moving a fader sends nothing back");
t = load(["linn.faders.js", 1]);
t.ctx.setvalueof(-1, 100, -1, -1, 7, -1, -1, -1);
assert.deepEqual(t.midi, [0xb0, 2, 100, 0xb0, 5, 7]);
assert.deepEqual(JSON.parse(JSON.stringify(t.out)), [[1, 100], [4, 7]]);
assert.equal(t.bars.length, 2);
t.midi.length = 0;
t.ctx.faders(1);
t.ctx.faders(1);
assert.deepEqual(t.midi, [0xb0, 2, 100, 0xb0, 5, 7], "pushed once when the faders come on");
t.ctx.faders(0);
t.midi.length = 0;
t.ctx.faders(1);
assert.equal(t.midi.length, 6);
// nothing known: nothing sent
t = load(["linn.faders.js", 1]);
t.ctx.faders(1);
t.ctx.setvalueof(-1, -1, -1, -1, -1, -1, -1, -1);
assert.deepEqual([t.midi, t.out], [[], []]);

console.log("linn.faders: all tests passed");
