// linn.curve: a response curve editor that works like ROLI Equator's expression curves.
// For a v8ui (Max 9). Input and output are 0..1; the curve is a chain of nodes, and each segment
// between two nodes can bend.
//
// Mouse (as in Equator):
//   double-click empty space: add a node (the segment it splits keeps its bend on the left side,
//     the new right side starts straight)
//   double-click a node: delete it (the two end nodes stay)
//   drag a node: move it (the end nodes move only up and down; a node can't pass its neighbours)
//   shift-drag a node: snap it to the grid
//   near the line, a curve point appears between two nodes: drag it up or down to bend that
//     segment; double-click it to straighten it
//
// Argument (jsarguments): strike | press | slide | lift: which curve this is (for the dot).
// Inlet: bang (send the table again), linear, load <name>, save <name>, refresh, resetcurves,
//        pos <which> <input 0..1> <active 0|1> (from linn.cv, for the editor named <which>: a dot
//        where the sounding note sits). The editors share the receiver linn_curves (pos, refresh).
//        setnodes [<name>] <n x0 y0 b0 x1 y1 b1 ...> (the stored form, also what pattr keeps: the
//        curve's name, shown in the menu after a preset recall, then its nodes).
// Outlet 0: 128 floats: the curve at input 0/127 .. 127/127 (for linn.cv: prepend curve <which>).
// Outlet 1: to a umenu listing the library: clear, then append <name> for each curve.
//
// Library: factory curves (built in, shaped by eye after Equator's factory curves) and the user's,
// saved by name in linn.curves.json in the patch's folder. All editors share the file.

autowatch = 1;
inlets = 1;
outlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const PAD = 6; // px around the graph
const GRID = 16; // grid divisions
const HIT = 7; // px: grabbing distance for nodes and the curve point
const NEAR = 12; // px: how close to the line the curve point appears
const MAXB = 0.99;
const FILE = "linn.curves.json";

// nodes: [{ x, y, b }], x rising from 0 to 1; b (-0.99..0.99) bends the segment to the next node:
// > 0 bulges up, < 0 down
let nodes = linearNodes();
let hover = -1; // segment whose curve point shows
let drag = null; // { kind: "node" | "bend", i, b0, y0 }
let curveName = "Linear"; // the curve loaded or saved last (edits keep it)
let dotX = -1; // the sounding note's input (0..1), -1 = none yet
let dotOn = 0; // 1 while a note sounds; the dot dims after

const DOT = [0.97, 0.8, 0.2]; // yellow, on every curve (the user's choice)
// this editor's name, from its arguments (whether or not jsarguments starts with the file name)
function myName() {
	try {
		return String(Array.from(jsarguments).find((a) => ["strike", "press", "slide", "lift"].includes(String(a))) || "");
	} catch (e) {
		return "";
	}
}


function linearNodes() {
	return [
		{ x: 0, y: 0, b: 0 },
		{ x: 1, y: 1, b: 0 },
	];
}

// --- curve math ---

// a segment's shape at t (0..1), 0..1 of the way from its first node's y to the next one's:
// t / (t + k (1 - t)), a hyperbola; k < 1 rises early, k > 1 late. "Up" means above the straight
// line whichever way the segment slopes.
function shape(t, b, rising) {
	if (!b) return t;
	const k0 = ((1 - b) / (1 + b)) ** 2;
	const k = rising ? k0 : 1 / k0;
	return t / (t + k * (1 - t));
}

function segY(i, t) {
	const a = nodes[i];
	const c = nodes[i + 1];
	return a.y + (c.y - a.y) * shape(t, a.b, c.y >= a.y);
}

// the curve at x (0..1)
function valueAt(x) {
	x = Math.max(0, Math.min(1, x));
	for (let i = 0; i < nodes.length - 1; i++) {
		const a = nodes[i];
		const c = nodes[i + 1];
		if (x > c.x) continue;
		if (c.x - a.x <= 1e-9) return c.y;
		return segY(i, (x - a.x) / (c.x - a.x));
	}
	return nodes[nodes.length - 1].y;
}

function table() {
	return Array.from({ length: 128 }, (_, v) => valueAt(v / 127));
}

// --- stored form ---

function flat() {
	const out = [nodes.length];
	nodes.forEach((n) => out.push(n.x, n.y, n.b));
	return out;
}

