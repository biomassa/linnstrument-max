// linn.lights: send a scale's row layout and pad lights to the LinnStrument,
// the way linnkit does (internal/device, internal/layout, internal/lights).
//
// Device rule (CLAUDE.md): lights go to custom slot 2 only; rows and Bend Range
// are settings, so "send" first makes the one backup, reference/backups/backup.json,
// unless it exists already (restore then always returns to the original settings).
//
// Inlet 0: messages: scale <path>, send, sendlights, backup, restore [path],
//          scheme <root|ji|names|mos>, offset <n>, limit <n>, root <note>, refhz <hz>,
//          rootcolor <name>, bend <n>, dump, status, reset.
// Inlet 1: raw MIDI bytes from the LinnStrument (for readback replies).
// Outlet 0: raw MIDI bytes to midiout.
// Outlet 1: settings (scale, scheme, offset, rootcolor, bend, limit, root, refhz),
//           offsetinfo <text>, legend <text>, tuning <root> <hz> (for linn.retune),
//           preview <json> (colors, labels, notes of all pads, for linn.preview), and status
//           (backup <path> <n> | backup kept <path>, verified <n>, restored <n> <path>,
//           lights <note>, state <...>, error <text>).

autowatch = 1;
inlets = 2;
outlets = 2;

// num, min, max, has range, readable: from linnkit internal/device/params_gen.go (firmware 2.3.4 ls_midi.ino)
const PARAMS = [
	[0,0,2,1,1],[1,1,16,1,1],[2,0,1,1,1],[3,0,1,1,1],[4,0,1,1,1],[5,0,1,1,1],[6,0,1,1,1],[7,0,1,1,1],[8,0,1,1,1],
	[9,0,1,1,1],[10,0,1,1,1],[11,0,1,1,1],[12,0,1,1,1],[13,0,1,1,1],[14,0,1,1,1],[15,0,1,1,1],[16,0,1,1,1],
	[17,0,1,1,1],[18,1,16,1,1],[19,1,96,1,1],[20,0,1,1,1],[21,0,1,1,1],[22,0,3,1,1],[23,0,1,1,1],[24,0,1,1,1],
	[25,0,127,1,1],[26,0,1,1,1],[27,0,1,1,1],[28,0,2,1,1],[29,0,127,1,1],[30,1,11,1,1],[31,1,11,1,1],
	[32,0,11,1,1],[33,1,11,1,1],[34,0,7,1,1],[35,0,4,1,1],[36,0,10,1,1],[37,0,14,1,1],[38,0,14,1,1],[39,0,2,1,1],
	[40,0,128,1,1],[41,0,128,1,1],[42,0,128,1,1],[43,0,128,1,1],[44,0,128,1,1],[45,0,128,1,1],[46,0,128,1,1],
	[47,0,128,1,1],[48,0,1,1,1],[49,0,128,1,1],[50,0,1,1,1],[51,0,128,1,1],[52,0,128,1,1],[53,0,128,1,1],
	[54,0,127,1,1],[55,0,127,1,1],[56,0,127,1,1],[57,0,127,1,1],[58,0,1,1,1],[59,0,127,1,1],[60,0,1,1,1],
	[61,0,14,1,1],[62,0,0,0,1],[63,0,0,0,1],[64,0,0,0,1],[65,0,3,1,1],[66,0,0,0,0],[200,0,1,1,1],[201,0,1,1,1],
	[202,2,25,1,1],[203,0,1,1,1],[204,0,1,1,1],[205,0,1,1,1],[206,0,1,1,1],[207,0,1,1,1],[208,0,1,1,1],
	[209,0,1,1,1],[210,0,1,1,1],[211,0,1,1,1],[212,0,1,1,1],[213,0,1,1,1],[214,0,1,1,1],[215,0,1,1,1],
	[216,0,1,1,1],[217,0,1,1,1],[218,0,1,1,1],[219,0,1,1,1],[220,0,1,1,1],[221,0,1,1,1],[222,0,1,1,1],
	[223,0,1,1,1],[224,0,1,1,1],[225,0,1,1,1],[226,0,1,1,1],[227,0,0,0,1],[228,0,0,0,1],[229,0,0,0,1],
	[230,0,0,0,1],[231,0,0,0,1],[232,0,3,1,1],[233,0,2,1,1],[234,0,1,1,1],[235,0,4,1,1],[236,1,7,1,1],
	[237,0,2,1,1],[238,1,360,1,1],[239,0,1,1,1],[240,0,1,1,1],[241,0,1,1,1],[242,0,1,1,1],[243,0,5,1,1],
	[244,0,1,1,1],[245,0,1,1,1],[246,0,1,1,1],[247,0,11,1,1],[248,0,127,1,1],[249,1,127,1,1],[250,1,127,1,1],
	[251,1,127,1,1],[252,0,512,1,1],[253,0,33,1,1],[254,0,1,1,1],[255,0,127,1,1],[256,0,127,1,1],[257,0,127,1,1],
	[258,0,127,1,1],[259,0,127,1,1],[260,0,127,1,1],[261,0,127,1,1],[262,0,127,1,1],[263,0,127,1,1],
	[264,0,127,1,1],[265,0,127,1,1],[266,0,127,1,1],[267,0,127,1,1],[268,0,127,1,1],[269,0,127,1,1],
	[270,0,127,1,1],[299,0,0,0,0],
];

