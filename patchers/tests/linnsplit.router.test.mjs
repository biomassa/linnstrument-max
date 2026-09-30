// Tests for patchers/linnsplit.router.js outside Max. Run: node patchers/tests/linnsplit.router.test.mjs
import { readFileSync } from "node:fs";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = readFileSync(new URL("../linnsplit.router.js", import.meta.url), "utf8");

function load() {
	const out = [[], []];
	const ctx = { outlet: (i, b) => out[i].push(b) };
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	const bytes = (...b) => b.flat().forEach((x) => ctx.msg_int(x));
	return { ctx, out, bytes };
}

// default zones: left main 1 + notes 2-8, right main 16 + notes 9-15
let t = load();
t.bytes([0x91, 60, 100], [0xe1, 0, 64], [0xd1, 30], [0xb0, 64, 127]); // ch 2 note, bend, pressure; ch 1 pedal
t.bytes([0x99, 72, 90], [0xb9, 74, 10], [0xbf, 1, 5]); // ch 10 note and Y; ch 16 (right main)
assert.deepEqual(t.out[0], [0x91, 60, 100, 0xe1, 0, 64, 0xd1, 30, 0xb0, 64, 127]);
assert.deepEqual(t.out[1], [0x99, 72, 90, 0xb9, 74, 10, 0xbf, 1, 5]);

// every channel of a zone: 8 on the left, 9 on the right
t = load();
for (let ch = 0; ch < 16; ch++) t.bytes([0x90 | ch, 60, 1]);
assert.equal(t.out[0].length / 3, 8);
assert.equal(t.out[1].length / 3, 8);

// running status keeps its side; the status is repeated on the way out
t = load();
t.bytes(0xe9, 0, 64, 1, 64);
assert.deepEqual(t.out[1], [0xe9, 0, 64, 0xe9, 1, 64]);
assert.deepEqual(t.out[0], []);

// system bytes go to both; realtime inside a message doesn't break it
t = load();
t.bytes(0x92, 60, 0xf8, 90);
assert.deepEqual(t.out[0], [0xf8, 0x92, 60, 90]);
assert.deepEqual(t.out[1], [0xf8]);

// zones can be changed; a channel outside both is dropped
t = load();
t.ctx.zones(1, 2, 4, 16, 12, 15);
t.bytes([0x95, 60, 1], [0x9c, 61, 1], [0x92, 62, 1]);
assert.deepEqual(t.out[0], [0x92, 62, 1]);
assert.deepEqual(t.out[1], [0x9c, 61, 1]);

// NRPN readback replies are dropped (on the main channels too); RPN and other CCs pass
t = load();
t.bytes([0xb0, 99, 1], [0xb0, 98, 72], [0xb0, 6, 0], [0xb0, 38, 1], [0xb0, 101, 127], [0xb0, 100, 127]); // NRPN 200 = 1
t.bytes([0xb0, 101, 0], [0xb0, 100, 0], [0xb0, 6, 48], [0xb0, 38, 0]); // RPN 0 (bend range) passes
t.bytes([0xb0, 1, 64], [0xbf, 99, 1], [0xbf, 6, 0], [0xbf, 74, 3]);
assert.deepEqual(t.out[0], [0xb0, 101, 0, 0xb0, 100, 0, 0xb0, 6, 48, 0xb0, 38, 0, 0xb0, 1, 64]);
assert.deepEqual(t.out[1], [0xbf, 74, 3]);

console.log("linnsplit.router: all tests passed");