function fromFlat(a) {
	a = a.map(Number);
	const n = a[0];
	if (!(n >= 2) || a.length < 1 + 3 * n) return null;
	const out = [];
	for (let i = 0; i < n; i++) {
		const x = clamp(a[1 + 3 * i], 0, 1);
		out.push({ x: i === 0 ? 0 : i === n - 1 ? 1 : x, y: clamp(a[2 + 3 * i], 0, 1), b: clamp(a[3 + 3 * i] || 0, -MAXB, MAXB) });
	}
	for (let i = 1; i < n; i++) if (out[i].x < out[i - 1].x) out[i].x = out[i - 1].x;
	return out;
}

const clamp = (v, lo, hi) => Math.max(lo, Math.min(hi, v));

function getvalueof() {
	return [curveName, ...flat()];
}

// a stored value: the name (older presets have none), then the nodes
function setvalueof(...a) {
	// (names saved through the dialog before 2026-09-23 start with "symbol ": drop it)
	const name = a.length && isNaN(Number(a[0])) ? String(a.shift()).replace(/^symbol /, "") : null;
	const n = fromFlat(a);
	if (!n) return;
	nodes = n;
	if (name !== null) {
		curveName = name;
		showName();
	}
	changed(false);
}

// the menu shows the curve's name without loading it again
function showName() {
	outlet(1, "setsymbol", curveName);
}

function setnodes(...a) {
	setvalueof(...a);
}

// changed: redraw, send the table, and (after an edit) tell pattr
function changed(edit = true) {
	mgraphics.redraw();
	outlet(0, table());
	if (edit) notifyclients();
}

// pos <which> <x> <active>: where the sounding note's input sits on the curve named <which>
function pos(which, x, on) {
	if (String(which) !== myName()) return;
	dotX = clamp(Number(x) || 0, 0, 1);
	dotOn = on ? 1 : 0;
	mgraphics.redraw();
}

function bang() {
	outlet(0, table());
}

function loadbang() {
	refresh();
	bang();
}

// also fill the menu and send the table once just after the script (re)loads: a new editor
// or an edited script gets no loadbang
const start = new Task(loadbang, this);
start.schedule(0);

function linear() {
	nodes = linearNodes();
	curveName = "Linear";
	showName();
	changed();
}

// --- library ---

const n3 = (...pts) => [pts.length, ...pts.flat()];
const FACTORY = {
	Linear: n3([0, 0, 0], [1, 1, 0]),
	"Velocity 1": n3([0, 0, -0.3], [1, 1, 0]),
	"Velocity 2": n3([0, 0, -0.6], [1, 1, 0]),
	"Velocity 3": n3([0, 0, 0.3], [0.5, 0.5, -0.3], [1, 1, 0]),
	"Velocity 4": n3([0, 0, 0.6], [0.5, 0.5, -0.6], [1, 1, 0]),
	"Velocity 5": n3([0, 0, 0.5], [0.5, 0.42, -0.6], [1, 1, 0]),
	"Velocity 6": n3([0, 0, 0.4], [0.5, 0.4, 0], [0.8, 0.65, -0.5], [1, 1, 0]),
	"Velocity 7": n3([0, 0, 0.5], [0.15, 0.25, 0], [0.85, 0.75, 0.5], [1, 1, 0]),
	"Full Velocity": n3([0, 1, 0], [1, 1, 0]),
	Exponential: n3([0, 0, -0.6], [1, 1, 0]),
	"Press Dead Zone Heavy": n3([0, 0, 0], [0.85, 0, -0.5], [1, 1, 0]),
	"Press Dead Zone Lite": n3([0, 0, 0], [0.25, 0, -0.5], [1, 1, 0]),
	// the user's (2026-09-25): 1 at both edges, 0.5 in the middle
	"mirrored linear": n3([0, 1, 0], [0.5, 0.5, 0], [1, 1, 0]),
	"mirrored exp": n3([0, 1, -0.6], [0.5, 0.5, -0.6], [1, 1, 0]),
};

function libPath() {
	let fp = "";
	try {
		fp = String(this.patcher.filepath || "");
	} catch (e) {}
	const i = fp.lastIndexOf("/");
	return i >= 0 ? fp.slice(0, i + 1) + FILE : "";
}

function readLib() {
	const p = libPath();
	if (!p) return {};
	const f = new File(p, "read");
	if (!f.isopen) return {};
	let s = "";
	while (f.position < f.eof) s += String(f.readline(65536)) + "\n";
	f.close();
	try {
		const o = JSON.parse(s);
		return o && typeof o === "object" ? o : {};
	} catch (e) {
		post("linn.curve: can't read " + p + "\n");
		return {};
	}
}

function writeLib(lib) {
	const p = libPath();
	if (!p) {
		post("linn.curve: save the patch first (the library goes next to it)\n");
		return false;
	}
	const f = new File(p, "write", "TEXT");
	if (!f.isopen) {
		post("linn.curve: can't write " + p + "\n");
		return false;
	}
	f.writestring(JSON.stringify(lib, null, 1) + "\n");
	f.eof = f.position;
	f.close();
	return true;
}

