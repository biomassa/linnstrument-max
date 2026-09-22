// linn.cv: LinnStrument MPE to monophonic CV (Expert Sleepers ES-8), in a scale.
// The newest held note sounds; releasing it returns to the newest note still held.
// Every new sounding note retriggers the gate (it drops for retrigger ms) and fires a trigger.
//
// Pitch, bend, vibrato warp and onset fade are copied from linn.retune.js (the user's choice:
// a separate script, so the linnstrument patches' scripts stay untouched). Copy fixes by hand.
//
// Values are in dac~ units for the ES-8 (1 = 10 V):
//   pitch: 1 V/oct = 0.1 per octave, 0 V = MIDI 60 in 12-TET (C4, 261.63 Hz), clamped to -1..1;
//          bends ramp over slew ms (the LinnStrument sends one every 6-12 ms), new notes jump
//   gate: strike velocity / 127 while a note is held
//   pressure, Y: 0..1 from the sounding note's channel pressure (or poly pressure) and Y CC
//   (velocity, pressure, Y and release go through response curves: curve <which> <128 floats>,
//   which = strike, press, slide or lift, from linn.curve editors; linear until one arrives)
//   trigger: on each new sounding note, 1 for trigger ms; trigvel 1: its height is the gate level
//            (the Strike curve); triglen 1: its length runs from 2 ms (softest) to 20 ms (hardest)
//   release: the sounding note's note-off velocity / 127, held until the next release
//
// Inlet 0: raw MIDI bytes (from midiin), or messages: scale <path | archive name>,
//          root <note> <hz>, bendrange <n>, vibrato <gain 1..3>, onset <ms>, ycc <n>,
//          trigger <ms 2..20>, trigvel <0|1>, triglen <0|1>, retrigger <ms>, slew <ms>, curve <which> <128 floats>, panic.
// Inlet 1: list of 128 frequencies (Hz) for MIDI notes 0..127 (from mtof).
// Outlets 2 pressure, 3 Y, 5 release: floats (for sig~).
// Outlet 0 pitch: <value> <ms> (for line~). Outlets 1 gate, 4 trigger: line~ lists of <target> <ms> pairs, so pulse widths are exact.
// Outlet 6: requests to mtof (as linn.retune's outlet 1).
// Curve positions: pos <strike|press|slide|lift> <input 0..1> <1 = a note sounds, 0 = none> to the
// receiver linn_curves, for the dots on the linn.curve editors.

autowatch = 1;
inlets = 2;
outlets = 7;

let range = 48; // LinnStrument Bend Range: full bend = this many scale steps
let vibratoGain = 1;
let onsetMs = 40;
let yCC = 74;
let trigMs = 4;
let trigVel = 0; // 1: trigger height follows the Strike curve
let trigLen = 0; // 1: trigger length follows it, 2..20 ms
let retrigMs = 1;
let slewMs = 10; // pitch ramp for bends (0 = steps as they come)

// response curves: 7-bit input -> 0..1
const LINEAR = Array.from({ length: 128 }, (_, v) => v / 127);
const curves = { strike: LINEAR, press: LINEAR, slide: LINEAR, lift: LINEAR };

let table = [];
for (let n = 0; n < 128; n++) table[n] = n * 100;

const inBend = new Array(16).fill(8192); // last value per input channel
const inPress = new Array(16).fill(0);
const inY = new Array(16).fill(0);
const stack = []; // held notes { c, note, vel, t0 }, oldest first; the last one sounds
let gate = 0; // gate level now
let faded = true; // the sounding note's vibrato gain has faded in
const last = [NaN, NaN, NaN, NaN, NaN, NaN]; // last float sent per outlet

let buf = [];
let need = 0;

function msg_int(b) {
	if (inlet !== 0) return;
	if (b & 0x80) {
		if (b >= 0xf8) return; // realtime: dropped
		const h = b & 0xf0;
		need = h === 0xc0 || h === 0xd0 ? 2 : h < 0xf0 ? 3 : 0;
		buf = need ? [b] : [];
		return;
	}
	if (!buf.length) return;
	buf.push(b);
	if (buf.length === need) {
		handle(buf);
		buf = [buf[0]]; // running status
	}
}

