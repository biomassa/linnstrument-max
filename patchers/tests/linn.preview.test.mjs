// Tests for patchers/linn.preview.js (v8ui) outside Max. Run: node patchers/tests/linn.preview.test.mjs
import { readFileSync } from "node:fs";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = readFileSync(new URL("../linn.preview.js", import.meta.url), "utf8");

// a stand-in mgraphics that records every drawing call
function load() {
	const calls = [];
	const out = [];
	const posts = [];
	const mg = new Proxy(
		{ size: [650, 208], text_measure: (s) => [s.length * 6, 10] },
		{
			get: (o, k) => (k in o ? o[k] : (...a) => calls.push([k, ...a])),
			set: (o, k, v) => ((o[k] = v), true),
		}
	);
	const ctx = { mgraphics: mg, post: (s) => posts.push(s), outlet: (i, b) => out.push(b) };
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	return { ctx, calls, out, posts };
}

// test pattern: rows start at 20 + 14 k, so row 8 runs past MIDI 127; root pads (31-EDO from 60)
// magenta "R", odd notes white "3", the rest unlit
const notes = Array.from({ length: 8 }, (_, r) => Array.from({ length: 25 }, (_, c) => 20 + 14 * r + c));
const colors = notes.map((row) => row.map((n) => (n > 127 ? 0 : (((n - 60) % 31) + 31) % 31 === 0 ? 6 : n % 2 ? 8 : 0)));
const labels = notes.map((row, r) => row.map((n, c) => (n > 127 ? "!!" : colors[r][c] === 6 ? "R" : colors[r][c] ? "3" : "")));
const json = JSON.stringify({ colors, labels, notes });
const W = 650 / 25; // 26 px per column
const H = 208 / 8; // 26 px per row
const at = (row, col) => ({ clientX: col * W + 5, clientY: (7 - row) * H + 5 });

let t = load();

// which pad a point hits: row 0 at the bottom
assert.deepEqual([...t.ctx.padAt(1, 1, 650, 208)], [7, 0]);
assert.deepEqual([...t.ctx.padAt(649, 207, 650, 208)], [0, 24]);
assert.equal(t.ctx.padAt(-1, 5, 650, 208), null);
assert.equal(t.ctx.padAt(5, 208, 650, 208), null);

// paint: only the background before any data; then 200 pads, text only on lit pads inside MIDI 0..127
t.ctx.paint();
assert.equal(t.calls.filter((c) => c[0] === "rectangle").length, 1);
t.ctx.preview(json);
t.calls.length = 0;
t.ctx.paint();
assert.equal(t.calls.filter((c) => c[0] === "rectangle").length, 1 + 200);
const lit = labels.flat().filter((l, i) => l && l !== "!!" && colors.flat()[i]).length;
assert.equal(t.calls.filter((c) => c[0] === "show_text").length, lit);
assert.ok(lit > 0);
// LED look: magenta = red and blue full, green at the floor (20/255); white = half red, green and blue full
const rgba = t.calls.filter((c) => c[0] === "set_source_rgba").map((c) => c.slice(1, 4).map((v) => Math.round(v * 255)));
assert.ok(rgba.some((c) => c.join() === "255,20,255"), "magenta pad");
assert.ok(rgba.some((c) => c.join() === "138,255,255"), "white pad, cyan-tinted");
assert.ok(rgba.some((c) => c.join() === "0,0,0"), "pad outside MIDI 0..127");

// click: note-on for the pad's note on channel 16 while pressed, note-off on release
t.out.length = 0;
t.ctx.onpointerdown(at(2, 12)); // row 3, column 13: 20 + 28 + 12 = 60
assert.deepEqual(t.out, [0x9f, 60, 96]);
t.calls.length = 0;
t.ctx.paint();
assert.equal(t.calls.filter((c) => c[0] === "stroke").length, 1, "the held pad is outlined");
t.ctx.onpointerup({});
assert.deepEqual(t.out.slice(3), [0x8f, 60, 0]);

// a second press without release lets go of the first note; leaving the object releases too
t.out.length = 0;
t.ctx.onpointerdown(at(0, 0)); // 20
t.ctx.onpointerdown(at(0, 1)); // 21
assert.deepEqual(t.out, [0x9f, 20, 96, 0x8f, 20, 0, 0x9f, 21, 96]);
t.ctx.onpointerleave({});
assert.deepEqual(t.out.slice(9), [0x8f, 21, 0]);

// pads outside MIDI 0..127 and clicks outside the grid play nothing
t.out.length = 0;
t.ctx.onpointerdown(at(7, 24)); // 118 + 24 = 142
t.ctx.onpointerdown({ clientX: 700, clientY: 10 });
t.ctx.onpointerup({});
assert.deepEqual(t.out, []);

// bad data is reported and the last good pattern stays
t.ctx.preview("{not json");
assert.match(t.posts.join(""), /can't read/);
t.calls.length = 0;
t.ctx.paint();
assert.equal(t.calls.filter((c) => c[0] === "rectangle").length, 1 + 200);

// labels wider than a pad shrink to fit, then the font size goes back
t = load();
t.ctx.preview(JSON.stringify({ colors, labels: labels.map((row) => row.map((l) => (l === "3" ? "Dbbb" : l))), notes }));
t.calls.length = 0;
t.ctx.paint();
const sizes = t.calls.filter((c) => c[0] === "set_font_size").map((c) => c[1]);
assert.ok(sizes.some((v) => v < sizes[0]), "a 4-character label is drawn smaller");
assert.equal(sizes.at(-1), sizes[0]);

console.log("linn.preview: all tests passed");
