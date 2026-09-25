// Tests for patchers/linn.curve.js (v8ui) outside Max. Run: node patchers/tests/linn.curve.test.mjs
import { readFileSync, mkdtempSync, existsSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join, dirname } from "node:path";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = readFileSync(new URL("../linn.curve.js", import.meta.url), "utf8");

// stand-in File: whole-file text
class File {
	constructor(path, mode = "read") {
		this.path = path; this.mode = mode; this.position = 0; this.text = "";
		if (mode === "write") { this.isopen = existsSync(dirname(path)); this.eof = 0; return; }
		try { this.text = readFileSync(path, "utf8"); this.isopen = true; } catch { this.isopen = false; }
		this.eof = this.text.length;
	}
	readline() { let e = this.text.indexOf("\n", this.position); if (e < 0) e = this.text.length; const s = this.text.slice(this.position, e); this.position = e + 1; return s; }
	writestring(s) { this.text += s; this.position = this.text.length; }
	close() { if (this.mode === "write" && this.isopen) writeFileSync(this.path, this.text.slice(0, this.eof)); }
}

// 140 x 140 box, PAD 6: the graph is 128 px square
const S = 140;
function load(filepath) {
	const out = [];
	const named = [];
	let notified = 0;
	const mg = new Proxy({ size: [S, S] }, { get: (o, k) => (k in o ? o[k] : () => {}), set: (o, k, v) => ((o[k] = v), true) });
	const ctx = {
		mgraphics: mg, File, post: () => {}, outlet: (i, ...a) => out.push([i, ...a.flat()]),
		notifyclients: () => notified++, Task: class { schedule() {} }, messnamed: (...a) => named.push(a),
		...(filepath && { patcher: { filepath } }),
	};
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	return { ctx, out, named, notified: () => notified };
}
const X = (x) => 6 + x * 128;
const Y = (y) => 6 + (1 - y) * 128;
const near = (a, b, m) => assert.ok(Math.abs(a - b) < 1e-9, `${m}: ${a} != ${b}`);
const tbl = (t) => t.out.filter((m) => m[0] === 0).pop().slice(1);

let t = load();

// linear by default: table = v / 127
t.ctx.bang();
tbl(t).forEach((v, i) => near(v, i / 127, "linear " + i));

// bend: positive bulges up for a rising segment (above the line), and for a falling one
near(t.ctx.shape(0.5, 0, true), 0.5, "no bend");
assert.ok(t.ctx.shape(0.5, 0.5, true) > 0.5, "up, rising: early");
assert.ok(t.ctx.shape(0.5, 0.5, false) < 0.5, "up, falling: late (stays high)");
assert.ok(t.ctx.shape(0.5, -0.5, true) < 0.5, "down, rising: late");
near(t.ctx.shape(0, 0.9, true), 0, "ends fixed");
near(t.ctx.shape(1, 0.9, true), 1, "ends fixed");
// symmetric: b and -b mirror each other through the line
near(t.ctx.shape(0.3, 0.5, true) + t.ctx.shape(0.7, -0.5, true), 1, "mirror");

// double-click adds a node where you click; the new right part is straight, the left keeps its bend
t.ctx.setnodes(2, 0, 0, 0.4, 1, 1, 0);
t.ctx.ondblclick(X(0.5), Y(0.2));
assert.deepEqual([...t.ctx.getvalueof()].slice(1).map((v) => +v.toFixed(6)), [3, 0, 0, 0.4, 0.5, 0.2, 0, 1, 1, 0]);
assert.equal(t.notified(), 1, "pattr told");
// double-click the node deletes it; the ends can't be deleted
t.ctx.ondblclick(X(0.5), Y(0.2));
assert.equal(t.ctx.getvalueof().slice(1)[0], 2);
t.ctx.ondblclick(X(0), Y(0));
assert.equal(t.ctx.getvalueof().slice(1)[0], 2, "end node stays");

