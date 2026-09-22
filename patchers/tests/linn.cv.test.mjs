// Tests for patchers/linn.cv.js outside Max. Run: node patchers/tests/linn.cv.test.mjs
import { readFileSync } from "node:fs";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = readFileSync(new URL("../linn.cv.js", import.meta.url), "utf8");

// a fake clock and Task: time moves only when a test calls advance(ms)
function scheduler() {
	let now = 0;
	const pending = [];
	class Task {
		constructor(fn, obj) { this.fn = fn; this.obj = obj; this.at = null; this.interval = 0; this.repeating = false; }
		repeat() { this.at = now + this.interval; this.repeating = true; if (!pending.includes(this)) pending.push(this); }
		cancel() { this.at = null; this.repeating = false; }
	}
	const advance = (ms) => {
		const end = now + ms;
		for (;;) {
			const due = pending.filter((t) => t.at !== null && t.at <= end).sort((a, b) => a.at - b.at)[0];
			if (!due) break;
			now = due.at;
			due.at = now + Math.max(1, due.interval);
			due.fn.call(due.obj);
		}
		now = end;
	};
	return { Task, advance, now: () => now };
}

function load() {
	const out = [];
	const clock = scheduler();
	const ctx = { inlet: 0, posts: [], dots: [], messnamed: (...a) => ctx.dots.push(a), Task: clock.Task, Date: { now: clock.now }, post: (s) => ctx.posts.push(s), outlet: (i, ...a) => out.push([i, ...a.flat()]) };
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	const bytes = (...b) => { ctx.inlet = 0; b.flat().forEach((x) => ctx.msg_int(x)); };
	const table = (hz) => { ctx.inlet = 1; ctx.list(...hz); ctx.inlet = 0; };
	// messages since the last take, per outlet: { 0: [values...], 1: [[list]...], ... }
	const take = () => {
		const r = {};
		for (const [i, ...a] of out.splice(0)) (r[i] ||= []).push(a.length === 1 ? a[0] : a);
		return r;
	};
	return { ctx, bytes, table, take, advance: clock.advance };
}

const on = (ch, n, v) => [0x90 | (ch - 1), n, v];
const off = (ch, n, v) => [0x80 | (ch - 1), n, v];
const bend = (ch, v) => [0xe0 | (ch - 1), v & 0x7f, v >> 7];
const edo = (n) => Array.from({ length: 128 }, (_, k) => 261.625565 * 2 ** ((k - 60) / n));
const near = (a, b, msg) => assert.ok(Math.abs(a - b) < 1e-9, `${msg}: ${a} != ${b}`);
const lastOf = (r, i) => r[i][r[i].length - 1];
// pitch messages are <value> <ms>
const pv = (m) => m[0];

let t, r;

// 0 V at MIDI 60; an octave up is 0.1; gate at velocity / 127; a 4 ms trigger
t = load();
t.bytes(on(2, 60, 127));
r = t.take();
near(pv(r[0][0]), 0, "C4 is 0 V");
assert.deepEqual(r[1], [[1, 0]]);
assert.deepEqual(r[4], [[1, 0, 1, 4, 0, 0]]);
t.bytes(off(2, 60, 64));
r = t.take();
near(r[5][0], 64 / 127, "release velocity");
assert.deepEqual(r[1], [[0, 0]], "gate closes");
t.bytes(on(3, 72, 64));
near(pv(t.take()[0][0]), 0.1, "an octave up is 0.1");

// clamped at +-10 V
t = load();
t.bytes(on(2, 0, 100));
near(pv(t.take()[0][0]), -0.5, "MIDI 0 is -5 V");
t.bytes(bend(2, 0));
near(pv(lastOf(t.take(), 0)), (0 - 48 * 100 - 6000) / 12000, "bend 48 steps down from MIDI 0");

// 31-EDO: pitch follows the table; a slide of 2 pads (bend range 32: exact in 14 bits) lands on note 62
t = load();
t.table(edo(31));
t.ctx.bendrange(32);
t.bytes(on(2, 60, 100));
t.take();
t.bytes(bend(2, 8192 + (2 / 32) * 8192));
near(pv(lastOf(t.take(), 0)), (2 * 1200) / 31 / 12000, "slide lands on the pad two steps up");