const NO_RESTORE = new Set([62, 63, 64, 65, 66, 162, 163, 164, 165, 166, 234, 243, 245, 299]); // actions, MIDI I/O, preset load, query
const NO_ANSWER = new Set([62, 63, 64]); // handled but never answered (firmware 2.3.4)
const P = { bend: 19, rowOffset: 227, noteLights: 247, guitarRow1: 263, query: 299, guitar: 13, custom0: 9, right: 100 };
const SLOT = 2; // scratch light slot (device rule)
const COLS = 25;
const ROWS = 8;
const ROOT = 60; // default MIDI note of degree 0 (per scale: root), as in linnkit
const COLORS = { off: 0, red: 1, yellow: 2, green: 3, cyan: 4, blue: 5, magenta: 6, white: 8, orange: 9, lime: 10, pink: 11 };
const SCHEMES = ["root", "ji", "names", "mos"]; // linnkit's light schemes (internal/lights/schemes.go)
const DELAY = 2; // ms after each message, as linnkit
const TIMEOUT = 1500; // ms to wait for readback replies
const FALLBACK_DIR = "/Users/ars/Dropbox/musicstuff/Max 9/linnstrument/reference/backups/";

const store = new Dict("linn.lights.settings"); // per scale, JSON strings keyed by file name
let scaleName = "";
let degrees = 0;
let scl = null; // the scale: { cents: [n], ratios: [n] ([num, den] or null), period }
let busy = false;

// --- parameters ---

const paramIndex = new Map(PARAMS.map((p) => [p[0], p]));

function lookup(num) {
	if (num >= P.right && num < 200) {
		const p = paramIndex.get(num - P.right);
		return p && p[0] <= 99 ? [num, p[1], p[2], p[3], p[4]] : null;
	}
	return paramIndex.get(num) || null;
}

function readableParams() {
	const out = PARAMS.filter((p) => p[4] && p[0] !== P.query && !NO_ANSWER.has(p[0])).map((p) => p[0]);
	return out.concat(out.filter((n) => n <= 99).map((n) => n + P.right));
}

function nrpnBytes(param, value) {
	return [0xb0, 99, param >> 7, 0xb0, 98, param & 127, 0xb0, 6, value >> 7, 0xb0, 38, value & 127, 0xb0, 101, 127, 0xb0, 100, 127];
}

// --- scale and settings ---

function scale(path) {
	path = String(path);
	const s = readScale(path);
	if (!s) return;
	scaleName = path.split(/[\/:]/).pop();
	scl = s;
	degrees = s.cents.length;
	outlet(1, "scale", scaleName, degrees);
	dump();
}