// dragging: the end nodes move only up and down; inner nodes stay between their neighbours
t = load();
t.ctx.setnodes(3, 0, 0, 0, 0.5, 0.5, 0, 1, 1, 0);
t.ctx.onclick(X(1), Y(1));
t.ctx.ondrag(X(0.6), Y(0.7), 1);
t.ctx.ondrag(X(0.6), Y(0.7), 0);
let v = [...t.ctx.getvalueof()].slice(1);
near(v[7], 1, "end x pinned");
near(v[8], 0.7, "end y moved");
t.ctx.onclick(X(0.5), Y(0.5));
t.ctx.ondrag(X(1.2), Y(0.3), 1);
v = [...t.ctx.getvalueof()].slice(1);
near(v[4], 1, "inner node stops at its neighbour");
// shift snaps to the grid (1/16)
t.ctx.ondrag(X(0.33), Y(0.52), 1, 0, 1);
v = [...t.ctx.getvalueof()].slice(1);
near(v[4], 5 / 16, "snap x");
near(v[5], 8 / 16, "snap y");
t.ctx.ondrag(X(0.33), Y(0.52), 0);

// bending: drag the curve point up -> the segment bulges up; double-click it -> straight again
t = load();
let [hx, hy] = t.ctx.handle(0);
near(hx, X(0.5), "straight: curve point in the middle");
t.ctx.onclick(hx, hy);
t.ctx.ondrag(hx, hy - 40, 1);
t.ctx.ondrag(hx, hy - 40, 0);
assert.ok(t.ctx.getvalueof().slice(1)[3] > 0, "bent up");
assert.ok(t.ctx.valueAt(0.5) > 0.5, "curve above the line");
[hx, hy] = t.ctx.handle(0);
t.ctx.ondblclick(hx, hy);
near(t.ctx.getvalueof().slice(1)[3], 0, "straightened");

// the curve point sits on the perpendicular bisector of the segment's line
t.ctx.setnodes(2, 0, 0.2, 0.6, 1, 0.7, 0);
[hx, hy] = t.ctx.handle(0);
const A = [X(0), Y(0.2)], C = [X(1), Y(0.7)], M = [(A[0] + C[0]) / 2, (A[1] + C[1]) / 2];
assert.ok(Math.abs((hx - M[0]) * (C[0] - A[0]) + (hy - M[1]) * (C[1] - A[1])) < 1e-3, "on the bisector");

// vertical segment (two nodes at the same x): a step
t.ctx.setnodes(3, 0, 0, 0, 0.5, 0, 0, 1, 1, 0);
t.ctx.setnodes(4, 0, 0, 0, 0.5, 0, 0, 0.5, 1, 0, 1, 1, 0);
near(t.ctx.valueAt(0.49), 0, "before the step");
near(t.ctx.valueAt(0.51), 1, "after the step");

// stored values are cleaned up: ends pinned, x rising, ranges clamped
t.ctx.setvalueof(3, 0.3, 1.5, 2, 0.8, 0.5, 0, 0.2, 0.1, 0);
assert.deepEqual([...t.ctx.getvalueof()].slice(1), [3, 0, 1, 0.99, 0.8, 0.5, 0, 1, 0.1, 0]);

// library: factory curves load by name; user curves save next to the patch and fill the menu
const dir = mkdtempSync(join(tmpdir(), "linncurve-"));
t = load(join(dir, "p.maxpat"));
t.ctx.load("Press", "Dead", "Zone", "Heavy");
near(t.ctx.valueAt(0.8), 0, "dead zone");
near(t.ctx.valueAt(1), 1, "top");
t.ctx.save("my", "curve");
assert.ok(existsSync(join(dir, "linn.curves.json")));
assert.deepEqual(t.named, [["linn_curves", "refresh"]]);
t.out.length = 0;
t.ctx.refresh();
const menu = t.out.filter((m) => m[0] === 1).map((m) => m.slice(1).join(" "));
assert.equal(menu[0], "clear");
assert.ok(menu.includes("append Velocity 1"));
assert.deepEqual(menu.slice(-3), ["append <separator>", "append my curve", "setsymbol my curve"]);
t.ctx.linear();
t.ctx.load("my", "curve");
near(t.ctx.valueAt(0.8), 0, "user curve loaded");
t.ctx.save("Linear");
assert.equal(Object.keys(JSON.parse(readFileSync(join(dir, "linn.curves.json"), "utf8"))).length, 1, "factory names refused");
// every factory curve is valid
const F = vm.runInContext("FACTORY", t.ctx);
for (const k of Object.keys(F)) assert.ok(t.ctx.fromFlat(F[k]), k);

