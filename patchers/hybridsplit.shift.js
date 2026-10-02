// hybridsplit.shift: moves note numbers by n (scale steps), for a side that has no linnsplit.retune
// (hybridSplit's CV side, in front of linn.cv). Same rule as linnsplit.retune's shift: a held note
// keeps the shift it started with; notes moved outside 0-127 are dropped with their note-off and poly
// pressure. Everything else passes unchanged.
// Inlet: raw MIDI bytes, or shift <n>. Outlet: raw MIDI bytes.

autowatch = 1;
inlets = 1;
outlets = 1;

let shiftSteps = 0;
const shifted = new Map(); // channel * 128 + note -> the note it was shifted to at its note-on
let buf = [];
let need = 0;

function shift(n) {
	shiftSteps = Math.max(-127, Math.min(127, Math.round(n)));
}

function msg_int(b) {
	if (b & 0x80) {
		if (b >= 0xf8) {
			outlet(0, b);
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
	if (h === 0x90 || h === 0x80 || h === 0xa0) {
		const key = (m[0] & 0x0f) * 128 + m[1];
		let note;
		if (h === 0x90 && m[2]) {
			note = m[1] + shiftSteps;
			shifted.set(key, note);
		} else {
			note = shifted.has(key) ? shifted.get(key) : m[1] + shiftSteps;
			if (h !== 0xa0) shifted.delete(key);
		}
		if (note < 0 || note > 127) return;
		m = [m[0], note, m[2]];
	}
	m.forEach((x) => outlet(0, x));
}
