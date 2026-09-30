// linnsplit.router: sorts the LinnStrument's MIDI into the left and right split by channel.
// Zones (set by linnsplit.lights' send): left main 1, notes 2-8; right main 16, notes 9-15.
// With the split off on the LinnStrument, the whole surface plays the shown split's zone, so
// everything goes to that side without any change here.
// Inlet: raw MIDI bytes; zones <lmain> <llo> <lhi> <rmain> <rlo> <rhi>.
// Outlet 0: left split's bytes. Outlet 1: right split's bytes. System messages go to both;
// channels outside both zones are dropped. NRPN traffic (CC 99/98, then data entry 6/38/96/97 and
// the 101/100 = 127 null) is dropped: it is linnsplit.lights' readback (the split is polled every
// second), which must not reach the synths. RPN (101/100 other than 127) passes and ends it.

autowatch = 1;
inlets = 1;
outlets = 2;

let side = new Array(16).fill(-1); // channel (0-15) -> 0 left, 1 right, -1 none
let buf = [];
let need = 0;
let dest = -1;
const nrpn = new Array(16).fill(false); // per channel: inside an NRPN exchange

// false for the CCs of an NRPN exchange
function keep(m) {
	if ((m[0] & 0xf0) !== 0xb0) return true;
	const c = m[0] & 0x0f;
	const n = m[1];
	if (n === 99 || n === 98) {
		nrpn[c] = true;
		return false;
	}
	if (n === 101 || n === 100) {
		// the null (127) ends an exchange: dropped while one is open, and closes it (a lone CC 6
		// afterwards is fader 6, not data entry)
		if (nrpn[c] && m[2] === 127) {
			if (n === 100) nrpn[c] = false;
			return false;
		}
		nrpn[c] = false;
		return true;
	}
	if (nrpn[c] && (n === 6 || n === 38 || n === 96 || n === 97)) return false;
	return true;
}

function zones(lmain, llo, lhi, rmain, rlo, rhi) {
	side = new Array(16).fill(-1);
	const put = (ch, s) => {
		ch = Math.round(ch);
		if (ch >= 1 && ch <= 16) side[ch - 1] = s;
	};
	for (let c = Math.round(llo); c <= Math.round(lhi); c++) put(c, 0);
	for (let c = Math.round(rlo); c <= Math.round(rhi); c++) put(c, 1);
	put(lmain, 0);
	put(rmain, 1);
}
zones(1, 2, 8, 16, 9, 15);

function msg_int(b) {
	if (b & 0x80) {
		if (b >= 0xf0) {
			// system: to both sides; sysex data bytes follow it to both too
			outlet(1, b);
			outlet(0, b);
			dest = b === 0xf0 ? 2 : dest;
			if (b < 0xf8) buf = [];
			return;
		}
		const h = b & 0xf0;
		need = h === 0xc0 || h === 0xd0 ? 2 : 3;
		dest = side[b & 0x0f];
		buf = [b];
		return;
	}
	if (dest === 2 && !buf.length) {
		outlet(1, b);
		outlet(0, b);
		return;
	}
	if (!buf.length) return;
	buf.push(b);
	if (buf.length === need) {
		if (dest >= 0 && keep(buf)) buf.forEach((x) => outlet(dest, x));
		buf = [buf[0]]; // running status
	}
}
