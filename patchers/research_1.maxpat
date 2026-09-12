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
        "rect": [ -1260.0, 356.0, 1200.0, 869.0 ],
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "filename": "linn.preview.js",
                    "id": "obj-71",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 521.0, 495.0, 650.0, 208.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 880.0, 480.0, 64.0, 64.0 ],
                    "textfile": {
                        "filename": "linn.preview.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linn_preview"
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1060.0, 255.0, 106.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1060.0, 255.0, 106.0, 22.0 ],
                    "text": "routepass preview",
                    "varname": "linn_lpreviewroute"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 300.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 560.0, 300.0, 100.0, 22.0 ],
                    "text": "prepend root",
                    "varname": "linn_ltuning"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 980.0, 83.0, 141.0, 22.0 ],
                    "presentation": 1,
                    "presentation_linecount": 4,
                    "presentation_rect": [ 1000.0, 40.0, 50.0, 62.0 ],
                    "text": "13 steps = 503 c ~4/3",
                    "varname": "linn_loffsetinfo"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0, 430.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1000.0, 430.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetinfo"
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0, 400.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1000.0, 400.0, 100.0, 22.0 ],
                    "text": "fromsymbol",
                    "varname": "linn_lfromsym"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1320.0, 350.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1320.0, 350.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetrefhz"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1250.0, 350.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1250.0, 350.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetroot"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1180.0, 350.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1180.0, 350.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetlimit"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1300.0, 110.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1300.0, 110.0, 100.0, 22.0 ],
                    "text": "prepend refhz",
                    "varname": "linn_lprefhz"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1230.0, 110.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1230.0, 110.0, 100.0, 22.0 ],
                    "text": "prepend root",
                    "varname": "linn_lproot"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1160.0, 110.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1160.0, 110.0, 100.0, 22.0 ],
                    "text": "prepend limit",
                    "varname": "linn_lplimit"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-56",
                    "maxclass": "flonum",
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1300.0, 70.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1300.0, 70.0, 50.0, 22.0 ],
                    "varname": "linn_lrefhz"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1230.0, 70.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1230.0, 70.0, 50.0, 22.0 ],
                    "varname": "linn_lroot"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "number",
                    "maximum": 13,
                    "minimum": 3,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1160.0, 70.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1160.0, 70.0, 50.0, 22.0 ],
                    "varname": "linn_llimit"
                }
            },
            {
                "box": {
                    "data": {
                        "22edo.scl": "{\"scheme\":\"ji\",\"offset\":9,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0}",
                        "ji_11.scl": "{\"scheme\":\"ji\",\"offset\":5,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0}",
                        "31-edo.scl": "{\"scheme\":\"ji\",\"offset\":13,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0}"
                    },
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 474.0, 332.0, 125.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 880.0, 380.0, 125.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 1,
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict linn.lights.settings"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 704.0, 272.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1110.0, 320.0, 100.0, 22.0 ],
                    "text": "print linn.lights",
                    "varname": "linn_lprint"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 634.0, 272.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1040.0, 320.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetbend"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 564.0, 272.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 970.0, 320.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetoffset"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 474.0, 272.0, 110.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 880.0, 320.0, 110.0, 22.0 ],
                    "text": "prepend setsymbol",
                    "varname": "linn_lsetscheme"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 674.0, 62.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1080.0, 110.0, 100.0, 22.0 ],
                    "text": "prepend bend",
                    "varname": "linn_lpbend"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 594.0, 62.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1000.0, 110.0, 100.0, 22.0 ],
                    "text": "prepend offset",
                    "varname": "linn_lpoffset"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 474.0, 62.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 880.0, 110.0, 100.0, 22.0 ],
                    "text": "prepend scheme",
                    "varname": "linn_lpscheme"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "number",
                    "maximum": 96,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 674.0, 22.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1080.0, 70.0, 50.0, 22.0 ],
                    "varname": "linn_lbend"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "number",
                    "maximum": 25,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 594.0, 22.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1000.0, 70.0, 50.0, 22.0 ],
                    "varname": "linn_loffset"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "items": [ "root", ",", "ji", ",", "names", ",", "mos" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 474.0, 22.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 880.0, 70.0, 100.0, 22.0 ],
                    "varname": "linn_lscheme"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 474.0, 182.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 880.0, 230.0, 100.0, 22.0 ],
                    "text": "linn.lights",
                    "varname": "linn_lights"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "preset", "int", "preset", "int", "" ],
                    "patching_rect": [ 14.0, 445.0, 100.0, 40.0 ],
                    "pattrstorage": "research_1",
                    "presentation": 1,
                    "presentation_rect": [ 93.0, 430.0, 100.0, 40.0 ],
                    "varname": "linn_preset"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 14.0, 395.0, 136.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 93.0, 380.0, 136.0, 22.0 ],
                    "saved_object_attributes": {
                        "client_rect": [ 580, 87, 949, 304 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 583, 69, 1034, 197 ]
                    },
                    "text": "pattrstorage research_1",
                    "varname": "research_1"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 14.0, 345.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 93.0, 330.0, 100.0, 22.0 ],
                    "restore": {
                        "linn_lbend": [ 48 ],
                        "linn_llimit": [ 7 ],
                        "linn_loffset": [ 13 ],
                        "linn_lrefhz": [ 0.0 ],
                        "linn_lroot": [ 60 ],
                        "linn_lscheme": [ 1 ],
                        "linn_scale": [ "31-edo.scl" ],
                        "vst~": [
                            {
                                "filetype": "C74Snapshot",
                                "version": 2,
                                "minorversion": 0,
                                "name": "Kaivo",
                                "origin": "Kaivo.vstinfo",
                                "type": "VST",
                                "subtype": "Instrument",
                                "embed": 1,
                                "snapshot": {
                                    "pluginname": "Kaivo.vstinfo",
                                    "plugindisplayname": "Kaivo",
                                    "pluginsavedname": "",
                                    "pluginsaveduniqueid": 1264675190,
                                    "version": 1,
                                    "isbank": 0,
                                    "isbase64": 1,
                                    "blob": "10448.CMlaKA....fQPMDZ....ArTXoYG...vv....A........................................fBk6oPBh.WXzMFZhnSB6oPBIHxZkk2W18VZiU1bhnSBzvhBIjfHqUVde01ajIhNIHCKJjPBhrVY48kXk4FYhnSBvvhBIjfHqUVdeUmaoM2atIhNI.CKJjPBhrVY480YrkFYkIhNI.CKJjPBhLWYw8EauMVXrIhNIDCKJjPBhLWYw8EZuMGchnSBvvhBIjfHyUVbew1auAmH5jPLrnPBIHxbkE2WzIWZmIhNIDCKJjPBhLWYw8kbgQWYhnSBv3hL1XCLv.CKJjPBhLWYw8kbgQWZuIhNIDCKJjPBhLWYw8kbgQWYeAmH5j.LrnPBIHxbkE2WyQWYvMmH5jPL1vhBIjfHyUVbeMGckA2beAmH5j.LrnPBIHxbkE2WuYlYyUFchnSBvvhBIjfHyUVbe8lYlMWYz8EbhnSBvvhBIjfHyUVbeIWXtcVYhnSBwHCKJjPBhLWYw8Ub0ElazkldkIhNI.CKJjPBhLWYw80YrkFYkIhNIDCKJjPBhLWYw8Eb2IhNIXiLrnPBIHxbkE2W1EFa0U1WjUFagkmH5j.NrnPBIHxbkE2WvUGayU1WjUFagkmH5j.LrnPBIHxbkE2W1EFa0UFLhnSBv3RMv.CLv.CKJjPBhLWYw8kcgwVckEiH5j.LtLSLv.CLvvhBIjfHyUVbeYWXrUWYxHhNI.iKwTCLv.CLrnPBIHxbkE2W1EFa0U1LhnSBv3BLz.CLv.CKJjPBhLWYw8kcgwVckQiH5j.LrnPBIHxbkE2W1EFa0UVMhnSBv3BLz.CLv.CKJjPBhLWYw8kcgwVckYiH5j.LtDSMv.CLvvhBIjfHyUVbeYWXrUWY2HhNI.iKyDCLv.CLrnPBIHxbkE2W1EFa0UFNhnSBv3RMv.CLv.CKJjPBhLWYw8kcgwVckkiH5j.LtXSNv.CLvvhBIjfHyUVbeYWXrUWYw.iH5j.LtfSMv.CLvvhBIjfHyUVbeYWXrUWYwDiH5j.LtjiMv.CLvvhBIjfHyUVbeYWXrUWYwHiH5jPLrnPBIHxbkE2W1EFa0UVLyHhNI.iK4XCLv.CLrnPBIHxbkE2W1EFa0UVLzHhNI.iK3TCLv.CLrnPBIHxbkE2W1EFa0UVL0HhNI.iK1jCLv.CLrnPBIHxbkE2WvUGayUFLhnSBwvhBIjfHyUVbeAWcrMWYwHhNI.CKJjPBhLWYw8Eb0w1bkIiH5j.LrnPBIHxbkE2WvUGayU1LhnSBvvhBIjfHyUVbeAWcrMWYzHhNI.CKJjPBhLWYw8Eb0w1bkUiH5j.LrnPBIHxbkE2WvUGayUlMhnSBvvhBIjfHyUVbeAWcrMWY2HhNI.CKJjPBhLWYw8Eb0w1bkgiH5jPLrnPBIHxbkE2WvUGayUVNhnSBvvhBIjfHyUVbeAWcrMWYw.iH5j.LrnPBIHxbkE2WvUGayUVLwHhNI.CKJjPBhLWYw8Eb0w1bkEiLhnSBvvhBIjfHyUVbeAWcrMWYwLiH5j.LrnPBIHxbkE2WvUGayUVLzHhNI.CKJjPBhLWYw8Eb0w1bkESMhnSBvvhBIjfHrY1ae8lYlMWYzIhNI.CKJjPBhvlYu80alY1bkQ2W3IhNIzBLt.CMv.CLvvhBIjfHrY1ae8lYlMWYz8UdhnSBsHiKxLSMwbCMk0BL3vhBIjfHrY1aeIWXzUlH5jfLx.CKJjPBhvlYu8EakYWYrIhNI.CKJjPBhvlYu8Ub0ElazkldkIhNI.CKJjPBhvlYu80alY1bkQ2WvIhNI.CKJjPBhvlYu8kbgQWYeAmH5jPLrnPBIHBal81WrUlckw1WvIhNI.iKxPCLv.CLrnPBIHBal81WlUmaiQWZu4lH5jfHiklbiwVYhvhBIjfHt8VZyU1WvUVXqMmH5jPLrnPBIHhauk1bk80coQFcnIhNIHCKJjPBh31aoMWYeYVXrw1alYlH5j.Lt.SLv.CLvvhBIjfHt8VZyU1WuYlYyUFchnSBs.iKvDCLv.CLrnPBIHhauk1bk8kbgQWYhnSBw.CLv.CKJjPBh31aoMWYewVY1UFahnSBv3BM1.CLv.CKJjPBh31aoMWYeEVcz8lH5jPLrnPBIHhauk1bk8kYowFckImH5jPLrnPBIHhauk1bk80alY1bkQ2WvIhNIDCKJjPBh31aoMWYeIWXzU1WvIhNI.CKJjPBh31aoMWYewVY1UFaeAmH5j.LrnPBIHRYtYWLeEFczE1XqIhNI.iKzLSNv.CLrnPBIHRYtYWLeQVYiEVdhnSBx3BN1.CLv.CKJjPBhTla1EyWyU2bzEVZtIhNIDCKJjPBhTla1EyWxUFakE1bkIhNIXiK0bCLv.CLrnPBIHRYtYWLewVY1UFahnSBwvhBIjfHk4lcw7Ed1UFahnSBwvhBIjfHk4lcw7UXzQWXis1WvIhNI.CKJjPBhTla1EyWjU1Xgk2WvIhNI.CKJjPBhTla1EyWxUFakE1bk8EbhnSBvvhBIjfHk4lcx7kbkAWYgQmH5j.LrnPBIHRYtYmLeQVYrEVdhnSBvvhBIjfHk4lcx7UXzQWXislH5jPNt.SN3.CLwvhBIjfHk4lcx70b0MGcgklahnSBwvhBIjfHk4lcx7kbkwVYgMWYhnSBx3RNw.CLv.CKJjPBhTla1IyW3YWYrIhNI.CKJjPBhTla1IyW3Ula1EiH5jPLrnPBIHRYtYmLeQVYrEVdeAmH5j.LrnPBIHRYtYmLeEFczE1Xq8EbhnSBvvhBIjfHk4lcx7kbkAWYgQ2WvIhNIDCKJjPBhTla1IyWxUFakE1bk8EbhnSBvvhBIjfHmIWXt8EbuMWZzk1at8EdhnSBv3RM0.CLv.CKJjPBhblbg41Wv81boQWZu41W4IhNI.iKzDCLv.CLrnPBIHxYxElaeIWXzU1Wt8VZyUlH5j.LrnPBIHxYxElaeIWXzUlH5j.Mz.CKJjPBhblbg41WjUlaykFc4IhNIPCKJjPBhblbg41WvkFciglH5j.LrnPBIHxYxElaeAWZzMFZeUla1IhNIHiK4fCLxLiLk0BL3vhBIjfHmIWXt8Ebg4lH5jPKx3hLyTSL2PSYs.CNrnPBIHxYxElaeY1arw1a2IhNIDCKJjPBhblbg41Wy01auQGZhnSBwvhBIjfHmIWXt80cxEFbhnSBwvhBIjfHmIWXt8EbuMWZzk1at8EdeAmH5j.LtHCNv.CLvvhBIjfHmIWXt8EbuMWZzk1at8UdeAmH5jPLrnPBIHxYxElaeIWXzU1WvIhNIDCKJjPBhblbg41WjUlaykFc48EbhnSBwvhBIjfHmIWXt8EboQ2Xn8EbhnSBwvhBIjfHmIWXt8EboQ2Xn8Eao41WvIhNIHiLvvhBIjfHmIWXt8EboQ2Xn8UYtY2WvIhNIDCKJjPBhblbg41WvElaeAmH5j.LtHCLv.CLvvhBIjfHmEFck8EakYWYrIhNI.CKJjPBhbVXzU1Ws8FYkIhNIDCKJjPBhbVXzU1WjU1XgkmH5jPLrnPBIHxYgQWYewVYgslH5j.LrnPBIHxYgQWYewVY1UFaeAmH5j.LtPSNv.CLvvhBIjfHxU1beA2aykFco8lahnSBv3BM1.CLv.CKJjPBhHWYy8kXxk1YnQmakM2bhnSBvvhBIjfHxU1beAWZzMFZhnSB0TCKJjPBhHWYy8kau4Fao4lH5j.LrnPBIHhbkM2WyU2bzEVZtIhNI.CKJjPBhHWYy8Ebg4lH5jPKx3hLyTSL2PSYs.CNrnPBIHhbkM2Ws8FYkIhNIHhau4VYhvhBIjfHxU1beA2aykFco8laeAmH5j.LtTiMv.CLvvhBIjfHxU1beIlbocFZz4VYyM2WvIhNI.iK3.CLv.CLrnPBIHhbkM2WvkFcig1WvIhNIDCKJjPBhHWYy8EboQ2Xn8Eao41WvIhNI.CKJjPBhHWYy8kau4Fao41WvIhNI.iK0.CLv.CLrnPBIHhbkM2WyU2bzEVZt8EbhnSBv3hLx.CLv.CKJjPBhHWYy8Ebg41WvIhNI.iKwDCLv.CLrnPBIHhbkM2WskFdecWYzIhNI.CKJjPBhHWYy8Uaog2WjIWdhnSBwvhBIjfHh8FY48EbuMWZzk1at8EdhnSBv3BM4.CLv.CKJjPBhH1ajk2Wv81boQWZu41W4IhNI.iK0.CLv.CLrnPBIHhXuQVde41atwVZtIhNI.iKw.CLv.CLrnPBIHhXuQVdeQ2atUlH5jPLrnPBIHhXuQVdeAWZzMFZhnSBv3hLz.CLv.CKJjPBhH1ajk2WyU2bzEVZtIhNIDCKJjPBhH1ajk2WvkFcig1Ws8FYkIhNIHCKJjPBhH1ajk2Ws8FYkIhNIHhau4VYhvhBIjfHh8FY48EbuMWZzk1at8EdeAmH5j.LtTCLv.CLvvhBIjfHh8FY48EbuMWZzk1at8UdeAmH5j.LtTCLv.CLvvhBIjfHh8FY48kau4Fao41WvIhNI.CKJjPBhH1ajk2Wz8lak8EbhnSBvvhBIjfHh8FY48EboQ2Xn8EbhnSBwvhBIjfHh8FY480b0MGcgklaeAmH5j.LrnPBIHhXuQVde0VZ380ckQmH5j.LrnPBIHhXuQVde0VZ38EYxkmH5j.LtTCLv.CLvvhBIjfHuUGcvUGceQWZrQmH5j.MtPyMvLCM3TVKvfCKJjPBh7VczAWcz80Xn8lb0MmH5jPLrnPBIHxa0QGb0Q2WrkVaoQmH5jPLrnPBIHBbgQ2XnUlbe0VXzIWZ3IhNIrmBIjPBhPWdvUlH5jfHyk1YtEFahvhBIjPBhbWZjQGZhnSBwbCKJjPBIHBZkk1YnQmH5j.MzvhBIjPBhPVYvQGZhnSBwvhBIjPBhPVXzElH5jvVvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvzkBIjPernPBIHxZkk2WyMVXrUlH5jfHwHSKkEWcgwlHrnPBIHxZkk2Ws8FYe0Fbk8EdhnSB2LCKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHxbkE2WxEFck8Ub0ElazkldkIhNI.CKJjPBh.mbkMWYzIhNIHxRgklcuAxZkk2buXFag41YkAxbzIWZtclHrnPBIHxbg0FbrU1WtEVakIhNIHxSyMVZrwVXz8lby8RXtEFaucFHyE1ctbWX1IBKJjPBhzVXqUlbe4VXsUlH5jfHMEFYx8lagABSgI1bhvhBIjfHgAGbe4VXsUlH5jfHKEVZ18lHrnPBIHRXvA2W1Ulbyk1atIhNIXyM3PSMJjPernPBhTla1klbu4Vak4FchnSB6oPBIHBbx8FcuM1arIhNIDCKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHRYjkFcuI2Wg4VZsIhNIDCKJjPBhTFYoQ2ax8kXuUmajMmH5jvdJjPBIHBc4AWYhnSBhLWZm4VXrIBKJjPBIHxcoQFcnIhNIPCKJjPBIHBZkk1YnQmH5jPLrnPBIjfHjUFbzglH5jPLrnPBIjfHjEFcgIhNIrELr.BLr.RL3bSMr.RLvDiMcoPBIzGKJjPBhTFYoQ2ax8ka00lH5jPLrnPBIHxayM1Wk4VXhwVYjIhNI.CKJjPBh71bi8EbuIGce8lYlMWYzIhNI.CKJjPBhzVXqUlbe4VXsUlH5jfHMEFYx8lagABSgI1bhvhBIjfHgAGbe4VXsUlH5jfHKEVZ18VQjkFcuImHrnPBIHRXvA2W1Ulbyk1atIhNIXyM3PSMJjPeJzG"
                                }
                            }
                        ]
                    },
                    "text": "autopattr",
                    "varname": "linn_autopattr"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 14.0, 132.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 420.0, 180.0, 100.0, 22.0 ],
                    "text": "linn.retune",
                    "varname": "linn_retune"
                }
            },
            {
                "box": {
                    "autopopulate": 1,
                    "id": "obj-14",
                    "items": [ "22edo.scl", ",", "31-edo.scl", ",", "ji_11.scl", ",", "ji_13.scl", ",", "ji_17.scl", ",", "ji_7.scl", ",", "ji_7a.scl", ",", "ji_8coh.scl", ",", "ji_9.scl", ",", "ji_9coh.scl" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 114.0, 62.0, 100.0, 22.0 ],
                    "pattrmode": 1,
                    "prefix": "~/Dropbox/musicstuff/Max 9/linnstrument/SCL/",
                    "presentation": 1,
                    "presentation_rect": [ 520.0, 110.0, 100.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "22edo.scl", "31-edo.scl", "ji_11.scl", "ji_13.scl", "ji_17.scl", "ji_7.scl", "ji_7a.scl", "ji_8coh.scl", "ji_9.scl", "ji_9coh.scl" ],
                            "parameter_longname": "linn_scale",
                            "parameter_mmax": 9,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_scale",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_scale"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 14.0, 278.0, 104.0, 22.0 ],
                    "saved_object_attributes": {
                        "alias": "",
                        "group": ""
                    },
                    "text": "maxmcp research"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 289.0, 104.0, 31.0, 22.0 ],
                    "text": "plug"
                }
            },
            {
                "box": {
                    "autosave": 1,
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 8,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "signal", "signal", "", "list", "int", "", "", "" ],
                    "patching_rect": [ 248.0, 188.0, 93.0, 22.0 ],
                    "save": [ "#N", "vst~", "loaduniqueid", 0, ";" ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "vst~",
                            "parameter_modmode": 0,
                            "parameter_shortname": "vst~",
                            "parameter_type": 3
                        }
                    },
                    "saved_object_attributes": {
                        "parameter_enable": 1,
                        "parameter_mappable": 0
                    },
                    "snapshot": {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "snapshotlist",
                        "origin": "vst~",
                        "type": "list",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                            "pluginname": "Kaivo.vstinfo",
                            "plugindisplayname": "Kaivo",
                            "pluginsavedname": "",
                            "pluginsaveduniqueid": 1264675190,
                            "version": 1,
                            "isbank": 0,
                            "isbase64": 1,
                            "blob": "10448.CMlaKA....fQPMDZ....ArTXoYG...vv....A........................................fBk6oPBh.WXzMFZhnSB6oPBIHxZkk2W18VZiU1bhnSBzvhBIjfHqUVde01ajIhNIHCKJjPBhrVY48kXk4FYhnSBvvhBIjfHqUVdeUmaoM2atIhNI.CKJjPBhrVY480YrkFYkIhNI.CKJjPBhLWYw8EauMVXrIhNIDCKJjPBhLWYw8EZuMGchnSBvvhBIjfHyUVbew1auAmH5jPLrnPBIHxbkE2WzIWZmIhNIDCKJjPBhLWYw8kbgQWYhnSBv3hL1XCLv.CKJjPBhLWYw8kbgQWZuIhNIDCKJjPBhLWYw8kbgQWYeAmH5j.LrnPBIHxbkE2WyQWYvMmH5jPL1vhBIjfHyUVbeMGckA2beAmH5j.LrnPBIHxbkE2WuYlYyUFchnSBvvhBIjfHyUVbe8lYlMWYz8EbhnSBvvhBIjfHyUVbeIWXtcVYhnSBwHCKJjPBhLWYw8Ub0ElazkldkIhNI.CKJjPBhLWYw80YrkFYkIhNIDCKJjPBhLWYw8Eb2IhNIXiLrnPBIHxbkE2W1EFa0U1WjUFagkmH5j.NrnPBIHxbkE2WvUGayU1WjUFagkmH5j.LrnPBIHxbkE2W1EFa0UFLhnSBv3RMv.CLv.CKJjPBhLWYw8kcgwVckEiH5j.LtLSLv.CLvvhBIjfHyUVbeYWXrUWYxHhNI.iKwTCLv.CLrnPBIHxbkE2W1EFa0U1LhnSBv3BLz.CLv.CKJjPBhLWYw8kcgwVckQiH5j.LrnPBIHxbkE2W1EFa0UVMhnSBv3BLz.CLv.CKJjPBhLWYw8kcgwVckYiH5j.LtDSMv.CLvvhBIjfHyUVbeYWXrUWY2HhNI.iKyDCLv.CLrnPBIHxbkE2W1EFa0UFNhnSBv3RMv.CLv.CKJjPBhLWYw8kcgwVckkiH5j.LtXSNv.CLvvhBIjfHyUVbeYWXrUWYw.iH5j.LtfSMv.CLvvhBIjfHyUVbeYWXrUWYwDiH5j.LtjiMv.CLvvhBIjfHyUVbeYWXrUWYwHiH5jPLrnPBIHxbkE2W1EFa0UVLyHhNI.iK4XCLv.CLrnPBIHxbkE2W1EFa0UVLzHhNI.iK3TCLv.CLrnPBIHxbkE2W1EFa0UVL0HhNI.iK1jCLv.CLrnPBIHxbkE2WvUGayUFLhnSBwvhBIjfHyUVbeAWcrMWYwHhNI.CKJjPBhLWYw8Eb0w1bkIiH5j.LrnPBIHxbkE2WvUGayU1LhnSBvvhBIjfHyUVbeAWcrMWYzHhNI.CKJjPBhLWYw8Eb0w1bkUiH5j.LrnPBIHxbkE2WvUGayUlMhnSBvvhBIjfHyUVbeAWcrMWY2HhNI.CKJjPBhLWYw8Eb0w1bkgiH5jPLrnPBIHxbkE2WvUGayUVNhnSBvvhBIjfHyUVbeAWcrMWYw.iH5j.LrnPBIHxbkE2WvUGayUVLwHhNI.CKJjPBhLWYw8Eb0w1bkEiLhnSBvvhBIjfHyUVbeAWcrMWYwLiH5j.LrnPBIHxbkE2WvUGayUVLzHhNI.CKJjPBhLWYw8Eb0w1bkESMhnSBvvhBIjfHrY1ae8lYlMWYzIhNI.CKJjPBhvlYu80alY1bkQ2W3IhNIzBLt.CMv.CLvvhBIjfHrY1ae8lYlMWYz8UdhnSBsHiKxLSMwbCMk0BL3vhBIjfHrY1aeIWXzUlH5jfLx.CKJjPBhvlYu8EakYWYrIhNI.CKJjPBhvlYu8Ub0ElazkldkIhNI.CKJjPBhvlYu80alY1bkQ2WvIhNI.CKJjPBhvlYu8kbgQWYeAmH5jPLrnPBIHBal81WrUlckw1WvIhNI.iKxPCLv.CLrnPBIHBal81WlUmaiQWZu4lH5jfHiklbiwVYhvhBIjfHt8VZyU1WvUVXqMmH5jPLrnPBIHhauk1bk80coQFcnIhNIHCKJjPBh31aoMWYeYVXrw1alYlH5j.Lt.SLv.CLvvhBIjfHt8VZyU1WuYlYyUFchnSBs.iKvDCLv.CLrnPBIHhauk1bk8kbgQWYhnSBw.CLv.CKJjPBh31aoMWYewVY1UFahnSBv3BM1.CLv.CKJjPBh31aoMWYeEVcz8lH5jPLrnPBIHhauk1bk8kYowFckImH5jPLrnPBIHhauk1bk80alY1bkQ2WvIhNIDCKJjPBh31aoMWYeIWXzU1WvIhNI.CKJjPBh31aoMWYewVY1UFaeAmH5j.LrnPBIHRYtYWLeEFczE1XqIhNI.iKzLSNv.CLrnPBIHRYtYWLeQVYiEVdhnSBx3BN1.CLv.CKJjPBhTla1EyWyU2bzEVZtIhNIDCKJjPBhTla1EyWxUFakE1bkIhNIXiK0bCLv.CLrnPBIHRYtYWLewVY1UFahnSBwvhBIjfHk4lcw7Ed1UFahnSBwvhBIjfHk4lcw7UXzQWXis1WvIhNI.CKJjPBhTla1EyWjU1Xgk2WvIhNI.CKJjPBhTla1EyWxUFakE1bk8EbhnSBvvhBIjfHk4lcx7kbkAWYgQmH5j.LrnPBIHRYtYmLeQVYrEVdhnSBvvhBIjfHk4lcx7UXzQWXislH5jPNt.SN3.CLwvhBIjfHk4lcx70b0MGcgklahnSBwvhBIjfHk4lcx7kbkwVYgMWYhnSBx3RNw.CLv.CKJjPBhTla1IyW3YWYrIhNI.CKJjPBhTla1IyW3Ula1EiH5jPLrnPBIHRYtYmLeQVYrEVdeAmH5j.LrnPBIHRYtYmLeEFczE1Xq8EbhnSBvvhBIjfHk4lcx7kbkAWYgQ2WvIhNIDCKJjPBhTla1IyWxUFakE1bk8EbhnSBvvhBIjfHmIWXt8EbuMWZzk1at8EdhnSBv3RM0.CLv.CKJjPBhblbg41Wv81boQWZu41W4IhNI.iKzDCLv.CLrnPBIHxYxElaeIWXzU1Wt8VZyUlH5j.LrnPBIHxYxElaeIWXzUlH5j.Mz.CKJjPBhblbg41WjUlaykFc4IhNIPCKJjPBhblbg41WvkFciglH5j.LrnPBIHxYxElaeAWZzMFZeUla1IhNIHiK4fCLxLiLk0BL3vhBIjfHmIWXt8Ebg4lH5jPKx3hLyTSL2PSYs.CNrnPBIHxYxElaeY1arw1a2IhNIDCKJjPBhblbg41Wy01auQGZhnSBwvhBIjfHmIWXt80cxEFbhnSBwvhBIjfHmIWXt8EbuMWZzk1at8EdeAmH5j.LtHCNv.CLvvhBIjfHmIWXt8EbuMWZzk1at8UdeAmH5jPLrnPBIHxYxElaeIWXzU1WvIhNIDCKJjPBhblbg41WjUlaykFc48EbhnSBwvhBIjfHmIWXt8EboQ2Xn8EbhnSBwvhBIjfHmIWXt8EboQ2Xn8Eao41WvIhNIHiLvvhBIjfHmIWXt8EboQ2Xn8UYtY2WvIhNIDCKJjPBhblbg41WvElaeAmH5j.LtHCLv.CLvvhBIjfHmEFck8EakYWYrIhNI.CKJjPBhbVXzU1Ws8FYkIhNIDCKJjPBhbVXzU1WjU1XgkmH5jPLrnPBIHxYgQWYewVYgslH5j.LrnPBIHxYgQWYewVY1UFaeAmH5j.LtPSNv.CLvvhBIjfHxU1beA2aykFco8lahnSBv3BM1.CLv.CKJjPBhHWYy8kXxk1YnQmakM2bhnSBvvhBIjfHxU1beAWZzMFZhnSB0TCKJjPBhHWYy8kau4Fao4lH5j.LrnPBIHhbkM2WyU2bzEVZtIhNI.CKJjPBhHWYy8Ebg4lH5jPKx3hLyTSL2PSYs.CNrnPBIHhbkM2Ws8FYkIhNIHhau4VYhvhBIjfHxU1beA2aykFco8laeAmH5j.LtTiMv.CLvvhBIjfHxU1beIlbocFZz4VYyM2WvIhNI.iK3.CLv.CLrnPBIHhbkM2WvkFcig1WvIhNIDCKJjPBhHWYy8EboQ2Xn8Eao41WvIhNI.CKJjPBhHWYy8kau4Fao41WvIhNI.iK0.CLv.CLrnPBIHhbkM2WyU2bzEVZt8EbhnSBv3hLx.CLv.CKJjPBhHWYy8Ebg41WvIhNI.iKwDCLv.CLrnPBIHhbkM2WskFdecWYzIhNI.CKJjPBhHWYy8Uaog2WjIWdhnSBwvhBIjfHh8FY48EbuMWZzk1at8EdhnSBv3BM4.CLv.CKJjPBhH1ajk2Wv81boQWZu41W4IhNI.iK0.CLv.CLrnPBIHhXuQVde41atwVZtIhNI.iKw.CLv.CLrnPBIHhXuQVdeQ2atUlH5jPLrnPBIHhXuQVdeAWZzMFZhnSBv3hLz.CLv.CKJjPBhH1ajk2WyU2bzEVZtIhNIDCKJjPBhH1ajk2WvkFcig1Ws8FYkIhNIHCKJjPBhH1ajk2Ws8FYkIhNIHhau4VYhvhBIjfHh8FY48EbuMWZzk1at8EdeAmH5j.LtTCLv.CLvvhBIjfHh8FY48EbuMWZzk1at8UdeAmH5j.LtTCLv.CLvvhBIjfHh8FY48kau4Fao41WvIhNI.CKJjPBhH1ajk2Wz8lak8EbhnSBvvhBIjfHh8FY48EboQ2Xn8EbhnSBwvhBIjfHh8FY480b0MGcgklaeAmH5j.LrnPBIHhXuQVde0VZ380ckQmH5j.LrnPBIHhXuQVde0VZ38EYxkmH5j.LtTCLv.CLvvhBIjfHuUGcvUGceQWZrQmH5j.MtPyMvLCM3TVKvfCKJjPBh7VczAWcz80Xn8lb0MmH5jPLrnPBIHxa0QGb0Q2WrkVaoQmH5jPLrnPBIHBbgQ2XnUlbe0VXzIWZ3IhNIrmBIjPBhPWdvUlH5jfHyk1YtEFahvhBIjPBhbWZjQGZhnSBwbCKJjPBIHBZkk1YnQmH5j.MzvhBIjPBhPVYvQGZhnSBwvhBIjPBhPVXzElH5jvVvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvzkBIjPernPBIHxZkk2WyMVXrUlH5jfHwHSKkEWcgwlHrnPBIHxZkk2Ws8FYe0Fbk8EdhnSB2LCKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHxbkE2WxEFck8Ub0ElazkldkIhNI.CKJjPBh.mbkMWYzIhNIHxRgklcuAxZkk2buXFag41YkAxbzIWZtclHrnPBIHxbg0FbrU1WtEVakIhNIHxSyMVZrwVXz8lby8RXtEFaucFHyE1ctbWX1IBKJjPBhzVXqUlbe4VXsUlH5jfHMEFYx8lagABSgI1bhvhBIjfHgAGbe4VXsUlH5jfHKEVZ18lHrnPBIHRXvA2W1Ulbyk1atIhNIXyM3PSMJjPernPBhTla1klbu4Vak4FchnSB6oPBIHBbx8FcuM1arIhNIDCKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHRYjkFcuI2Wg4VZsIhNIDCKJjPBhTFYoQ2ax8kXuUmajMmH5jvdJjPBIHBc4AWYhnSBhLWZm4VXrIBKJjPBIHxcoQFcnIhNIPCKJjPBIHBZkk1YnQmH5jPLrnPBIjfHjUFbzglH5jPLrnPBIjfHjEFcgIhNIrELr.BLr.RL3bSMr.RLvDiMcoPBIzGKJjPBhTFYoQ2ax8ka00lH5jPLrnPBIHxayM1Wk4VXhwVYjIhNI.CKJjPBh71bi8EbuIGce8lYlMWYzIhNI.CKJjPBhzVXqUlbe4VXsUlH5jfHMEFYx8lagABSgI1bhvhBIjfHgAGbe4VXsUlH5jfHKEVZ18VQjkFcuImHrnPBIHRXvA2W1Ulbyk1atIhNIXyM3PSMJjPeJzG"
                        },
                        "snapshotlist": {
                            "current_snapshot": 0,
                            "entries": [
                                {
                                    "filetype": "C74Snapshot",
                                    "version": 2,
                                    "minorversion": 0,
                                    "name": "Kaivo",
                                    "origin": "Kaivo.vstinfo",
                                    "type": "VST",
                                    "subtype": "Instrument",
                                    "embed": 0,
                                    "snapshot": {
                                        "pluginname": "Kaivo.vstinfo",
                                        "plugindisplayname": "Kaivo",
                                        "pluginsavedname": "",
                                        "pluginsaveduniqueid": 1264675190,
                                        "version": 1,
                                        "isbank": 0,
                                        "isbase64": 1,
                                        "blob": "10448.CMlaKA....fQPMDZ....ArTXoYG...vv....A........................................fBk6oPBh.WXzMFZhnSB6oPBIHxZkk2W18VZiU1bhnSBzvhBIjfHqUVde01ajIhNIHCKJjPBhrVY48kXk4FYhnSBvvhBIjfHqUVdeUmaoM2atIhNI.CKJjPBhrVY480YrkFYkIhNI.CKJjPBhLWYw8EauMVXrIhNIDCKJjPBhLWYw8EZuMGchnSBvvhBIjfHyUVbew1auAmH5jPLrnPBIHxbkE2WzIWZmIhNIDCKJjPBhLWYw8kbgQWYhnSBv3hL1XCLv.CKJjPBhLWYw8kbgQWZuIhNIDCKJjPBhLWYw8kbgQWYeAmH5j.LrnPBIHxbkE2WyQWYvMmH5jPL1vhBIjfHyUVbeMGckA2beAmH5j.LrnPBIHxbkE2WuYlYyUFchnSBvvhBIjfHyUVbe8lYlMWYz8EbhnSBvvhBIjfHyUVbeIWXtcVYhnSBwHCKJjPBhLWYw8Ub0ElazkldkIhNI.CKJjPBhLWYw80YrkFYkIhNIDCKJjPBhLWYw8Eb2IhNIXiLrnPBIHxbkE2W1EFa0U1WjUFagkmH5j.NrnPBIHxbkE2WvUGayU1WjUFagkmH5j.LrnPBIHxbkE2W1EFa0UFLhnSBv3RMv.CLv.CKJjPBhLWYw8kcgwVckEiH5j.LtLSLv.CLvvhBIjfHyUVbeYWXrUWYxHhNI.iKwTCLv.CLrnPBIHxbkE2W1EFa0U1LhnSBv3BLz.CLv.CKJjPBhLWYw8kcgwVckQiH5j.LrnPBIHxbkE2W1EFa0UVMhnSBv3BLz.CLv.CKJjPBhLWYw8kcgwVckYiH5j.LtDSMv.CLvvhBIjfHyUVbeYWXrUWY2HhNI.iKyDCLv.CLrnPBIHxbkE2W1EFa0UFNhnSBv3RMv.CLv.CKJjPBhLWYw8kcgwVckkiH5j.LtXSNv.CLvvhBIjfHyUVbeYWXrUWYw.iH5j.LtfSMv.CLvvhBIjfHyUVbeYWXrUWYwDiH5j.LtjiMv.CLvvhBIjfHyUVbeYWXrUWYwHiH5jPLrnPBIHxbkE2W1EFa0UVLyHhNI.iK4XCLv.CLrnPBIHxbkE2W1EFa0UVLzHhNI.iK3TCLv.CLrnPBIHxbkE2W1EFa0UVL0HhNI.iK1jCLv.CLrnPBIHxbkE2WvUGayUFLhnSBwvhBIjfHyUVbeAWcrMWYwHhNI.CKJjPBhLWYw8Eb0w1bkIiH5j.LrnPBIHxbkE2WvUGayU1LhnSBvvhBIjfHyUVbeAWcrMWYzHhNI.CKJjPBhLWYw8Eb0w1bkUiH5j.LrnPBIHxbkE2WvUGayUlMhnSBvvhBIjfHyUVbeAWcrMWY2HhNI.CKJjPBhLWYw8Eb0w1bkgiH5jPLrnPBIHxbkE2WvUGayUVNhnSBvvhBIjfHyUVbeAWcrMWYw.iH5j.LrnPBIHxbkE2WvUGayUVLwHhNI.CKJjPBhLWYw8Eb0w1bkEiLhnSBvvhBIjfHyUVbeAWcrMWYwLiH5j.LrnPBIHxbkE2WvUGayUVLzHhNI.CKJjPBhLWYw8Eb0w1bkESMhnSBvvhBIjfHrY1ae8lYlMWYzIhNI.CKJjPBhvlYu80alY1bkQ2W3IhNIzBLt.CMv.CLvvhBIjfHrY1ae8lYlMWYz8UdhnSBsHiKxLSMwbCMk0BL3vhBIjfHrY1aeIWXzUlH5jfLx.CKJjPBhvlYu8EakYWYrIhNI.CKJjPBhvlYu8Ub0ElazkldkIhNI.CKJjPBhvlYu80alY1bkQ2WvIhNI.CKJjPBhvlYu8kbgQWYeAmH5jPLrnPBIHBal81WrUlckw1WvIhNI.iKxPCLv.CLrnPBIHBal81WlUmaiQWZu4lH5jfHiklbiwVYhvhBIjfHt8VZyU1WvUVXqMmH5jPLrnPBIHhauk1bk80coQFcnIhNIHCKJjPBh31aoMWYeYVXrw1alYlH5j.Lt.SLv.CLvvhBIjfHt8VZyU1WuYlYyUFchnSBs.iKvDCLv.CLrnPBIHhauk1bk8kbgQWYhnSBw.CLv.CKJjPBh31aoMWYewVY1UFahnSBv3BM1.CLv.CKJjPBh31aoMWYeEVcz8lH5jPLrnPBIHhauk1bk8kYowFckImH5jPLrnPBIHhauk1bk80alY1bkQ2WvIhNIDCKJjPBh31aoMWYeIWXzU1WvIhNI.CKJjPBh31aoMWYewVY1UFaeAmH5j.LrnPBIHRYtYWLeEFczE1XqIhNI.iKzLSNv.CLrnPBIHRYtYWLeQVYiEVdhnSBx3BN1.CLv.CKJjPBhTla1EyWyU2bzEVZtIhNIDCKJjPBhTla1EyWxUFakE1bkIhNIXiK0bCLv.CLrnPBIHRYtYWLewVY1UFahnSBwvhBIjfHk4lcw7Ed1UFahnSBwvhBIjfHk4lcw7UXzQWXis1WvIhNI.CKJjPBhTla1EyWjU1Xgk2WvIhNI.CKJjPBhTla1EyWxUFakE1bk8EbhnSBvvhBIjfHk4lcx7kbkAWYgQmH5j.LrnPBIHRYtYmLeQVYrEVdhnSBvvhBIjfHk4lcx7UXzQWXislH5jPNt.SN3.CLwvhBIjfHk4lcx70b0MGcgklahnSBwvhBIjfHk4lcx7kbkwVYgMWYhnSBx3RNw.CLv.CKJjPBhTla1IyW3YWYrIhNI.CKJjPBhTla1IyW3Ula1EiH5jPLrnPBIHRYtYmLeQVYrEVdeAmH5j.LrnPBIHRYtYmLeEFczE1Xq8EbhnSBvvhBIjfHk4lcx7kbkAWYgQ2WvIhNIDCKJjPBhTla1IyWxUFakE1bk8EbhnSBvvhBIjfHmIWXt8EbuMWZzk1at8EdhnSBv3RM0.CLv.CKJjPBhblbg41Wv81boQWZu41W4IhNI.iKzDCLv.CLrnPBIHxYxElaeIWXzU1Wt8VZyUlH5j.LrnPBIHxYxElaeIWXzUlH5j.Mz.CKJjPBhblbg41WjUlaykFc4IhNIPCKJjPBhblbg41WvkFciglH5j.LrnPBIHxYxElaeAWZzMFZeUla1IhNIHiK4fCLxLiLk0BL3vhBIjfHmIWXt8Ebg4lH5jPKx3hLyTSL2PSYs.CNrnPBIHxYxElaeY1arw1a2IhNIDCKJjPBhblbg41Wy01auQGZhnSBwvhBIjfHmIWXt80cxEFbhnSBwvhBIjfHmIWXt8EbuMWZzk1at8EdeAmH5j.LtHCNv.CLvvhBIjfHmIWXt8EbuMWZzk1at8UdeAmH5jPLrnPBIHxYxElaeIWXzU1WvIhNIDCKJjPBhblbg41WjUlaykFc48EbhnSBwvhBIjfHmIWXt8EboQ2Xn8EbhnSBwvhBIjfHmIWXt8EboQ2Xn8Eao41WvIhNIHiLvvhBIjfHmIWXt8EboQ2Xn8UYtY2WvIhNIDCKJjPBhblbg41WvElaeAmH5j.LtHCLv.CLvvhBIjfHmEFck8EakYWYrIhNI.CKJjPBhbVXzU1Ws8FYkIhNIDCKJjPBhbVXzU1WjU1XgkmH5jPLrnPBIHxYgQWYewVYgslH5j.LrnPBIHxYgQWYewVY1UFaeAmH5j.LtPSNv.CLvvhBIjfHxU1beA2aykFco8lahnSBv3BM1.CLv.CKJjPBhHWYy8kXxk1YnQmakM2bhnSBvvhBIjfHxU1beAWZzMFZhnSB0TCKJjPBhHWYy8kau4Fao4lH5j.LrnPBIHhbkM2WyU2bzEVZtIhNI.CKJjPBhHWYy8Ebg4lH5jPKx3hLyTSL2PSYs.CNrnPBIHhbkM2Ws8FYkIhNIHhau4VYhvhBIjfHxU1beA2aykFco8laeAmH5j.LtTiMv.CLvvhBIjfHxU1beIlbocFZz4VYyM2WvIhNI.iK3.CLv.CLrnPBIHhbkM2WvkFcig1WvIhNIDCKJjPBhHWYy8EboQ2Xn8Eao41WvIhNI.CKJjPBhHWYy8kau4Fao41WvIhNI.iK0.CLv.CLrnPBIHhbkM2WyU2bzEVZt8EbhnSBv3hLx.CLv.CKJjPBhHWYy8Ebg41WvIhNI.iKwDCLv.CLrnPBIHhbkM2WskFdecWYzIhNI.CKJjPBhHWYy8Uaog2WjIWdhnSBwvhBIjfHh8FY48EbuMWZzk1at8EdhnSBv3BM4.CLv.CKJjPBhH1ajk2Wv81boQWZu41W4IhNI.iK0.CLv.CLrnPBIHhXuQVde41atwVZtIhNI.iKw.CLv.CLrnPBIHhXuQVdeQ2atUlH5jPLrnPBIHhXuQVdeAWZzMFZhnSBv3hLz.CLv.CKJjPBhH1ajk2WyU2bzEVZtIhNIDCKJjPBhH1ajk2WvkFcig1Ws8FYkIhNIHCKJjPBhH1ajk2Ws8FYkIhNIHhau4VYhvhBIjfHh8FY48EbuMWZzk1at8EdeAmH5j.LtTCLv.CLvvhBIjfHh8FY48EbuMWZzk1at8UdeAmH5j.LtTCLv.CLvvhBIjfHh8FY48kau4Fao41WvIhNI.CKJjPBhH1ajk2Wz8lak8EbhnSBvvhBIjfHh8FY48EboQ2Xn8EbhnSBwvhBIjfHh8FY480b0MGcgklaeAmH5j.LrnPBIHhXuQVde0VZ380ckQmH5j.LrnPBIHhXuQVde0VZ38EYxkmH5j.LtTCLv.CLvvhBIjfHuUGcvUGceQWZrQmH5j.MtPyMvLCM3TVKvfCKJjPBh7VczAWcz80Xn8lb0MmH5jPLrnPBIHxa0QGb0Q2WrkVaoQmH5jPLrnPBIHBbgQ2XnUlbe0VXzIWZ3IhNIrmBIjPBhPWdvUlH5jfHyk1YtEFahvhBIjPBhbWZjQGZhnSBwbCKJjPBIHBZkk1YnQmH5j.MzvhBIjPBhPVYvQGZhnSBwvhBIjPBhPVXzElH5jvVvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvzkBIjPernPBIHxZkk2WyMVXrUlH5jfHwHSKkEWcgwlHrnPBIHxZkk2Ws8FYe0Fbk8EdhnSB2LCKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHxbkE2WxEFck8Ub0ElazkldkIhNI.CKJjPBh.mbkMWYzIhNIHxRgklcuAxZkk2buXFag41YkAxbzIWZtclHrnPBIHxbg0FbrU1WtEVakIhNIHxSyMVZrwVXz8lby8RXtEFaucFHyE1ctbWX1IBKJjPBhzVXqUlbe4VXsUlH5jfHMEFYx8lagABSgI1bhvhBIjfHgAGbe4VXsUlH5jfHKEVZ18lHrnPBIHRXvA2W1Ulbyk1atIhNIXyM3PSMJjPernPBhTla1klbu4Vak4FchnSB6oPBIHBbx8FcuM1arIhNIDCKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHRYjkFcuI2Wg4VZsIhNIDCKJjPBhTFYoQ2ax8kXuUmajMmH5jvdJjPBIHBc4AWYhnSBhLWZm4VXrIBKJjPBIHxcoQFcnIhNIPCKJjPBIHBZkk1YnQmH5jPLrnPBIjfHjUFbzglH5jPLrnPBIjfHjEFcgIhNIrELr.BLr.RL3bSMr.RLvDiMcoPBIzGKJjPBhTFYoQ2ax8ka00lH5jPLrnPBIHxayM1Wk4VXhwVYjIhNI.CKJjPBh71bi8EbuIGce8lYlMWYzIhNI.CKJjPBhzVXqUlbe4VXsUlH5jfHMEFYx8lagABSgI1bhvhBIjfHgAGbe4VXsUlH5jfHKEVZ18VQjkFcuImHrnPBIHRXvA2W1Ulbyk1atIhNIXyM3PSMJjPeJzG"
                                    },
                                    "fileref": {
                                        "name": "Kaivo",
                                        "filename": "Kaivo_20260912.maxsnap",
                                        "filepath": "~/Dropbox/musicstuff/Max 9/Snapshots",
                                        "filepos": -1,
                                        "snapshotfileid": "93e24734f635b5134e03af9f07ed7fb6"
                                    }
                                }
                            ]
                        }
                    },
                    "text": "vst~",
                    "varname": "vst~",
                    "viewvisibility": 0
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 380.0, 334.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 14.0, 22.0, 152.0, 22.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 420.0, 70.0, 143.0, 35.0 ],
                    "text": "midiin \"LinnStrument MIDI\"",
                    "varname": "linn_midiin"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "gradient": 1,
                    "id": "obj-36",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 474.0, 112.0, 35.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 880.0, 160.0, 50.0, 22.0 ],
                    "text": "send",
                    "varname": "linn_lsend"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "gradient": 1,
                    "id": "obj-38",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 521.0, 91.0, 63.0, 22.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 930.0, 160.0, 50.0, 35.0 ],
                    "text": "sendlights",
                    "varname": "linn_lsendlights"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "gradient": 1,
                    "id": "obj-40",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 609.0, 112.0, 47.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1015.0, 160.0, 50.0, 22.0 ],
                    "text": "backup",
                    "varname": "linn_lbackup"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "gradient": 1,
                    "id": "obj-42",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 674.0, 112.0, 46.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1080.0, 160.0, 50.0, 22.0 ],
                    "text": "restore",
                    "varname": "linn_lrestore"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "gradient": 1,
                    "id": "obj-48",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 734.0, 112.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1140.0, 160.0, 50.0, 22.0 ],
                    "text": "status",
                    "varname": "linn_lstatus"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "gradient": 1,
                    "id": "obj-50",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 794.0, 112.0, 35.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1200.0, 160.0, 50.0, 22.0 ],
                    "text": "reset",
                    "varname": "linn_lreset"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-68",
                    "linecount": 3,
                    "maxclass": "newobj",
                    "numinlets": 9,
                    "numoutlets": 9,
                    "outlettype": [ "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 474.0, 232.0, 144.0, 49.0 ],
                    "presentation": 1,
                    "presentation_linecount": 3,
                    "presentation_rect": [ 880.0, 280.0, 144.0, 49.0 ],
                    "text": "route scheme offset bend limit root refhz offsetinfo tuning",
                    "varname": "linn_lroute"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 1 ],
                    "order": 1,
                    "source": [ "obj-14", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 1 ],
                    "order": 0,
                    "source": [ "obj-14", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-5", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-68", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-68", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-68", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-68", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "source": [ "obj-68", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "source": [ "obj-68", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-68", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "source": [ "obj-68", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "source": [ "obj-69", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-14": [ "linn_scale", "linn_scale", 0 ],
            "obj-2": [ "vst~", "vst~", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}