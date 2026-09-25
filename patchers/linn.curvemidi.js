// linn.curvemidi: response curves on LinnStrument MIDI, before linn.retune / linn.relay.
// Note-on velocity goes through the strike curve, channel and poly pressure through press,
// the Y CC (74) through slide, note-off velocity through lift; everything else passes unchanged.
// The curves come from linn.curve editors (curve <which> <128 floats>, linear until one arrives).
//
// Argument: the receiver for the editors' dots (e.g. linn_b_curves). Poly: strike, press and slide
//           get one dot per held note, pos <which> <input 0..1> <1|0> <channel> (0 removes it);
//           lift has one dot, pos lift <input> <active>, dimmed when no note is held.
// Inlet: raw MIDI bytes (from midiin or linn.preview), or curve <which> <128 floats>, ycc <n>.
// Outlet: raw MIDI bytes, one int at a time (for linn.retune's or linn.relay's left inlet).

autowatch = 1;
inlets = 1;
outlets = 1;

const LINEAR = Array.from({ length: 128 }, (_, v) => v / 127);
const curves = { strike: LINEAR, press: LINEAR, slide: LINEAR, lift: LINEAR };
let yCC = 74;
let held = 0; // notes held now
let lastLift = 0;
const chHeld = new Array(16).fill(0); // notes held per channel
const chPress = new Array(16).fill(0); // latest pressure and Y per channel (they arrive before the note)
const chY = new Array(16).fill(0);

let buf = [];
let need = 0;

function bus() {
	try {
		const a = Array.from(jsarguments).slice(1).find((x) => isNaN(Number(x)));
		return a ? String(a) : "";
	} catch (e) {
		return "";
	}
}

function dot(which, v, on, voice) {
	const b = bus();
	if (!b) return;
	if (voice === undefined) messnamed(b, "pos", which, v / 127, on);
	else messnamed(b, "pos", which, v / 127, on, voice);
}

// a curve's output for a 7-bit input, as a 7-bit value
const map = (which, v) => Math.max(0, Math.min(127, Math.round(curves[which][v] * 127)));

function msg_int(b) {
	if (b & 0x80) {
		if (b >= 0xf8) {
			outlet(0, b); // realtime passes (linn.retune drops it)
			return;
		}
		const h = b & 0xf0;
		need = h === 0xc0 || h === 0xd0 ? 2 : h < 0xf0 ? 3 : 0;
		buf = need ? [b] : [];
		if (!need) outlet(0, b);
		return;
	}
	if (!buf.length) {
		outlet(0, b);
		return;
	}
	buf.push(b);
	if (buf.length === need) {
		handle(buf);
		buf = [buf[0]]; // running status
	}
}

function handle(m) {
	const h = m[0] & 0xf0;
	const c = m[0] & 0x0f;
	const v = c + 1; // voice: the MIDI channel (one note per channel in Channel Per Note)
	const out = m.slice();
	if (h === 0x90 && m[2] > 0) {
		out[2] = Math.max(1, map("strike", m[2])); // 0 would turn the note-on into a note-off
		held++;
		chHeld[c]++;
		dot("strike", m[2], 1, v);
		dot("press", chPress[c], 1, v);
		dot("slide", chY[c], 1, v);
	} else if (h === 0x80 || (h === 0x90 && m[2] === 0)) {
		if (h === 0x80) {
			out[2] = map("lift", m[2]);
			lastLift = m[2];
			dot("lift", m[2], 1);
		}
		held = Math.max(0, held - 1);
		chHeld[c] = Math.max(0, chHeld[c] - 1);
		if (!chHeld[c]) ["strike", "press", "slide"].forEach((w) => dot(w, 0, 0, v));
		if (!held) dot("lift", lastLift, 0);
	} else if (h === 0xd0 || h === 0xa0) {
		const i = h === 0xd0 ? 1 : 2;
		out[i] = map("press", m[i]);
		chPress[c] = m[i];
		if (chHeld[c]) dot("press", m[i], 1, v);
	} else if (h === 0xb0 && m[1] === yCC) {
		out[2] = map("slide", m[2]);
		chY[c] = m[2];
		if (chHeld[c]) dot("slide", m[2], 1, v);
	}
	out.forEach((x) => outlet(0, x));
}

// curve <strike|press|slide|lift> <128 floats>: the response for 7-bit values 0..127
function curve(which, ...t) {
	which = String(which);
	if (!(which in curves) || t.length !== 128) {
		post("linn.curvemidi: curve needs strike, press, slide or lift and 128 values\n");
		return;
	}
	curves[which] = t.map((v) => Math.max(0, Math.min(1, Number(v) || 0)));
}

// ycc <n>: the CC the LinnStrument sends for Y (74 after linn.lights' MIDI setup)
function ycc(n) {
	yCC = Math.max(0, Math.min(127, Math.round(n)));
}
