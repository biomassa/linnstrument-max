// linn.retune: play LinnStrument MPE in a scale on an MPE synth. Two modes:
//
// retune 1 (default), for a 12-TET synth, the way Live's Tuning System does it:
// each note is sent as the nearest 12-TET note plus a per-note pitch bend.
// retune 0, for a synth that loads the scale itself (Aalto, Kaivo): notes pass
// unchanged and only bends are converted, so a slide lands on the pitch of the
// pad it reaches. exportscale (a button) writes the .scl and a matching .kbm
// (degree 0 on the root at its frequency) to kbmdir for the synth to load.
//
// In both modes the player's bend counts in scale steps (bendrange = the
// LinnStrument Bend Range) and goes out in the synth's per-note bend range
// (synthbend). See docs/scala-synth-bends.md.
//
// Each note gets its own output channel: the free one that has been quiet
// longest (the oldest note is cut when all are busy), so release tails keep
// their pitch. Messages on the main channel pass through unchanged.
//
// As linn.relay's engine (linnkit's tuning relay, internal/relay/relay.go) it drives
// hardware: output channels, a note range (notes that would go out beyond it are
// dropped) and a mono mode for single-voice instruments, set one by one or with
// target k2600 | mutantbrain | generic (all 12-TET, bend range 24, no main channel).
//
// Inlet 0: raw MIDI bytes (from midiin), or messages: scale <path | archive name>,
//          root <note> <hz>, retune <0|1>, bendrange <n>, synthbend <n>,
//          exportscale, kbmdir <folder>, mainchannel <n> (0 = none), panic,
//          channels <first> <last>, voices <n>, notes <low> <high>, mono <0|1>,
//          legato <0|1>, target <name>, vibrato <gain 1..3>, onset <ms>.
// Inlet 1: list of 128 frequencies (Hz) for MIDI notes 0..127 (from mtof).
// Outlet 0: midievent <status> <data1> [<data2>] (to vst~); MIDI clock and transport are dropped.
// Outlet 1: requests to mtof (scalename none + scale <n> <pairs...>, or scalename <name>; then the list 0..127).

autowatch = 1;
inlets = 2;
outlets = 2;

let range = 48; // LinnStrument Bend Range: full bend = this many scale steps
let vibratoGain = 1; // small motions around the touch widened by this much; whole pads land exactly
let onsetMs = 40; // after a strike the vibrato gain fades in from 1 over this long (0 = at once)
let synthRange = 48; // the synth's per-note bend range, semitones
let retuning = 1; // 1: nearest 12-TET note + bend; 0: the synth has the scale, bends are converted
let main = 0; // main MPE channel (0-based): passes through, never used for notes
let sclPath = ""; // the .scl file loaded (for the export in mode 0)
let rootNote = 60;
let rootHz = 261.625565;
let kbmDir = ""; // "" = ~/Music/Madrona Labs/Scales/linnstrument/
let first = 0; // output channels first..last (0-based)
let last = 15;
let maxVoices = 16; // at most this many notes at once: channels first..first + maxVoices - 1
let lo = 0; // notes that would go out below lo or above hi are dropped
let hi = 127;
let monoMode = 0; // 1: one voice on the first channel, the newest held note sounds
let legatoMode = 1; // mono: 1 = a new note starts before the old one ends (no retrigger)
const stack = []; // mono: held notes { c, note, vel }, oldest first
const dropped = new Set(); // input notes (channel * 128 + note) dropped for the note range

// pitch of each MIDI note, in cents above MIDI note 0 (12-TET until a scale loads)
let table = [];
for (let n = 0; n < 128; n++) table[n] = n * 100;

const inBend = new Array(16).fill(8192); // last bend per input channel
const pending = []; // per input channel: controllers that arrived with no note held
for (let c = 0; c < 16; c++) pending[c] = new Map();

