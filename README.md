# linnstrument-max

![The linnstrument.maxpat patch: the pad preview with just-interval lights for 31-EDO, and the scale, light, layout and tuning controls](docs/linnstrument.png)

These Max 9 patches operate the Roger Linn LinnStrument. They read scales from Scala (`.scl`) files. They set the pad layout and the pad lights. They tune MPE synths in Max and 12-TET hardware.

The terminal app [linnkit](https://github.com/biomassa/linnkit) does the same tasks outside Max. The two projects use the same specifications (`docs/`). The tests compare the Max code with the output of linnkit.

## Select the patch

The folder `patchers/` has three patches. Select the patch for your instrument.

| Patch | Use |
|---|---|
| `linnstrument.maxpat` | For synth plugins in Max (`vst~`, for example Madrona Labs Kaivo). The `retune` toggle sets the tuning mode. **On**: for a plugin that has 12-equal tuning. The patch tunes each note with pitch bend. **Off**: for a plugin that loads the scale. The notes go to the plugin without change. The patch changes the slides so that they stop on the pads. |
| `linnstrument-es8.maxpat` | For modular synths through the Expert Sleepers ES-8. One voice. The patch sends six CV signals: pitch (1 V/oct, 0 V = MIDI 60), gate, pressure, Y, trigger and release velocity. Connect its outlets to `dac~`. |
| `linnstrument-relay.maxpat` | For 12-TET hardware on a MIDI port. The `target` menu sets the instrument. **k2600**: Kurzweil K2600 in Multi mode, one note on each channel. **mutantbrain**: Hexinverter Mutant Brain, one voice. **generic**: a different 12-TET MPE instrument. |

CAUTION: Open only one patch at a time. The patches receive MIDI from the same LinnStrument.

`linnstrument-b.maxpat` is `linnstrument.maxpat` for use as a bpatcher in a larger patch. It has no `vst~`, no `ezdac~` and no `plug` message. Connect its outlet to your `vst~`. Its presets are in `linnstrument-b.json`.

NOTE: `research_1.maxpat` is an older version. It is a backup.

The patches have these controls:

- A scale menu. It shows the files in `patchers/SCL/`. To add a scale, put its `.scl` file in this folder. Click `rescan folder` to read the folder again.
- Controls for the LinnStrument layout: `row offset`, `bottom-left`, `root` and `Linnstrument PB range`. The `row offset` menu shows the best offsets first, as linnkit does.
- `LED pattern`: a menu of 13 light schemes (`docs/light-schemes.md`). Each scheme has its settings.
- `send`: this writes the MIDI setup, the rows, the Bend Range and the lights to the LinnStrument.
- `sendlights`: this writes only the lights.
- A preview of the pads with their colors and labels. Click a pad to play it.
- `vibrato`: this makes side-to-side vibrato wider. Slides continue to stop on the pads.
- `onset ms`: this increases the vibrato effect slowly after each strike.
- Four response curves (strike, press, slide, lift), as in `linnstrument-es8.maxpat` (see there). In `linnstrument.maxpat`, `linnstrument-b.maxpat` and `linnstrument-relay.maxpat` they change the MIDI to the synth: velocity, pressure, Y (CC 74) and release velocity. With linear curves (the default) the MIDI does not change. A coloured dot shows each note that you hold.
- Presets (the preset grid). The patches keep the presets in `linnstrument.json`, `linnstrument-es8.json` and `linnstrument-relay.json`.

## Prepare the equipment

### LinnStrument

1. Make sure that the MIDI mode is Channel Per Note (MPE).
2. Make sure that Y sends CC 74 and Z sends channel pressure.
3. Set the Bend Range to 48.

NOTE: When the `MIDI setup` toggle is on, `send` does steps 1 to 3 for you. `send` uses the value in the `Linnstrument PB range` box.

Before the first write, `send` saves all the LinnStrument settings to `reference/backups/backup.json`. `restore` writes these settings back to the LinnStrument.

1. Make the folder `reference/backups/` before you use `send`. This folder is not in the repository.

NOTE: The patches write lights only to custom light slot 2.

### `linnstrument.maxpat`

1. Click the `plug` message and load the plugin into `vst~`.
2. Make sure that the plugin receives MPE.
3. If `retune` is on, set the plugin to 12-equal tuning.
4. If `retune` is on, set the per-note bend range of the plugin to 48.
5. If `retune` is off, click `export to madrona`. This writes the `.scl` file and a `.kbm` file.
6. If `retune` is off, load the scale in the plugin from `~/Music/Madrona Labs/Scales/linnstrument/`.
7. If `retune` is off, set `synth bend` to the per-note bend range of the plugin.

CAUTION: Some plugin settings are not parameters, for example the scale menu of Kaivo. After you change such a setting, move a knob of the plugin. Then save the patch or store a preset. If you do not move a knob, the patch restores the old setting.

### `linnstrument-es8.maxpat`

1. Set the LinnStrument to Channel Per Note. When `MIDI setup` is on, `send` does this for you.
2. Connect the six outlets to `dac~` and to the ES-8 outputs.

The newest note that you hold plays. When you release it, the newest note that you still hold plays again.

- `slides slew ms`, `press slew ms`, `Y slew ms`: these make pitch, pressure and Y change smoothly, in the audio signal after `linn.cv` (`linn.slew~`). New notes do not slide.
- `trig ms`: the length of the trigger, 2 to 20 ms.
- `vel > trig level`: when this is on, the strike velocity sets the trigger level.
- `vel > trig length`: when this is on, the strike velocity sets the trigger length, from 2 ms (soft) to 20 ms (hard).

The four curves set the response to strike (velocity), press (pressure), slide (Y) and lift (release velocity). The yellow dot shows the value of the note that plays.

- Double-click an empty area to add a node. Double-click a node to delete it.
- Drag a node to move it. Hold Shift to snap it to the grid.
- Move the pointer near the line. A point shows between two nodes. Drag this point to bend the line. Double-click it to make the line straight.
- Use the menu to load a curve. Click the button next to the name to save the curve. The patch keeps the saved curves in `patchers/linn.curves.json`.
- `reset curves`: this deletes all saved curves and sets the four curves to linear.

### `linnstrument-relay.maxpat`

1. In the `MIDI out` menu, select the MIDI output port.
2. In the `target` menu, select the instrument.
3. In the `voices` box, set the maximum number of notes. The relay uses the channels 1 to this number.

For the Kurzweil K2600:

1. Set the MIDI receive mode to Multi.
2. Set the same program on the channels 1 to `voices`.
3. Set the pitch bend range of the program to 24 semitones (2400 cents).
4. Do not use an intonation table.

For the Hexinverter Mutant Brain:

1. Set note input 1 to channel 1 with last-note priority.
2. Set the pitch bend range of note input 1 to ±24.
3. Set CV A to the pitch of note input 1 (V/Oct).
4. Set CV B to the velocity of note input 1.
5. Set CV C to channel aftertouch on channel 1. This gives the pressure.
6. Set CV D to CC 74 on channel 1. This gives the Y position.

NOTE: The Mutant Brain plays only MIDI notes 24 to 120. When `legato` is on, the gate stays high when you move to a new pad.

## Contents

| Path | Contents |
|---|---|
| `patchers/linnstrument.maxpat`, `patchers/linnstrument-es8.maxpat`, `patchers/linnstrument-relay.maxpat` | The three patches |
| `patchers/linnstrument-b.maxpat` | `linnstrument.maxpat` as a bpatcher, with an outlet for `vst~` |
| `patchers/linn.lights.maxpat` + `.js` | The layout, lights, settings and backups of the LinnStrument |
| `patchers/linn.retune.maxpat` + `.js` | The tuning for synth plugins. The script is also the engine of `linn.relay`. |
| `patchers/linn.relay.maxpat` | The tuning for 12-TET hardware, with output to a MIDI port |
| `patchers/linn.cv.maxpat` + `.js` | One-voice CV for the ES-8 |
| `patchers/linn.curve.js` | The response curve editor (`v8ui`) |
| `patchers/linn.curvemidi.js` | The response curves on the MIDI before `linn.retune` and `linn.relay` |
| `patchers/linn.slew~.maxpat` + `linn.slew.gendsp` | Linear slew in the audio signal (`gen~`) |
| `patchers/linn.preview.js` | The pad preview (`v8ui`) |
| `patchers/tests/` | Node tests for the scripts, with reference grids from linnkit |
| `docs/light-schemes.md` | The light schemes (the same in linnkit) |
| `docs/scala-synth-bends.md` | The bend conversion for synths that load the scale (the same in linnkit) |
| `docs/parity.md` | The features of linnkit and of the two patches |
| `patchers/SCL/` | Scala scale files for the scale menu |

## Requirements

- Max 9
- A LinnStrument (full size, 200 pads) with firmware 2.3.4
- Node.js (only for the tests)

## Tests

To do the tests, use this command:

    for t in patchers/tests/*.test.mjs; do node "$t"; done