// a .scl file as linnkit reads it (internal/scala/scl.go): "!" lines are comments, then a
// description, the note count, and one pitch per line: cents if it has a ".", else a ratio
// n/d or an integer n. Degree 0 is 1/1; the last pitch is the period.
function readScale(path) {
	const f = new File(path, "read");
	if (!f.isopen) {
		report("error", "can't open " + path);
		return null;
	}
	const lines = [];
	while (f.position < f.eof) lines.push(String(f.readline(4096)).replace(/\r$/, ""));
	f.close();
	const body = lines.filter((l) => !l.trim().startsWith("!"));
	const n = parseInt(String(body[1]).trim().split(/\s+/)[0], 10);
	const pitches = body
		.slice(2)
		.map((l) => pitch(l.trim().split(/\s+/)[0] || ""))
		.filter((p) => p)
		.slice(0, n);
	if (!(n > 0) || pitches.length !== n) {
		report("error", "can't read " + path);
		return null;
	}
	const cents = [0];
	const ratios = [[1, 1]];
	for (let k = 1; k < n; k++) {
		cents.push(pitches[k - 1].cents);
		ratios.push(pitches[k - 1].ratio);
	}
	return { cents, ratios, period: pitches[n - 1].cents };
}

// one pitch field: the leading run of 0-9 + - . / (anything after it is ignored)
function pitch(field) {
	const tok = (field.match(/^[0-9+\-./]*/) || [""])[0];
	if (!tok) return null;
	if (tok.includes(".")) {
		const c = parseFloat(tok);
		return isNaN(c) ? null : { cents: c, ratio: null };
	}
	const [a, b = "1"] = tok.split("/");
	let num = parseInt(a, 10);
	let den = parseInt(b, 10);
	if (!(num > 0) || !(den > 0)) return null;
	const g = gcd(num, den);
	num /= g;
	den /= g;
	return { cents: 1200 * Math.log2(num / den), ratio: [num, den] };
}

function defaults() {
	// row offset: the step count nearest a perfect fourth (linnkit scores candidates instead; not ported)
	return {
		scheme: "root",
		offset: Math.max(1, Math.min(COLS, Math.round((degrees * 498.04) / 1200))),
		rootcolor: "magenta",
		bend: 48,
		limit: 7, // ji scheme: highest prime
		root: ROOT, // MIDI note of degree 0
		refhz: 0, // frequency of the root; 0 = its 12-TET pitch
	};
}

function settings() {
	const s = defaults();
	if (scaleName && store.contains(scaleName)) Object.assign(s, JSON.parse(String(store.get(scaleName))));
	return s;
}

// store one setting for the current scale; returns the new settings (null without a scale)
function change(key, value) {
	if (!scaleName) {
		report("error", "pick a scale first");
		return null;
	}
	const s = settings();
	s[key] = value;
	store.set(scaleName, JSON.stringify(s));
	outlet(1, key, value);
	return s;
}

function scheme(name) {
	name = String(name);
	if (!SCHEMES.includes(name)) report("error", "scheme " + name + " is not available (root, ji, names, mos)");
	else derived(change("scheme", name), ["legend", "preview"]);
}

function offset(n) {
	derived(change("offset", Math.max(1, Math.min(COLS, Math.round(n)))), ["offsetinfo", "preview"]);
}

function limit(n) {
	derived(change("limit", Math.max(3, Math.min(13, Math.round(n)))), ["legend", "preview"]);
}

function root(n) {
	derived(change("root", Math.max(0, Math.min(127, Math.round(n)))), ["tuning", "preview"]);
}

function refhz(f) {
	derived(change("refhz", Math.max(0, Number(f) || 0)), ["tuning"]);
}

function rootcolor(name) {
	name = String(name);
	if (!(name in COLORS) || name === "off") report("error", "unknown color " + name);
	else derived(change("rootcolor", name), ["preview"]);
}

function bend(n) {
	change("bend", Math.max(1, Math.min(96, Math.round(n))));
}

function dump() {
	const s = settings();
	for (const k of ["scheme", "offset", "rootcolor", "bend", "limit", "root", "refhz"]) outlet(1, k, s[k]);
	derived(s, ["offsetinfo", "legend", "tuning", "preview"]);
}