// the live dot: pos sets where it sits and whether a note sounds; it's drawn on the curve
t = load();
t.ctx.jsarguments = ["linn.curve.js", "strike"];
t.ctx.pos("press", 0.5, 1);
assert.equal(vm.runInContext("dotX", t.ctx), -1, "another editor's dot: ignored");
t.ctx.pos("strike", 0.5, 1);
assert.equal(vm.runInContext("dotX", t.ctx), 0.5);
assert.equal(vm.runInContext("dotOn", t.ctx), 1);
t.ctx.pos("strike", 2, 0);
assert.equal(vm.runInContext("dotX", t.ctx), 1, "clamped");

// the name travels with the curve: stored by pattr, shown in the menu on recall; edits keep it
t = load();
t.ctx.load("Velocity", "2");
assert.equal(t.ctx.getvalueof()[0], "Velocity 2");
const stored = [...t.ctx.getvalueof()];
t.ctx.linear();
assert.equal(t.ctx.getvalueof()[0], "Linear");
t.out.length = 0;
t.ctx.setvalueof(...stored);
assert.deepEqual(t.out.filter((m) => m[0] === 1).map((m) => m.slice(1).join(" ")), ["setsymbol Velocity 2"], "menu shows the recalled name");
near(t.ctx.valueAt(0.5), vm.runInContext("valueAt(0.5)", t.ctx), "same curve");
t.ctx.ondblclick(X(0.5), Y(0.9));
assert.equal(t.ctx.getvalueof()[0], "Velocity 2", "an edit keeps the name");
// older stored values have no name: nodes only, the name stays
t.ctx.setvalueof(2, 0, 0, 0, 1, 1, 0);
assert.equal(t.ctx.getvalueof()[0], "Velocity 2");
assert.equal(t.ctx.getvalueof()[1], 2);
// refresh shows the name again after refilling the menu
t.out.length = 0;
t.ctx.refresh();
assert.equal(t.out.filter((m) => m[0] === 1).pop().slice(1).join(" "), "setsymbol Velocity 2");

// dialog sends "symbol <text>": the word symbol is not part of the name
t = load(join(dir, "p.maxpat"));
t.ctx.save("symbol", "mirror");
assert.ok("mirror" in JSON.parse(readFileSync(join(dir, "linn.curves.json"), "utf8")));
assert.equal(t.ctx.getvalueof()[0], "mirror");

// resetcurves: library emptied, curve back to Linear, menu without user curves
t = load(join(dir, "p.maxpat"));
t.ctx.load("mirror");
t.ctx.resetcurves();
assert.deepEqual(JSON.parse(readFileSync(join(dir, "linn.curves.json"), "utf8")), {});
assert.equal(t.ctx.getvalueof()[0], "Linear");
near(t.ctx.valueAt(0.3), 0.3, "linear");
const m2 = t.out.filter((m) => m[0] === 1).map((m) => m.slice(1).join(" "));
assert.ok(!m2.includes("append <separator>"), "no user curves in the menu");

// a stored name with the old "symbol " prefix is shown without it
t = load();
t.ctx.setvalueof("symbol mirror", 2, 0, 0, 0, 1, 1, 0);
assert.equal(t.ctx.getvalueof()[0], "mirror");

console.log("linn.curve: all tests passed");