// a new strike while one is held retriggers the gate at the new velocity and fires a trigger
t = load();
t.bytes(on(2, 60, 127));
t.take();
t.bytes(on(3, 64, 63.5 * 2));
r = t.take();
assert.deepEqual(r[1], [[0, 0, 0, 1, 1, 0]]);
assert.deepEqual(r[4], [[1, 0, 1, 4, 0, 0]]);
near(pv(r[0][0]), 4 / 120, "pitch jumps to the new note");

// releasing the sounding note returns to the held one: retrigger at its velocity, its pitch,
// and the released note's velocity on the release outlet
t = load();
t.bytes(on(2, 60, 100), on(3, 67, 50));
t.take();
t.bytes(off(3, 67, 30));
r = t.take();
near(r[5][0], 30 / 127, "release velocity of the sounding note");
assert.deepEqual(r[1], [[0, 0, 0, 1, 100 / 127, 0]]);
assert.ok(r[4], "a trigger for the returning note");
near(pv(r[0][0]), 0, "back to C4");
// releasing a held note that isn't sounding changes nothing
t.bytes(on(4, 70, 90), off(2, 60, 10));
t.take();
t.bytes(off(4, 70, 20));
r = t.take();
assert.deepEqual(r[1], [[0, 0]], "gate closes when the last note goes");

// pressure and Y follow the sounding note's channel, including values sent before its note-on
t = load();
t.bytes([0xd1, 40], [0xb1, 74, 20], on(2, 60, 100));
r = t.take();
near(r[2][0], 40 / 127, "pressure sent before the note-on");
near(r[3][0], 20 / 127, "Y sent before the note-on");
t.bytes([0xd2, 90], [0xb2, 74, 100], on(3, 62, 100));
t.take();
t.bytes([0xd1, 50]); // the held, silent note's pressure: waits
r = t.take();
assert.equal(r[2], undefined, "a silent note's pressure doesn't go out");
t.bytes(off(3, 62, 0));
r = t.take();
near(r[2][0], 50 / 127, "back to the held note's latest pressure");
near(r[3][0], 20 / 127, "and its Y");
t.bytes([0xb1, 1, 99]); // another CC is ignored
assert.equal(t.take()[3], undefined);
t.ctx.ycc(1);
t.bytes([0xb1, 1, 99]);
near(t.take()[3][0], 99 / 127, "ycc picks the Y CC");

// realtime bytes are dropped, also inside a message
t = load();
t.bytes(0x91, 0xf8, 60, 100);
near(pv(t.take()[0][0]), 0, "note through a clock byte");

// onset: the vibrato gain fades in from 1 over onset ms, re-tuned every 5 ms with no new bends
t = load();
t.ctx.vibrato(2);
t.ctx.onset(40);
t.bytes(bend(2, 8192 + Math.round((0.1 / 48) * 8192)), on(2, 60, 100));
const s = ((Math.round((0.1 / 48) * 8192)) / 8192) * 48;
const at = (g) => (100 * (s + ((g - 1) * Math.sin(2 * Math.PI * s)) / (2 * Math.PI))) / 12000;
near(pv(t.take()[0][0]), at(1), "gain 1 at the strike");
t.advance(20);
near(pv(lastOf(t.take(), 0)), at(1.5), "halfway at 20 ms");
t.advance(40);
near(pv(lastOf(t.take(), 0)), at(2), "full gain after 40 ms");
t.advance(20);
assert.equal(t.take()[0], undefined, "ramp stops");

// panic: gate and trigger down, notes forgotten
t = load();
t.bytes(on(2, 60, 100));
t.take();
t.ctx.panic();
t.bytes(off(2, 60, 50));
r = t.take();
assert.equal(r[5], undefined, "the note was forgotten");