// outputs computed from the settings: row interval, color legend, tuning for linn.retune
function derived(s, which) {
	if (!s || !scl) return;
	if (which.includes("offsetinfo")) outlet(1, "offsetinfo", offsetInfo(s));
	if (which.includes("legend")) outlet(1, "legend", legend(s));
	if (which.includes("tuning")) outlet(1, "tuning", s.root, s.refhz > 0 ? s.refhz : 440 * Math.pow(2, (s.root - 69) / 12));
	if (which.includes("preview")) outlet(1, "preview", JSON.stringify(grid(s)));
}

// "9 steps = 491 c ~4/3": the row interval and the simplest ratio near it (linnkit's candidate list)
function offsetInfo(s) {
	const step = scl.period / degrees;
	const c = s.offset * step;
	const r = nearestRatio(c, Math.max(10, 0.35 * step));
	return s.offset + " steps = " + Math.round(c) + " c" + (r ? " ~" + r[0] + "/" + r[1] : "");
}

function legend(s) {
	if (s.scheme === "ji") return "R root, 3 white, 5 green, 7 blue, 11 orange, 13 yellow (limit " + s.limit + ")";
	if (s.scheme === "names") return "C root, naturals white, sharps blue, flats green";
	if (s.scheme === "mos") {
		const m = defaultMOS();
		return m ? "R root, MOS white (" + m.size + " notes, generator " + m.generator + " degrees), other degrees unlit" : "no MOS found in this scale: root only";
	}
	return "R root";
}

// --- scale analysis and light schemes, ported from linnkit (internal/theory, internal/lights/schemes.go) ---

const FIFTH = 1200 * Math.log2(1.5);
const JI_COLORS = { 3: COLORS.white, 5: COLORS.green, 7: COLORS.blue, 11: COLORS.orange, 13: COLORS.yellow };

function gcd(a, b) {
	while (b) [a, b] = [b, a % b];
	return a;
}

function largestPrime(x) {
	let lp = 1;
	for (let p = 2; p * p <= x; p++)
		while (x % p === 0) {
			lp = p;
			x /= p;
		}
	return x > 1 ? x : lp;
}

const primeLimit = (n, d) => Math.max(largestPrime(n), largestPrime(d));

function oddPart(x) {
	while (x > 0 && x % 2 === 0) x /= 2;
	return x;
}

// the degree closest to a pitch within the period, and the error (degree minus pitch)
function nearestDegree(c) {
	let best = 0;
	let err = Infinity;
	scl.cents.forEach((d, i) => {
		if (Math.abs(d - c) < Math.abs(err)) {
			best = i;
			err = d - c;
		}
	});
	return [best, err];
}

// the simplest ratio (smallest n*d; up to 23-limit, odd limit 63, denominator 64) within tol cents
function nearestRatio(cents, tol) {
	const octaves = Math.min(Math.ceil((Math.max(cents, 0) + tol) / 1200) + 1, 4);
	let best = null;
	let bestErr = 0;
	for (let d = 1; d <= 64; d++)
		for (let n = d; n < d * 2 ** octaves; n++) {
			if (gcd(n, d) !== 1 || primeLimit(n, d) > 23 || Math.max(oddPart(n), oddPart(d)) > 63) continue;
			const e = Math.abs(1200 * Math.log2(n / d) - cents);
			if (e > tol) continue;
			if (!best || n * d < best[0] * best[1] || (n * d === best[0] * best[1] && e < bestErr)) {
				best = [n, d];
				bestErr = e;
			}
		}
	return best;
}

// one [CC22 color, label] per degree for the current scheme; labels as linnkit's grid prints them
function swatches(s) {
	const rootColor = COLORS[s.rootcolor];
	if (s.scheme === "ji") return jiFamilies(s.limit, rootColor);
	if (s.scheme === "names") return noteNames(rootColor);
	const sw = Array.from({ length: degrees }, () => [COLORS.off, ""]);
	if (s.scheme === "mos") {
		const m = defaultMOS();
		if (m) mosDegrees(m).forEach((d) => (sw[d] = [COLORS.white, "o"]));
	}
	sw[0] = [rootColor, "R"];
	return sw;
}