// one voice per output channel
const slots = [];
for (let ch = 0; ch < 16; ch++) slots[ch] = { ch, active: false, inCh: -1, inNote: -1, outNote: -1, used: 0, bend: -1, t0: 0, faded: true };
let seq = 0;

const pool = () =>
	slots.filter((v) => v.ch !== main && v.ch >= first && v.ch <= (monoMode ? first : Math.min(last, first + maxVoices - 1)));
const held = (c) => slots.filter((v) => v.active && v.inCh === c);

let buf = [];
let need = 0;

function msg_int(b) {
	if (inlet !== 0) return;
	if (b & 0x80) {
		if (b >= 0xf8) {
			// realtime (clock, start, continue, stop, ...) is dropped: no clock or transport
			// over the LinnStrument's connection (the user's choice, 2026-09-14)
			return; // a realtime byte can arrive inside another message; that message goes on
		}
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
	slots.forEach((v) => v.active && tune(v));
}

// scale <path>: read a .scl file and give mtof its pitches inline.
// scale <name>: a scale from Max's built-in archive (e.g. ji_11).
function scale(name) {
	name = String(name);
	if (/[\/:]/.test(name)) {
		const p = localPath(name);
		const s = readScl(p);
		if (!s) return;
		sclPath = p;
		outlet(1, "scalename", "none");
		outlet(1, "scale", s.length, ...s.flat());
	} else {
		sclPath = "";
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

// retune 1: 12-TET synth (nearest note + bend); retune 0: the synth loads the scale
function retune(on) {
	on = on ? 1 : 0;
	if (on === retuning) return;
	panic(); // held notes went out with the other mode's note numbers
	retuning = on;
}

// the LinnStrument Bend Range: a full bend is this many scale steps
function bendrange(n) {
	range = Math.max(1, Math.min(96, Math.round(n)));
	slots.forEach((v) => v.active && tune(v));
}

// the synth's per-note pitch bend range in semitones
function synthbend(n) {
	synthRange = Math.max(1, Math.min(96, Math.round(n)));
	slots.forEach((v) => v.active && tune(v));
}

// root <note> <hz>: degree 0 on this MIDI note at this frequency (linn.lights sends it as "tuning")
function root(note, hz) {
	rootNote = note;
	rootHz = hz;
	outlet(1, "mid", note);
	outlet(1, "ref", note);
	outlet(1, "base", hz);
	outlet(1, Array.from({ length: 128 }, (_, i) => i));
}

// mainchannel <n>: the LinnStrument's main channel passes through unchanged and carries no notes; 0 = none
function mainchannel(n) {
	const ch = n >= 1 ? Math.min(16, Math.round(n)) - 1 : -1;
	if (ch >= 0 && slots[ch].active) release(slots[ch], 0);
	main = ch;
}

// every output channel: note-offs for held notes, all notes off (CC 123), bend centred
function panic() {
	for (const v of pool()) {
		if (v.active) release(v, 0);
		send(0xb0 | v.ch, 123, 0);
		setBend(v, 8192);
	}
	pending.forEach((p) => p.clear());
	stack.length = 0;
	dropped.clear();
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
			held(c).forEach(tune);
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

// the pitch a note has reached with its input channel's bend, at vibrato gain g
function pitch(c, note, g = 1) {
	return pitchAt(note + warp(((inBend[c] - 8192) / 8192) * range, g));
}

// the player's bend in pads, s -> s + (g - 1) sin(2 pi s) / (2 pi): whole pads (and half pads)
// stay where they are, so slides land exactly; near each pad the pitch moves g times faster,
// so vibrato is g times wider; halfway between pads it moves 2 - g times as fast
function warp(s, g) {
	return s + ((g - 1) * Math.sin(2 * Math.PI * s)) / (2 * Math.PI);
}

// a voice's vibrato gain: from 1 at the strike up to vibratoGain after onsetMs, so the wobble of a
// landing finger isn't widened ("barking")
function gainAt(v) {
	if (onsetMs <= 0 || v.faded) return vibratoGain;
	return 1 + (vibratoGain - 1) * Math.min(1, (Date.now() - v.t0) / onsetMs);
}

// while voices fade in, re-tune them every 5 ms (a finger held still sends no bends)
const ramp = new Task(rampTick, this);
ramp.interval = 5;
let ramping = false;

function startRamp() {
	if (ramping) return;
	ramping = true;
	ramp.repeat();
}

function rampTick() {
	const now = Date.now();
	let any = false;
	slots.forEach((v) => {
		if (!v.active || v.faded) return;
		if (now - v.t0 >= onsetMs) v.faded = true;
		else any = true;
		tune(v);
	});
	if (!any) {
		ramp.cancel();
		ramping = false;
	}
}

// onset <ms>: how long the vibrato gain takes to fade in after a strike (0 = at once)
function onset(ms) {
	onsetMs = Math.max(0, Math.min(500, Math.round(Number(ms) || 0)));
}

// vibrato <gain>: 1 = off; up to 3. Above 2 the pitch runs backwards around halfway between
// pads during a slide (it still starts and ends on the pads); the user tries up to 3 (2026-09-12)
function vibrato(g) {
	vibratoGain = Math.max(1, Math.min(3, Number(g) || 1));
	slots.forEach((v) => v.active && tune(v));
}

// the free channel that has been quiet longest, else the oldest note
function pick() {
	const vs = pool();
	const free = vs.filter((v) => !v.active);
	return (free.length ? free : vs).reduce((a, b) => (b.used < a.used ? b : a));
}

function noteOn(c, note, vel) {
	const key = c * 128 + note;
	dropped.delete(key);
	const out = outNote(c, note);
	if (out < lo || out > hi) {
		dropped.add(key); // outside the note range: dropped, and its note-off with it
		return;
	}
	if (monoMode) return monoOn(c, note, vel);
	held(c).forEach((v) => v.inNote === note && release(v, 0));
	const v = pick();
	if (v.active) release(v, 0);
	start(v, c, note, out);
	send(0x90 | v.ch, out, vel);
}

function noteOff(c, note, vel) {
	if (dropped.delete(c * 128 + note)) return;
	if (monoMode) return monoOff(c, note, vel);
	held(c).forEach((v) => v.inNote === note && release(v, vel));
}

// the note a pad goes out as: the nearest 12-TET note (retune 1) or its own (retune 0)
function outNote(c, note) {
	return retuning ? Math.round(pitch(c, note) / 100) : note;
}

// give a voice its source note (struck at t0), send what the input channel held back, then the bend
function start(v, c, note, out, t0 = Date.now()) {
	const faded = onsetMs <= 0 || vibratoGain <= 1 || Date.now() - t0 >= onsetMs;
	Object.assign(v, { active: true, inCh: c, inNote: note, outNote: out, used: ++seq, t0, faded });
	for (const m of pending[c].values()) send((m[0] & 0xf0) | v.ch, ...m.slice(1));
	pending[c].clear();
	tune(v);
	if (!faded) startRamp();
}

function release(v, vel) {
	send(0x80 | v.ch, v.outNote, vel);
	v.active = false;
	v.used = ++seq;
}

// send the voice's bend: from its 12-TET note to its pitch (retune 1), or from the
// pitch the synth plays for the note to the pitch the slide has reached (retune 0)
function tune(v) {
	const from = retuning ? v.outNote * 100 : pitchAt(v.inNote);
	const semis = (pitch(v.inCh, v.inNote, gainAt(v)) - from) / 100;
	setBend(v, Math.max(0, Math.min(16383, 8192 + Math.round((semis / synthRange) * 8192))));
}

function setBend(v, val) {
	if (v.bend === val) return;
	v.bend = val;
	send(0xe0 | v.ch, val & 0x7f, val >> 7);
}

// --- mono (Mutant Brain): one voice; the newest held note sounds, and releasing it
// returns to the newest note still held. legato 1: the new note starts before the old
// one ends (the gate stays high); legato 0: the old note ends first (the gate retriggers).
// Bend, pressure and Y come from the note that sounds. ---

function monoOn(c, note, vel) {
	const i = stack.findIndex((s) => s.c === c && s.note === note);
	if (i >= 0) stack.splice(i, 1);
	stack.push({ c, note, vel, t0: Date.now() });
	sound(stack[stack.length - 1]);
}

function monoOff(c, note, vel) {
	const i = stack.findIndex((s) => s.c === c && s.note === note);
	if (i < 0) return;
	const sounding = i === stack.length - 1;
	stack.splice(i, 1);
	if (!sounding) return;
	const v = pool()[0];
	if (stack.length) sound(stack[stack.length - 1]);
	else if (v && v.active) release(v, vel);
}

function sound(s) {
	const v = pool()[0];
	if (!v) return;
	const out = outNote(s.c, s.note);
	if (v.active && legatoMode) {
		const old = v.outNote;
		start(v, s.c, s.note, out, s.t0);
		if (out !== old) {
			send(0x90 | v.ch, out, s.vel);
			send(0x80 | v.ch, old, 0);
		}
		return;
	}
	if (v.active) release(v, 0);
	start(v, s.c, s.note, out, s.t0);
	send(0x90 | v.ch, out, s.vel);
}

// --- relay settings (linn.relay) ---

// centre the bend of every output channel (after the channels change)
function centre() {
	pool().forEach((v) => setBend(v, 8192));
}

// channels <first> <last>: the output channels, one note each
function channels(a, b) {
	panic();
	const x = Math.max(1, Math.min(16, Math.round(a))) - 1;
	const y = Math.max(1, Math.min(16, Math.round(b === undefined ? a : b))) - 1;
	first = Math.min(x, y);
	last = Math.max(x, y);
	centre();
}

// voices <n>: at most n notes at once, on the first n output channels (the oldest note is cut
// for a new one); kept when the target changes
function voices(n) {
	panic();
	maxVoices = Math.max(1, Math.min(16, Math.round(n)));
	centre();
}

// notes <low> <high>: notes that would go out beyond these are dropped
function notes(a, b) {
	lo = Math.max(0, Math.min(127, Math.round(a)));
	hi = Math.max(lo, Math.min(127, Math.round(b)));
}

function mono(on) {
	panic();
	monoMode = on ? 1 : 0;
	centre();
}

function legato(on) {
	legatoMode = on ? 1 : 0;
}

// linnkit's relay targets (relay.go); the Mutant Brain is mono on note input 1 (channel 1)
const TARGETS = {
	k2600: { channels: [1, 16], notes: [0, 127], mono: 0 },
	mutantbrain: { channels: [1, 1], notes: [24, 120], mono: 1 },
	generic: { channels: [1, 16], notes: [0, 127], mono: 0 },
};

// target <name>: 12-TET retuning, bend range 24, no main channel, and the target's channels, notes, mono
function target(name) {
	const t = TARGETS[String(name)];
	if (!t) {
		post("linn.retune: unknown target " + name + " (" + Object.keys(TARGETS).join(", ") + ")\n");
		return;
	}
	panic();
	retuning = 1;
	main = -1;
	synthRange = 24;
	first = t.channels[0] - 1;
	last = t.channels[1] - 1;
	lo = t.notes[0];
	hi = t.notes[1];
	monoMode = t.mono;
	centre();
}

// --- mode 0: the scale and a matching .kbm for the synth to load ---

// kbmdir <folder>: where the files go (the folder must exist; Max can't create one)
function kbmdir(path) {
	path = String(path);
	kbmDir = path.endsWith("/") ? path : path + "/";
}

// kbmdir if set; else ~/Music/Madrona Labs/Scales/linnstrument/ (Mac: the home folder is
// found in the patch's path, /Users/<name>/); else Madrona/ in the patcher's own folder
// (patchers/Madrona/ in the repo; Max can't create folders); "" if unsaved
function exportDir() {
	if (kbmDir) return kbmDir;
	let fp = "";
	try {
		fp = String(this.patcher.filepath || "");
	} catch (e) {}
	const m = fp.match(/^(.*?\/Users\/[^\/]+)\//);
	if (m) return m[1] + "/Music/Madrona Labs/Scales/linnstrument/";
	const i = fp.lastIndexOf("/");
	return i >= 0 ? fp.slice(0, i + 1) + "Madrona/" : "";
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

// exportscale: copy the .scl unchanged and write <name>.kbm next to it, like linnkit's
// Madrona export; only on request (an export button), not on every scale or root change
function exportscale() {
	if (!sclPath) {
		post("linn.retune: no .scl file to export (pick a scale from the menu)\n");
		return;
	}
	const pairs = readScl(sclPath);
	const bytes = readBytes(sclPath);
	if (!pairs || !bytes) return;
	const name = sclPath.split(/[\/:]/).pop().replace(/\.[^.]*$/, "");
	const dir = exportDir();
	if (!dir) {
		post("linn.retune: no folder to export to: save the patch, or set one with kbmdir <folder>\n");
		return;
	}
	if (!writeBytes(dir + name + ".scl", bytes)) return;
	if (!writeBytes(dir + name + ".kbm", Array.from(kbm(name, pairs.length, rootNote, rootHz), (ch) => ch.charCodeAt(0)))) return;
	post("linn.retune: wrote " + dir + name + ".scl and .kbm (degree 0 on MIDI " + rootNote + " at " + rootHz.toFixed(2) + " Hz)\n");
	if (!kbmDir && !/\/Madrona Labs\/Scales\//.test(dir)) post("linn.retune: that is not the synth's Scales folder: copy the files there, or set it with kbmdir <folder>\n");
	if (pairs.length >= 127) post("linn.retune: " + pairs.length + " degrees: Aalto and Kaivo ignore a .kbm this long\n");
}

// a linear .kbm listing every degree (Madrona Labs synths ignore the map size and need the
// entries): the same text as linnkit's scala.LinearMapping(...).Format except the title
function kbm(name, n, note, hz) {
	const lines = [
		"! " + name + ": degree 0 on MIDI " + note + " at " + hz.toFixed(3) + " Hz, written by linn.retune",
		"! Size of map:",
		n,
		"! First MIDI note number to retune:",
		0,
		"! Last MIDI note number to retune:",
		127,
		"! Middle note where the first entry of the mapping is mapped to:",
		note,
		"! Reference note for which frequency is given:",
		note,
		"! Frequency to tune the above note to:",
		hz.toFixed(6),
		"! Scale degree to consider as formal octave:",
		n,
		"! Mapping:",
	];
	for (let d = 0; d < n; d++) lines.push(d);
	return lines.join("\n") + "\n";
}

function readBytes(path) {
	const f = new File(path, "read");
	if (!f.isopen) {
		post("linn.retune: can't open " + path + "\n");
		return null;
	}
	const out = [];
	while (f.position < f.eof) {
		const chunk = f.readbytes(Math.min(1024, f.eof - f.position));
		if (!chunk || !chunk.length) break;
		for (const b of chunk) out.push(b);
	}
	f.close();
	return out;
}

function writeBytes(path, bytes) {
	const f = new File(path, "write", "TEXT");
	if (!f.isopen) {
		post("linn.retune: can't write " + path + " (does the folder exist?)\n");
		return false;
	}
	for (let i = 0; i < bytes.length; i += 1024) f.writebytes(bytes.slice(i, i + 1024));
	f.eof = f.position; // cut what an older, longer file had after this
	f.close();
	return true;
}