function list(...a) {
	if (inlet !== 1 || a.length !== 128) return;
	table = a.map((f) => 1200 * Math.log2(f / 440) + 6900);
	tune();
}

// scale <path>: a .scl file, given to mtof inline; scale <name>: Max's archive (e.g. ji_11)
function scale(name) {
	name = String(name);
	if (/[\/:]/.test(name)) {
		const s = readScl(localPath(name));
		if (!s) return;
		outlet(6, "scalename", "none");
		outlet(6, "scale", s.length, ...s.flat());
	} else outlet(6, "scalename", name);
	outlet(6, Array.from({ length: 128 }, (_, i) => i));
}

function readScl(path) {
	const f = new File(path, "read");
	if (!f.isopen) {
		post("linn.cv: can't open " + path + "\n");
		return null;
	}
	const lines = [];
	while (f.position < f.eof) lines.push(String(f.readline(4096)).replace(/\r$/, ""));
	f.close();
	const body = lines.filter((l) => !l.startsWith("!"));
	const n = parseInt(body[1], 10);
	const pitches = body
		.slice(2)
		.map((l) => l.trim().split(/\s+/)[0])
		.filter((t) => t)
		.slice(0, n)
		.map((t) => (t.includes(".") ? [parseFloat(t), 0] : t.includes("/") ? t.split("/").map(Number) : [Number(t), 1]));
	if (!(n > 0) || pitches.length !== n) {
		post("linn.cv: can't read " + path + "\n");
		return null;
	}
	return pitches;
}

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

// root <note> <hz>: degree 0 on this MIDI note at this frequency
function root(note, hz) {
	outlet(6, "mid", note);
	outlet(6, "ref", note);
	outlet(6, "base", hz);
	outlet(6, Array.from({ length: 128 }, (_, i) => i));
}

function bendrange(n) {
	range = Math.max(1, Math.min(96, Math.round(n)));
	tune();
}

function vibrato(g) {
	vibratoGain = Math.max(1, Math.min(3, Number(g) || 1));
	tune();
}

function onset(ms) {
	onsetMs = Math.max(0, Math.min(500, Math.round(Number(ms) || 0)));
}

// ycc <n>: the CC the LinnStrument sends for Y (74 after linn.lights' MIDI setup)
function ycc(n) {
	yCC = Math.max(0, Math.min(127, Math.round(n)));
}

function trigger(ms) {
	trigMs = Math.max(2, Math.min(20, Number(ms) || 4));
}

function trigvel(on) {
	trigVel = on ? 1 : 0;
}

function triglen(on) {
	trigLen = on ? 1 : 0;
}

// curve <strike|press|slide|lift> <128 floats>: the response for 7-bit values 0..127
function curve(which, ...t) {
	which = String(which);
	if (!(which in curves) || t.length !== 128) {
		post("linn.cv: curve needs strike, press, slide or lift and 128 values\n");
		return;
	}
	curves[which] = t.map((v) => Math.max(0, Math.min(1, Number(v) || 0)));
	const s = sounding();
	if (!s) return;
	if (which === "press") send(2, curves.press[inPress[s.c]]);
	if (which === "slide") send(3, curves.slide[inY[s.c]]);
}

// where the sounding note's input sits on a curve (a dot on its editor)
function dot(which, v, on = 1) {
	messnamed("linn_curves", "pos", which, v / 127, on);
}

// slew <ms>: bends ramp to their new pitch over this long; new notes still jump
function slew(ms) {
	slewMs = Math.max(0, Math.min(50, Number(ms) || 0));
}

function retrigger(ms) {
	retrigMs = Math.max(0, Math.min(100, Number(ms) || 0));
}

// gate and trigger down, every held note forgotten
function panic() {
	stack.length = 0;
	gate = 0;
	outlet(1, 0, 0);
	outlet(4, 0, 0);
}

