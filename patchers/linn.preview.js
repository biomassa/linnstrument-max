// linn.preview: shows linn.lights' pad pattern the way the LinnStrument lights it, and plays a
// pad when you click it. For a v8ui (Max 9).
//
// Inlet: preview <json> from linn.lights: { colors, labels, notes }, each [row][col - 1],
//        row 0 nearest the player (drawn at the bottom).
// Outlet: raw MIDI bytes for linn.retune's left inlet: note-on while a pad is pressed,
//         note-off on release, on MIDI channel 16.

autowatch = 1;
inlets = 1;
outlets = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const COLS = 25;
const ROWS = 8;
const CHANNEL = 15; // MIDI channel 16, 0-based
const VELOCITY = 96;

// how the pads look (linnkit lights.go, from the firmware's LED driver): each LED channel is on
// or off; white, orange, lime and pink alternate two base colors, so white looks cyan-tinted
const DUTY = {
	1: [1, 0, 0],
	2: [1, 1, 0],
	3: [0, 1, 0],
	4: [0, 1, 1],
	5: [0, 0, 1],
	6: [1, 0, 1],
	8: [0.5, 1, 1],
	9: [1, 0.5, 0],
	10: [0.5, 1, 0],
	11: [1, 0.5, 0.5],
};
const LIGHT = new Set([2, 3, 4, 8, 9, 10, 11]); // colors that need dark text

let data = null;
let held = null; // [row, col, note] while a pad is pressed

function preview(json) {
	try {
		data = JSON.parse(String(json));
	} catch (e) {
		post("linn.preview: can't read the preview data\n");
		return;
	}
	mgraphics.redraw();
}

// pad fill as rgb 0..1: unlit pads dark grey, pads outside MIDI 0..127 black
function fill(color, note) {
	if (note < 0 || note > 127) return [0, 0, 0];
	const d = DUTY[color];
	return d ? d.map((v) => (20 + 235 * v) / 255) : [40 / 255, 40 / 255, 40 / 255];
}

// the pad under a point: [row, col], row 0 at the bottom; null outside the grid
function padAt(x, y, w, h) {
	const col = Math.floor(x / (w / COLS));
	const fromTop = Math.floor(y / (h / ROWS));
	if (col < 0 || col >= COLS || fromTop < 0 || fromTop >= ROWS) return null;
	return [ROWS - 1 - fromTop, col];
}

function paint() {
	const [w, h] = mgraphics.size;
	mgraphics.set_source_rgba(0.06, 0.06, 0.06, 1);
	mgraphics.rectangle(0, 0, w, h);
	mgraphics.fill();
	if (!data) return;
	const cw = w / COLS;
	const ch = h / ROWS;
	mgraphics.select_font_face("Arial Bold");
	mgraphics.set_font_size(Math.max(7, Math.min(cw, ch) * 0.4));
	for (let r = 0; r < ROWS; r++)
		for (let c = 0; c < COLS; c++) {
			const x = c * cw;
			const y = (ROWS - 1 - r) * ch;
			const note = data.notes[r][c];
			const color = data.colors[r][c];
			const [R, G, B] = fill(color, note);
			mgraphics.set_source_rgba(R, G, B, 1);
			mgraphics.rectangle(x + 1, y + 1, cw - 2, ch - 2);
			mgraphics.fill();
			if (held && held[0] === r && held[1] === c) {
				mgraphics.set_source_rgba(1, 1, 1, 1);
				mgraphics.set_line_width(2);
				mgraphics.rectangle(x + 2, y + 2, cw - 4, ch - 4);
				mgraphics.stroke();
			}
			const label = data.labels[r][c];
			if (color && label && label !== "!!") {
				const ink = LIGHT.has(color) ? 0.08 : 1;
				mgraphics.set_source_rgba(ink, ink, ink, 1);
				const [tw, th] = mgraphics.text_measure(label);
				mgraphics.move_to(x + (cw - tw) / 2, y + (ch + th * 0.6) / 2);
				mgraphics.show_text(label);
			}
		}
}

function onpointerdown(e) {
	if (!data) return;
	const [w, h] = mgraphics.size;
	const p = padAt(e.clientX, e.clientY, w, h);
	if (!p) return;
	const note = data.notes[p[0]][p[1]];
	if (note < 0 || note > 127) return;
	release();
	held = [p[0], p[1], note];
	send(0x90 | CHANNEL, note, VELOCITY);
	mgraphics.redraw();
}
onpointerdown.local = 1;

function onpointerup() {
	release();
	mgraphics.redraw();
}
onpointerup.local = 1;

function onpointerleave() {
	onpointerup();
}
onpointerleave.local = 1;

function release() {
	if (!held) return;
	send(0x80 | CHANNEL, held[2], 0);
	held = null;
}

// one int at a time, as linn.retune's left inlet takes raw MIDI bytes from midiin
function send(...bytes) {
	bytes.forEach((b) => outlet(0, b));
}

function onresize() {
	mgraphics.redraw();
}
onresize.local = 1;
