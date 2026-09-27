// linn.faders: the LinnStrument's CC faders (a split in CC Faders mode, 8 rows) as 8 outlets.
// Arguments: MIDI channel (default 1), first CC number (default 1): the faders are CC n..n+7,
//            bottom row first, as the firmware's defaults.
// Inlet: raw MIDI bytes (from midiin). Outlets 0-7: each fader's value as a float 0..1 (CC / 127),
//         on every change.

autowatch = 1;
inlets = 1;
outlets = 8;

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

function msg_int(b) {
	if (b & 0x80) {
		if (b < 0xf8) buf = b === cfg.status ? [b] : []; // realtime bytes don't break running status
		return;
	}
	if (!buf.length) return;
	buf.push(b);
	if (buf.length === 3) {
		const i = buf[1] - cfg.cc;
		if (i >= 0 && i < 8) outlet(i, buf[2] / 127);
		buf = [buf[0]]; // running status
	}
}
