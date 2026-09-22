{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 9,
			"minor": 1,
			"revision": 5,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			200.0,
			200.0,
			700.0,
			420.0
		],
		"integercoordinates": 1,
		"autosave": 0,
		"boxes": [
			{
				"box": {
					"id": "obj-1",
					"maxclass": "inlet",
					"index": 1,
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						30.0,
						20.0,
						30.0,
						30.0
					],
					"comment": "raw MIDI bytes from midiin, or messages: root, bendrange, vibrato, onset, ycc, trigger, retrigger, panic"
				}
			},
			{
				"box": {
					"id": "obj-2",
					"maxclass": "inlet",
					"index": 2,
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						400.0,
						20.0,
						30.0,
						30.0
					],
					"comment": "scale: a .scl path or an archive name"
				}
			},
			{
				"box": {
					"id": "obj-3",
					"maxclass": "newobj",
					"text": "prepend scale",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						400.0,
						70.0,
						90.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-4",
					"maxclass": "newobj",
					"text": "v8 linn.cv.js",
					"numinlets": 2,
					"numoutlets": 7,
					"outlettype": [
						"",
						"",
						"",
						"",
						"",
						"",
						""
					],
					"patching_rect": [
						30.0,
						120.0,
						340.0,
						22.0
					],
					"saved_object_attributes": {
						"parameter_enable": 0
					}
				}
			},
			{
				"box": {
					"id": "obj-5",
					"maxclass": "newobj",
					"text": "mtof @mid 60 @ref 60 @base 261.625565",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						400.0,
						170.0,
						250.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-10",
					"maxclass": "newobj",
					"text": "line~",
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"bang"
					],
					"patching_rect": [
						30.0,
						200.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-20",
					"maxclass": "outlet",
					"index": 1,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						260.0,
						30.0,
						30.0
					],
					"comment": "pitch: 0.1 per octave (1 V/oct at dac~ 1 = 10 V), 0 = MIDI 60"
				}
			},
			{
				"box": {
					"id": "obj-11",
					"maxclass": "newobj",
					"text": "line~",
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"bang"
					],
					"patching_rect": [
						86.0,
						200.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-21",
					"maxclass": "outlet",
					"index": 2,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						86.0,
						260.0,
						30.0,
						30.0
					],
					"comment": "gate: strike velocity / 127 while held; retriggers on each new note"
				}
			},
			{
				"box": {
					"id": "obj-12",
					"maxclass": "newobj",
					"text": "sig~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						142.0,
						200.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-22",
					"maxclass": "outlet",
					"index": 3,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						142.0,
						260.0,
						30.0,
						30.0
					],
					"comment": "pressure 0..1"
				}
			},
			{
				"box": {
					"id": "obj-13",
					"maxclass": "newobj",
					"text": "sig~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						198.0,
						200.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-23",
					"maxclass": "outlet",
					"index": 4,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						198.0,
						260.0,
						30.0,
						30.0
					],
					"comment": "Y 0..1"
				}
			},
			{
				"box": {
					"id": "obj-14",
					"maxclass": "newobj",
					"text": "line~",
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"bang"
					],
					"patching_rect": [
						254.0,
						200.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-24",
					"maxclass": "outlet",
					"index": 5,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						254.0,
						260.0,
						30.0,
						30.0
					],
					"comment": "trigger: 1 for 4 ms on each new note"
				}
			},
			{
				"box": {
					"id": "obj-15",
					"maxclass": "newobj",
					"text": "sig~",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						310.0,
						200.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-25",
					"maxclass": "outlet",
					"index": 6,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						310.0,
						260.0,
						30.0,
						30.0
					],
					"comment": "release velocity 0..1"
				}
			},
			{
				"box": {
					"id": "obj-30",
					"maxclass": "comment",
					"linecount": 7,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						310.0,
						620.0,
						104.0
					],
					"text": "linn.cv: LinnStrument MPE (Channel Per Note) to monophonic CV for the Expert Sleepers ES-8, in the loaded scale. The newest held note sounds; releasing it returns to the newest note still held. Each new sounding note retriggers the gate (1 ms low) and fires a trigger (trigger <ms> 2-20, default 4; trigvel 1: height from the Strike curve; triglen 1: 2-20 ms by velocity). Outlets, in dac~ units (1 = 10 V): pitch (1 V/oct, 0 V = MIDI 60 in 12-TET), gate, pressure, Y (CC 74, ycc <n>), trigger, release velocity. Pitch bends ramp over slew <ms> (default 10, 0-50; new notes jump). The player's bend counts in scale steps (bendrange = the LinnStrument Bend Range)."
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"obj-1",
						0
					],
					"destination": [
						"obj-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-2",
						0
					],
					"destination": [
						"obj-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-3",
						0
					],
					"destination": [
						"obj-4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-4",
						6
					],
					"destination": [
						"obj-5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						0
					],
					"destination": [
						"obj-4",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-4",
						0
					],
					"destination": [
						"obj-10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-10",
						0
					],
					"destination": [
						"obj-20",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-4",
						1
					],
					"destination": [
						"obj-11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-11",
						0
					],
					"destination": [
						"obj-21",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-4",
						2
					],
					"destination": [
						"obj-12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-12",
						0
					],
					"destination": [
						"obj-22",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-4",
						3
					],
					"destination": [
						"obj-13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-13",
						0
					],
					"destination": [
						"obj-23",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-4",
						4
					],
					"destination": [
						"obj-14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-14",
						0
					],
					"destination": [
						"obj-24",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-4",
						5
					],
					"destination": [
						"obj-15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-15",
						0
					],
					"destination": [
						"obj-25",
						0
					]
				}
			}
		]
	}
}