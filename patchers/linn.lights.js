// linn.lights: send a scale's row layout and pad lights to the LinnStrument,
// the way linnkit does (internal/device, internal/layout, internal/lights).
//
// Device rule (CLAUDE.md): lights go to custom slot 2 only; rows and Bend Range
// are settings, so "send" first makes the one backup, reference/backups/backup.json,
// unless it exists already (restore then always returns to the original settings).
// send and sendlights first read the split; the columns of a split in CC faders mode are
// painted dark, since the custom lights would cover the faders.
//
// Inlet 0: messages: scale <path>, send, sendlights, backup, restore [path],
//          scheme <name> (root ji names mos chain moskeys wijmenga kite factors steps nested
//          consonance harmonics; see docs/light-schemes.md), offset <n>, limit <n>, root <note>,
//          refhz <hz>, rootcolor <name>, bend <n>, generator <n>, mossize <n>, harmonics <16|32>,
//          subharmonics <0|1>, low <note> (bottom-left pad; -1 = root on row 4, column 1),
//          state <json> (every scale's settings at once, from [pattr]), dump, status, reset.
// Inlet 1: raw MIDI bytes from the LinnStrument (for readback replies).
// Outlet 0: raw MIDI bytes to midiout.
// Outlet 1: settings (scale, scheme, offset, rootcolor, bend, limit, root, refhz, generator,
//           mossize, harmonics, subharmonics, low),
//           offsetinfo <text>, legend <text>, tuning <root> <hz> (for linn.retune),
//           lightsstate <json> (every scale's settings, after each change, for [pattr]),
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
// linnkit's light schemes (internal/lights/schemes.go, schemes_more.go; the new ones in docs/light-schemes.md)
const MORE_SCHEMES = ["chain", "moskeys", "wijmenga", "kite", "factors", "steps", "nested", "consonance", "harmonics"];
const SCHEMES = ["root", "ji", "names", "mos"].concat(MORE_SCHEMES);
const DELAY = 2; // ms after each message, as linnkit
const TIMEOUT = 1500; // ms to wait for readback replies

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
	const s = readScale(localPath(path));
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
		generator: 0, // chain, moskeys, wijmenga, nested: degrees; 0 = the degree nearest 3/2
		mossize: 0, // moskeys: notes; 0 = automatic
		harmonics: 16, // 16 = harmonics 1-16, 32 = harmonics 16-32
		subharmonics: 1, // harmonics: also the subharmonic series
		low: -1, // MIDI note of the bottom-left pad; -1 = root on row 4, column 1 (linnkit's store Low)
	};
}

// a scale's settings: stored ones over the defaults; with no stored offset, linnkit's best ranked one
function settings() {
	const s = defaults();
	const stored = scaleName && store.contains(scaleName) ? JSON.parse(String(store.get(scaleName))) : {};
	Object.assign(s, stored);
	if (!("offset" in stored) && scl) s.offset = candidates(s.root)[0].offset;
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
	sendState();
	return s;
}

// --- every scale's settings as one block for a [pattr] in the patch: saved with the patch and in
// presets, recalled in one piece. The individual controls are kept out of autopattr: restored one
// by one in no fixed order, a value could land on the wrong scale. ---

let lastState = "";

function stateJSON() {
	const all = {};
	for (const k of [].concat(store.getkeys() || [])) all[k] = JSON.parse(String(store.get(k)));
	return JSON.stringify(all);
}

function sendState() {
	lastState = stateJSON();
	outlet(1, "lightsstate", lastState);
}

// state <json>: replace every scale's settings (from [pattr] at load or preset recall), then show
// the current scale's; our own block coming back unchanged is ignored
function state(json) {
	json = String(json);
	if (json === lastState) return;
	let all;
	try {
		all = JSON.parse(json);
	} catch (e) {
		report("error", "can't read the settings block");
		return;
	}
	if (!all || typeof all !== "object" || Array.isArray(all)) return;
	store.clear();
	for (const k of Object.keys(all)) store.set(k, JSON.stringify(all[k]));
	lastState = json;
	if (scaleName) dump();
}

function scheme(name) {
	name = String(name);
	if (!SCHEMES.includes(name)) report("error", "scheme " + name + " is not available (" + SCHEMES.join(", ") + ")");
	else derived(change("scheme", name), ["legend", "preview"]);
}