function handle(m) {
	const h = m[0] & 0xf0;
	const c = m[0] & 0x0f;
	const s = sounding();
	switch (h) {
		case 0x90:
			if (m[2]) noteOn(c, m[1], m[2]);
			else noteOff(c, m[1], 0);
			return;
		case 0x80:
			noteOff(c, m[1], m[2]);
			return;
		case 0xe0:
			inBend[c] = m[1] | (m[2] << 7);
			if (s && s.c === c) tune();
			return;
		case 0xd0:
			inPress[c] = m[1];
			if (s && s.c === c) {
				send(2, curves.press[m[1]]);
				dot("press", m[1]);
			}
			return;
		case 0xa0:
			if (s && s.c === c && s.note === m[1]) {
				inPress[c] = m[2];
				send(2, curves.press[m[2]]);
				dot("press", m[2]);
			}
			return;
		case 0xb0:
			if (m[1] === 123 || m[1] === 120) return panic();
			if (m[1] !== yCC) return;
			inY[c] = m[2];
			if (s && s.c === c) {
				send(3, curves.slide[m[2]]);
				dot("slide", m[2]);
			}
			return;
	}
}

const sounding = () => stack[stack.length - 1];

function noteOn(c, note, vel) {
	const i = stack.findIndex((s) => s.c === c && s.note === note);
	if (i >= 0) stack.splice(i, 1);
	stack.push({ c, note, vel, t0: Date.now() });
	sound();
}

function noteOff(c, note, vel) {
	const i = stack.findIndex((s) => s.c === c && s.note === note);
	if (i < 0) return;
	const was = i === stack.length - 1;
	const s = stack.splice(i, 1)[0];
	if (!was) return;
	send(5, curves.lift[vel]);
	dot("lift", vel);
	if (stack.length) sound();
	else {
		gate = 0;
		outlet(1, 0, 0);
		dot("strike", s.vel, 0);
		dot("press", inPress[s.c], 0);
		dot("slide", inY[s.c], 0);
	}
}

// the newest held note sounds: pitch, pressure and Y from its channel, gate (re)opened at its
// velocity, trigger fired
function sound() {
	const s = sounding();
	faded = onsetMs <= 0 || vibratoGain <= 1 || Date.now() - s.t0 >= onsetMs;
	tune(true);
	send(2, curves.press[inPress[s.c]]);
	send(3, curves.slide[inY[s.c]]);
	dot("strike", s.vel);
	dot("press", inPress[s.c]);
	dot("slide", inY[s.c]);
	const v = curves.strike[s.vel];
	if (gate > 0 && retrigMs > 0 && v > 0) outlet(1, 0, 0, 0, retrigMs, v, 0);
	else outlet(1, v, 0);
	gate = v;
	const th = trigVel ? v : 1;
	outlet(4, th, 0, th, trigLen ? 2 + 18 * v : trigMs, 0, 0);
	if (!faded) startRamp();
}

function send(i, x) {
	if (x === last[i]) return;
	last[i] = x;
	outlet(i, x);
}

// the sounding note's pitch in dac~ units (0.1 per octave, 0 at MIDI 60 in 12-TET): a new note
// jumps, a bend ramps over slew ms
function tune(jump) {
	const s = sounding();
	if (!s) return;
	const g = faded ? vibratoGain : 1 + (vibratoGain - 1) * Math.min(1, (Date.now() - s.t0) / onsetMs);
	const c = pitchAt(s.note + warp(((inBend[s.c] - 8192) / 8192) * range, g));
	const x = Math.max(-1, Math.min(1, (c - 6000) / 12000));
	if (x === last[0] && !jump) return;
	last[0] = x;
	outlet(0, x, jump ? 0 : slewMs);
}

// --- copied from linn.retune.js ---

function cents(i) {
	if (i < 0) return table[0] + i * (table[1] - table[0]);
	if (i > 127) return table[127] + (i - 127) * (table[127] - table[126]);
	return table[i];
}

function pitchAt(x) {
	const i = Math.floor(x);
	const c0 = cents(i);
	return c0 + (x - i) * (cents(i + 1) - c0);
}

function warp(s, g) {
	return s + ((g - 1) * Math.sin(2 * Math.PI * s)) / (2 * Math.PI);
}

// while the vibrato gain fades in, re-tune every 5 ms (a finger held still sends no bends)
const ramp = new Task(rampTick, this);
ramp.interval = 5;
let ramping = false;

function startRamp() {
	if (ramping) return;
	ramping = true;
	ramp.repeat();
}

function rampTick() {
	const s = sounding();
	if (s && !faded && Date.now() - s.t0 >= onsetMs) faded = true;
	tune();
	if (!s || faded) {
		ramp.cancel();
		ramping = false;
	}
}
