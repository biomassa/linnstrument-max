# Dark columns for CC faders

Shared spec for linnkit and the Max patches (user's request, 2026-09-26).

## Problem

The firmware draws CC faders on the main LED layer, under the custom light layer
(`getCombinedLedData`, `ls_leds.ino:138`: the highest non-off layer wins; `LED_LAYER_CUSTOM1` = 1
is above `LED_LAYER_MAIN` = 0). A custom light pattern painted on all 25 columns hides the faders
wherever it has a pad lit. The faders still work, but you can't see them.

## Behaviour

Before painting the lights (send and send-lights-only), read with NRPN 299:

| NRPN | Meaning |
|---|---|
| 200 | split on (1) / off (0) |
| 201 | split shown when split is off (0 left, 1 right) |
| 202 | split point: first column of the right split (2–25) |
| 35 | left split Special mode (0 none, 1 arp, 2 CC faders, 3 strum, 4 sequencer) |
| 135 | right split Special mode |

Dark columns (sent as colour 0, and shown dark in the preview):
- split on, right split Special = 2: columns 202..25
- split on, left split Special = 2: columns 1..202−1
- split off and the shown split (201) has Special = 2: all columns
- otherwise none

Only CC faders (2) count. Arp, strum and sequencer are left alone.

If any of the five values doesn't answer, nothing is dark and a note is shown; the send goes on.
Nothing is written. The split is read on each send and when the app or patch starts (so the preview shows it before the first send): after changing it on the instrument, send again.

The recorded slot-2 pattern (Max: `lights-slot2.json`) is the painted one, dark columns included.

## Max

`linn.lights.js`: `write()` reads the five values, sets the dark columns, sends the preview again and
paints; `readsplit` (also run 1 s after the patch opens) only reads it for the preview. A read now ends as soon as every reply is in, instead of always waiting the 1.5 s timeout.
Tests in `patchers/tests/linn.lights.test.mjs`.

## Faders setup and fader bars (2026-10-01)

Added in Max after the dark columns; proposed for linnkit.

### Faders setup

One action (Max: the `faders` button) turns the right split into 8 CC faders:

| NRPN | Value | Meaning |
|---|---|---|
| 200 | 1 | split on |
| 135 | 2 | right split Special = CC faders (firmware case 35 turns arp, strum and sequencer off) |
| 101 | 1 | right split main channel 1 (where the faders' CCs are read) |

The split column (202) stays as it is on the instrument. These are settings writes, so the one backup
is made first if none exists (as for send). The three values are read back; a mismatch is reported.
Then the lights are sent again, so the fader columns are dark (see above). The main channel's on/off
flag can't be set by NRPN; the user keeps it on.

### Fader bars in the preview

The faders send CC 1-8 (bottom row first) on channel 1, value 0-127. The preview draws, in each row of
the dark columns, one bar from the split's first dark column, as long as value / 127 of the dark
columns' width, in LED blue, not segmented (unlike the LinnStrument's own fader display). A row has no
bar until its fader has sent a value (the LinnStrument doesn't report fader positions).

Max: `linn.faders.js` outlet 8 sends `fader <row> <0..1>`; `linn.preview.js` `fader` draws the bars
over the preview's `dark` columns. Tests: `linn.lights.test.mjs` (faders), `linn.preview.test.mjs`
(bars), `linn.faders.test.mjs`.

### Toggle and polling (2026-10-01)

The faders setup is a toggle: off writes 135 = 0 and 200 = 0. The split (200, 201, 202, 35, 135) is read
about once a second; on a change the dark columns, the preview and the toggle follow, and the lights are
painted again without CC23. The polling replies (NRPN on channel 1) are dropped before the synth.
