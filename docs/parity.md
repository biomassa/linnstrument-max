# Feature parity: linnkit and the two Max patches

The user's rule (2026-09-12): keep [linnkit](https://github.com/biomassa/linnkit), `patchers/linnstrument.maxpat` (synth plugins in Max) and `patchers/linnstrument-relay.maxpat` (12-TET hardware) in sync. A feature added to one is proposed for the others; each change is agreed with the user first.

State on 2026-09-12. linnkit's column includes the relay work in progress there (not committed).

## Features

| Feature | linnkit | Max patches | Gap |
|---|---|---|---|
| **Scales** | | | |
| Scale files | `SCL/`, `~/SCL`, added folders; filter by name or description | `SCL/` only; `rescan` | Max: extra folders, filter |
| Scale summary, table of degrees, interval matrix | yes (SCALE pane, `m`, `t`, `describe`) | no | Max |
| **Layout** | | | |
| Row offset | ranked list of candidates (interval, periods, triad span, period move, fits) | menu of the same ranking (checked against linnkit); scales with no stored offset start on the best | none |
| Bottom-left note, root note, per scale | yes | yes | none |
| Reference frequency of the root | set per scale | derived from the root note (display only; the user's choice) | intended difference |
| Factory 12-TET layout send | yes (`f`) | no | Max |
| **Lights** | | | |
| 13 light schemes and their settings | yes | yes (checked pad by pad against linnkit) | none |
| Light slot | 0, 1 or 2 | slot 2 only | Max (slots 0 and 1 need the user's go-ahead) |
| Pad preview | text or colour grid; large grid with degrees | `v8ui` preview with labels; click a pad to play it | linnkit: play from the preview is not possible in a terminal |
| **Send** | | | |
| Rows, Bend Range, lights, readback check | yes | yes | none |
| MIDI setup (Channel Per Note, main 1, per-note 2-16, or One Channel) | yes (`c`) | `MIDI setup` toggle, on by default: Channel Per Note, main 1, per-note 2-16, X/Y/Z (One Channel not offered) | none |
| Backups | one per send in `~/.config/linnkit/backups`; restore the latest | one file, kept from the first send; restore | none in effect |
| Slot 2 light pattern in the backup, repainted by restore | no (ignores the extra entry) | yes | linnkit |
| **Synths** | | | |
| Synth profiles (bend ranges, setup notes) | yes | no (a `synth bend` box) | Max, if wanted |
| Bend Range for Scala synths | approximate B from the profile, or exact with the Scala-synth relay | exact: Bend Range stays 48, bends converted (`retune 0`) | none |
| Export `.scl` + `.kbm` for Madrona Labs synths | yes (`e`, and when the Scala-synth relay starts) | `export scale` button (linnstrument.maxpat) | none |
| 12-TET plugin retuning (like Live's tuning system) | Live profile, or the relay to the IAC bus | `retune 1` (linnstrument.maxpat) | none |
| **Relay** | | | |
| Targets K2600, Mutant Brain, generic | yes | yes (linnstrument-relay.maxpat) | none |
| Mutant Brain voices | mono on channel 1, notes 24-120, bend 24; setup text has the CV layout | mono on channel 1 (the user's choice) | none |
| Voice limit, vibrato gain, onset fade-in, legato | yes (same formulas; relay window defaults vibrato 2.5, fade-in 40 ms, voices 16, legato on) | yes (vibrato and onset also in linnstrument.maxpat; the engine defaults vibrato to 1, the patches store 2.5) | none: same output for the same settings |
| Main channel pass-through | none (its targets have none; its Scala target uses channels 2-16 and drops channel 1) | relay patch: none; linnstrument.maxpat passes channel 1 through to the plugin | small, by design |
| MIDI clock and transport | dropped: the relay drops every status >= 0xF0 (realtime, song position, sysex); nothing sends them to the LinnStrument (2026-09-14, not committed there yet) | dropped: no realtime or system messages pass, and none go to the LinnStrument (the user's choice, 2026-09-14; clock in may come later) | none |
| Relay counters (messages, dropped, stolen, clamped) and sounding notes | yes | no (built, then removed at the user's request as not useful, 2026-09-12) | intended difference |
| Send Bend Range (RPN 0) to the target | "send bend range", on by default: RPN 0 to each channel in use when the relay starts | no | intended difference (the user's choice, 2026-09-12: the K2600 and Mutant Brain ignore it) |
| Response curves (strike, press, slide, lift; editors like Equator's, a shared curve library) | no | yes (linnstrument, -b, -relay: on the MIDI; -es8: on the CV) | intended difference for now (the user's choice, 2026-09-25: no curves in linnkit at least for now) |
| **Presets** | | | |
| Settings per scale | yes | yes | none |
| Presets | named presets (scale, settings, slot, send options); the last send is reopened at start | numbered slots of the preset grid (scale, lights settings, synth or relay settings, plugin state) | different models; see the plan |

## Plan for the Max patches

Suggested order. Each item is a separate decision for the user.

1. ~~**Clock and transport pass through** in `linn.relay`.~~ Built on 2026-09-12, dropped again on 2026-09-14 at the user's request: no clock or transport over the LinnStrument's connection.
2. **MIDI setup on send**, as an option: Channel Per Note with main channel 1 and per-note channels 2–16, and the Bend Range. It is a settings write, covered by the backup.
3. **Ranked row offsets**: port linnkit's layout scoring (`internal/layout`), show the best candidates in a menu with their interval, and make the best one the default, as in linnkit. Tested against `linnkit grid` output.
4. **Relay counters and sounding notes** in `linnstrument-relay.maxpat`.
5. **Factory 12-TET layout send**.
6. **Light slots 0 and 1** (only with the user's go-ahead: they hold the user's own patterns).
7. **Scale summary and table of degrees**: a text display fed by `linn.lights`.
8. **Extra scale folders and a filter** for the scale menu.

Intended differences, not planned: the reference frequency input (the user removed it), the 4-voice Mutant Brain mode in Max (the user chose mono), synth profiles (the Max patches set the synth's bend range directly).

## For linnkit

Done in linnkit on 2026-09-12 (not committed there yet): voice limit, vibrato gain, onset fade-in, Mutant Brain mono with legato, the Mutant Brain CV layout, the K2600 bend range in cents; 12-TET note rounding now floor(x + 0.5) like linn.retune.

Sent, waiting for the user's decision there: the slot 2 light pattern in backups, repainted by restore.
