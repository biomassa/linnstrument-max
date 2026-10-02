// Tests for patchers/hybridsplit.shift.js outside Max. Run: node patchers/tests/hybridsplit.shift.test.mjs
import { readFileSync } from "node:fs";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = readFileSync(new URL("../hybridsplit.shift.js", import.meta.url), "utf8");
function load() {
	const out = [];
	const ctx = { outlet: (i, b) => out.push(b) };
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	const bytes = (...b) => b.flat().forEach((x) => ctx.msg_int(x));
	return { ctx, out, bytes };
}

// no shift: every byte passes (running status comes out with the status repeated)
let t = load();
t.bytes([0x99, 60, 100], [0xe9, 0, 64], [0xd9, 30], [0xb9, 74, 5], [0x89, 60, 70], 0xf8);
assert.deepEqual(t.out, [0x99, 60, 100, 0xe9, 0, 64, 0xd9, 30, 0xb9, 74, 5, 0x89, 60, 70, 0xf8]);

// shift: note-on, poly pressure and note-off move; other messages don't
t = load();
t.ctx.shift(-20);
t.bytes([0x99, 60, 100], [0xa9, 60, 50], [0xe9, 0, 64], [0x89, 60, 70]);
assert.deepEqual(t.out, [0x99, 40, 100, 0xa9, 40, 50, 0xe9, 0, 64, 0x89, 40, 70]);

// a held note keeps the shift it began with; a note-on with velocity 0 ends it too
t = load();
t.ctx.shift(5);
t.bytes([0x9a, 60, 100]);
t.ctx.shift(12);
t.bytes([0x9a, 60, 0], [0x9a, 60, 90]);
assert.deepEqual(t.out, [0x9a, 65, 100, 0x9a, 65, 0, 0x9a, 72, 90]);

// moved outside 0-127: dropped with its note-off
t = load();
t.ctx.shift(100);
t.bytes([0x9b, 60, 100], [0x8b, 60, 0], [0xdb, 9]);
assert.deepEqual(t.out, [0xdb, 9]);

console.log("hybridsplit.shift: all tests passed");