// fill the umenu: factory curves, then the user's
function refresh() {
	outlet(1, "clear");
	Object.keys(FACTORY).forEach((k) => outlet(1, "append", k));
	const user = Object.keys(readLib()).sort();
	if (user.length) outlet(1, "append", "<separator>");
	user.forEach((k) => outlet(1, "append", k));
	showName();
}

function load(...name) {
	name = name.join(" ");
	const a = FACTORY[name] || readLib()[name];
	const n = a && fromFlat(a);
	if (!n) {
		post("linn.curve: no curve named " + name + "\n");
		return;
	}
	nodes = n;
	curveName = name;
	changed();
}

// resetcurves: delete every saved curve and go back to Linear (the patch sends it to all editors
// through linn_curves after a confirmation dialog)
function resetcurves() {
	if (!writeLib({})) return;
	nodes = linearNodes();
	curveName = "Linear";
	changed();
	refresh();
}

function save(...name) {
	if (name.length > 1 && String(name[0]) === "symbol") name.shift(); // dialog sends "symbol <text>"
	name = name.join(" ").trim();
	if (!name) return;
	if (FACTORY[name]) {
		post("linn.curve: " + name + " is a factory curve: pick another name\n");
		return;
	}
	const lib = readLib();
	lib[name] = flat();
	if (!writeLib(lib)) return;
	curveName = name;
	notifyclients();
	messnamed("linn_curves", "refresh");
	refresh();
}

// --- drawing ---

const W = () => mgraphics.size[0] - 2 * PAD;
const H = () => mgraphics.size[1] - 2 * PAD;
const px = (x) => PAD + x * W();
const py = (y) => PAD + (1 - y) * H();
const vx = (X) => (X - PAD) / W();
const vy = (Y) => 1 - (Y - PAD) / H();

// where a segment's curve point sits: the point of the curve on the perpendicular bisector of
// its straight line, in pixels (as Equator draws it)
function handle(i) {
	const a = nodes[i];
	const c = nodes[i + 1];
	const A = [px(a.x), py(a.y)];
	const C = [px(c.x), py(c.y)];
	const M = [(A[0] + C[0]) / 2, (A[1] + C[1]) / 2];
	const D = [C[0] - A[0], C[1] - A[1]];
	const s = (t) => {
		const x = a.x + (c.x - a.x) * t;
		return (px(x) - M[0]) * D[0] + (py(segY(i, t)) - M[1]) * D[1];
	};
	let lo = 0;
	let hi = 1;
	for (let k = 0; k < 40; k++) {
		const mid = (lo + hi) / 2;
		if (s(mid) < 0) lo = mid;
		else hi = mid;
	}
	const t = (lo + hi) / 2;
	return [px(a.x + (c.x - a.x) * t), py(segY(i, t))];
}

function paint() {
	const [w, h] = mgraphics.size;
	mgraphics.set_source_rgba(0.13, 0.14, 0.17, 1);
	mgraphics.rectangle(0, 0, w, h);
	mgraphics.fill();
	mgraphics.set_line_width(1);
	for (let g = 0; g <= GRID; g++) {
		const c = g === GRID / 2 ? 0.34 : 0.22;
		mgraphics.set_source_rgba(c, c, c + 0.03, 1);
		mgraphics.move_to(px(g / GRID), py(0));
		mgraphics.line_to(px(g / GRID), py(1));
		mgraphics.move_to(px(0), py(g / GRID));
		mgraphics.line_to(px(1), py(g / GRID));
		mgraphics.stroke();
	}
	mgraphics.set_source_rgba(0.78, 0.8, 0.86, 1);
	mgraphics.set_line_width(1.5);
	mgraphics.move_to(px(0), py(nodes[0].y));
	for (let i = 0; i < nodes.length - 1; i++) {
		const a = nodes[i];
		const c = nodes[i + 1];
		const steps = Math.max(2, Math.ceil(Math.abs(px(c.x) - px(a.x)) / 2));
		for (let s = 1; s <= steps; s++) {
			const t = s / steps;
			mgraphics.line_to(px(a.x + (c.x - a.x) * t), py(segY(i, t)));
		}
	}
	mgraphics.stroke();
	nodes.forEach((n, i) => {
		const on = drag && drag.kind === "node" && drag.i === i;
		mgraphics.set_source_rgba(on ? 0.9 : 0.42, on ? 0.92 : 0.45, on ? 0.96 : 0.55, 1);
		mgraphics.ellipse(px(n.x) - 4, py(n.y) - 4, 8, 8);
		mgraphics.fill();
	});
	if (dotX >= 0) {
		const [r, g, b] = DOT;
		const X = px(dotX);
		const Y = py(valueAt(dotX));
		mgraphics.set_source_rgba(r, g, b, dotOn ? 1 : 0.35);
		mgraphics.ellipse(X - 5, Y - 5, 10, 10);
		mgraphics.fill();
	}
	const seg = drag && drag.kind === "bend" ? drag.i : hover;
	if (seg >= 0 && seg < nodes.length - 1) {
		const [X, Y] = handle(seg);
		mgraphics.set_source_rgba(0.1, 0.85, 0.95, 1);
		mgraphics.move_to(X, Y - 5);
		mgraphics.line_to(X + 5, Y);
		mgraphics.line_to(X, Y + 5);
		mgraphics.line_to(X - 5, Y);
		mgraphics.close_path();
		mgraphics.fill();
	}
}