// ji: each degree by the prime limit of its ratio from the root. Degrees written as ratios use
// their own limit (off above the limit); degrees in cents take the simplest just ratio (lowest
// limit, then smallest n*d) whose nearest degree is within tol = min(15, 0.35 x mean step).
function jiFamilies(lim, rootColor) {
	const n = degrees;
	const tol = Math.min(15, (0.35 * scl.period) / n);
	const family = new Array(n).fill(0); // 0 = undecided, -1 = off
	family[0] = 1;
	for (let d = 1; d < n; d++) {
		const r = scl.ratios[d];
		if (r) {
			const pl = primeLimit(r[0], r[1]);
			family[d] = pl >= 3 && pl <= lim ? pl : -1;
		}
	}
	for (const [a, b, pl] of justRatios(lim, 400)) {
		const c = 1200 * Math.log2(a / b);
		if (c >= scl.period) continue;
		const [d, err] = nearestDegree(c);
		if (d > 0 && Math.abs(err) <= tol && family[d] === 0) family[d] = pl;
	}
	return family.map((f) => (f === 1 ? [rootColor, "R"] : f > 1 ? [JI_COLORS[f] || COLORS.off, String(f)] : [COLORS.off, ""]));
}

// n/d inside the octave with d <= 32, n*d <= maxHeight and prime limit 3..lim,
// sorted by limit and then n*d, stable in generation order
function justRatios(lim, maxHeight) {
	const out = [];
	for (let d = 1; d <= 32; d++)
		for (let n = d + 1; n < 2 * d; n++) {
			if (gcd(n, d) !== 1 || n * d > maxHeight) continue;
			const pl = primeLimit(n, d);
			if (pl >= 3 && pl <= lim) out.push([n, d, pl]);
		}
	return out.sort((x, y) => x[2] - y[2] || x[0] * x[1] - y[0] * y[1]);
}

// names: meantone note names from the chain of fifths (the degree nearest 3/2), C on the root.
// Sharps are naturals plus the chromatic step (7 fifths - 4 periods), flats minus it.
// Precedence: root, naturals, sharps, flats; the rest are off.
function noteNames(rootColor) {
	const n = degrees;
	const sw = new Array(n).fill(null);
	const mod = (x) => ((x % n) + n) % n;
	const set = (d, c, label) => {
		if (sw[d] === null) sw[d] = [c, label];
	};
	set(0, rootColor, "C");
	const [fifth] = nearestDegree(FIFTH);
	if (fifth > 0) {
		const names = ["F", "C", "G", "D", "A", "E", "B"]; // F is one fifth below C
		const naturals = names.map((_, i) => mod((i - 1) * fifth));
		naturals.forEach((d, i) => set(d, COLORS.white, names[i]));
		const apotome = 7 * fifth - 4 * n;
		if (mod(apotome) !== 0) {
			naturals.forEach((d, i) => set(mod(d + apotome), COLORS.blue, names[i] + "#"));
			naturals.forEach((d, i) => set(mod(d - apotome), COLORS.green, names[i] + "b"));
		}
	}
	return sw.map((p) => p || [COLORS.off, ""]);
}

// mos: the degree nearest 3/2 as generator, 7 notes starting one generator below the root;
// if 7 is not a MOS, try 5, 6, 8..12 (null when nothing fits)
function defaultMOS() {
	const n = degrees;
	const [g] = nearestDegree(FIFTH);
	if (g <= 0 || n < 5) return null;
	for (const size of [7, 5, 6, 8, 9, 10, 11, 12]) {
		const m = { generator: g, size, down: 1 };
		if (size < n && isMOS(mosDegrees(m), n)) return m;
	}
	return null;
}

function mosDegrees(m) {
	const seen = new Set();
	for (let k = -m.down; k < m.size - m.down; k++) seen.add((((k * m.generator) % degrees) + degrees) % degrees);
	return [...seen].sort((a, b) => a - b);
}

// exactly two step sizes, counted in degrees
function isMOS(degs, n) {
	if (degs.length < 2) return false;
	return new Set(degs.map((d, i) => (i + 1 < degs.length ? degs[i + 1] : n) - d)).size === 2;
}

// --- layout and lights ---

