# linnstrument

Max 9 patches for the Roger Linn LinnStrument.

The plan has three parts:

- `linn.lights`: control the pad colors, the row layout and the settings from Max.
- `linn.synth`: an MPE synth with microtonal tuning from Scala (`.scl`) files.
- `linn.relay`: retune the LinnStrument for 12-TET instruments, for example the Kurzweil K2600 and the Hexinverter Mutant Brain.

Work has not started yet. For a terminal app that sends scales, layouts and lights to the LinnStrument, see linnkit.

## AI-assisted development

This project is made with AI-assisted development. An AI coding assistant helps to write the patches, the code and the documentation.

## Contents

| Folder | Contents |
|---|---|
| `patchers/` | Max patches (`.maxpat`) |
| `LinnStrumentLights/` | Light controller patches by bfuhrman (git submodule, github.com/bfuhrman/LinnStrumentLights) |
| `SCL/` | Scala scale files |

## Requirements

- Max 9.
- A LinnStrument (full size, 200 pads), firmware 2.3.4.

## Get the submodule

After you clone this repository, get the light controller patches:

    git submodule update --init