// slew: a new note jumps (0 ms), a bend ramps over slew ms (default 10), slew 0 = steps
t = load();
t.bytes(on(2, 60, 100));
assert.deepEqual(t.take()[0], [[0, 0]], "a new note jumps");
t.bytes(bend(2, 8192 + 2048));
assert.equal(lastOf(t.take(), 0)[1], 10, "a bend ramps over 10 ms");
t.ctx.slew(0);
t.bytes(bend(2, 8192));
assert.deepEqual(lastOf(t.take(), 0), [0, 0], "slew 0");
t.ctx.slew(25);
t.bytes(on(3, 62, 100));
assert.equal(lastOf(t.take(), 0)[1], 0, "a new note jumps whatever the slew");
t.ctx.slew(80);
t.bytes(bend(3, 9000));
assert.equal(lastOf(t.take(), 0)[1], 50, "slew is clamped to 50");

// response curves: strike -> gate, press -> pressure, slide -> Y, lift -> release
t = load();
const sq = Array.from({ length: 128 }, (_, v) => (v / 127) ** 2);
t.ctx.curve("strike", ...sq);
t.ctx.curve("press", ...sq);
t.ctx.curve("slide", ...sq);
t.ctx.curve("lift", ...sq);
t.bytes([0xd1, 64], [0xb1, 74, 32], on(2, 60, 100));
r = t.take();
assert.deepEqual(r[1], [[(100 / 127) ** 2, 0]], "gate through the strike curve");
near(r[2][0], (64 / 127) ** 2, "pressure curve");
near(r[3][0], (32 / 127) ** 2, "slide curve");
t.bytes(off(2, 60, 50));
near(t.take()[5][0], (50 / 127) ** 2, "lift curve");
// a new curve applies to the sounding note at once
t.bytes([0xd1, 64], on(2, 60, 100));
t.take();
t.ctx.curve("press", ...Array(128).fill(1));
near(t.take()[2][0], 1, "press curve applied now");
// bad curves are refused
t.ctx.curve("wobble", ...sq);
t.ctx.curve("press", 1, 2);
assert.equal(t.ctx.posts.length, 2);

// curve dots: strike, press and slide on each sounding note, press/slide as they move, lift on
// release; when the last note ends the dots go inactive
t = load();
t.bytes([0xd1, 64], [0xb1, 74, 32], on(2, 60, 127));
assert.deepEqual(t.ctx.dots.splice(0).map((d) => d.join(" ")), ["linn_curves pos strike 1 1", `linn_curves pos press ${64 / 127} 1`, `linn_curves pos slide ${32 / 127} 1`]);
t.bytes([0xd1, 127]);
assert.deepEqual(t.ctx.dots.splice(0).map((d) => d.join(" ")), ["linn_curves pos press 1 1"]);
t.bytes(off(2, 60, 0));
assert.deepEqual(t.ctx.dots.splice(0).map((d) => d.join(" ")), ["linn_curves pos lift 0 1", "linn_curves pos strike 1 0", "linn_curves pos press 1 0", `linn_curves pos slide ${32 / 127} 0`]);

// trigger: height and length from the strike velocity (through the Strike curve) when switched on
t = load();
t.bytes(on(2, 60, 127));
assert.deepEqual(t.take()[4], [[1, 0, 1, 4, 0, 0]], "off: 1 for 4 ms");
t.ctx.trigger(30);
t.bytes(on(3, 62, 127));
assert.deepEqual(t.take()[4], [[1, 0, 1, 20, 0, 0]], "trig ms clamped to 20");
t.ctx.trigvel(1);
t.ctx.triglen(1);
t.ctx.curve("strike", ...Array.from({ length: 128 }, (_, v) => v / 254));
t.bytes(on(4, 64, 127));
assert.deepEqual(t.take()[4], [[0.5, 0, 0.5, 11, 0, 0]], "half level, halfway 2..20 ms");
t.bytes(on(5, 65, 0x7f), off(5, 65, 0));
t.take();
t.ctx.curve("strike", ...Array.from({ length: 128 }, () => 0));
t.bytes(on(6, 66, 10));
assert.deepEqual(t.take()[4], [[0, 0, 0, 2, 0, 0]], "softest: 2 ms");

console.log("linn.cv: all tests passed");