// a new offset puts the root back on row 4 (low -1), as picking another layout does in linnkit's dashboard
function offset(n) {
	let s = change("offset", Math.max(1, Math.min(COLS, Math.round(n))));
	if (s && s.low >= 0) s = change("low", -1);
	derived(s, ["offsetinfo", "offsetindex", "preview"]);
}

// offsetpick <i>: the i-th row offset of the ranked menu (0 = the best)
function offsetpick(i) {
	if (!scl) return;
	const c = candidates(settings().root)[Math.round(i)];
	if (c) offset(c.offset);
}

// midisetup <0|1>: send also sets Channel Per Note, main channel 1, per-note channels 2-16,
// X/Y/Z on, Y = CC74 and Z = channel pressure on both splits (linnkit's "configure MIDI")
let midiSetup = 1;

function midisetup(n) {
	midiSetup = n ? 1 : 0;
	outlet(1, "midisetup", midiSetup);
}

function limit(n) {
	derived(change("limit", Math.max(3, Math.min(13, Math.round(n)))), ["legend", "preview"]);
}

function root(n) {
	derived(change("root", Math.max(0, Math.min(127, Math.round(n)))), ["tuning", "offsets", "preview"]); // the ranking depends on the root (fits)
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

function generator(n) {
	derived(change("generator", Math.max(0, Math.round(n))), ["legend", "preview"]);
}

function mossize(n) {
	derived(change("mossize", Math.max(0, Math.round(n))), ["legend", "preview"]);
}

function harmonics(n) {
	n = Math.round(n);
	if (n !== 16 && n !== 32) report("error", "harmonics must be 16 or 32, not " + n);
	else derived(change("harmonics", n), ["legend", "preview"]);
}

function subharmonics(n) {
	derived(change("subharmonics", n ? 1 : 0), ["legend", "preview"]);
}

// the bottom-left pad's note, used as is (pads above MIDI 127 are off, as in linnkit); -1 = automatic
function low(n) {
	derived(change("low", Math.max(-1, Math.min(127, Math.round(n)))), ["preview"]);
}

function dump() {
	const s = settings();
	for (const k of ["scheme", "offset", "rootcolor", "bend", "limit", "root", "refhz", "generator", "mossize", "harmonics", "subharmonics", "low"]) outlet(1, k, s[k]);
	derived(s, ["offsetinfo", "offsets", "legend", "tuning", "preview"]);
}

// outputs computed from the settings: row interval, ranked offsets, color legend, tuning for linn.retune
function derived(s, which) {
	if (!s || !scl) return;
	if (which.includes("offsetinfo")) outlet(1, "offsetinfo", offsetInfo(s));
	if (which.includes("offsets")) {
		// menu items: "offsetmenu clear", then "offsetmenu append <label>" for each offset, best first
		outlet(1, "offsetmenu", "clear");
		candidates(s.root).forEach((c) => outlet(1, "offsetmenu", "append", offsetLabel(c)));
	}
	if (which.includes("offsets") || which.includes("offsetindex"))
		outlet(1, "offsetindex", candidates(s.root).findIndex((c) => c.offset === s.offset));
	if (which.includes("legend")) outlet(1, "legend", legend(s));
	if (which.includes("tuning")) outlet(1, "tuning", s.root, s.refhz > 0 ? s.refhz : 440 * Math.pow(2, (s.root - 69) / 12));
	if (which.includes("preview")) outlet(1, "preview", JSON.stringify(masked(grid(s))));
}

// "9 steps = 491 c ~4/3": the row interval and the simplest ratio near it (linnkit's candidate list)
function offsetInfo(s) {
	const step = scl.period / degrees;
	const c = s.offset * step;
	const r = nearestRatio(c, Math.max(10, 0.35 * step));
	return s.offset + " steps = " + Math.round(c) + " c" + (r ? " ~" + r[0] + "/" + r[1] : "");
}

function legend(s) {
	if (MORE_SCHEMES.includes(s.scheme)) return more(s).legend;
	if (s.scheme === "ji") return "R root, 3 white, 5 green, 7 blue, 11 orange, 13 yellow (limit " + s.limit + ")";
	if (s.scheme === "names") return "C root, naturals white, sharps blue, flats green";
	if (s.scheme === "mos") {
		const m = defaultMOS();
		return m ? "R root, MOS white (" + m.size + " notes, generator " + m.generator + " degrees), other degrees unlit" : "no MOS found in this scale: root only";
	}
	return "R root";
}

// --- row offsets ranked like linnkit (internal/layout/candidates.go): compact major and minor triads
// first, then at least 2.5 periods of range, then a short move to the same degree one period up;
// layouts that don't fit in MIDI 0..127 rank last. Lower score is better. ---

const TRIADS = [
	[1200 * Math.log2(5 / 4), 1200 * Math.log2(3 / 2)], // major
	[1200 * Math.log2(6 / 5), 1200 * Math.log2(3 / 2)], // minor
];
let candCache = { key: "", list: [] };

// cents from degree k up s degrees, crossing periods
function intervalCents(k, s) {
	const j = k + s;
	return scl.cents[j % degrees] + Math.floor(j / degrees) * scl.period - scl.cents[k];
}

// how many degrees above degree k the interval closest to target lies, and whether it's within tol
function stepsFor(k, target, tol) {
	let best = 0;
	let bestErr = Infinity;
	for (let s = 1; s <= 2 * degrees; s++) {
		const e = Math.abs(intervalCents(k, s) - target);
		if (e < bestErr) {
			best = s;
			bestErr = e;
		}
	}
	return [best, bestErr <= tol];
}

// the pad move (columns, rows up) for an interval of s notes with row offset r: the shortest
// column move using 0 to 4 rows, fewer rows on ties
function padMove(s, r) {
	let dc = s;
	let dr = 0;
	for (let k = 1; k <= 4; k++) {
		const c = s - k * r;
		if (Math.abs(c) < Math.abs(dc)) {
			dc = c;
			dr = k;
		}
	}
	return [dc, dr];
}

// mean columns spanned by the major and minor triads the scale can form, over every root degree; -1 if none
function chordSpan(r, tol) {
	let total = 0;
	let count = 0;
	for (const chord of TRIADS)
		for (let k = 0; k < degrees; k++) {
			const cols = [0];
			let ok = true;
			for (const target of chord) {
				const [s, found] = stepsFor(k, target, tol);
				if (!found) {
					ok = false;
					break;
				}
				cols.push(padMove(s, r)[0]);
			}
			if (ok) {
				total += Math.max(...cols) - Math.min(...cols);
				count++;
			}
		}
	return count ? total / count : -1;
}

// every row offset 1..25 with the root at rootNote, best first (linnkit layout.Candidates)
function candidates(rootNote) {
	const key = scaleName + "|" + rootNote;
	if (candCache.key === key) return candCache.list;
	const step = scl.period / degrees;
	const tol = Math.max(30, 0.6 * step);
	const list = [];
	for (let r = 1; r <= COLS; r++) {
		const rows = rowStarts(r, rootNote);
		const fits = rows[0] >= 0 && rows[ROWS - 1] + COLS - 1 <= 127;
		const periods = (7 * r + COLS - 1) / degrees;
		const span = chordSpan(r, tol);
		const move = padMove(degrees, r);
		let score = span < 0 ? 30 : span;
		score += 3 * Math.max(0, 2.5 - periods);
		score += 0.5 * Math.abs(move[0]);
		if (!fits) score += 50;
		score -= 0.01 * periods;
		list.push({ offset: r, cents: r * step, ratio: nearestRatio(r * step, Math.max(10, 0.35 * step)), periods, span, move, fits, score });
	}
	list.sort((a, b) => a.score - b.score); // stable, as linnkit's sort.SliceStable
	candCache = { key, list };
	return list;
}

// a menu item: "+10  387 c ~5/4", marked when the surface doesn't fit in MIDI 0..127
function offsetLabel(c) {
	return "+" + c.offset + "  " + Math.round(c.cents) + " c" + (c.ratio ? " ~" + c.ratio[0] + "/" + c.ratio[1] : "") + (c.fits ? "" : "  (doesn't fit)");
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
	if (MORE_SCHEMES.includes(s.scheme)) return more(s).sw;
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

// --- the schemes in docs/light-schemes.md, ported from linnkit internal/lights/schemes_more.go ---

const THIRD = 1200 * Math.log2(1.25);
const COLOR_NAMES = Object.fromEntries(Object.entries(COLORS).map(([k, v]) => [v, k]));
const mod = (x, n) => ((x % n) + n) % n;
const offs = (n) => Array.from({ length: n }, () => [COLORS.off, ""]);
const tolerance = () => Math.min(15, (0.35 * scl.period) / degrees);

// swatches and legend of one of MORE_SCHEMES
function more(s) {
	const rc = COLORS[s.rootcolor];
	switch (s.scheme) {
		case "chain":
			return {
				sw: chainScheme(s, rc),
				legend: "C root  white k 0..4  yellow 5..8  green -1..-4  blue 9..12  red -5..-8  cyan 13..16  pink -9..-12  (generator " + generatorOf(s) + ")",
			};
		case "moskeys": {
			const { sw, m } = mosKeysScheme(s, rc);
			return { sw, legend: m ? "R root  white MOS (" + m.size + " notes, generator " + m.generator + ")  blue other" : "no MOS found in this scale: root only" };
		}
		case "wijmenga": {
			const w = wijmengaScheme(s, rc);
			return {
				sw: w.sw,
				legend: w.meantone
					? "R root  green naturals  white sharps  flats unlit  yellow outer sharps  blue outer flats  (meantone)"
					: "R root  white naturals and a comma either side  green sharps  orange flats  (comma " + w.c + ", chroma " + w.chroma + " degrees)",
			};
		}
		case "kite":
			return { sw: kiteScheme(s, rc), legend: "R root  wa white  yo yellow  gu green  zo blue  ru red  ilo lime  lu orange  tho pink  thu cyan  (limit " + s.limit + ")" };
		case "factors":
			return { sw: factorsScheme(s), legend: "R root (unlit)  3 red  5 green  7 blue  35 yellow  57 cyan  37 magenta  357 white  (limit " + s.limit + ")" };
		case "steps": {
			const [cls, k] = stepClasses();
			const sw = cls.map((c) => stepSwatch(c, k));
			sw[0] = [rc, "R"];
			const parts = Array.from({ length: k }, (_, c) => stepSwatch(c, k)).map(([col, l]) => l + " " + COLOR_NAMES[col]);
			return { sw, legend: "R root  " + k + " step sizes, largest first: " + parts.join("  ") };
		}
		case "nested": {
			const { sw, layers } = nestedScheme(s, rc);
			const parts = layers.map((size, i) => i + 1 + " " + COLOR_NAMES[LAYER_COLORS[i]] + " (" + size + " notes)");
			return { sw, legend: layers.length ? "R root  " + parts.join("  ") : "no MOS layers found: root only" };
		}
		case "consonance":
			return { sw: consonanceScheme(rc), legend: "R root  odd limit <=5 white  <=9 green  <=15 blue  higher cyan" };
		case "harmonics": {
			const [lo, hi] = s.harmonics === 32 ? [16, 32] : [1, 16];
			return {
				sw: harmonicsScheme(s, rc),
				legend: "R root  harmonics " + lo + "-" + hi + " yellow" + (s.subharmonics ? "  subharmonics blue (u)  both white" : ""),
			};
		}
	}
	return null;
}

// the generator in degrees: the setting (mod n), or the degree nearest 3/2
function generatorOf(s) {
	return s.generator > 0 ? s.generator % degrees : nearestDegree(FIFTH)[0];
}

// each degree's chain position: the k in [2 - floor((n-1)/2), 2 + ceil((n-1)/2)] with k*g mod n = d,
// the one closest to k = 2 when several reach it (ties to the lower k); null when none does
function chainPositions(n, g) {
	const pos = new Array(n).fill(null);
	for (let k = 2 - Math.floor((n - 1) / 2); k <= 2 + Math.floor(n / 2); k++) {
		const d = mod(k * g, n);
		if (pos[d] === null || Math.abs(k - 2) < Math.abs(pos[d] - 2)) pos[d] = k;
	}
	return pos;
}

// k = -1..5 are F C G D A E B; then sharps (x for two), flats
function chainName(k) {
	const name = ["F", "C", "G", "D", "A", "E", "B"][mod(k + 1, 7)];
	const acc = Math.floor((k + 1) / 7);
	return acc === 2 ? name + "x" : acc > 0 ? name + "#".repeat(acc) : acc < 0 ? name + "b".repeat(-acc) : name;
}

function chainColor(k) {
	if (k >= 0 && k <= 4) return COLORS.white;
	if (k >= 5 && k <= 8) return COLORS.yellow;
	if (k >= -4 && k <= -1) return COLORS.green;
	if (k >= 9 && k <= 12) return COLORS.blue;
	if (k >= -8 && k <= -5) return COLORS.red;
	if (k >= 13 && k <= 16) return COLORS.cyan;
	if (k >= -12 && k <= -9) return COLORS.pink;
	return COLORS.off;
}

// chain: place on the chain of generators from the root (Lumatone 31-EDO colours after Kite), note names;
// positions outside the coloured range are unlit but keep their name
function chainScheme(s, rc) {
	const sw = chainPositions(degrees, generatorOf(s)).map((k) => (k === null ? [COLORS.off, ""] : [chainColor(k), chainName(k)]));
	sw[0] = [rc, "C"];
	return sw;
}

// moskeys: a MOS white, every other degree blue; the automatic size is searched along the generator
function mosKeysScheme(s, rc) {
	const n = degrees;
	const g = generatorOf(s);
	let size = s.mossize > 0 ? s.mossize : 0;
	if (!size) size = [7, 5, 6, 8, 9, 10, 11, 12].find((m) => g > 0 && m < n && isMOS(mosDegrees({ generator: g, size: m, down: 1 }), n)) || 0;
	const sw = offs(n);
	sw[0] = [rc, "R"];
	if (!size) return { sw, m: null };
	const m = { generator: g, size, down: 1 };
	for (let d = 1; d < n; d++) sw[d] = [COLORS.blue, ""];
	mosDegrees(m).forEach((d) => d && (sw[d] = [COLORS.white, ""]));
	return { sw, m };
}

// wijmenga: his meantone keyboard (rows of 7-5-7-5-7 by chain position), else "four seasons":
// naturals and a comma either side white, sharps (+25/24) green, flats orange
function wijmengaScheme(s, rc) {
	const n = degrees;
	const g = generatorOf(s);
	const [t] = nearestDegree(THIRD);
	const c = 4 * g - 2 * n - t;
	const chroma = 2 * t - g;
	const meantone = mod(c, n) === 0;
	const sw = offs(n);
	if (meantone) {
		chainPositions(n, g).forEach((k, d) => {
			if (k === null) return;
			if (k >= -1 && k <= 5) sw[d] = [COLORS.green, ""];
			else if (k >= 6 && k <= 10) sw[d] = [COLORS.white, ""];
			else if (k >= 11 && k <= 17) sw[d] = [COLORS.yellow, ""];
			else if (k >= -13 && k <= -7) sw[d] = [COLORS.blue, ""];
		});
	} else {
		const set = (d, col) => {
			if (sw[d][0] === COLORS.off) sw[d] = [col, ""];
		};
		const naturals = [-1, 0, 1, 2, 3, 4, 5].map((k) => mod(k * g, n));
		naturals.forEach((d) => [d, d + c, d - c].forEach((x) => set(mod(x, n), COLORS.white)));
		naturals.forEach((d) => set(mod(d + chroma, n), COLORS.green));
		naturals.forEach((d) => set(mod(d - chroma, n), COLORS.orange));
	}
	sw[0] = [rc, "R"];
	return { sw, c, chroma, meantone };
}

// the ratio of each degree as ji reads it: the written ratio when its prime limit is 3..lim (none when
// higher), else the first justRatios(lim, 400) entry that lands on the degree within tolerance
function jiRatios(lim) {
	const n = degrees;
	const tol = tolerance();
	const out = new Array(n).fill(null);
	const decided = new Array(n).fill(false);
	out[0] = [1, 1];
	decided[0] = true;
	for (let d = 1; d < n; d++) {
		const r = scl.ratios[d];
		if (!r) continue;
		decided[d] = true;
		const pl = primeLimit(r[0], r[1]);
		if (pl >= 3 && pl <= lim) out[d] = r;
	}
	for (const [a, b] of justRatios(lim, 400)) {
		const c = 1200 * Math.log2(a / b);
		if (c >= scl.period) continue;
		const [d, err] = nearestDegree(c);
		if (d > 0 && Math.abs(err) <= tol && !decided[d]) {
			out[d] = [a, b];
			decided[d] = true;
		}
	}
	return out;
}

const KITE = {
	5: [[COLORS.yellow, "yo"], [COLORS.green, "gu"]],
	7: [[COLORS.blue, "zo"], [COLORS.red, "ru"]],
	11: [[COLORS.lime, "ilo"], [COLORS.orange, "lu"]],
	13: [[COLORS.pink, "tho"], [COLORS.cyan, "thu"]],
};

// kite: Kite Giedraitis's colour notation: the highest prime above 3, over (numerator) or under; 3-limit is wa
function kiteScheme(s, rc) {
	const sw = jiRatios(s.limit).map((r, d) => {
		if (!d || !r) return [COLORS.off, ""];
		const num = largestPrime(r[0]);
		const den = largestPrime(r[1]);
		const p = Math.max(num, den);
		if (p < 5) return [COLORS.white, "wa"];
		return KITE[p] ? KITE[p][num > den ? 0 : 1] : [COLORS.off, ""];
	});
	sw[0] = [rc, "R"];
	return sw;
}

const FACTOR_COLORS = { 3: COLORS.red, 5: COLORS.green, 7: COLORS.blue, 35: COLORS.yellow, 57: COLORS.cyan, 37: COLORS.magenta, 357: COLORS.white };

// factors: the primes 3, 5, 7 in each ratio switch the red, green, blue LEDs; the root is unlit
function factorsScheme(s) {
	const sw = jiRatios(s.limit).map((r, d) => {
		if (!d || !r) return [COLORS.off, ""];
		const label = [3, 5, 7].filter((p) => r[0] % p === 0 || r[1] % p === 0).join("");
		return label in FACTOR_COLORS ? [FACTOR_COLORS[label], label] : [COLORS.off, ""];
	});
	sw[0] = [COLORS.off, "R"];
	return sw;
}

// steps: each step (degree d to d+1, the last to the period) in a size class, 0 = the largest;
// a class holds the sizes within 0.5 c of its smallest member (linnkit theory.StepClasses)
function stepClasses() {
	const steps = scl.cents.map((c, d) => (d + 1 < degrees ? scl.cents[d + 1] : scl.period) - c);
	const v = steps.slice().sort((a, b) => a - b);
	const lows = [];
	let start = 0;
	v.forEach((x, i) => {
		if (i === 0) lows.push(x);
		else if (x - v[start] > 0.5) {
			start = i;
			lows.push(x);
		}
	});
	const cls = steps.map((st) => {
		let g = 0;
		lows.forEach((lo, j) => {
			if (st >= lo) g = j;
		});
		return lows.length - 1 - g;
	});
	return [cls, lows.length];
}

const STEP_MIDDLE = [COLORS.green, COLORS.cyan, COLORS.yellow, COLORS.orange, COLORS.lime, COLORS.pink];

function stepSwatch(c, k) {
	const col = c === 0 ? COLORS.white : c === k - 1 ? COLORS.blue : STEP_MIDDLE[(c - 1) % STEP_MIDDLE.length];
	const label = k === 1 ? "L" : k === 2 ? ["L", "s"][c] : k === 3 ? ["L", "M", "s"][c] : String(c + 1);
	return [col, label];
}

const LAYER_COLORS = [COLORS.white, COLORS.yellow, COLORS.blue, COLORS.green];

// nested: the MOS sizes 5..n-1 along the generator (from one generator below the root), smallest
// first, up to four; a degree belongs to the first layer that has it
function nestedScheme(s, rc) {
	const n = degrees;
	const g = generatorOf(s);
	const layers = [];
	for (let m = 5; g > 0 && m < n && layers.length < 4; m++) if (isMOS(mosDegrees({ generator: g, size: m, down: 1 }), n)) layers.push(m);
	const sw = offs(n);
	for (let i = layers.length - 1; i >= 0; i--) mosDegrees({ generator: g, size: layers[i], down: 1 }).forEach((d) => (sw[d] = [LAYER_COLORS[i], String(i + 1)]));
	sw[0] = [rc, "R"];
	return { sw, layers };
}

// consonance: bands by the odd limit of each degree's ratio (written, or the nearest simple ratio within tolerance)
function consonanceScheme(rc) {
	const tol = tolerance();
	const sw = scl.cents.map((c, d) => {
		const r = d ? scl.ratios[d] || nearestRatio(c, tol) : null;
		if (!r) return [COLORS.off, ""];
		const ol = Math.max(oddPart(r[0]), oddPart(r[1]));
		return [ol <= 5 ? COLORS.white : ol <= 9 ? COLORS.green : ol <= 15 ? COLORS.blue : COLORS.cyan, r[0] + "/" + r[1]];
	});
	sw[0] = [rc, "R"];
	return sw;
}

// harmonics: the degrees the root's harmonics (and subharmonics) land on within tolerance, reduced
// into the period, which counts as degree 0 again
function harmonicsScheme(s, rc) {
	const n = degrees;
	const period = scl.period;
	const tol = tolerance();
	const place = (c) => {
		c %= period;
		if (c < 0) c += period;
		let [d, err] = nearestDegree(c);
		if (Math.abs(period - c) < Math.abs(err)) [d, err] = [0, period - c];
		return Math.abs(err) <= tol ? d : -1;
	};
	const harm = new Array(n).fill(0);
	const sub = new Array(n).fill(0);
	const [lo, hi] = s.harmonics === 32 ? [16, 32] : [1, 16];
	for (let h = lo; h <= hi; h++) {
		const c = 1200 * Math.log2(h);
		let d = place(c);
		if (d >= 0 && !harm[d]) harm[d] = h;
		if (!s.subharmonics) continue;
		d = place(-c);
		if (d >= 0 && !sub[d]) sub[d] = h;
	}
	const sw = harm.map((h, d) =>
		h && sub[d] ? [COLORS.white, String(h)] : h ? [COLORS.yellow, String(h)] : sub[d] ? [COLORS.blue, "u" + sub[d]] : [COLORS.off, ""]
	);
	sw[0] = [rc, "R"];
	return sw;
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

// the row starts of a scale's settings: from the bottom-left note when set (linnkit layout.Uniform),
// else with the root on row 4
function rowsOf(s) {
	return s.low >= 0 ? Array.from({ length: ROWS }, (_, r) => s.low + r * s.offset) : rowStarts(s.offset, s.root);
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
	const rows = rowsOf(s);
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

// --- CC faders: pads in a split that shows faders stay dark, so the faders can be seen ---

// the firmware draws the faders under the custom light layer; send and sendlights read the split
// (NRPN 200 on/off, 201 the split shown when off, 202 first column of the right split) and each
// split's Special mode (35 / 135, 2 = CC faders) and leave those columns dark
const SPLIT = { on: 200, current: 201, point: 202, special: 35, faders: 2 };
let dark = new Set(); // columns 1..25 left dark

function faderColumns(v) {
	const cols = new Set();
	const faders = (side) => v[SPLIT.special + (side ? P.right : 0)] === SPLIT.faders;
	const sp = v[SPLIT.point];
	if (v[SPLIT.on] === 1 && sp >= 2 && sp <= COLS) {
		if (faders(0)) for (let c = 1; c < sp; c++) cols.add(c);
		if (faders(1)) for (let c = sp; c <= COLS; c++) cols.add(c);
	} else if (v[SPLIT.on] === 0 && faders(v[SPLIT.current] === 1)) {
		for (let c = 1; c <= COLS; c++) cols.add(c);
	}
	return cols;
}

// a grid with the dark columns off and unlabelled
function masked(g) {
	const off = (rows, blank) => rows.map((r) => r.map((x, i) => (dark.has(i + 1) ? blank : x)));
	return Object.assign({}, g, { colors: off(g.colors, COLORS.off), labels: off(g.labels, "") });
}

function write(withLayout) {
	read([SPLIT.on, SPLIT.current, SPLIT.point, SPLIT.special, SPLIT.special + P.right], (got, missing) => {
		if (missing.length) post("linn.lights: split settings not read (" + missing.join(" ") + "), all columns lit\n");
		dark = missing.length ? new Set() : faderColumns(got);
		derived(settings(), ["preview"]);
		writeNow(withLayout);
	});
}

function writeNow(withLayout) {
	const s = settings();
	const expect = {};
	const set = (p, v) => {
		if (setNRPN(p, v)) expect[p] = v;
	};
	if (withLayout && midiSetup) {
		// both splits, as linnkit's device.Configure: Channel Per Note, main channel 1, per-note
		// channels 2-16, Send X/Y/Z on, Y expression CC 74, Z expression channel pressure
		for (const base of [0, P.right]) {
			set(base + 0, 1);
			set(base + 1, 1);
			for (let ch = 1; ch <= 16; ch++) set(base + 1 + ch, ch === 1 ? 0 : 1);
			set(base + 20, 1);
			set(base + 24, 1);
			set(base + 39, 2);
			set(base + 25, 74);
			// the firmware only accepts 0-2 for the Y expression, but setting the Y CC number
			// (25) to anything but 1 promotes CC1 (2) to CC74 (3), so 3 is what reads back
			if (expect[base + 39] !== undefined) expect[base + 39] = 3;
			set(base + 27, 1);
			set(base + 28, 1);
		}
	}
	if (withLayout) {
		set(P.bend, s.bend);
		set(P.bend + P.right, s.bend);
		set(P.rowOffset, P.guitar);
		rowsOf(s).forEach((v, i) => set(P.guitarRow1 + i, Math.max(0, Math.min(127, v))));
	}
	set(P.noteLights, P.custom0 + SLOT);
	const surf = masked(grid(s)).colors;
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
	const r = { want: new Set(params), got: {}, cb, retries };
	reading = r;
	params.forEach((p) => enqueueBytes(nrpnBytes(P.query, p)));
	enqueue(() => later(TIMEOUT, () => finishRead(r)));
}

// ends a read when every reply is in, or after the timeout (with retries for the missing ones);
// a timer left over from a read that already ended does nothing
function finishRead(r) {
	if (!r || reading !== r) return;
	const missing = [...r.want].filter((p) => !(p in r.got));
	if (missing.length && r.retries > 0) {
		r.retries--;
		later(300, () => {
			missing.forEach((p) => enqueueBytes(nrpnBytes(P.query, p)));
			enqueue(() => later(TIMEOUT, () => finishRead(r)));
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
		if (reading.want.has(p)) {
			reading.got[p] = (st.vmsb << 7) | v;
			if (Object.keys(reading.got).length === reading.want.size) finishRead(reading);
		}
	}
}

// --- backup and restore (linnkit's JSON format: {"taken", "values"}) ---

// a relative path (the scale menu's prefix is "SCL/") is taken from this patcher's folder
function localPath(path) {
	if (/^[\/~]/.test(path) || /^[^\/]+:/.test(path)) return path;
	let fp = "";
	try {
		fp = String(this.patcher.filepath || "");
	} catch (e) {}
	const i = fp.lastIndexOf("/");
	return i >= 0 ? fp.slice(0, i + 1) + path : path;
}

// reference/backups/ in the repo when the script sits in patchers/; else the patcher's own
// folder; "" when the patch was never saved
function backupDir() {
	let fp = "";
	try {
		fp = String(this.patcher.filepath || "");
	} catch (e) {}
	const i = fp.lastIndexOf("/patchers/");
	if (i >= 0) return fp.slice(0, i) + "/reference/backups/";
	const j = fp.lastIndexOf("/");
	return j >= 0 ? fp.slice(0, j + 1) : "";
}

function backup() {
	if (!start()) return;
	makeBackup(done);
}

function makeBackup(cb) {
	if (!backupDir()) {
		report("error", "no folder for the backup: save the patch first");
		cb(false);
		return;
	}
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
		f.eof = f.position; // cut what an older, longer file had after this
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
	if (!backupDir()) return false;
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
	if (!/[\/:]/.test(path)) {
		report("error", "no folder for " + path + ": save the patch first");
		return false;
	}
	const f = new File(path, "write", "TEXT");
	if (!f.isopen) {
		report("error", "can't write " + path);
		return false;
	}
	f.writestring(JSON.stringify(obj, null, 2) + "\n");
	f.eof = f.position; // cut what an older, longer file had after this (Max's File keeps it otherwise)
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
		low: s.low,
		dark: [...dark],
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
	// a backup taken after a send records the Y expression as 3 (CC74), which NRPN 39 refuses
	// (0-2 only). Write the Y CC number first and then 2: the firmware promotes it to CC74.
	// A recorded CC of 1 would block the promotion, so use 74 first and set 1 again after.
	const yFix = [];
	for (const base of [0, P.right]) {
		if (snap[base + 39] !== 3) continue;
		const cc = snap[base + 25] === undefined || snap[base + 25] === 1 ? 74 : snap[base + 25];
		yFix.push([base + 25, cc], [base + 39, 2]);
		if (snap[base + 25] === 1) yFix.push([base + 25, 1]);
	}
	const yParams = new Set(yFix.map(([p]) => p));
	const nums = Object.keys(snap).map(Number).filter((n) => !NO_RESTORE.has(n)).sort((a, b) => a - b);
	read(nums, (current) => {
		const changed = nums.filter((n) => !yParams.has(n) && current[n] !== snap[n] && setNRPN(n, snap[n]));
		// the Y writes go in their own order, and only when the device isn't there already
		if (yFix.some(([p]) => current[p] !== snap[p])) {
			yFix.forEach(([p, v]) => setNRPN(p, v));
			yParams.forEach((p) => changed.push(p));
		}
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
