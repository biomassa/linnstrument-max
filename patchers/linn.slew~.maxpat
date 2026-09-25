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
			560.0,
			300.0
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
						"signal"
					],
					"patching_rect": [
						30.0,
						20.0,
						30.0,
						30.0
					],
					"comment": "signal to slew"
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
						"signal"
					],
					"patching_rect": [
						200.0,
						20.0,
						30.0,
						30.0
					],
					"comment": "reset: a change jumps instead (linn.cv's note count); leave unconnected to always slew"
				}
			},
			{
				"box": {
					"id": "obj-3",
					"maxclass": "newobj",
					"text": "r #1",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						330.0,
						20.0,
						80.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-4",
					"maxclass": "newobj",
					"text": "prepend ms",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						330.0,
						60.0,
						80.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-5",
					"maxclass": "newobj",
					"text": "gen~ @gen linn.slew",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						30.0,
						110.0,
						200.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "obj-6",
					"maxclass": "outlet",
					"index": 1,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						160.0,
						30.0,
						30.0
					],
					"comment": "slewed signal"
				}
			},
			{
				"box": {
					"id": "obj-7",
					"maxclass": "comment",
					"linecount": 3,
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						210.0,
						480.0,
						48.0
					],
					"text": "linn.slew~ <name>: linear slew in the audio domain (linn.slew.gendsp). Each new value is reached in a straight line over ms. A change on the right inlet jumps straight to the input. Set the time with ms <n> to the receiver <name>."
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
						"obj-5",
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
						"obj-5",
						1
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
						0
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
						"obj-6",
						0
					]
				}
			}
		]
	}
}