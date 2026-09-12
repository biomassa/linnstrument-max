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
        "rect": [ 220.0, 220.0, 680.0, 400.0 ],
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "comment": "messages: send, sendlights, backup, restore [path], scheme, offset, rootcolor, bend, dump, status, reset",
                    "id": "obj-1",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "scale file path (from the scale menu)",
                    "id": "obj-2",
                    "index": 2,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 70.0, 90.0, 22.0 ],
                    "text": "prepend scale"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 30.0, 130.0, 120.0, 22.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    },
                    "text": "v8 linn.lights.js",
                    "varname": "lights"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 420.0, 70.0, 170.0, 22.0 ],
                    "text": "midiin \"LinnStrument MIDI\""
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 200.0, 180.0, 22.0 ],
                    "text": "midiout \"LinnStrument MIDI\""
                }
            },
            {
                "box": {
                    "comment": "settings for the controls (scale, scheme, offset, rootcolor, bend) and status",
                    "id": "obj-7",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 200.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 260.0, 620.0, 76.0 ],
                    "text": "Sends a scale's row layout and pad lights to the LinnStrument, like linnkit. Lights go to custom slot 2 only. sendlights = lights only; send = Bend Range + rows + lights, after an automatic backup to reference/backups/. restore = write back the newest backup (or restore <path>). Per-scale settings (scheme, offset, rootcolor, bend) live in [dict linn.lights.settings] in the parent patch. Degree 0 is MIDI 60, as in linn.retune."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 1 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-4", 1 ]
                }
            }
        ],
        "autosave": 0
    }
}
