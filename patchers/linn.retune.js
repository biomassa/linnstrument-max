// linn.retune: retune LinnStrument MPE for a 12-TET MPE plugin, the way Live's
// Tuning System does. Each note is sent as the nearest 12-TET note plus a
// per-note pitch bend; the player's bend counts in scale steps.
//
// Each note gets its own output channel: the free one that has been quiet
// longest (the oldest note is cut when all are busy), so release tails keep
// their pitch. Messages on the main channel pass through unchanged.
//
// Inlet 0: raw MIDI bytes (from midiin), or messages: scale <path | archive name>,
//          bendrange <n>, mainchannel <n>, root <note> <hz>, panic.
// Inlet 1: list of 128 frequencies (Hz) for MIDI notes 0..127 (from mtof).
// Outlet 0: midievent <status> <data1> [<data2>] (to vst~).
// Outlet 1: requests to mtof (scalename none + scale <n> <pairs...>, or scalename <name>; then the list 0..127).

autowatch = 1;
inlets = 2;
outlets = 2;

let range = 48; // semitones: plugin per-note bend range = LinnStrument Bend Range
let main = 0; // main MPE channel (0-based): passes through, never used for notes

// pitch of each MIDI note, in cents above MIDI note 0 (12-TET until a scale loads)
let table = [];
for (let n = 0; n < 128; n++) table[n] = n * 100;

const inBend = new Array(16).fill(8192); // last bend per input channel
const pending = []; // per input channel: controllers that arrived with no note held
for (let c = 0; c < 16; c++) pending[c] = new Map();

// one voice per output channel
const voices = [];
for (let ch = 0; ch < 16; ch++) voices[ch] = { ch, active: false, inCh: -1, inNote: -1, outNote: -1, used: 0, bend: -1 };
let seq = 0;

const pool = () => voices.filter((v) => v.ch !== main);
const held = (c) => voices.filter((v) => v.active && v.inCh === c);

let buf = [];
let need = 0;

function msg_int(b) {
	if (inlet !== 0) return;
	if (b & 0x80) {
		if (b >= 0xf8) return; // realtime
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
	voices.forEach((v) => v.active && retune(v));
}

// scale <path>: read a .scl file and give mtof its pitches inline.
// scale <name>: a scale from Max's built-in archive (e.g. ji_11).
function scale(name) {
	name = String(name);
	if (/[\/:]/.test(name)) {
		const s = readScl(name);
		if (!s) return;
		outlet(1, "scalename", "none");
		outlet(1, "scale", s.length, ...s.flat());
	} else {
		outlet(1, "scalename", name);
	}
	outlet(1, Array.from({ length: 128 }, (_, i) => i));
}

// Scala: "!" lines are comments; then a description, the note count, and one
// pitch per line (cents if it has a ".", else a ratio n/d or an integer n).
// Returns one pair per degree in mtof's inline format: [cents, 0] or [num, den].
function readScl(path) {
	const f = new File(path, "read");
	if (!f.isopen) {
		post("linn.retune: can't open " + path + "\n");
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
		post("linn.retune: can't read " + path + "\n");
		return null;
	}
	return pitches;
}

function bendrange(n) {
	range = n;
	voices.forEach((v) => v.active && retune(v));
}

// root <note> <hz>: degree 0 on this MIDI note at this frequency (linn.lights sends it as "tuning")
function root(note, hz) {
	outlet(1, "mid", note);
	outlet(1, "ref", note);
	outlet(1, "base", hz);
	outlet(1, Array.from({ length: 128 }, (_, i) => i));
}

function mainchannel(n) {
	const ch = Math.max(1, Math.min(16, n)) - 1;
	if (voices[ch].active) release(voices[ch], 0);
	main = ch;
}

function panic() {
	for (const v of pool()) {
		if (v.active) release(v, 0);
		setBend(v, 8192);
	}
	pending.forEach((p) => p.clear());
}

function send(...m) {
	outlet(0, "midievent", ...m);
}

function handle(m) {
	const h = m[0] & 0xf0;
	const c = m[0] & 0x0f;
	if (c === main) {
		send(...m); // main channel: unchanged
		return;
	}
	switch (h) {
		case 0x90:
			if (m[2]) noteOn(c, m[1], m[2]);
			else noteOff(c, m[1], 0);
			return;
		case 0x80:
			noteOff(c, m[1], m[2]);
			return;
		case 0xe0:
			inBend[c] = m[1] | (m[2] << 7); // with no note held it waits for the next note
			held(c).forEach(retune);
			return;
		case 0xa0:
			held(c).forEach((v) => v.inNote === m[1] && send(0xa0 | v.ch, v.outNote, m[2]));
			return;
		case 0xb0:
			if ((m[1] >= 64 && m[1] <= 69) || m[1] >= 120) pool().forEach((v) => send(0xb0 | v.ch, m[1], m[2])); // pedals, channel mode
			else route(c, 0xb000 | m[1], m);
			return;
		case 0xd0:
			route(c, 0xd000, m);
			return;
		case 0xc0:
			pool().forEach((v) => send(0xc0 | v.ch, m[1]));
			return;
	}
}

// send a controller to the notes of its input channel, or keep it for that
// channel's next note (the LinnStrument sends Y and Z just before a note)
function route(c, key, m) {
	const vs = held(c);
	if (vs.length) vs.forEach((v) => send((m[0] & 0xf0) | v.ch, ...m.slice(1)));
	else pending[c].set(key, m.slice());
}

// fractional scale position (MIDI note + bend in steps) -> cents, interpolated
// linearly in cents between neighbouring notes; extrapolated past 0..127
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

function pitch(c, note) {
	return pitchAt(note + ((inBend[c] - 8192) / 8192) * range);
}

// the free channel that has been quiet longest, else the oldest note
function pick() {
	const vs = pool();
	const free = vs.filter((v) => !v.active);
	return (free.length ? free : vs).reduce((a, b) => (b.used < a.used ? b : a));
}

function noteOn(c, note, vel) {
	held(c).forEach((v) => v.inNote === note && release(v, 0));
	const out = Math.max(0, Math.min(127, Math.round(pitch(c, note) / 100)));
	const v = pick();
	if (v.active) release(v, 0);
	Object.assign(v, { active: true, inCh: c, inNote: note, outNote: out, used: ++seq });
	for (const m of pending[c].values()) send((m[0] & 0xf0) | v.ch, ...m.slice(1));
	pending[c].clear();
	retune(v);
	send(0x90 | v.ch, out, vel);
}

function noteOff(c, note, vel) {
	held(c).forEach((v) => v.inNote === note && release(v, vel));
}

function release(v, vel) {
	send(0x80 | v.ch, v.outNote, vel);
	v.active = false;
	v.used = ++seq;
}

// send the bend that moves the voice's 12-TET note to its pitch
function retune(v) {
	const semis = (pitch(v.inCh, v.inNote) - v.outNote * 100) / 100;
	setBend(v, Math.max(0, Math.min(16383, 8192 + Math.round((semis / range) * 8192))));
}

function setBend(v, val) {
	if (v.bend === val) return;
	v.bend = val;
	send(0xe0 | v.ch, val & 0x7f, val >> 7);
}