// row starts with the root on row 4, column 1, moved to fit MIDI 0..127 (linnkit layout.RootLow)
function rowStarts(off, rootNote = ROOT) {
	let low = rootNote - 3 * off;
	const span = 7 * off + COLS - 1;
	if (low + span > 127) low = 127 - span;
	low = Math.max(low, 0);
	return Array.from({ length: ROWS }, (_, r) => low + r * off);
}

// surface()[row][col - 1] = CC22 color; row 0 nearest the player
// every pad in the color of the degree it plays (linnkit lights.Paint); degree 0 on the root
function surface() {
	return grid(settings()).colors;
}

function labelSurface() {
	return grid(settings()).labels;
}

// colors, labels and MIDI notes of all pads, each [row][col - 1]; pads outside MIDI 0..127 are
// off and labelled "!!", as in linnkit
function grid(s) {
	const rows = rowStarts(s.offset, s.root);
	const n = degrees || 12;
	const sw = scl ? swatches(s) : [[COLORS[s.rootcolor], "R"]].concat(Array.from({ length: n - 1 }, () => [COLORS.off, ""]));
	const g = { colors: [], labels: [], notes: [] };
	rows.forEach((start) => {
		const notes = Array.from({ length: COLS }, (_, c) => start + c);
		const pads = notes.map((note) => (note < 0 || note > 127 ? [COLORS.off, "!!"] : sw[(((note - s.root) % n) + n) % n]));
		g.notes.push(notes);
		g.colors.push(pads.map((p) => p[0]));
		g.labels.push(pads.map((p) => p[1]));
	});
	return g;
}

// --- sending: a queue of 3-byte messages and callbacks, DELAY ms apart ---

const queue = [];
const pump = new Task(tick, this);
pump.interval = DELAY;
let pumping = false;

function enqueue(...items) {
	queue.push(...items);
	if (!pumping) {
		pumping = true;
		pump.repeat();
	}
}

function enqueueBytes(bytes) {
	for (let i = 0; i < bytes.length; i += 3) enqueue(bytes.slice(i, i + 3));
}

function setNRPN(param, value) {
	const p = lookup(param);
	if (p && p[3] && (value < p[1] || value > p[2])) {
		post("linn.lights: NRPN " + param + " value " + value + " outside " + p[1] + ".." + p[2] + ", skipped\n");
		return false;
	}
	enqueueBytes(nrpnBytes(param, value));
	return true;
}

function tick() {
	const item = queue.shift();
	if (typeof item === "function") item();
	else if (item) item.forEach((b) => outlet(0, b));
	if (!queue.length) {
		pump.cancel();
		pumping = false;
	}
}

// one-shot timers stay referenced until they fire, so Max cannot free them early
const timers = new Set();

function later(ms, fn) {
	const t = new Task(() => {
		timers.delete(t);
		fn();
	}, this);
	timers.add(t);
	t.schedule(ms);
}

// status: state <busy 0/1> <messages queued> <replies got/wanted, or -> <pending timers>
function status() {
	report("state", busy ? 1 : 0, queue.length, reading ? Object.keys(reading.got).length + "/" + reading.want.size : "-", timers.size);
}

// reset: drop a stuck job (queue, readback, timers) without reloading the patch
function reset() {
	queue.length = 0;
	pump.cancel();
	pumping = false;
	timers.forEach((t) => t.cancel());
	timers.clear();
	reading = null;
	busy = false;
	status();
}

function report(...a) {
	outlet(1, ...a);
	if (a[0] === "error") post("linn.lights: " + a.slice(1).join(" ") + "\n");
}

function start() {
	if (busy) {
		report("error", "busy");
		return false;
	}
	if (!scaleName) {
		report("error", "pick a scale first");
		return false;
	}
	busy = true;
	return true;
}

function done() {
	busy = false;
}

function sendlights() {
	if (start()) write(false);
}

function send() {
	if (!start()) return;
	if (hasBackup()) {
		report("backup", "kept", backupPath()); // the first backup stays, so restore returns to the original settings
		write(true);
	} else makeBackup((ok) => (ok ? write(true) : done()));
}

