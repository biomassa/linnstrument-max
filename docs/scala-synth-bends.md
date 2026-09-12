# Slides for synths that load the scale themselves

Shared by linn.retune (Max, `patchers/linn.retune.js`, mode `retune 0`) and linnkit (to add). Written
2026-09-12 at the user's request: keep the LinnStrument Bend Range at 48 for every scale and convert
bends so slides land on the pads, also for synths that load `.scl` + `.kbm` (Aalto, Kaivo, Surge XT,
Pigments). linnkit today sets the LinnStrument Bend Range B so that one pad of slide is about the
average step (`synth.PlanFor`); that is exact only when 100 * S / B happens to equal the step, and never
for unequal scales.

## The two routes

- 12-TET synth (linn.retune `retune 1`, linnkit's relay): each note goes out as the nearest 12-TET note
  plus a per-note bend.
- Scala synth (linn.retune `retune 0`, new): the synth has the scale, with degree 0 on the root note at
  the root frequency (a `.kbm`). Note numbers pass unchanged; only per-note pitch bend is rewritten.

## Terms

- B: the LinnStrument Bend Range (NRPN 19), 48. A full bend (+8191) is B scale steps (as in Live's
  tuning system).
- S: the synth's per-note bend range in semitones (Aalto / Kaivo: 12, 24, 48 or 96).
- `pitch(x)`: cents of fractional position x = MIDI note + steps, from the tuning table of 128 notes
  (the scale mapped with degree 0 on the root), linear in cents between neighbouring notes,
  extrapolated past 0..127 with the end steps. The same function linn.retune uses in both modes.

## The conversion (Scala synth)

For a note n on input channel c with input bend b (0..16383, centre 8192):

- steps = (b - 8192) / 8192 * B
- cents = pitch(n + steps) - pitch(n)
- out = clamp(8192 + round(cents / (100 * S) * 8192), 0, 16383)

Rounding: `round(x) = floor(x + 0.5)` (JavaScript `Math.round`: halves go up, -2.5 -> -2), in both
linn.retune and linnkit (not Go's `math.Round`, which rounds halves away from zero).

At note-on the bend is whatever the channel holds (usually centre, so 8192 and no glide into the
attack). Slides past S semitones clamp.

Examples (for tests):

- 31-EDO, S = 48, +24 steps (b = 12288): 929.032 c, out = 9778. With S = 12: 14534.
- ji_7 style scale with degree 1 = 203.91 c (9/8) and degree 2 = 386.31 c (5/4), B = 64, note on
  degree 1, b = 8256 (+0.5 step): 91.20 c, S = 48: out = 8348.

## The synth's tuning

The conversion is right only if the synth plays the same pitches as the table: the same `.scl`, and a
`.kbm` with degree 0 on the root at the root frequency. linn.retune copies the `.scl` unchanged and
writes `<name>.kbm` in linnkit's `scala.LinearMapping(n, root, hz).Format(...)` layout (every degree
listed; Madrona Labs synths ignore a map of 127 or more entries) to
`~/Music/Madrona Labs/Scales/linnstrument/` on its `exportscale` message, from an export button (not on
every scale or root change: that rewrote the same files on every preset recall). The user still loads it
in the synth. linnkit writes the same layout to `.../Scales/linnkit/` from its export.

## Everything else

Channel allocation, tail hold, pressure/Y/pedals and the main channel work as in the 12-TET route
(linn.retune's header; linnkit's relay). Switching modes releases held notes first.
