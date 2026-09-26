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
Nothing is written. The split is read on each send only: after changing it on the instrument, send again.

The recorded slot-2 pattern (Max: `lights-slot2.json`) is the painted one, dark columns included.

## Max

`linn.lights.js`: `write()` reads the five values, sets the dark columns, sends the preview again and
paints. A read now ends as soon as every reply is in, instead of always waiting the 1.5 s timeout.
Tests in `patchers/tests/linn.lights.test.mjs`.