// --- mouse ---

function nodeAt(X, Y) {
	let best = -1;
	let bd = HIT;
	nodes.forEach((n, i) => {
		const d = Math.hypot(px(n.x) - X, py(n.y) - Y);
		if (d <= bd) {
			bd = d;
			best = i;
		}
	});
	return best;
}

// the segment whose curve passes near the pointer, or -1
function segmentNear(X, Y) {
	const x = vx(X);
	for (let i = 0; i < nodes.length - 1; i++) {
		const a = nodes[i];
		const c = nodes[i + 1];
		if (x < a.x || x > c.x || c.x - a.x <= 1e-9) continue;
		if (Math.abs(py(segY(i, (x - a.x) / (c.x - a.x))) - Y) <= NEAR) return i;
	}
	return -1;
}

function handleAt(X, Y) {
	for (let i = 0; i < nodes.length - 1; i++) {
		if (nodes[i + 1].x - nodes[i].x <= 1e-9) continue;
		const [hx, hy] = handle(i);
		if (Math.hypot(hx - X, hy - Y) <= HIT) return i;
	}
	return -1;
}

function onidle(X, Y) {
	const s = nodeAt(X, Y) >= 0 ? -1 : handleAt(X, Y) >= 0 ? handleAt(X, Y) : segmentNear(X, Y);
	if (s !== hover) {
		hover = s;
		mgraphics.redraw();
	}
}
onidle.local = 1;

function onidleout() {
	if (hover !== -1) {
		hover = -1;
		mgraphics.redraw();
	}
}
onidleout.local = 1;

function onclick(X, Y) {
	const n = nodeAt(X, Y);
	if (n >= 0) {
		drag = { kind: "node", i: n };
		mgraphics.redraw();
		return;
	}
	const s = handleAt(X, Y);
	if (s >= 0) drag = { kind: "bend", i: s, b0: nodes[s].b, y0: Y };
}
onclick.local = 1;

function ondrag(X, Y, button, mod1, shift) {
	if (!drag) return;
	if (!button) {
		drag = null;
		mgraphics.redraw();
		notifyclients();
		return;
	}
	if (drag.kind === "bend") {
		nodes[drag.i].b = clamp(drag.b0 + (drag.y0 - Y) / 80, -MAXB, MAXB);
	} else {
		const i = drag.i;
		const nd = nodes[i];
		let x = vx(X);
		let y = vy(Y);
		if (shift) {
			x = Math.round(x * GRID) / GRID;
			y = Math.round(y * GRID) / GRID;
		}
		nd.y = clamp(y, 0, 1);
		if (i > 0 && i < nodes.length - 1) nd.x = clamp(x, nodes[i - 1].x, nodes[i + 1].x);
	}
	mgraphics.redraw();
	outlet(0, table());
}
ondrag.local = 1;

function ondblclick(X, Y) {
	drag = null;
	const n = nodeAt(X, Y);
	if (n >= 0) {
		if (n === 0 || n === nodes.length - 1) return;
		nodes.splice(n, 1);
		changed();
		return;
	}
	const s = handleAt(X, Y);
	if (s >= 0) {
		nodes[s].b = 0;
		changed();
		return;
	}
	const x = vx(X);
	const y = vy(Y);
	if (x <= 0 || x >= 1 || y < 0 || y > 1) return;
	const i = nodes.findIndex((nd) => nd.x > x); // insert before this one
	if (i <= 0) return;
	nodes.splice(i, 0, { x, y: clamp(y, 0, 1), b: 0 });
	hover = -1;
	changed();
}
ondblclick.local = 1;

function onresize() {
	mgraphics.redraw();
}
onresize.local = 1;