function write(withLayout) {
	const s = settings();
	const expect = {};
	const set = (p, v) => {
		if (setNRPN(p, v)) expect[p] = v;
	};
	if (withLayout) {
		set(P.bend, s.bend);
		set(P.bend + P.right, s.bend);
		set(P.rowOffset, P.guitar);
		rowStarts(s.offset, s.root).forEach((v, i) => set(P.guitarRow1 + i, Math.max(0, Math.min(127, v))));
	}
	set(P.noteLights, P.custom0 + SLOT);
	const surf = surface();
	paint(surf);
	enqueue([0xb0, 23, SLOT]); // saves the slot and all settings to flash
	enqueue(() => recordLights(surf, s));
	enqueue(() =>
		later(500, () =>
			read(Object.keys(expect).map(Number), (got) => {
				const bad = Object.keys(expect).filter((p) => got[p] !== undefined && got[p] !== expect[p]);
				const missing = Object.keys(expect).filter((p) => got[p] === undefined);
				if (bad.length) report("error", "readback mismatch: " + bad.map((p) => p + "=" + got[p] + " expected " + expect[p]).join(", "));
				else if (missing.length) report("error", "no answer for " + missing.join(" "));
				else report("verified", Object.keys(expect).length);
				done();
			})
		)
	);
}

// --- readback: NRPN 299 queries, replies on inlet 1 ---

let reading = null;
const cc = Array.from({ length: 16 }, () => ({ msb: 0, lsb: 0, vmsb: 0, rpn: false }));
let buf = [];

function read(params, cb, retries = 2) {
	reading = { want: new Set(params), got: {}, cb, retries };
	params.forEach((p) => enqueueBytes(nrpnBytes(P.query, p)));
	enqueue(() => later(TIMEOUT, finishRead));
}

function finishRead() {
	const r = reading;
	if (!r) return;
	const missing = [...r.want].filter((p) => !(p in r.got));
	if (missing.length && r.retries > 0) {
		r.retries--;
		later(300, () => {
			missing.forEach((p) => enqueueBytes(nrpnBytes(P.query, p)));
			enqueue(() => later(TIMEOUT, finishRead));
		});
		return;
	}
	reading = null;
	r.cb(r.got, missing);
}

function msg_int(b) {
	if (inlet !== 1) return;
	if (b & 0x80) {
		buf = (b & 0xf0) === 0xb0 ? [b] : [];
		return;
	}
	if (!buf.length) return;
	buf.push(b);
	if (buf.length === 3) {
		reply(buf[0] & 0x0f, buf[1], buf[2]);
		buf = [buf[0]]; // running status
	}
}

// collect NRPN replies (CC99, CC98, CC6, CC38); RPN traffic (CC101/100) is ignored
function reply(ch, num, v) {
	const st = cc[ch];
	if (num === 99) (st.msb = v), (st.rpn = false);
	else if (num === 98) (st.lsb = v), (st.rpn = false);
	else if (num === 101 || num === 100) st.rpn = true;
	else if (num === 6) st.vmsb = v;
	else if (num === 38 && !st.rpn && reading) {
		const p = (st.msb << 7) | st.lsb;
		if (reading.want.has(p)) reading.got[p] = (st.vmsb << 7) | v;
	}
}

// --- backup and restore (linnkit's JSON format: {"taken", "values"}) ---

function backupDir() {
	let fp = "";
	try {
		fp = String(this.patcher.filepath || "");
	} catch (e) {}
	const i = fp.lastIndexOf("/patchers/");
	return i >= 0 ? fp.slice(0, i) + "/reference/backups/" : FALLBACK_DIR;
}

function backup() {
	if (!start()) return;
	makeBackup(done);
}

