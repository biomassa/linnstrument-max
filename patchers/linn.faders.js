// linn.faders: the LinnStrument's CC faders (a split in CC Faders mode, 8 rows) as 8 outlets.
// Arguments: MIDI channel (default 1), first CC number (default 1): the faders are CC n..n+7,
//            bottom row first, as the firmware's defaults.
// Inlet: raw MIDI bytes (from midiin). Outlets 0-7: each fader's value as a float 0..1 (CC / 127),
//         on every change. Outlet 8: fader <0-7> <0..1> for linn.preview's fader bars.
// Outlet 9: raw MIDI bytes to the LinnStrument (midiout): CC n..n+7 that move its faders.
// The last value of each fader is kept (getvalueof/setvalueof, so autopattr stores it with the patch
// and in presets; -1 = never moved). The LinnStrument can't report fader positions, so the kept values
// are pushed instead: on restore (setvalueof: load, preset), on faders 1 (the split turned into faders)
// and on push, each known value goes to the LinnStrument, to its outlet and to the bars. Unknown ones
// are not sent.

autowatch = 1;
inlets = 1;
outlets = 10;

let buf = [];

function args() {
	let a = [];
	try {
		a = Array.from(jsarguments).slice(1).map(Number);
	} catch (e) {}
	const ch = a[0] >= 1 && a[0] <= 16 ? Math.round(a[0]) : 1;
	const cc = a[1] >= 0 && a[1] <= 120 ? Math.round(a[1]) : 1;
	return { status: 0xb0 | (ch - 1), cc };
}
const cfg = args();
let values = new Array(8).fill(-1); // last CC value of each fader; -1 = not known
let fadersOn = 0;

function emit(i, v) {
	outlet(8, "fader", i, v / 127);
	outlet(i, v / 127);
}

// push: every known value to the LinnStrument (moves its faders), the outlets and the bars
function push() {
	values.forEach((v, i) => {
		if (v < 0) return;
		outlet(9, cfg.status);
		outlet(9, cfg.cc + i);
		outlet(9, v);
		emit(i, v);
	});
}

// faders <0|1> (linn.lights' state): pushed when the faders come on
function faders(on) {
	on = on ? 1 : 0;
	if (on && !fadersOn) push();
	fadersOn = on;
}

function getvalueof() {
	return values;
}

function setvalueof(...v) {
	v = v.flat().map(Number);
	if (v.length !== 8) return;
	values = v.map((x) => (x >= 0 && x <= 127 ? Math.round(x) : -1));
	push();
}

function msg_int(b) {
	if (b & 0x80) {
		if (b < 0xf8) buf = b === cfg.status ? [b] : []; // realtime bytes don't break running status
		return;
	}
	if (!buf.length) return;
	buf.push(b);
	if (buf.length === 3) {
		const i = buf[1] - cfg.cc;
		if (i >= 0 && i < 8) {
			values[i] = buf[2];
			emit(i, buf[2]);
			try {
				notifyclients();
			} catch (e) {}
		}
		buf = [buf[0]]; // running status
	}
}
