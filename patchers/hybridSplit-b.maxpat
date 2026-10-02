{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 2,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 34.0, 92.0, 1878.0, 1170.0 ],
        "openinpresentation": 1,
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-119",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1620.0, 1780.0, 100.0, 22.0 ],
                    "text": "prepend shift",
                    "varname": "linnsplit_rshift_r"
                }
            },
            {
                "box": {
                    "id": "obj-117",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1620.0, 380.0, 100.0, 22.0 ],
                    "text": "prepend shift",
                    "varname": "linnsplit_rshift_l"
                }
            },
            {
                "box": {
                    "id": "obj-115",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1620.0, 1750.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linnsplit_setshift_r"
                }
            },
            {
                "box": {
                    "id": "obj-114",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1620.0, 350.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linnsplit_setshift_l"
                }
            },
            {
                "box": {
                    "id": "obj-113",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1348.0, 1590.0, 100.0, 22.0 ],
                    "text": "prepend shift r",
                    "varname": "linnsplit_pshift_r"
                }
            },
            {
                "box": {
                    "id": "obj-112",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1348.0, 184.0, 100.0, 22.0 ],
                    "text": "prepend shift l",
                    "varname": "linnsplit_pshift_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-111",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1240.0, 1548.0, 184.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 139.0, 608.0, 55.0, 24.0 ],
                    "text": "shift",
                    "varname": "cmt_shift_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-105",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1240.0, 148.0, 184.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 309.0, 303.0, 55.0, 24.0 ],
                    "text": "shift",
                    "varname": "cmt_shift_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-96",
                    "maxclass": "number",
                    "maximum": 60,
                    "minimum": -60,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1282.0, 1578.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 194.0, 607.0, 44.0, 26.0 ],
                    "varname": "linnsplit_shift_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-64",
                    "maxclass": "number",
                    "maximum": 60,
                    "minimum": -60,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1282.0, 178.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 364.0, 302.0, 44.0, 26.0 ],
                    "varname": "linnsplit_shift_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-108",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1202.0, 1518.0, 184.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 568.0, 612.0, 70.0, 24.0 ],
                    "text": "colours",
                    "textcolor": [ 1.0, 0.5647058823529412, 0.5647058823529412, 1.0 ],
                    "varname": "cmt_palette_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-106",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1202.0, 118.0, 184.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 771.0, 307.0, 70.0, 24.0 ],
                    "text": "colours",
                    "textcolor": [ 1.0, 0.5647058823529412, 0.5647058823529412, 1.0 ],
                    "varname": "cmt_palette_l"
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1514.0, 1750.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linnsplit_setpalette_r"
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1514.0, 350.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linnsplit_setpalette_l"
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1160.0, 1614.0, 100.0, 22.0 ],
                    "text": "prepend palette r",
                    "varname": "linnsplit_ppalette_r"
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1160.0, 214.0, 100.0, 22.0 ],
                    "text": "prepend palette l",
                    "varname": "linnsplit_ppalette_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-66",
                    "maxclass": "number",
                    "maximum": 8,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1214.0, 1578.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 632.0, 611.0, 36.0, 26.0 ],
                    "textcolor": [ 1.0, 0.5647058823529412, 0.5647058823529412, 1.0 ],
                    "varname": "linnsplit_palette_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-63",
                    "maxclass": "number",
                    "maximum": 8,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1214.0, 178.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 834.0, 306.0, 36.0, 26.0 ],
                    "textcolor": [ 1.0, 0.5647058823529412, 0.5647058823529412, 1.0 ],
                    "varname": "linnsplit_palette_l"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1338.0, 245.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linnsplit_setsplitcol"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1230.0, 246.0, 100.0, 22.0 ],
                    "text": "route splitcol",
                    "varname": "linnsplit_colroute"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 340.0, 58.0, 110.0, 22.0 ],
                    "text": "prepend midisetup",
                    "varname": "linn_pmidisetup"
                }
            },
            {
                "box": {
                    "id": "obj-92",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 410.0, 90.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 321.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "linn_lmidisetup",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lmidisetup",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_lmidisetup"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-70",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 460.0, 64.0, 98.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 35.0, 321.0, 93.0, 24.0 ],
                    "text": "MIDI setup",
                    "varname": "cmt_midisetup"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2650.0, 540.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetoffsetidx"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1653.0, 88.0, 110.0, 22.0 ],
                    "text": "prepend offsetpick",
                    "varname": "linn_lpoffsetpick"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-13",
                    "items": [ "+2  343 c ~5/4", ",", "+1  171 c ~8/7", ",", "+4  686 c ~3/2", ",", "+3  514 c ~4/3", ",", "+5  857 c ~5/3", ",", "+8  1371 c ~9/4", ",", "+6  1029 c ~7/4", ",", "+9  1543 c ~5/2", ",", "+7  1200 c ~2/1", ",", "+10  1714 c ~8/3", ",", "+11  1886 c ~3/1", ",", "+12  2057 c ~10/3", ",", "+13  2229 c ~7/2", ",", "+14  2400 c ~4/1", ",", "+25  4286 c ~12/1  (doesn't fit)", ",", "+24  4114 c ~11/1  (doesn't fit)", ",", "+23  3943 c ~10/1  (doesn't fit)", ",", "+22  3771 c ~9/1  (doesn't fit)", ",", "+21  3600 c ~8/1  (doesn't fit)", ",", "+20  3429 c ~7/1  (doesn't fit)", ",", "+19  3257 c ~13/2  (doesn't fit)", ",", "+18  3086 c ~6/1  (doesn't fit)", ",", "+17  2914 c ~11/2  (doesn't fit)", ",", "+16  2743 c ~5/1  (doesn't fit)", ",", "+15  2571 c ~9/2  (doesn't fit)" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1653.0, 28.0, 110.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 689.0, 252.0, 179.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "+2  343 c ~5/4", "+1  171 c ~8/7", "+4  686 c ~3/2", "+3  514 c ~4/3", "+5  857 c ~5/3", "+8  1371 c ~9/4", "+6  1029 c ~7/4", "+9  1543 c ~5/2", "+7  1200 c ~2/1", "+10  1714 c ~8/3", "+11  1886 c ~3/1", "+12  2057 c ~10/3", "+13  2229 c ~7/2", "+14  2400 c ~4/1", "+25  4286 c ~12/1  (doesn't fit)", "+24  4114 c ~11/1  (doesn't fit)", "+23  3943 c ~10/1  (doesn't fit)", "+22  3771 c ~9/1  (doesn't fit)", "+21  3600 c ~8/1  (doesn't fit)", "+20  3429 c ~7/1  (doesn't fit)", "+19  3257 c ~13/2  (doesn't fit)", "+18  3086 c ~6/1  (doesn't fit)", "+17  2914 c ~11/2  (doesn't fit)", "+16  2743 c ~5/1  (doesn't fit)", "+15  2571 c ~9/2  (doesn't fit)" ],
                            "parameter_longname": "linn_loffsetmenu",
                            "parameter_mmax": 24,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_loffsetmenu",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_loffsetmenu"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 184.0, 90.0, 22.0 ],
                    "text": "prepend onset",
                    "varname": "linn_ponset_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-76",
                    "maxclass": "number",
                    "maximum": 500,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 560.0, 214.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 738.0, 306.0, 57.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_onset_l",
                            "parameter_mmax": 500.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_onset_l",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "linn_onset_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-62",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 136.0, 103.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 669.0, 306.0, 90.0, 24.0 ],
                    "text": "onset ms",
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "cmt_onset_l"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 440.0, 172.0, 110.0, 22.0 ],
                    "text": "prepend vibrato",
                    "varname": "linn_pvibrato_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "format": 6,
                    "id": "obj-45",
                    "maxclass": "flonum",
                    "maximum": 3.0,
                    "minimum": 1.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 440.0, 204.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 737.0, 275.0, 60.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_vibrato_l",
                            "parameter_mmax": 3.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_vibrato_l",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "linn_vibrato_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-37",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 440.0, 120.0, 102.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 669.0, 276.0, 76.0, 24.0 ],
                    "text": "vibrato",
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "cmt_vibrato_l"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2467.0, 580.0, 100.0, 22.0 ],
                    "text": "prepend state",
                    "varname": "linn_pstate"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 2467.0, 540.0, 150.0, 22.0 ],
                    "restore": [ "{\"22edo.scl\":{\"scheme\":\"ji\",\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1},\"ji_11.scl\":{\"scheme\":\"ji\",\"offset\":5,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1},\"31-edo.scl\":{\"scheme\":\"ji\",\"offset\":13,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":5,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1},\"ji_13.scl\":{\"scheme\":\"kite\",\"offset\":5,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":3,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1},\"ji_17.scl\":{\"scheme\":\"ji\",\"offset\":7,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":5,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1},\"ji_7.scl\":{\"l\":{\"scheme\":\"ji\",\"limit\":5,\"palette\":5,\"shift\":0},\"r\":{\"scheme\":\"ji\",\"limit\":5,\"shift\":3},\"offset\":5,\"low\":-1,\"root\":60}}" ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr linn_lightsstate",
                    "varname": "linn_lightsstate"
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "populate" ],
                    "patching_rect": [ 260.0, 34.0, 70.0, 22.0 ],
                    "text": "t populate",
                    "varname": "linn_trescan"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.9058823529411765, 0.8431372549019608, 0.5686274509803921, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 260.0, 8.0, 20.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 154.0, 277.0, 24.0, 24.0 ],
                    "varname": "linn_rescanbtn"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-65",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 290.0, 4.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 180.0, 277.0, 103.0, 24.0 ],
                    "text": "rescan folder",
                    "varname": "cmt_rescan"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "exportscale" ],
                    "patching_rect": [ 30.0, 146.0, 80.0, 22.0 ],
                    "text": "t exportscale",
                    "varname": "linn_texport"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 116.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 154.0, 308.0, 24.0, 24.0 ],
                    "varname": "linn_exportbtn"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 60.0, 94.0, 80.0, 33.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 180.0, 303.0, 59.0, 33.0 ],
                    "text": "export to madrona",
                    "varname": "cmt_export"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-51",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 520.0, 100.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 309.0, 253.0, 97.0, 24.0 ],
                    "text": "LED pattern",
                    "varname": "cmt_synthbend[1]_l"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1100.0, 440.0, 110.0, 35.0 ],
                    "text": "prepend bendrange",
                    "varname": "linn_pbendrange_l"
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 270.0, 146.0, 110.0, 35.0 ],
                    "text": "prepend synthbend",
                    "varname": "linn_psynthbend_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-46",
                    "maxclass": "number",
                    "maximum": 96,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 294.0, 188.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 95.0, 68.0, 38.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 48 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "linn_synthbend_l",
                            "parameter_mmax": 96.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_synthbend_l",
                            "parameter_type": 0
                        }
                    },
                    "varname": "linn_synthbend_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-44",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 270.0, 90.0, 100.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 69.0, 91.0, 24.0 ],
                    "text": "synth bend",
                    "varname": "cmt_synthbend_l"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 170.0, 146.0, 90.0, 22.0 ],
                    "text": "prepend retune",
                    "varname": "linn_pretune_l"
                }
            },
            {
                "box": {
                    "checkedcolor": [ 1.0, 0.5294117647058824, 0.17254901960784313, 1.0 ],
                    "id": "obj-39",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 170.0, 116.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 96.0, 87.0, 36.0, 36.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "linn_retuneon_l",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_retuneon_l",
                            "parameter_type": 2
                        }
                    },
                    "uncheckedcolor": [ 0.23137254901960785, 0.4549019607843137, 0.6666666666666666, 1.0 ],
                    "varname": "linn_retuneon_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-35",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 170.0, 216.0, 70.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 93.0, 63.0, 24.0 ],
                    "text": "retune",
                    "textcolor": [ 0.9977086186408997, 0.5845433473587036, 0.2821178436279297, 1.0 ],
                    "varname": "cmt_retune_l"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1753.0, 490.0, 100.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsethz"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1753.0, 460.0, 100.0, 22.0 ],
                    "text": "fromsymbol",
                    "varname": "linn_lhzfromsym"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1753.0, 430.0, 100.0, 22.0 ],
                    "text": "sprintf %.2f Hz",
                    "varname": "linn_lhzformat"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "float" ],
                    "patching_rect": [ 1753.0, 400.0, 100.0, 22.0 ],
                    "text": "unpack 0 0.",
                    "varname": "linn_lhzunpack"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1753.0, 370.0, 100.0, 22.0 ],
                    "text": "route root",
                    "varname": "linn_lhzroute"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-23",
                    "ignoreclick": 1,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1995.0, 28.0, 114.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 445.0, 327.0, 64.0, 26.0 ],
                    "text": "261.63",
                    "varname": "linn_lhzinfo"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-134",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2115.0, 36.0, 117.0, 42.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 0.0, 125.0, 105.0, 42.0 ],
                    "text": "Linnstrument PB range",
                    "varname": "cmt_bend_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-130",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1989.0, 60.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 309.0, 326.0, 40.0, 24.0 ],
                    "text": "root",
                    "varname": "cmt_root"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-126",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1701.0, 120.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 614.0, 253.0, 79.0, 24.0 ],
                    "text": "row offset",
                    "textcolor": [ 0.9255475997924805, 0.9250496029853821, 0.5176522731781006, 1.0 ],
                    "varname": "cmt_offset"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 16.0,
                    "id": "obj-124",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1550.0, 120.0, 141.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 569.0, 302.0, 72.0, 24.0 ],
                    "text": "subharm",
                    "varname": "cmt_subharmonics_l"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 16.0,
                    "id": "obj-122",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1431.0, 150.0, 121.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 448.0, 302.0, 83.0, 24.0 ],
                    "text": "harmonics",
                    "varname": "cmt_harmonics_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-118",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1334.0, 6.0, 117.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 569.0, 276.0, 81.0, 24.0 ],
                    "text": "generator",
                    "varname": "cmt_generator_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-116",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1094.0, 150.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 309.0, 277.0, 61.0, 24.0 ],
                    "text": "primes",
                    "varname": "cmt_limit_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-93",
                    "items": [ 3, ",", 5, ",", 7, ",", 11, ",", 13 ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1034.0, 28.0, 55.0, 26.0 ],
                    "pattrmode": 1,
                    "presentation": 1,
                    "presentation_rect": [ 364.0, 275.0, 46.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "3", "5", "7", "11", "13" ],
                            "parameter_longname": "linn_llimit_l",
                            "parameter_mmax": 4,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_llimit_l",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_llimit_l"
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "linecount": 4,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1277.0, 330.0, 110.0, 62.0 ],
                    "text": "expr ($i1>=5)+($i1>=7)+($i1>=11)+($i1>=13)",
                    "varname": "linn_llimitidx_l"
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2229.0, 460.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetsubharmonics_l"
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2110.0, 492.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetharmonics_l"
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2110.0, 460.0, 90.0, 22.0 ],
                    "text": "expr $i1==32",
                    "varname": "linn_lharmidx_l"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1991.0, 460.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetmossize_l"
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1872.0, 460.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetgenerator_l"
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1508.0, 88.0, 137.0, 22.0 ],
                    "text": "prepend subharmonics l",
                    "varname": "linn_lpsubharmonics_l"
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1383.0, 88.0, 117.0, 22.0 ],
                    "text": "prepend harmonics l",
                    "varname": "linn_lpharmonics_l"
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1383.0, 58.0, 100.0, 22.0 ],
                    "text": "expr ($i1+1)*16",
                    "varname": "linn_lharmexpr_l"
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1269.0, 88.0, 106.0, 22.0 ],
                    "text": "prepend mossize l",
                    "varname": "linn_lpmossize_l"
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1148.0, 88.0, 113.0, 22.0 ],
                    "text": "prepend generator l",
                    "varname": "linn_lpgenerator_l"
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1508.0, 28.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 637.0, 302.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "linn_lsubharmonics_l",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lsubharmonics_l",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_lsubharmonics_l"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 16.0,
                    "id": "obj-77",
                    "items": [ 16, ",", 32 ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1539.0, 28.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 525.0, 301.0, 46.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "16", "32" ],
                            "parameter_longname": "linn_lharmonics_l",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lharmonics_l",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_lharmonics_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-75",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1269.0, 28.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 527.0, 275.0, 47.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "linn_lmossize_l",
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lmossize_l",
                            "parameter_type": 3
                        }
                    },
                    "varname": "linn_lmossize_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-73",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1148.0, 28.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 644.0, 275.0, 58.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "linn_lgenerator_l",
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lgenerator_l",
                            "parameter_type": 3
                        }
                    },
                    "varname": "linn_lgenerator_l"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "linnsplit.preview.js",
                    "id": "obj-71",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 480.0, 560.0, 650.0, 208.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 158.0, -3.0, 710.0, 251.0 ],
                    "textfile": {
                        "filename": "linnsplit.preview.js",
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
                    "patching_rect": [ 920.0, 240.0, 106.0, 22.0 ],
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
                    "patching_rect": [ 1753.0, 330.0, 90.0, 22.0 ],
                    "text": "prepend root",
                    "varname": "linn_ltuning"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1396.0, 330.0, 80.0, 22.0 ],
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
                    "patching_rect": [ 1277.0, 400.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetlimit_l"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1881.0, 88.0, 100.0, 22.0 ],
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
                    "patching_rect": [ 1034.0, 88.0, 100.0, 22.0 ],
                    "text": "prepend limit l",
                    "varname": "linn_lplimit_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-54",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1881.0, 28.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 344.0, 326.0, 38.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_lroot",
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_lroot",
                            "parameter_type": 0
                        }
                    },
                    "varname": "linn_lroot"
                }
            },
            {
                "box": {
                    "data": {
                        "22edo.scl": "{\"scheme\":\"ji\",\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1}",
                        "ji_11.scl": "{\"scheme\":\"ji\",\"offset\":5,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1}",
                        "31-edo.scl": "{\"scheme\":\"ji\",\"offset\":13,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":5,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1}",
                        "ji_13.scl": "{\"scheme\":\"kite\",\"offset\":5,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":3,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1}",
                        "ji_17.scl": "{\"scheme\":\"ji\",\"offset\":7,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":5,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1}",
                        "ji_7.scl": "{\"l\":{\"scheme\":\"ji\",\"limit\":5,\"palette\":5,\"shift\":0},\"r\":{\"scheme\":\"ji\",\"limit\":5,\"shift\":3},\"offset\":5,\"low\":-1,\"root\":60}"
                    },
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 474.0, 332.0, 147.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 1,
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict linnsplit.lights.settings"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2760.0, 540.0, 100.0, 22.0 ],
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
                    "patching_rect": [ 1158.0, 330.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetbend_l"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 920.0, 330.0, 110.0, 22.0 ],
                    "text": "prepend setsymbol",
                    "varname": "linn_lsetscheme_l"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2109.0, 88.0, 100.0, 22.0 ],
                    "text": "prepend bend l",
                    "varname": "linn_lpbend_l"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 920.0, 88.0, 104.0, 22.0 ],
                    "text": "prepend scheme l",
                    "varname": "linn_lpscheme_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-11",
                    "maxclass": "number",
                    "maximum": 96,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 2043.0, 94.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 96.0, 141.0, 36.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_lbend_l",
                            "parameter_mmax": 96.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_lbend_l",
                            "parameter_type": 0
                        }
                    },
                    "varname": "linn_lbend_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-5",
                    "items": [ "root", ",", "ji", ",", "names", ",", "mos", ",", "chain", ",", "moskeys", ",", "wijmenga", ",", "kite", ",", "factors", ",", "steps", ",", "nested", ",", "consonance", ",", "harmonics" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 920.0, 28.0, 100.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 402.0, 252.0, 100.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "root", "ji", "names", "mos", "chain", "moskeys", "wijmenga", "kite", "factors", "steps", "nested", "consonance", "harmonics" ],
                            "parameter_longname": "linn_lscheme_l",
                            "parameter_mmax": 12,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lscheme_l",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9255475997924805, 0.9250496029853821, 0.5176522731781006, 1.0 ],
                    "varname": "linn_lscheme_l"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 920.0, 200.0, 100.0, 22.0 ],
                    "text": "linnsplit.lights",
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
                    "patching_rect": [ 14.0, 445.0, 141.0, 114.0 ],
                    "pattrstorage": "hybridsplit-b",
                    "presentation": 1,
                    "presentation_rect": [ 0.0, -3.0, 149.0, 64.0 ],
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
                    "patching_rect": [ 14.0, 395.0, 221.0, 22.0 ],
                    "saved_object_attributes": {
                        "client_rect": [ 580, 87, 949, 304 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 583, 69, 1034, 197 ]
                    },
                    "text": "pattrstorage hybridsplit-b @savemode 3",
                    "varname": "hybridsplit-b"
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
                    "restore": {
                        "linn_curve_lift_l": [ "Linear", 2, 0, 0, 0, 1, 1, 0 ],
                        "linn_curve_lift_r": [ "Linear", 2, 0, 0, 0, 1, 1, 0 ],
                        "linn_curve_press_l": [ "Linear", 2, 0, 0, 0, 1, 1, 0 ],
                        "linn_curve_press_r": [ "Linear", 2, 0, 0, 0, 1, 1, 0 ],
                        "linn_curve_slide_l": [ "Linear", 2, 0, 0, 0, 1, 1, 0 ],
                        "linn_curve_slide_r": [ "Linear", 2, 0, 0, 0, 1, 1, 0 ],
                        "linn_curve_strike_l": [ "Linear", 2, 0, 0, 0, 1, 1, 0 ],
                        "linn_curve_strike_r": [ "Linear", 2, 0, 0, 0, 1, 1, 0 ],
                        "linn_lmidisetup": [ 1 ],
                        "linn_onset_l": [ 0 ],
                        "linn_onset_r": [ 0 ],
                        "linn_retuneon_l": [ 0 ],
                        "linn_scale": [ "ji_7.scl" ],
                        "linn_slew_r": [ 0 ],
                        "linn_slewpress_r": [ 0 ],
                        "linn_slewy_r": [ 0 ],
                        "linn_synthbend_l": [ 48 ],
                        "linn_triglen_r": [ 0 ],
                        "linn_trigms_r": [ 2 ],
                        "linn_trigvel_r": [ 0 ],
                        "linn_vibrato_l": [ 1.0 ],
                        "linn_vibrato_r": [ 1.0 ],
                        "linnsplit_splitcol": [ 12 ]
                    },
                    "restore_extra": {
                        "linn_curve_lift_l": {
                            "id": "obj-9005"
                        },
                        "linn_curve_lift_r": {
                            "id": "obj-20082"
                        },
                        "linn_curve_press_l": {
                            "id": "obj-9003"
                        },
                        "linn_curve_press_r": {
                            "id": "obj-20010"
                        },
                        "linn_curve_slide_l": {
                            "id": "obj-9004"
                        },
                        "linn_curve_slide_r": {
                            "id": "obj-20090"
                        },
                        "linn_curve_strike_l": {
                            "id": "obj-9043"
                        },
                        "linn_curve_strike_r": {
                            "id": "obj-20053"
                        },
                        "linn_lmidisetup": {
                            "id": "obj-92"
                        },
                        "linn_onset_l": {
                            "id": "obj-76"
                        },
                        "linn_onset_r": {
                            "id": "obj-20037"
                        },
                        "linn_retuneon_l": {
                            "id": "obj-39"
                        },
                        "linn_scale": {
                            "id": "obj-14"
                        },
                        "linn_slew_r": {
                            "id": "obj-60006"
                        },
                        "linn_slewpress_r": {
                            "id": "obj-60009"
                        },
                        "linn_slewy_r": {
                            "id": "obj-60012"
                        },
                        "linn_synthbend_l": {
                            "id": "obj-46"
                        },
                        "linn_triglen_r": {
                            "id": "obj-60020"
                        },
                        "linn_trigms_r": {
                            "id": "obj-60018"
                        },
                        "linn_trigvel_r": {
                            "id": "obj-60019"
                        },
                        "linn_vibrato_l": {
                            "id": "obj-45"
                        },
                        "linn_vibrato_r": {
                            "id": "obj-20091"
                        },
                        "linnsplit_splitcol": {
                            "id": "obj-20100"
                        }
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
                    "patching_rect": [ 14.0, 190.0, 100.0, 22.0 ],
                    "text": "linnsplit.retune",
                    "varname": "linn_retune_l"
                }
            },
            {
                "box": {
                    "autopopulate": 1,
                    "fontsize": 16.0,
                    "id": "obj-14",
                    "items": [ "22edo.scl", ",", "31-edo.scl", ",", "ji_11.scl", ",", "ji_13.scl", ",", "ji_17.scl", ",", "ji_7.scl", ",", "ji_7a.scl", ",", "ji_8coh.scl", ",", "ji_9.scl", ",", "ji_9coh.scl", ",", "partch-grm.scl", ",", "partch_43.scl" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 114.0, 62.0, 100.0, 26.0 ],
                    "pattrmode": 1,
                    "prefix": "SCL/",
                    "presentation": 1,
                    "presentation_rect": [ 158.0, 252.0, 147.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "22edo.scl", "31-edo.scl", "ji_11.scl", "ji_13.scl", "ji_17.scl", "ji_7.scl", "ji_7a.scl", "ji_8coh.scl", "ji_9.scl", "ji_9coh.scl", "partch-grm.scl", "partch_43.scl" ],
                            "parameter_longname": "linn_scale",
                            "parameter_mmax": 11,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_scale",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9254901960784314, 0.9254901960784314, 0.5176470588235295, 1.0 ],
                    "varname": "linn_scale"
                }
            },
            {
                "box": {
                    "color": [ 0.8901960784313725, 0.25882352941176473, 0.25882352941176473, 1.0 ],
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 41.0, 732.0, 122.0, 22.0 ],
                    "saved_object_attributes": {
                        "alias": "",
                        "group": ""
                    },
                    "text": "maxmcp hybridsplit-b"
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
                    "patching_rect": [ 9.0, 7.0, 152.0, 22.0 ],
                    "text": "midiin \"LinnStrument MIDI\"",
                    "varname": "linn_midiin"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "gradient": 1,
                    "id": "obj-36",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 480.0, 28.0, 43.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 173.0, 46.0, 26.0 ],
                    "text": "send",
                    "textcolor": [ 1.0, 0.5843137254901961, 0.2823529411764706, 1.0 ],
                    "varname": "linn_lsend"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "gradient": 1,
                    "id": "obj-38",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 552.0, 28.0, 81.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 203.0, 81.0, 26.0 ],
                    "text": "sendlights",
                    "textcolor": [ 0.5490196078431373, 1.0, 0.4627450980392157, 1.0 ],
                    "varname": "linn_lsendlights"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "gradient": 1,
                    "id": "obj-40",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 640.0, 28.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 235.0, 64.0, 26.0 ],
                    "text": "backup",
                    "varname": "linn_lbackup"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "gradient": 1,
                    "id": "obj-42",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 712.0, 28.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 263.0, 64.0, 26.0 ],
                    "text": "restore",
                    "varname": "linn_lrestore"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "gradient": 1,
                    "id": "obj-48",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 784.0, 28.0, 63.0, 26.0 ],
                    "text": "status",
                    "varname": "linn_lstatus"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_color1": [ 0.1568627450980392, 0.17254901960784313, 0.19215686274509805, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1 ],
                    "bgfillcolor_type": "gradient",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "gradient": 1,
                    "id": "obj-50",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 856.0, 28.0, 44.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 35.0, 291.0, 63.0, 26.0 ],
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
                    "maxclass": "newobj",
                    "numinlets": 9,
                    "numoutlets": 9,
                    "outlettype": [ "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 920.0, 280.0, 960.0, 22.0 ],
                    "text": "route scheme offset bend limit root refhz offsetinfo tuning",
                    "varname": "linn_lroute"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-98",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 6,
                    "outlettype": [ "", "", "", "", "", "" ],
                    "patching_rect": [ 1872.0, 420.0, 603.0, 22.0 ],
                    "text": "route generator mossize harmonics subharmonics low",
                    "varname": "linn_lroute2"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "id": "obj-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1431.0, 120.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 447.0, 276.0, 84.0, 24.0 ],
                    "text": "MOS size",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "varname": "cmt_mossize_l"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "id": "obj-20",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2115.0, 6.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 381.0, 327.0, 62.0, 24.0 ],
                    "text": "root Hz",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "varname": "cmt_refhz"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 2467.0, 500.0, 260.0, 22.0 ],
                    "text": "route lightsstate offsetmenu offsetindex",
                    "varname": "linn_lstateroute"
                }
            },
            {
                "box": {
                    "id": "obj-9000",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
                    "patching_rect": [ 274.0, 949.0, 100.0, 22.0 ],
                    "text": "dialog",
                    "varname": "linn_dialog_strike_l"
                }
            },
            {
                "box": {
                    "id": "obj-9001",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 274.0, 979.0, 100.0, 22.0 ],
                    "text": "prepend save",
                    "varname": "linn_psave_strike_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-9002",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 184.0, 1099.0, 191.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 360.0, 57.0, 24.0 ],
                    "text": "strike",
                    "textcolor": [ 0.5137254901960784, 1.0, 0.5019607843137255, 1.0 ],
                    "varname": "cmt_curve_strike_l"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "linnsplit.curve.js",
                    "id": "obj-9003",
                    "jsarguments": [ "press" ],
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 394.0, 1069.0, 150.0, 150.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 180.0, 386.0, 160.0, 160.0 ],
                    "textfile": {
                        "filename": "linnsplit.curve.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linn_curve_press_l"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "linnsplit.curve.js",
                    "id": "obj-9004",
                    "jsarguments": [ "slide" ],
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 774.0, 1069.0, 150.0, 150.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 352.0, 386.0, 160.0, 160.0 ],
                    "textfile": {
                        "filename": "linnsplit.curve.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linn_curve_slide_l"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "linnsplit.curve.js",
                    "id": "obj-9005",
                    "jsarguments": [ "lift" ],
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1154.0, 1069.0, 150.0, 150.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 524.0, 386.0, 160.0, 160.0 ],
                    "textfile": {
                        "filename": "linnsplit.curve.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linn_curve_lift_l"
                }
            },
            {
                "box": {
                    "id": "obj-9006",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 1239.0, 118.0, 22.0 ],
                    "text": "prepend curve press",
                    "varname": "linn_pcurve_press_l"
                }
            },
            {
                "box": {
                    "id": "obj-9007",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 774.0, 1239.0, 113.0, 22.0 ],
                    "text": "prepend curve slide",
                    "varname": "linn_pcurve_slide_l"
                }
            },
            {
                "box": {
                    "id": "obj-9008",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1154.0, 1239.0, 101.0, 22.0 ],
                    "text": "prepend curve lift",
                    "varname": "linn_pcurve_lift_l"
                }
            },
            {
                "box": {
                    "id": "obj-9009",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 394.0, 1269.0, 117.0, 22.0 ],
                    "text": "s linnsplit_l_cvcurve",
                    "varname": "linn_scurve_press_l"
                }
            },
            {
                "box": {
                    "id": "obj-9010",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 774.0, 1269.0, 117.0, 22.0 ],
                    "text": "s linnsplit_l_cvcurve",
                    "varname": "linn_scurve_slide_l"
                }
            },
            {
                "box": {
                    "id": "obj-9011",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1154.0, 1269.0, 117.0, 22.0 ],
                    "text": "s linnsplit_l_cvcurve",
                    "varname": "linn_scurve_lift_l"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-9012",
                    "items": [ "Linear", ",", "Velocity 1", ",", "Velocity 2", ",", "Velocity 3", ",", "Velocity 4", ",", "Velocity 5", ",", "Velocity 6", ",", "Velocity 7", ",", "Full Velocity", ",", "Exponential", ",", "Press Dead Zone Heavy", ",", "Press Dead Zone Lite", ",", "mirrored linear", ",", "mirrored exp" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 394.0, 979.0, 150.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 180.0, 550.0, 160.0, 24.0 ],
                    "varname": "linn_curvemenu_press_l"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-9013",
                    "items": [ "Linear", ",", "Velocity 1", ",", "Velocity 2", ",", "Velocity 3", ",", "Velocity 4", ",", "Velocity 5", ",", "Velocity 6", ",", "Velocity 7", ",", "Full Velocity", ",", "Exponential", ",", "Press Dead Zone Heavy", ",", "Press Dead Zone Lite", ",", "mirrored linear", ",", "mirrored exp" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 774.0, 979.0, 150.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 352.0, 550.0, 160.0, 24.0 ],
                    "varname": "linn_curvemenu_slide_l"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-9014",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
                    "patching_rect": [ 1520.0, 949.0, 460.0, 22.0 ],
                    "text": "dialog @mode 2 @label \"Delete all saved curves and set the four curves to Linear?\"",
                    "varname": "linn_curveresetdialog"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-9015",
                    "items": [ "Linear", ",", "Velocity 1", ",", "Velocity 2", ",", "Velocity 3", ",", "Velocity 4", ",", "Velocity 5", ",", "Velocity 6", ",", "Velocity 7", ",", "Full Velocity", ",", "Exponential", ",", "Press Dead Zone Heavy", ",", "Press Dead Zone Lite", ",", "mirrored linear", ",", "mirrored exp" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1154.0, 979.0, 150.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 524.0, 550.0, 160.0, 24.0 ],
                    "varname": "linn_curvemenu_lift_l"
                }
            },
            {
                "box": {
                    "id": "obj-9016",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 1019.0, 100.0, 22.0 ],
                    "text": "prepend load",
                    "varname": "linn_pload_press_l"
                }
            },
            {
                "box": {
                    "id": "obj-9017",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 774.0, 1019.0, 100.0, 22.0 ],
                    "text": "prepend load",
                    "varname": "linn_pload_slide_l"
                }
            },
            {
                "box": {
                    "id": "obj-9018",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1154.0, 1019.0, 100.0, 22.0 ],
                    "text": "prepend load",
                    "varname": "linn_pload_lift_l"
                }
            },
            {
                "box": {
                    "id": "obj-9019",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.9844885468482971, 0.9999385476112366, 0.650842010974884, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 654.0, 919.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 316.0, 360.0, 24.0, 24.0 ],
                    "varname": "linn_curvesave_press_l"
                }
            },
            {
                "box": {
                    "id": "obj-9020",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.9844885468482971, 0.9999385476112366, 0.650842010974884, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1034.0, 919.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 488.0, 360.0, 24.0, 24.0 ],
                    "varname": "linn_curvesave_slide_l"
                }
            },
            {
                "box": {
                    "id": "obj-9021",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.9844885468482971, 0.9999385476112366, 0.650842010974884, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1414.0, 919.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 660.0, 360.0, 24.0, 24.0 ],
                    "varname": "linn_curvesave_lift_l"
                }
            },
            {
                "box": {
                    "id": "obj-9022",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
                    "patching_rect": [ 654.0, 949.0, 100.0, 22.0 ],
                    "text": "dialog",
                    "varname": "linn_dialog_press_l"
                }
            },
            {
                "box": {
                    "id": "obj-9023",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
                    "patching_rect": [ 1034.0, 949.0, 100.0, 22.0 ],
                    "text": "dialog",
                    "varname": "linn_dialog_slide_l"
                }
            },
            {
                "box": {
                    "id": "obj-9024",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
                    "patching_rect": [ 1414.0, 949.0, 100.0, 22.0 ],
                    "text": "dialog",
                    "varname": "linn_dialog_lift_l"
                }
            },
            {
                "box": {
                    "id": "obj-9025",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 654.0, 979.0, 100.0, 22.0 ],
                    "text": "prepend save",
                    "varname": "linn_psave_press_l"
                }
            },
            {
                "box": {
                    "id": "obj-9026",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1034.0, 979.0, 100.0, 22.0 ],
                    "text": "prepend save",
                    "varname": "linn_psave_slide_l"
                }
            },
            {
                "box": {
                    "id": "obj-9027",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1414.0, 979.0, 100.0, 22.0 ],
                    "text": "prepend save",
                    "varname": "linn_psave_lift_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-9028",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 564.0, 1099.0, 190.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 180.0, 360.0, 58.0, 24.0 ],
                    "text": "press",
                    "textcolor": [ 0.5137254901960784, 1.0, 0.5019607843137255, 1.0 ],
                    "varname": "cmt_curve_press_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-9029",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 944.0, 1099.0, 190.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 352.0, 360.0, 71.0, 24.0 ],
                    "text": "slide (Y)",
                    "textcolor": [ 0.5137254901960784, 1.0, 0.5019607843137255, 1.0 ],
                    "varname": "cmt_curve_slide_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-9030",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1324.0, 1099.0, 180.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 524.0, 360.0, 36.0, 24.0 ],
                    "text": "lift",
                    "textcolor": [ 0.5137254901960784, 1.0, 0.5019607843137255, 1.0 ],
                    "varname": "cmt_curve_lift_l"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-9031",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 184.0, 1039.0, 150.0, 22.0 ],
                    "text": "r linnsplit_l_curves",
                    "varname": "linn_rrefresh_strike_l"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-9032",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 564.0, 1039.0, 150.0, 22.0 ],
                    "text": "r linnsplit_l_curves",
                    "varname": "linn_rrefresh_press_l"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-9033",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 944.0, 1039.0, 150.0, 22.0 ],
                    "text": "r linnsplit_l_curves",
                    "varname": "linn_rrefresh_slide_l"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-9034",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1324.0, 1039.0, 150.0, 22.0 ],
                    "text": "r linnsplit_l_curves",
                    "varname": "linn_rrefresh_lift_l"
                }
            },
            {
                "box": {
                    "id": "obj-9035",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.9976966977119446, 0.26637566089630127, 0.26622143387794495, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1520.0, 919.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 799.0, 360.0, 24.0, 24.0 ],
                    "varname": "linn_curvereset"
                }
            },
            {
                "box": {
                    "id": "obj-9036",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "resetcurves" ],
                    "patching_rect": [ 1520.0, 979.0, 100.0, 22.0 ],
                    "text": "t resetcurves",
                    "varname": "linn_tcurvereset"
                }
            },
            {
                "box": {
                    "id": "obj-9037",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1520.0, 1009.0, 111.0, 22.0 ],
                    "text": "s linnsplit_l_curves",
                    "varname": "linn_scurvereset"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-9038",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1550.0, 919.0, 156.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 699.0, 360.0, 98.0, 24.0 ],
                    "text": "reset curves",
                    "textcolor": [ 1.0, 0.26666666666666666, 0.26666666666666666, 1.0 ],
                    "varname": "cmt_curvereset"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-9039",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1323.0, 1007.0, 191.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 99.0, 360.0, 43.0, 24.0 ],
                    "text": "save",
                    "textcolor": [ 0.984313725490196, 1.0, 0.6509803921568628, 1.0 ],
                    "varname": "cmt_curve_strike[1]_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-9040",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 920.0, 191.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 271.0, 360.0, 43.0, 24.0 ],
                    "text": "save",
                    "textcolor": [ 0.984313725490196, 1.0, 0.6509803921568628, 1.0 ],
                    "varname": "cmt_curve_strike[2]_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-9041",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 695.0, 919.0, 191.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 448.0, 360.0, 43.0, 24.0 ],
                    "text": "save",
                    "textcolor": [ 0.984313725490196, 1.0, 0.6509803921568628, 1.0 ],
                    "varname": "cmt_curve_strike[3]_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-9042",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1066.0, 915.0, 191.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 618.0, 360.0, 43.0, 24.0 ],
                    "text": "save",
                    "textcolor": [ 0.984313725490196, 1.0, 0.6509803921568628, 1.0 ],
                    "varname": "cmt_curve_strike[4]_l"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "linnsplit.curve.js",
                    "id": "obj-9043",
                    "jsarguments": [ "strike" ],
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 14.0, 1069.0, 150.0, 150.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 386.0, 160.0, 160.0 ],
                    "textfile": {
                        "filename": "linnsplit.curve.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linn_curve_strike_l"
                }
            },
            {
                "box": {
                    "id": "obj-9044",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 14.0, 1239.0, 117.0, 22.0 ],
                    "text": "prepend curve strike",
                    "varname": "linn_pcurve_strike_l"
                }
            },
            {
                "box": {
                    "id": "obj-9045",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 14.0, 1269.0, 117.0, 22.0 ],
                    "text": "s linnsplit_l_cvcurve",
                    "varname": "linn_scurve_strike_l"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-9046",
                    "items": [ "Linear", ",", "Velocity 1", ",", "Velocity 2", ",", "Velocity 3", ",", "Velocity 4", ",", "Velocity 5", ",", "Velocity 6", ",", "Velocity 7", ",", "Full Velocity", ",", "Exponential", ",", "Press Dead Zone Heavy", ",", "Press Dead Zone Lite", ",", "mirrored linear", ",", "mirrored exp" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 14.0, 979.0, 150.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 550.0, 160.0, 24.0 ],
                    "varname": "linn_curvemenu_strike_l"
                }
            },
            {
                "box": {
                    "id": "obj-9047",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 14.0, 1019.0, 100.0, 22.0 ],
                    "text": "prepend load",
                    "varname": "linn_pload_strike_l"
                }
            },
            {
                "box": {
                    "id": "obj-9048",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.9844885468482971, 0.9999385476112366, 0.650842010974884, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 274.0, 919.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 144.0, 360.0, 24.0, 24.0 ],
                    "varname": "linn_curvesave_strike_l"
                }
            },
            {
                "box": {
                    "id": "obj-9049",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1520.0, 1049.0, 130.0, 22.0 ],
                    "text": "r linnsplit_curves_lib",
                    "varname": "linn_rcurveslib"
                }
            },
            {
                "box": {
                    "filename": "linnsplit.curvemidi.js",
                    "id": "obj-9050",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 674.0, 160.0, 250.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "parameter_enable": 0
                    },
                    "text": "v8 linnsplit.curvemidi.js linnsplit_l_curves",
                    "textfile": {
                        "filename": "linnsplit.curvemidi.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linn_curvemidi_l"
                }
            },
            {
                "box": {
                    "id": "obj-9051",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 934.0, 130.0, 150.0, 22.0 ],
                    "text": "r linnsplit_l_cvcurve",
                    "varname": "linn_rcvcurve_l"
                }
            },
            {
                "box": {
                    "id": "obj-20001",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1158.0, 1730.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetbend_r"
                }
            },
            {
                "box": {
                    "id": "obj-20003",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2109.0, 1488.0, 100.0, 22.0 ],
                    "text": "prepend bend r",
                    "varname": "linn_lpbend_r"
                }
            },
            {
                "box": {
                    "id": "obj-20004",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
                    "patching_rect": [ 1034.0, 2349.0, 100.0, 22.0 ],
                    "text": "dialog",
                    "varname": "linn_dialog_slide_r"
                }
            },
            {
                "box": {
                    "id": "obj-20005",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1991.0, 1860.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetmossize_r"
                }
            },
            {
                "box": {
                    "id": "obj-20007",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 654.0, 2379.0, 100.0, 22.0 ],
                    "text": "prepend save",
                    "varname": "linn_psave_press_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-20008",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 564.0, 2439.0, 150.0, 22.0 ],
                    "text": "r linnsplit_r_curves",
                    "varname": "linn_rrefresh_press_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20009",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 383.0, 2320.0, 191.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 269.0, 664.0, 43.0, 24.0 ],
                    "text": "save",
                    "textcolor": [ 0.984313725490196, 1.0, 0.6509803921568628, 1.0 ],
                    "varname": "cmt_curve_strike[2]_r"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "linnsplit.curve.js",
                    "id": "obj-20010",
                    "jsarguments": [ "press" ],
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 394.0, 2469.0, 150.0, 150.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 178.0, 690.0, 160.0, 160.0 ],
                    "textfile": {
                        "filename": "linnsplit.curve.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linn_curve_press_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20011",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1269.0, 1428.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 319.0, 581.0, 47.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "linn_lmossize_r",
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lmossize_r",
                            "parameter_type": 3
                        }
                    },
                    "varname": "linn_lmossize_r"
                }
            },
            {
                "box": {
                    "id": "obj-20012",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1148.0, 1488.0, 115.0, 22.0 ],
                    "text": "prepend generator r",
                    "varname": "linn_lpgenerator_r"
                }
            },
            {
                "box": {
                    "id": "obj-20013",
                    "linecount": 4,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1277.0, 1730.0, 110.0, 62.0 ],
                    "text": "expr ($i1>=5)+($i1>=7)+($i1>=11)+($i1>=13)",
                    "varname": "linn_llimitidx_r"
                }
            },
            {
                "box": {
                    "id": "obj-20014",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1383.0, 1488.0, 119.0, 22.0 ],
                    "text": "prepend harmonics r",
                    "varname": "linn_lpharmonics_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-20015",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1324.0, 2439.0, 150.0, 22.0 ],
                    "text": "r linnsplit_r_curves",
                    "varname": "linn_rrefresh_lift_r"
                }
            },
            {
                "box": {
                    "id": "obj-20016",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1508.0, 1488.0, 138.0, 22.0 ],
                    "text": "prepend subharmonics r",
                    "varname": "linn_lpsubharmonics_r"
                }
            },
            {
                "box": {
                    "id": "obj-20017",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1154.0, 2639.0, 101.0, 22.0 ],
                    "text": "prepend curve lift",
                    "varname": "linn_pcurve_lift_r"
                }
            },
            {
                "box": {
                    "id": "obj-20018",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 440.0, 1572.0, 110.0, 22.0 ],
                    "text": "prepend vibrato",
                    "varname": "linn_pvibrato_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20020",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 695.0, 2319.0, 191.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 446.0, 664.0, 43.0, 24.0 ],
                    "text": "save",
                    "textcolor": [ 0.984313725490196, 1.0, 0.6509803921568628, 1.0 ],
                    "varname": "cmt_curve_strike[3]_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20022",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 184.0, 2499.0, 191.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 6.0, 664.0, 57.0, 24.0 ],
                    "text": "strike",
                    "textcolor": [ 0.5137254901960784, 1.0, 0.5019607843137255, 1.0 ],
                    "varname": "cmt_curve_strike_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 16.0,
                    "id": "obj-20023",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1538.0, 1436.0, 141.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 361.0, 608.0, 72.0, 24.0 ],
                    "text": "subharm",
                    "varname": "cmt_subharmonics_r"
                }
            },
            {
                "box": {
                    "id": "obj-20024",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.9844885468482971, 0.9999385476112366, 0.650842010974884, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1034.0, 2319.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 486.0, 664.0, 24.0, 24.0 ],
                    "varname": "linn_curvesave_slide_r"
                }
            },
            {
                "box": {
                    "id": "obj-20025",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1034.0, 1488.0, 100.0, 22.0 ],
                    "text": "prepend limit r",
                    "varname": "linn_lplimit_r"
                }
            },
            {
                "box": {
                    "id": "obj-20026",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 2419.0, 100.0, 22.0 ],
                    "text": "prepend load",
                    "varname": "linn_pload_press_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20027",
                    "items": [ 3, ",", 5, ",", 7, ",", 11, ",", 13 ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1034.0, 1428.0, 55.0, 26.0 ],
                    "pattrmode": 1,
                    "presentation": 1,
                    "presentation_rect": [ 194.0, 580.0, 46.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "3", "5", "7", "11", "13" ],
                            "parameter_longname": "linn_llimit_r",
                            "parameter_mmax": 4,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_llimit_r",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_llimit_r"
                }
            },
            {
                "box": {
                    "id": "obj-20028",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 774.0, 2669.0, 117.0, 22.0 ],
                    "text": "s linnsplit_r_cvcurve",
                    "varname": "linn_scurve_slide_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20029",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 440.0, 1520.0, 102.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 461.0, 582.0, 76.0, 24.0 ],
                    "text": "vibrato",
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "cmt_vibrato_r"
                }
            },
            {
                "box": {
                    "id": "obj-20030",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 1584.0, 90.0, 22.0 ],
                    "text": "prepend onset",
                    "varname": "linn_ponset_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20031",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1334.0, 1406.0, 117.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 361.0, 582.0, 81.0, 24.0 ],
                    "text": "generator",
                    "varname": "cmt_generator_r"
                }
            },
            {
                "box": {
                    "id": "obj-20032",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2229.0, 1860.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetsubharmonics_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20033",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1066.0, 2315.0, 191.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 616.0, 664.0, 43.0, 24.0 ],
                    "text": "save",
                    "textcolor": [ 0.984313725490196, 1.0, 0.6509803921568628, 1.0 ],
                    "varname": "cmt_curve_strike[4]_r"
                }
            },
            {
                "box": {
                    "id": "obj-20034",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2110.0, 1860.0, 90.0, 22.0 ],
                    "text": "expr $i1==32",
                    "varname": "linn_lharmidx_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20035",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 1536.0, 103.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 461.0, 612.0, 105.0, 24.0 ],
                    "text": "onset ms",
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "cmt_onset_r"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-20036",
                    "items": [ "Linear", ",", "Velocity 1", ",", "Velocity 2", ",", "Velocity 3", ",", "Velocity 4", ",", "Velocity 5", ",", "Velocity 6", ",", "Velocity 7", ",", "Full Velocity", ",", "Exponential", ",", "Press Dead Zone Heavy", ",", "Press Dead Zone Lite", ",", "mirrored linear", ",", "mirrored exp" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1154.0, 2379.0, 150.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 854.0, 160.0, 24.0 ],
                    "varname": "linn_curvemenu_lift_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20037",
                    "maxclass": "number",
                    "maximum": 500,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 560.0, 1614.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 530.0, 612.0, 29.328125, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_onset_r",
                            "parameter_mmax": 500.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_onset_r",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "linn_onset_r"
                }
            },
            {
                "box": {
                    "id": "obj-20038",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 774.0, 2419.0, 100.0, 22.0 ],
                    "text": "prepend load",
                    "varname": "linn_pload_slide_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20039",
                    "items": [ "root", ",", "ji", ",", "names", ",", "mos", ",", "chain", ",", "moskeys", ",", "wijmenga", ",", "kite", ",", "factors", ",", "steps", ",", "nested", ",", "consonance", ",", "harmonics" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 920.0, 1428.0, 100.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 100.0, 639.0, 100.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "root", "ji", "names", "mos", "chain", "moskeys", "wijmenga", "kite", "factors", "steps", "nested", "consonance", "harmonics" ],
                            "parameter_longname": "linn_lscheme_r",
                            "parameter_mmax": 12,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lscheme_r",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9255475997924805, 0.9250496029853821, 0.5176522731781006, 1.0 ],
                    "varname": "linn_lscheme_r"
                }
            },
            {
                "box": {
                    "id": "obj-20040",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.9844885468482971, 0.9999385476112366, 0.650842010974884, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1414.0, 2319.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 658.0, 664.0, 24.0, 24.0 ],
                    "varname": "linn_curvesave_lift_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20041",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 944.0, 2499.0, 190.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 350.0, 664.0, 71.0, 24.0 ],
                    "text": "slide (Y)",
                    "textcolor": [ 0.5137254901960784, 1.0, 0.5019607843137255, 1.0 ],
                    "varname": "cmt_curve_slide_r"
                }
            },
            {
                "box": {
                    "id": "obj-20042",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2110.0, 1892.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetharmonics_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-20044",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 944.0, 2439.0, 150.0, 22.0 ],
                    "text": "r linnsplit_r_curves",
                    "varname": "linn_rrefresh_slide_r"
                }
            },
            {
                "box": {
                    "id": "obj-20046",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
                    "patching_rect": [ 274.0, 2349.0, 100.0, 22.0 ],
                    "text": "dialog",
                    "varname": "linn_dialog_strike_r"
                }
            },
            {
                "box": {
                    "id": "obj-20047",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1034.0, 2379.0, 100.0, 22.0 ],
                    "text": "prepend save",
                    "varname": "linn_psave_slide_r"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-20048",
                    "items": [ "Linear", ",", "Velocity 1", ",", "Velocity 2", ",", "Velocity 3", ",", "Velocity 4", ",", "Velocity 5", ",", "Velocity 6", ",", "Velocity 7", ",", "Full Velocity", ",", "Exponential", ",", "Press Dead Zone Heavy", ",", "Press Dead Zone Lite", ",", "mirrored linear", ",", "mirrored exp" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 14.0, 2379.0, 150.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 6.0, 854.0, 160.0, 24.0 ],
                    "varname": "linn_curvemenu_strike_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20049",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 564.0, 2499.0, 190.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 178.0, 664.0, 58.0, 24.0 ],
                    "text": "press",
                    "textcolor": [ 0.5137254901960784, 1.0, 0.5019607843137255, 1.0 ],
                    "varname": "cmt_curve_press_r"
                }
            },
            {
                "box": {
                    "id": "obj-20050",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 920.0, 1488.0, 105.0, 22.0 ],
                    "text": "prepend scheme r",
                    "varname": "linn_lpscheme_r"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-20051",
                    "items": [ "Linear", ",", "Velocity 1", ",", "Velocity 2", ",", "Velocity 3", ",", "Velocity 4", ",", "Velocity 5", ",", "Velocity 6", ",", "Velocity 7", ",", "Full Velocity", ",", "Exponential", ",", "Press Dead Zone Heavy", ",", "Press Dead Zone Lite", ",", "mirrored linear", ",", "mirrored exp" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 394.0, 2379.0, 150.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 178.0, 854.0, 160.0, 24.0 ],
                    "varname": "linn_curvemenu_press_r"
                }
            },
            {
                "box": {
                    "id": "obj-20052",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 394.0, 2639.0, 118.0, 22.0 ],
                    "text": "prepend curve press",
                    "varname": "linn_pcurve_press_r"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "linnsplit.curve.js",
                    "id": "obj-20053",
                    "jsarguments": [ "strike" ],
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 14.0, 2469.0, 150.0, 150.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 6.0, 690.0, 160.0, 160.0 ],
                    "textfile": {
                        "filename": "linnsplit.curve.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linn_curve_strike_r"
                }
            },
            {
                "box": {
                    "id": "obj-20054",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
                    "patching_rect": [ 1414.0, 2349.0, 100.0, 22.0 ],
                    "text": "dialog",
                    "varname": "linn_dialog_lift_r"
                }
            },
            {
                "box": {
                    "id": "obj-20055",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1154.0, 2419.0, 100.0, 22.0 ],
                    "text": "prepend load",
                    "varname": "linn_pload_lift_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20056",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1148.0, 1428.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 436.0, 581.0, 58.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "linn_lgenerator_r",
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lgenerator_r",
                            "parameter_type": 3
                        }
                    },
                    "varname": "linn_lgenerator_r"
                }
            },
            {
                "box": {
                    "id": "obj-20057",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.9844885468482971, 0.9999385476112366, 0.650842010974884, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 654.0, 2319.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 314.0, 664.0, 24.0, 24.0 ],
                    "varname": "linn_curvesave_press_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20058",
                    "maxclass": "number",
                    "maximum": 96,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 2109.0, 1452.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 101.0, 606.0, 36.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_lbend_r",
                            "parameter_mmax": 96.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_lbend_r",
                            "parameter_type": 0
                        }
                    },
                    "varname": "linn_lbend_r"
                }
            },
            {
                "box": {
                    "id": "obj-20059",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1383.0, 1458.0, 100.0, 22.0 ],
                    "text": "expr ($i1+1)*16",
                    "varname": "linn_lharmexpr_r"
                }
            },
            {
                "box": {
                    "id": "obj-20060",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 910.0, 1766.0, 110.0, 22.0 ],
                    "text": "prepend setsymbol",
                    "varname": "linn_lsetscheme_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20061",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1324.0, 2499.0, 180.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 664.0, 36.0, 24.0 ],
                    "text": "lift",
                    "textcolor": [ 0.5137254901960784, 1.0, 0.5019607843137255, 1.0 ],
                    "varname": "cmt_curve_lift_r"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "obj-20062",
                    "items": [ "Linear", ",", "Velocity 1", ",", "Velocity 2", ",", "Velocity 3", ",", "Velocity 4", ",", "Velocity 5", ",", "Velocity 6", ",", "Velocity 7", ",", "Full Velocity", ",", "Exponential", ",", "Press Dead Zone Heavy", ",", "Press Dead Zone Lite", ",", "mirrored linear", ",", "mirrored exp" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 774.0, 2379.0, 150.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 350.0, 854.0, 160.0, 24.0 ],
                    "varname": "linn_curvemenu_slide_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-20063",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 184.0, 2439.0, 150.0, 22.0 ],
                    "text": "r linnsplit_r_curves",
                    "varname": "linn_rrefresh_strike_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20064",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 1920.0, 100.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 640.0, 97.0, 24.0 ],
                    "text": "LED pattern",
                    "varname": "cmt_synthbend[1]_r"
                }
            },
            {
                "box": {
                    "id": "obj-20065",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 14.0, 2669.0, 117.0, 22.0 ],
                    "text": "s linnsplit_r_cvcurve",
                    "varname": "linn_scurve_strike_r"
                }
            },
            {
                "box": {
                    "id": "obj-20066",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.9844885468482971, 0.9999385476112366, 0.650842010974884, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 274.0, 2319.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 142.0, 664.0, 24.0, 24.0 ],
                    "varname": "linn_curvesave_strike_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20069",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1341.0, 2407.0, 191.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 97.0, 664.0, 43.0, 24.0 ],
                    "text": "save",
                    "textcolor": [ 0.984313725490196, 1.0, 0.6509803921568628, 1.0 ],
                    "varname": "cmt_curve_strike[1]_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "id": "obj-20070",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1431.0, 1520.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 239.0, 582.0, 84.0, 24.0 ],
                    "text": "MOS size",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "varname": "cmt_mossize_r"
                }
            },
            {
                "box": {
                    "id": "obj-20071",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1100.0, 1840.0, 110.0, 35.0 ],
                    "text": "prepend bendrange",
                    "varname": "linn_pbendrange_r"
                }
            },
            {
                "box": {
                    "id": "obj-20072",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 394.0, 2669.0, 117.0, 22.0 ],
                    "text": "s linnsplit_r_cvcurve",
                    "varname": "linn_scurve_press_r"
                }
            },
            {
                "box": {
                    "id": "obj-20074",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1154.0, 2669.0, 117.0, 22.0 ],
                    "text": "s linnsplit_r_cvcurve",
                    "varname": "linn_scurve_lift_r"
                }
            },
            {
                "box": {
                    "id": "obj-20076",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1508.0, 1428.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 429.0, 608.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "linn_lsubharmonics_r",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lsubharmonics_r",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_lsubharmonics_r"
                }
            },
            {
                "box": {
                    "id": "obj-20077",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
                    "patching_rect": [ 654.0, 2349.0, 100.0, 22.0 ],
                    "text": "dialog",
                    "varname": "linn_dialog_press_r"
                }
            },
            {
                "box": {
                    "id": "obj-20078",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 774.0, 2639.0, 113.0, 22.0 ],
                    "text": "prepend curve slide",
                    "varname": "linn_pcurve_slide_r"
                }
            },
            {
                "box": {
                    "id": "obj-20079",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1414.0, 2379.0, 100.0, 22.0 ],
                    "text": "prepend save",
                    "varname": "linn_psave_lift_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 16.0,
                    "id": "obj-20080",
                    "items": [ 16, ",", 32 ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1431.0, 1554.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 317.0, 607.0, 46.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "16", "32" ],
                            "parameter_longname": "linn_lharmonics_r",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lharmonics_r",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_lharmonics_r"
                }
            },
            {
                "box": {
                    "id": "obj-20081",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1269.0, 1488.0, 107.0, 22.0 ],
                    "text": "prepend mossize r",
                    "varname": "linn_lpmossize_r"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "linnsplit.curve.js",
                    "id": "obj-20082",
                    "jsarguments": [ "lift" ],
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1154.0, 2469.0, 150.0, 150.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 522.0, 690.0, 160.0, 160.0 ],
                    "textfile": {
                        "filename": "linnsplit.curve.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linn_curve_lift_r"
                }
            },
            {
                "box": {
                    "id": "obj-20083",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1872.0, 1860.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetgenerator_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20084",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2175.0, 1406.0, 117.0, 42.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 5.0, 590.0, 105.0, 42.0 ],
                    "text": "Linnstrument PB range",
                    "varname": "cmt_bend_r"
                }
            },
            {
                "box": {
                    "id": "obj-20085",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 14.0, 2639.0, 117.0, 22.0 ],
                    "text": "prepend curve strike",
                    "varname": "linn_pcurve_strike_r"
                }
            },
            {
                "box": {
                    "id": "obj-20086",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 14.0, 2419.0, 100.0, 22.0 ],
                    "text": "prepend load",
                    "varname": "linn_pload_strike_r"
                }
            },
            {
                "box": {
                    "id": "obj-20087",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 934.0, 1530.0, 150.0, 22.0 ],
                    "text": "r linnsplit_r_cvcurve",
                    "varname": "linn_rcvcurve_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20088",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1094.0, 1550.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 139.0, 582.0, 61.0, 24.0 ],
                    "text": "primes",
                    "varname": "cmt_limit_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 16.0,
                    "id": "obj-20089",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1539.0, 1406.0, 121.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 240.0, 608.0, 83.0, 24.0 ],
                    "text": "harmonics",
                    "varname": "cmt_harmonics_r"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "linnsplit.curve.js",
                    "id": "obj-20090",
                    "jsarguments": [ "slide" ],
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 774.0, 2469.0, 150.0, 150.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 350.0, 690.0, 160.0, 160.0 ],
                    "textfile": {
                        "filename": "linnsplit.curve.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linn_curve_slide_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "format": 6,
                    "id": "obj-20091",
                    "maxclass": "flonum",
                    "maximum": 3.0,
                    "minimum": 1.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 374.0, 1544.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 529.0, 581.0, 60.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_vibrato_r",
                            "parameter_mmax": 3.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_vibrato_r",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "linn_vibrato_r"
                }
            },
            {
                "box": {
                    "id": "obj-20092",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 274.0, 2379.0, 100.0, 22.0 ],
                    "text": "prepend save",
                    "varname": "linn_psave_strike_r"
                }
            },
            {
                "box": {
                    "id": "obj-20093",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1277.0, 1800.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetlimit_r"
                }
            },
            {
                "box": {
                    "filename": "linnsplit.router.js",
                    "id": "obj-20094",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 123.0, 187.0, 160.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "parameter_enable": 0
                    },
                    "text": "v8 linnsplit.router.js",
                    "textfile": {
                        "filename": "linnsplit.router.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "linnsplit_router"
                }
            },
            {
                "box": {
                    "id": "obj-20095",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 830.0, 270.0, 80.0, 22.0 ],
                    "text": "route l r",
                    "varname": "linnsplit_sideroute"
                }
            },
            {
                "box": {
                    "id": "obj-20099",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1680.0, 1009.0, 130.0, 22.0 ],
                    "text": "s linnsplit_r_curves",
                    "varname": "linn_scurvereset_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20100",
                    "maxclass": "number",
                    "maximum": 25,
                    "minimum": 2,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 940.0, 158.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 599.0, 327.0, 40.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 13 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "linnsplit_splitcol",
                            "parameter_mmax": 25.0,
                            "parameter_mmin": 2.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linnsplit_splitcol",
                            "parameter_type": 0
                        }
                    },
                    "varname": "linnsplit_splitcol"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-20101",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1120.0, 182.0, 80.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 519.0, 327.0, 80.0, 24.0 ],
                    "text": "split col",
                    "varname": "cmt_splitcol"
                }
            },
            {
                "box": {
                    "id": "obj-20102",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1120.0, 247.0, 100.0, 22.0 ],
                    "text": "prepend splitcol",
                    "varname": "linnsplit_psplitcol"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-30001",
                    "items": [ "red", ",", "yellow", ",", "green", ",", "cyan", ",", "blue", ",", "magenta", ",", "white", ",", "orange", ",", "lime", ",", "pink" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 998.0, 160.0, 90.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 739.0, 332.0, 102.0, 26.0 ],
                    "textcolor": [ 0.9255475997924805, 0.9250496029853821, 0.5176522731781006, 1.0 ],
                    "varname": "linnsplit_rootcolor_l"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 16.0,
                    "id": "obj-30002",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1094.0, 118.0, 100.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 654.0, 333.0, 85.0, 24.0 ],
                    "text": "root color",
                    "varname": "cmt_rootcolor_l"
                }
            },
            {
                "box": {
                    "id": "obj-30003",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1040.0, 214.0, 110.0, 22.0 ],
                    "text": "prepend rootcolor l",
                    "varname": "linnsplit_prootcolor_l"
                }
            },
            {
                "box": {
                    "id": "obj-30004",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1396.0, 362.0, 110.0, 22.0 ],
                    "text": "prepend setsymbol",
                    "varname": "linnsplit_setrootcolor_l"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-30005",
                    "items": [ "red", ",", "yellow", ",", "green", ",", "cyan", ",", "blue", ",", "magenta", ",", "white", ",", "orange", ",", "lime", ",", "pink" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 998.0, 1560.0, 90.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 531.0, 638.0, 103.0, 26.0 ],
                    "textcolor": [ 0.9255475997924805, 0.9250496029853821, 0.5176522731781006, 1.0 ],
                    "varname": "linnsplit_rootcolor_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontsize": 16.0,
                    "id": "obj-30006",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1094.0, 1518.0, 100.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 446.0, 639.0, 85.0, 24.0 ],
                    "text": "root color",
                    "varname": "cmt_rootcolor_r"
                }
            },
            {
                "box": {
                    "id": "obj-30007",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1094.0, 1584.0, 110.0, 22.0 ],
                    "text": "prepend rootcolor r",
                    "varname": "linnsplit_prootcolor_r"
                }
            },
            {
                "box": {
                    "id": "obj-30008",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1396.0, 1750.0, 110.0, 22.0 ],
                    "text": "prepend setsymbol",
                    "varname": "linnsplit_setrootcolor_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-120",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 11,
                    "numoutlets": 11,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 842.0, 362.0, 428.0, 35.0 ],
                    "text": "route scheme bend limit generator mossize harmonics subharmonics rootcolor palette shift",
                    "varname": "linnsplit_sidesettings_l"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-121",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 11,
                    "numoutlets": 11,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 842.0, 1798.0, 428.0, 35.0 ],
                    "text": "route scheme bend limit generator mossize harmonics subharmonics rootcolor palette shift",
                    "varname": "linnsplit_sidesettings_r"
                }
            },
            {
                "box": {
                    "comment": "left split: to vst~ (midievent)",
                    "id": "obj-40001",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 215.0, 780.0, 30.0, 30.0 ],
                    "varname": "out_vst_l"
                }
            },
            {
                "box": {
                    "filename": "hybridsplit.shift.js",
                    "id": "obj-60001",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 674.0, 1560.0, 180.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "parameter_enable": 0
                    },
                    "text": "v8 hybridsplit.shift.js",
                    "textfile": {
                        "filename": "hybridsplit.shift.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "hybridsplit_shift_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-60002",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 7,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 14.0, 1590.0, 340.0, 22.0 ],
                    "text": "linn.cv linnsplit_r_curves",
                    "varname": "linn_cv_r"
                }
            },
            {
                "box": {
                    "id": "obj-60003",
                    "linecount": 4,
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 708.0, 2020.0, 50.0, 62.0 ],
                    "text": "linn.slew~ hybrid_slewp",
                    "varname": "linn_slew_pitch_r"
                }
            },
            {
                "box": {
                    "id": "obj-60004",
                    "linecount": 4,
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 815.0, 2020.0, 50.0, 62.0 ],
                    "text": "linn.slew~ hybrid_slewz",
                    "varname": "linn_slew_press_r"
                }
            },
            {
                "box": {
                    "id": "obj-60005",
                    "linecount": 4,
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 869.0, 2020.0, 50.0, 62.0 ],
                    "text": "linn.slew~ hybrid_slewy",
                    "varname": "linn_slew_y_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-60006",
                    "maxclass": "number",
                    "maximum": 50,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1374.0, 1918.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 828.0, 699.0, 53.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_slew_r",
                            "parameter_mmax": 50.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_slew_r",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "linn_slew_r"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-60007",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1374.0, 1954.0, 100.0, 22.0 ],
                    "text": "prepend ms",
                    "varname": "linn_pslew_r"
                }
            },
            {
                "box": {
                    "id": "obj-60008",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1484.0, 1954.0, 100.0, 22.0 ],
                    "text": "s hybrid_slewp",
                    "varname": "linn_sslewp_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-60009",
                    "maxclass": "number",
                    "maximum": 50,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1754.0, 1912.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 831.0, 727.0, 50.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_slewpress_r",
                            "parameter_mmax": 50.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_slewpress_r",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "linn_slewpress_r"
                }
            },
            {
                "box": {
                    "id": "obj-60010",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1754.0, 1942.0, 100.0, 22.0 ],
                    "text": "prepend ms",
                    "varname": "linn_pslewpress_r"
                }
            },
            {
                "box": {
                    "id": "obj-60011",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1754.0, 1972.0, 100.0, 22.0 ],
                    "text": "s hybrid_slewz",
                    "varname": "linn_sslewpress_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-60012",
                    "maxclass": "number",
                    "maximum": 50,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1904.0, 1912.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 831.0, 757.0, 50.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_slewy_r",
                            "parameter_mmax": 50.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_slewy_r",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "linn_slewy_r"
                }
            },
            {
                "box": {
                    "id": "obj-60013",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1904.0, 1942.0, 100.0, 22.0 ],
                    "text": "prepend ms",
                    "varname": "linn_pslewy_r"
                }
            },
            {
                "box": {
                    "id": "obj-60014",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1904.0, 1972.0, 100.0, 22.0 ],
                    "text": "s hybrid_slewy",
                    "varname": "linn_sslewy_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-60015",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1374.0, 1894.0, 140.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 689.0, 699.0, 140.0, 24.0 ],
                    "text": "slides slew ms",
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "cmt_slew_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-60016",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1754.0, 1888.0, 140.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 689.0, 728.0, 140.0, 24.0 ],
                    "text": "press slew ms",
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "cmt_slewpress_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-60017",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1904.0, 1888.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 689.0, 758.0, 140.0, 24.0 ],
                    "text": "Y slew ms",
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "cmt_slewy_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-60018",
                    "maxclass": "number",
                    "maximum": 20,
                    "minimum": 2,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1134.0, 2012.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 831.0, 786.0, 50.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_trigms_r",
                            "parameter_mmax": 20.0,
                            "parameter_mmin": 2.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_trigms_r",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "linn_trigms_r"
                }
            },
            {
                "box": {
                    "id": "obj-60019",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1254.0, 2012.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 831.0, 817.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "linn_trigvel_r",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_trigvel_r",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_trigvel_r"
                }
            },
            {
                "box": {
                    "id": "obj-60020",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1414.0, 2012.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 831.0, 847.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "linn_triglen_r",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_triglen_r",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_triglen_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-60021",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1134.0, 1988.0, 100.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 689.0, 787.0, 140.0, 24.0 ],
                    "text": "trig ms",
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "cmt_trigms_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-60022",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1254.0, 1988.0, 150.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 689.0, 817.0, 140.0, 24.0 ],
                    "text": "vel > trig level",
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "cmt_trigvel_r"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-60023",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1414.0, 1988.0, 160.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 689.0, 847.0, 140.0, 24.0 ],
                    "text": "vel > trig length",
                    "textcolor": [ 0.6509803921568628, 0.7098039215686275, 1.0, 1.0 ],
                    "varname": "cmt_triglen_r"
                }
            },
            {
                "box": {
                    "id": "obj-60024",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1134.0, 2042.0, 100.0, 22.0 ],
                    "text": "prepend trigger",
                    "varname": "linn_ptrigms_r"
                }
            },
            {
                "box": {
                    "id": "obj-60025",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1254.0, 2042.0, 100.0, 22.0 ],
                    "text": "prepend trigvel",
                    "varname": "linn_ptrigvel_r"
                }
            },
            {
                "box": {
                    "id": "obj-60026",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1414.0, 2042.0, 100.0, 22.0 ],
                    "text": "prepend triglen",
                    "varname": "linn_ptriglen_r"
                }
            },
            {
                "box": {
                    "id": "obj-60027",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1534.0, 2088.0, 117.0, 22.0 ],
                    "text": "s linnsplit_r_cvcurve",
                    "varname": "linn_strig_r"
                }
            },
            {
                "box": {
                    "comment": "right split CV: pitch (0.1/oct, 0 = MIDI 60)",
                    "id": "obj-60028",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 265.0, 780.0, 30.0, 30.0 ],
                    "varname": "cv_out_pitch_r"
                }
            },
            {
                "box": {
                    "comment": "right split CV: gate (velocity)",
                    "id": "obj-60029",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 315.0, 780.0, 30.0, 30.0 ],
                    "varname": "cv_out_gate_r"
                }
            },
            {
                "box": {
                    "comment": "right split CV: pressure",
                    "id": "obj-60030",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 365.0, 780.0, 30.0, 30.0 ],
                    "varname": "cv_out_press_r"
                }
            },
            {
                "box": {
                    "comment": "right split CV: Y",
                    "id": "obj-60031",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 415.0, 780.0, 30.0, 30.0 ],
                    "varname": "cv_out_y_r"
                }
            },
            {
                "box": {
                    "comment": "right split CV: trigger",
                    "id": "obj-60032",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 465.0, 780.0, 30.0, 30.0 ],
                    "varname": "cv_out_trig_r"
                }
            },
            {
                "box": {
                    "comment": "right split CV: release velocity",
                    "id": "obj-60033",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 515.0, 780.0, 30.0, 30.0 ],
                    "varname": "cv_out_release_r"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-101", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-112", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-113", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "source": [ "obj-114", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "source": [ "obj-115", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-117", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60001", 0 ],
                    "source": [ "obj-119", 0 ]
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
                    "destination": [ "obj-101", 0 ],
                    "source": [ "obj-120", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-114", 0 ],
                    "order": 1,
                    "source": [ "obj-120", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 0 ],
                    "order": 0,
                    "source": [ "obj-120", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-120", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30004", 0 ],
                    "source": [ "obj-120", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "order": 0,
                    "source": [ "obj-120", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-120", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "order": 1,
                    "source": [ "obj-120", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "source": [ "obj-120", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 0 ],
                    "source": [ "obj-120", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-88", 0 ],
                    "source": [ "obj-120", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-90", 0 ],
                    "source": [ "obj-120", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-91", 0 ],
                    "source": [ "obj-120", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "source": [ "obj-121", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-115", 0 ],
                    "order": 1,
                    "source": [ "obj-121", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-119", 0 ],
                    "order": 0,
                    "source": [ "obj-121", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20001", 0 ],
                    "order": 0,
                    "source": [ "obj-121", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20005", 0 ],
                    "source": [ "obj-121", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20013", 0 ],
                    "source": [ "obj-121", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20032", 0 ],
                    "source": [ "obj-121", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20034", 0 ],
                    "source": [ "obj-121", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20060", 0 ],
                    "source": [ "obj-121", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20071", 0 ],
                    "order": 1,
                    "source": [ "obj-121", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20083", 0 ],
                    "source": [ "obj-121", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30008", 0 ],
                    "source": [ "obj-121", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-121", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 1 ],
                    "order": 2,
                    "source": [ "obj-14", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 1 ],
                    "midpoints": [ 400.0, 90.0 ],
                    "order": 0,
                    "source": [ "obj-14", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60002", 1 ],
                    "order": 1,
                    "source": [ "obj-14", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40001", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20094", 0 ],
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
                    "destination": [ "obj-11", 0 ],
                    "order": 1,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "order": 3,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20011", 0 ],
                    "order": 13,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20024", 0 ],
                    "order": 21,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20027", 0 ],
                    "order": 22,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20036", 0 ],
                    "order": 17,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20039", 0 ],
                    "order": 27,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20040", 0 ],
                    "order": 9,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20048", 0 ],
                    "order": 39,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20051", 0 ],
                    "order": 33,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20056", 0 ],
                    "order": 19,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20057", 0 ],
                    "order": 31,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20058", 0 ],
                    "order": 0,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20062", 0 ],
                    "order": 29,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20066", 0 ],
                    "order": 35,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20076", 0 ],
                    "order": 6,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20080", 0 ],
                    "order": 8,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30001", 0 ],
                    "order": 26,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30005", 0 ],
                    "order": 25,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "order": 28,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "order": 2,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "order": 38,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "order": 16,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "order": 12,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "order": 15,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "order": 37,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "order": 20,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "order": 14,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "order": 4,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "order": 7,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9012", 0 ],
                    "order": 34,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9013", 0 ],
                    "order": 30,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9015", 0 ],
                    "order": 18,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9019", 0 ],
                    "order": 32,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9020", 0 ],
                    "order": 23,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9021", 0 ],
                    "order": 10,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9035", 0 ],
                    "order": 5,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9046", 0 ],
                    "order": 40,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9048", 0 ],
                    "order": 36,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "order": 24,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "order": 11,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20058", 0 ],
                    "source": [ "obj-20001", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-20003", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20047", 0 ],
                    "source": [ "obj-20004", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20011", 0 ],
                    "source": [ "obj-20005", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20010", 0 ],
                    "source": [ "obj-20007", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20010", 0 ],
                    "source": [ "obj-20008", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20051", 0 ],
                    "midpoints": [ 534.5, 2629.0, 552.0, 2629.0, 552.0, 2369.0, 403.5, 2369.0 ],
                    "source": [ "obj-20010", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20052", 0 ],
                    "source": [ "obj-20010", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20081", 0 ],
                    "source": [ "obj-20011", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-20012", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20093", 0 ],
                    "source": [ "obj-20013", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-20014", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20082", 0 ],
                    "source": [ "obj-20015", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-20016", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20074", 0 ],
                    "source": [ "obj-20017", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60002", 0 ],
                    "source": [ "obj-20018", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20004", 0 ],
                    "source": [ "obj-20024", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-20025", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20010", 0 ],
                    "source": [ "obj-20026", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20025", 0 ],
                    "source": [ "obj-20027", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60002", 0 ],
                    "source": [ "obj-20030", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20076", 0 ],
                    "source": [ "obj-20032", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20042", 0 ],
                    "source": [ "obj-20034", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20055", 0 ],
                    "source": [ "obj-20036", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20030", 0 ],
                    "source": [ "obj-20037", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20090", 0 ],
                    "source": [ "obj-20038", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20050", 0 ],
                    "source": [ "obj-20039", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20054", 0 ],
                    "source": [ "obj-20040", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20080", 0 ],
                    "source": [ "obj-20042", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20090", 0 ],
                    "source": [ "obj-20044", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20092", 0 ],
                    "source": [ "obj-20046", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20090", 0 ],
                    "source": [ "obj-20047", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20086", 0 ],
                    "source": [ "obj-20048", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-20050", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20026", 0 ],
                    "source": [ "obj-20051", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20072", 0 ],
                    "source": [ "obj-20052", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20048", 0 ],
                    "midpoints": [ 154.5, 2629.0, 172.0, 2629.0, 172.0, 2369.0, 23.5, 2369.0 ],
                    "source": [ "obj-20053", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20085", 0 ],
                    "source": [ "obj-20053", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20079", 0 ],
                    "source": [ "obj-20054", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20082", 0 ],
                    "source": [ "obj-20055", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20012", 0 ],
                    "source": [ "obj-20056", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20077", 0 ],
                    "source": [ "obj-20057", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20003", 0 ],
                    "source": [ "obj-20058", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20014", 0 ],
                    "source": [ "obj-20059", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20039", 0 ],
                    "source": [ "obj-20060", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20038", 0 ],
                    "source": [ "obj-20062", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20053", 0 ],
                    "source": [ "obj-20063", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20046", 0 ],
                    "source": [ "obj-20066", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60002", 0 ],
                    "source": [ "obj-20071", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20016", 0 ],
                    "source": [ "obj-20076", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20007", 0 ],
                    "source": [ "obj-20077", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20028", 0 ],
                    "source": [ "obj-20078", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20082", 0 ],
                    "source": [ "obj-20079", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20059", 0 ],
                    "source": [ "obj-20080", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-20081", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20017", 0 ],
                    "source": [ "obj-20082", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20036", 0 ],
                    "midpoints": [ 1294.5, 2629.0, 1312.0, 2629.0, 1312.0, 2369.0, 1163.5, 2369.0 ],
                    "source": [ "obj-20082", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20056", 0 ],
                    "source": [ "obj-20083", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20065", 0 ],
                    "source": [ "obj-20085", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20053", 0 ],
                    "source": [ "obj-20086", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60002", 0 ],
                    "source": [ "obj-20087", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20062", 0 ],
                    "midpoints": [ 914.5, 2629.0, 932.0, 2629.0, 932.0, 2369.0, 783.5, 2369.0 ],
                    "source": [ "obj-20090", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20078", 0 ],
                    "source": [ "obj-20090", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20018", 0 ],
                    "source": [ "obj-20091", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20053", 0 ],
                    "source": [ "obj-20092", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20027", 0 ],
                    "source": [ "obj-20093", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60001", 0 ],
                    "source": [ "obj-20094", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9050", 0 ],
                    "source": [ "obj-20094", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-120", 0 ],
                    "source": [ "obj-20095", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-121", 0 ],
                    "source": [ "obj-20095", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-20095", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20102", 0 ],
                    "source": [ "obj-20100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-20102", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-25", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-29", 0 ]
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
                    "destination": [ "obj-30003", 0 ],
                    "source": [ "obj-30001", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-30003", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30001", 0 ],
                    "source": [ "obj-30004", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30007", 0 ],
                    "source": [ "obj-30005", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-30007", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30005", 0 ],
                    "source": [ "obj-30008", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-31", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-31", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-31", 2 ]
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
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "source": [ "obj-4", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-4", 0 ]
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
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-41", 0 ]
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
                    "destination": [ "obj-13", 0 ],
                    "midpoints": [ 2745.0, 572.0, 2745.0, 490.0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-47", 0 ]
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
                    "destination": [ "obj-15", 0 ],
                    "midpoints": [ 440.0, 200.0, 130.0, 178.0 ],
                    "source": [ "obj-49", 0 ]
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
                    "destination": [ "obj-15", 0 ],
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
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60002", 0 ],
                    "source": [ "obj-60001", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60003", 1 ],
                    "source": [ "obj-60002", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60003", 0 ],
                    "source": [ "obj-60002", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60004", 0 ],
                    "source": [ "obj-60002", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60005", 0 ],
                    "source": [ "obj-60002", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60029", 0 ],
                    "source": [ "obj-60002", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60032", 0 ],
                    "source": [ "obj-60002", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60033", 0 ],
                    "source": [ "obj-60002", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60028", 0 ],
                    "source": [ "obj-60003", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60030", 0 ],
                    "source": [ "obj-60004", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60031", 0 ],
                    "source": [ "obj-60005", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60007", 0 ],
                    "source": [ "obj-60006", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60008", 0 ],
                    "source": [ "obj-60007", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60010", 0 ],
                    "source": [ "obj-60009", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60011", 0 ],
                    "source": [ "obj-60010", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60013", 0 ],
                    "source": [ "obj-60012", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60014", 0 ],
                    "source": [ "obj-60013", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60024", 0 ],
                    "source": [ "obj-60018", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60025", 0 ],
                    "source": [ "obj-60019", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60026", 0 ],
                    "source": [ "obj-60020", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60027", 0 ],
                    "source": [ "obj-60024", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60027", 0 ],
                    "source": [ "obj-60025", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60027", 0 ],
                    "source": [ "obj-60026", 0 ]
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
                    "destination": [ "obj-85", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-112", 0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-99", 0 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "order": 2,
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "order": 0,
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60002", 0 ],
                    "order": 1,
                    "source": [ "obj-67", 0 ]
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
                    "destination": [ "obj-67", 0 ],
                    "source": [ "obj-68", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "source": [ "obj-68", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20095", 0 ],
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
                    "destination": [ "obj-20094", 0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-81", 0 ],
                    "source": [ "obj-75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-78", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-84", 0 ],
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-80", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-81", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-83", 0 ],
                    "source": [ "obj-82", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-83", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-84", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-85", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-86", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "source": [ "obj-88", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20100", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9001", 0 ],
                    "source": [ "obj-9000", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9043", 0 ],
                    "source": [ "obj-9001", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9006", 0 ],
                    "source": [ "obj-9003", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9012", 0 ],
                    "midpoints": [ 534.5, 1229.0, 552.0, 1229.0, 552.0, 969.0, 403.5, 969.0 ],
                    "source": [ "obj-9003", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9007", 0 ],
                    "source": [ "obj-9004", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9013", 0 ],
                    "midpoints": [ 914.5, 1229.0, 932.0, 1229.0, 932.0, 969.0, 783.5, 969.0 ],
                    "source": [ "obj-9004", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9008", 0 ],
                    "source": [ "obj-9005", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9015", 0 ],
                    "midpoints": [ 1294.5, 1229.0, 1312.0, 1229.0, 1312.0, 969.0, 1163.5, 969.0 ],
                    "source": [ "obj-9005", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9009", 0 ],
                    "source": [ "obj-9006", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9010", 0 ],
                    "source": [ "obj-9007", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9011", 0 ],
                    "source": [ "obj-9008", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9016", 0 ],
                    "source": [ "obj-9012", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9017", 0 ],
                    "source": [ "obj-9013", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9036", 0 ],
                    "source": [ "obj-9014", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9018", 0 ],
                    "source": [ "obj-9015", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9003", 0 ],
                    "source": [ "obj-9016", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9004", 0 ],
                    "source": [ "obj-9017", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9005", 0 ],
                    "source": [ "obj-9018", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9022", 0 ],
                    "source": [ "obj-9019", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9023", 0 ],
                    "source": [ "obj-9020", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9024", 0 ],
                    "source": [ "obj-9021", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9025", 0 ],
                    "source": [ "obj-9022", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9026", 0 ],
                    "source": [ "obj-9023", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9027", 0 ],
                    "source": [ "obj-9024", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9003", 0 ],
                    "source": [ "obj-9025", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9004", 0 ],
                    "source": [ "obj-9026", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9005", 0 ],
                    "source": [ "obj-9027", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9043", 0 ],
                    "source": [ "obj-9031", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9003", 0 ],
                    "source": [ "obj-9032", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9004", 0 ],
                    "source": [ "obj-9033", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9005", 0 ],
                    "source": [ "obj-9034", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9014", 0 ],
                    "source": [ "obj-9035", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20099", 0 ],
                    "order": 0,
                    "source": [ "obj-9036", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9037", 0 ],
                    "order": 1,
                    "source": [ "obj-9036", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9044", 0 ],
                    "source": [ "obj-9043", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9046", 0 ],
                    "midpoints": [ 154.5, 1229.0, 172.0, 1229.0, 172.0, 969.0, 23.5, 969.0 ],
                    "source": [ "obj-9043", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9045", 0 ],
                    "source": [ "obj-9044", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9047", 0 ],
                    "source": [ "obj-9046", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9043", 0 ],
                    "source": [ "obj-9047", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9000", 0 ],
                    "source": [ "obj-9048", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20010", 0 ],
                    "order": 4,
                    "source": [ "obj-9049", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20053", 0 ],
                    "order": 6,
                    "source": [ "obj-9049", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20082", 0 ],
                    "order": 0,
                    "source": [ "obj-9049", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20090", 0 ],
                    "order": 2,
                    "source": [ "obj-9049", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9003", 0 ],
                    "order": 5,
                    "source": [ "obj-9049", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9004", 0 ],
                    "order": 3,
                    "source": [ "obj-9049", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9005", 0 ],
                    "order": 1,
                    "source": [ "obj-9049", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9043", 0 ],
                    "order": 7,
                    "source": [ "obj-9049", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-9050", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9050", 0 ],
                    "source": [ "obj-9051", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-91", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-93", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-113", 0 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-98", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-99", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-11": [ "linn_lbend_l", "linn_lbend_l", 0 ],
            "obj-13": [ "linn_loffsetmenu", "linn_loffsetmenu", 0 ],
            "obj-14": [ "linn_scale", "linn_scale", 0 ],
            "obj-20011": [ "linn_lmossize_r", "linn_lmossize_r", 0 ],
            "obj-20027": [ "linn_llimit_r", "linn_llimit_r", 0 ],
            "obj-20037": [ "linn_onset_r", "linn_onset_r", 0 ],
            "obj-20039": [ "linn_lscheme_r", "linn_lscheme_r", 0 ],
            "obj-20056": [ "linn_lgenerator_r", "linn_lgenerator_r", 0 ],
            "obj-20058": [ "linn_lbend_r", "linn_lbend_r", 0 ],
            "obj-20076": [ "linn_lsubharmonics_r", "linn_lsubharmonics_r", 0 ],
            "obj-20080": [ "linn_lharmonics_r", "linn_lharmonics_r", 0 ],
            "obj-20091": [ "linn_vibrato_r", "linn_vibrato_r", 0 ],
            "obj-20100": [ "linnsplit_splitcol", "linnsplit_splitcol", 0 ],
            "obj-39": [ "linn_retuneon_l", "linn_retuneon_l", 0 ],
            "obj-45": [ "linn_vibrato_l", "linn_vibrato_l", 0 ],
            "obj-46": [ "linn_synthbend_l", "linn_synthbend_l", 0 ],
            "obj-5": [ "linn_lscheme_l", "linn_lscheme_l", 0 ],
            "obj-54": [ "linn_lroot", "linn_lroot", 0 ],
            "obj-60006": [ "linn_slew_r", "linn_slew_r", 0 ],
            "obj-60009": [ "linn_slewpress_r", "linn_slewpress_r", 0 ],
            "obj-60012": [ "linn_slewy_r", "linn_slewy_r", 0 ],
            "obj-60018": [ "linn_trigms_r", "linn_trigms_r", 0 ],
            "obj-60019": [ "linn_trigvel_r", "linn_trigvel_r", 0 ],
            "obj-60020": [ "linn_triglen_r", "linn_triglen_r", 0 ],
            "obj-73": [ "linn_lgenerator_l", "linn_lgenerator_l", 0 ],
            "obj-75": [ "linn_lmossize_l", "linn_lmossize_l", 0 ],
            "obj-76": [ "linn_onset_l", "linn_onset_l", 0 ],
            "obj-77": [ "linn_lharmonics_l", "linn_lharmonics_l", 0 ],
            "obj-79": [ "linn_lsubharmonics_l", "linn_lsubharmonics_l", 0 ],
            "obj-92": [ "linn_lmidisetup", "linn_lmidisetup", 0 ],
            "obj-93": [ "linn_llimit_l", "linn_llimit_l", 0 ],
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