function makeBackup(cb) {
	read(readableParams(), (got, missing) => {
		const n = Object.keys(got).length;
		if (!n) {
			report("error", "the LinnStrument did not answer; if it is asleep, touch a pad to wake it");
			cb(false);
			return;
		}
		const d = new Date();
		const path = backupPath();
		const values = {};
		Object.keys(got).map(Number).sort((a, b) => a - b).forEach((k) => (values[k] = got[k]));
		const f = new File(path, "write", "TEXT");
		if (!f.isopen) {
			report("error", "can't write " + path);
			cb(false);
			return;
		}
		const snap = { taken: d.toISOString(), values };
		const lights = readJSON(backupDir() + LIGHTS_FILE);
		if (validLights(lights)) snap.lights = lights; // the slot 2 pattern, which the device can't report
		f.writestring(JSON.stringify(snap, null, 2) + "\n");
		f.close();
		if (missing.length) post("linn.lights: backup missing " + missing.length + " parameters: " + missing.join(" ") + "\n");
		report("backup", path, n);
		cb(true);
	});
}

// the one backup file; the lights record lives in the same folder
const BACKUP_FILE = "backup.json";

function backupPath() {
	return backupDir() + BACKUP_FILE;
}

function hasBackup() {
	const f = new File(backupPath(), "read");
	const ok = f.isopen;
	f.close();
	return ok;
}

function readJSON(path) {
	const f = new File(path, "read");
	if (!f.isopen) return null;
	let text = "";
	while (f.position < f.eof) text += String(f.readline(4096)) + "\n";
	f.close();
	try {
		return JSON.parse(text);
	} catch (e) {
		return null;
	}
}

function writeJSON(path, obj) {
	const f = new File(path, "write", "TEXT");
	if (!f.isopen) {
		report("error", "can't write " + path);
		return false;
	}
	f.writestring(JSON.stringify(obj, null, 2) + "\n");
	f.close();
	return true;
}

// --- slot 2 light pattern: recorded when painted, carried in backups, repainted by restore ---

const LIGHTS_FILE = "lights-slot2.json";

function validLights(l) {
	return !!l && Array.isArray(l.pattern) && l.pattern.length === ROWS && l.pattern.every((r) => Array.isArray(r) && r.length === COLS);
}

// 200 pads, column by column, as linnkit sends them; pattern[row][col - 1] = CC22 color
function paint(pattern) {
	for (let col = 1; col <= COLS; col++)
		for (let row = 0; row < ROWS; row++) enqueue([0xb0, 20, col], [0xb0, 21, row], [0xb0, 22, pattern[row][col - 1]]);
}

function recordLights(pattern, s) {
	writeJSON(backupDir() + LIGHTS_FILE, {
		slot: SLOT,
		scale: scaleName,
		scheme: s.scheme,
		limit: s.limit,
		root: s.root,
		offset: s.offset,
		taken: new Date().toISOString(),
		pattern,
	});
}

function restore(path) {
	if (busy) {
		report("error", "busy");
		return;
	}
	path = path ? String(path) : hasBackup() ? backupPath() : "";
	if (!path) {
		report("error", "no backups yet");
		return;
	}
	const data = readJSON(path);
	if (!data || !data.values) {
		report("error", "can't read " + path);
		return;
	}
	const snap = data.values;
	const lights = validLights(data.lights) ? data.lights : null;
	busy = true;
	const nums = Object.keys(snap).map(Number).filter((n) => !NO_RESTORE.has(n)).sort((a, b) => a - b);
	read(nums, (current) => {
		const changed = nums.filter((n) => current[n] !== snap[n] && setNRPN(n, snap[n]));
		if (lights) {
			// show slot 2, repaint it, save it; then show the slot the backup had showing
			setNRPN(P.noteLights, P.custom0 + SLOT);
			paint(lights.pattern);
			enqueue([0xb0, 23, SLOT]);
			const shown = snap[P.noteLights];
			if (shown !== undefined && shown !== P.custom0 + SLOT) setNRPN(P.noteLights, shown);
			enqueue(() => writeJSON(backupDir() + LIGHTS_FILE, Object.assign({}, lights, { restored: path })));
		} else {
			report("lights", "not in this backup, slot 2 unchanged");
		}
		enqueue(() =>
			read([P.noteLights], (g) => {
				const slot = g[P.noteLights] - P.custom0;
				if (slot >= 0 && slot <= 2) enqueue([0xb0, 23, slot]); // re-saves the showing slot and all settings to flash
				enqueue(() => {
					report("restored", changed.length, path);
					done();
				});
			})
		);
	});
}
