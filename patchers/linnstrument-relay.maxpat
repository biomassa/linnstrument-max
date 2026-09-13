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
        "rect": [ 313.0, 1391.0, 1302.0, 988.0 ],
        "openinpresentation": 1,
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 290.0, 316.0, 110.0, 22.0 ],
                    "text": "prepend midisetup",
                    "varname": "linn_pmidisetup"
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 260.0, 316.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 477.0, 24.0, 24.0 ],
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
                    "id": "obj-37",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 288.0, 116.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 35.0, 477.0, 129.0, 24.0 ],
                    "text": "MIDI setup",
                    "varname": "cmt_midisetup"
                }
            },
            {
                "box": {
                    "id": "obj-22",
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
                    "id": "obj-15",
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
                    "id": "obj-13",
                    "items": [ "+10  387 c ~5/4", ",", "+8  310 c ~6/5", ",", "+9  348 c ~11/9", ",", "+11  426 c ~9/7", ",", "+6  232 c ~8/7", ",", "+7  271 c ~7/6", ",", "+5  194 c ~9/8", ",", "+14  542 c ~11/8", ",", "+13  503 c ~4/3", ",", "+12  465 c ~13/10", ",", "+4  155 c ~11/10", ",", "+3  116 c ~14/13", ",", "+2  77 c ~20/19", ",", "+1  39 c ~34/33", ",", "+16  619 c ~10/7  (doesn't fit)", ",", "+17  658 c ~16/11  (doesn't fit)", ",", "+15  581 c ~7/5  (doesn't fit)", ",", "+18  697 c ~3/2  (doesn't fit)", ",", "+19  735 c ~20/13  (doesn't fit)", ",", "+20  774 c ~11/7  (doesn't fit)", ",", "+21  813 c ~8/5  (doesn't fit)", ",", "+22  852 c ~13/8  (doesn't fit)", ",", "+23  890 c ~5/3  (doesn't fit)", ",", "+24  929 c ~12/7  (doesn't fit)", ",", "+25  968 c ~7/4  (doesn't fit)" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1653.0, 28.0, 110.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 583.0, 315.0, 130.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "+10  387 c ~5/4", "+8  310 c ~6/5", "+9  348 c ~11/9", "+11  426 c ~9/7", "+6  232 c ~8/7", "+7  271 c ~7/6", "+5  194 c ~9/8", "+14  542 c ~11/8", "+13  503 c ~4/3", "+12  465 c ~13/10", "+4  155 c ~11/10", "+3  116 c ~14/13", "+2  77 c ~20/19", "+1  39 c ~34/33", "+16  619 c ~10/7  (doesn't fit)", "+17  658 c ~16/11  (doesn't fit)", "+15  581 c ~7/5  (doesn't fit)", "+18  697 c ~3/2  (doesn't fit)", "+19  735 c ~20/13  (doesn't fit)", "+20  774 c ~11/7  (doesn't fit)", "+21  813 c ~8/5  (doesn't fit)", "+22  852 c ~13/8  (doesn't fit)", "+23  890 c ~5/3  (doesn't fit)", "+24  929 c ~12/7  (doesn't fit)", "+25  968 c ~7/4  (doesn't fit)" ],
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
                    "id": "obj-6",
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
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 2467.0, 540.0, 150.0, 22.0 ],
                    "restore": [ "{\"22edo.scl\":{\"scheme\":\"ji\",\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1},\"ji_11.scl\":{\"scheme\":\"wijmenga\",\"offset\":5,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1},\"31-edo.scl\":{\"scheme\":\"ji\",\"offset\":13,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":8,\"mossize\":3,\"harmonics\":16,\"subharmonics\":1,\"low\":-1},\"ji_13.scl\":{\"scheme\":\"kite\",\"offset\":5,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":3,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1},\"ji_17.scl\":{\"scheme\":\"ji\",\"offset\":7,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":5,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1}}" ],
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
                    "id": "obj-103",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 810.0, 226.0, 90.0, 22.0 ],
                    "text": "prepend onset",
                    "varname": "linn_ponset"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-102",
                    "maxclass": "number",
                    "maximum": 500,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 810.0, 202.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 794.0, 346.0, 57.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_ronset",
                            "parameter_mmax": 500.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_ronset",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.39215686274509803, 0.7058823529411765, 1.0, 1.0 ],
                    "varname": "linn_ronset"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-100",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 810.0, 178.0, 103.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 722.0, 347.0, 90.0, 24.0 ],
                    "text": "onset ms",
                    "textcolor": [ 0.39215686274509803, 0.7058823529411765, 1.0, 1.0 ],
                    "varname": "cmt_onset"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 690.0, 222.0, 110.0, 22.0 ],
                    "text": "prepend vibrato",
                    "varname": "linn_pvibrato"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "format": 6,
                    "id": "obj-92",
                    "maxclass": "flonum",
                    "maximum": 3.0,
                    "minimum": 1.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 690.0, 192.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 790.0, 315.0, 60.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_rvibrato",
                            "parameter_mmax": 3.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_rvibrato",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.39215686274509803, 0.7058823529411765, 1.0, 1.0 ],
                    "varname": "linn_rvibrato"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-78",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 690.0, 168.0, 89.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 722.0, 318.0, 76.0, 24.0 ],
                    "text": "vibrato",
                    "textcolor": [ 0.39215686274509803, 0.7058823529411765, 1.0, 1.0 ],
                    "varname": "cmt_vibrato"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 570.0, 196.0, 100.0, 22.0 ],
                    "text": "prepend voices",
                    "varname": "linn_pvoices"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-62",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 570.0, 164.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 62.0, 234.0, 58.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_rvoices",
                            "parameter_mmax": 16.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_rvoices",
                            "parameter_type": 0
                        }
                    },
                    "varname": "linn_rvoices"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-56",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 570.0, 140.0, 88.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 3.0, 235.0, 57.0, 24.0 ],
                    "text": "voices",
                    "varname": "cmt_voices"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-53",
                    "items": [ "AU DLS Synth 1", ",", "interapp MIDI Bus 1", ",", "UltraLite-mk5", ",", "LinnStrument MIDI", ",", "from Max 1", ",", "from Max 2", ",", "Vector Sequencer" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 420.0, 124.0, 130.0, 26.0 ],
                    "pattrmode": 1,
                    "presentation": 1,
                    "presentation_rect": [ 3.0, 446.0, 150.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "AU DLS Synth 1", "interapp MIDI Bus 1", "UltraLite-mk5", "LinnStrument MIDI", "from Max 1", "from Max 2", "Vector Sequencer" ],
                            "parameter_longname": "linn_rport",
                            "parameter_mmax": 6,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_rport",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_rport"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-47",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 340.0, 124.0, 98.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 5.0, 420.0, 128.0, 24.0 ],
                    "text": "MIDI out",
                    "varname": "cmt_port"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 44.0, 60.0, 22.0 ],
                    "text": "midiinfo",
                    "varname": "linn_rmidiinfo"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 230.0, 160.0, 100.0, 22.0 ],
                    "text": "prepend legato",
                    "varname": "linn_plegato"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 230.0, 124.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 155.0, 371.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "linn_rlegato",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_rlegato",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_rlegato"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 230.0, 100.0, 70.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 181.0, 371.0, 70.0, 20.0 ],
                    "text": "legato",
                    "varname": "cmt_legato"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 160.0, 100.0, 22.0 ],
                    "text": "prepend target",
                    "varname": "linn_ptarget"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "items": [ "k2600", ",", "mutantbrain", ",", "generic" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 30.0, 124.0, 110.0, 22.0 ],
                    "pattrmode": 1,
                    "presentation": 1,
                    "presentation_rect": [ 3.0, 156.0, 150.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "k2600", "mutantbrain", "generic" ],
                            "parameter_longname": "linn_rtarget",
                            "parameter_mmax": 2,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_rtarget",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_rtarget"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 100.0, 70.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 3.0, 132.0, 91.0, 20.0 ],
                    "text": "target",
                    "varname": "cmt_target"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 14.0, 250.0, 414.0, 22.0 ],
                    "text": "linn.relay",
                    "varname": "linn_relay"
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "populate" ],
                    "patching_rect": [ 180.0, 34.0, 70.0, 22.0 ],
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
                    "presentation_rect": [ 155.0, 340.0, 24.0, 24.0 ],
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
                    "patching_rect": [ 284.0, 4.0, 101.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 181.0, 340.0, 103.0, 24.0 ],
                    "text": "rescan folder",
                    "varname": "cmt_rescan"
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
                    "presentation_rect": [ 310.0, 316.0, 97.0, 24.0 ],
                    "text": "LED pattern",
                    "varname": "cmt_synthbend[1]"
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
                    "varname": "linn_pbendrange"
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
                    "presentation_rect": [ 446.0, 390.0, 64.0, 26.0 ],
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
                    "patching_rect": [ 2109.0, 6.0, 117.0, 42.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 1.0, 188.0, 105.0, 42.0 ],
                    "text": "Linnstrument PB range",
                    "varname": "cmt_bend"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-130",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1881.0, 6.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 310.0, 389.0, 40.0, 24.0 ],
                    "text": "root",
                    "varname": "cmt_root"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-128",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1767.0, 6.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 310.0, 366.0, 84.0, 24.0 ],
                    "text": "bottom-left",
                    "varname": "cmt_low"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-126",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1653.0, 6.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 505.0, 316.0, 79.0, 24.0 ],
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
                    "patching_rect": [ 1508.0, 6.0, 141.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 570.0, 365.0, 72.0, 24.0 ],
                    "text": "subharm",
                    "varname": "cmt_subharmonics"
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
                    "patching_rect": [ 1383.0, 6.0, 121.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 449.0, 365.0, 83.0, 24.0 ],
                    "text": "harmonics",
                    "varname": "cmt_harmonics"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-118",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1148.0, 6.0, 117.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 570.0, 339.0, 81.0, 24.0 ],
                    "text": "generator",
                    "varname": "cmt_generator"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-116",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1034.0, 6.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 310.0, 340.0, 61.0, 24.0 ],
                    "text": "primes",
                    "varname": "cmt_limit"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2348.0, 460.0, 80.0, 22.0 ],
                    "text": "prepend set",
                    "varname": "linn_lsetlow"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1767.0, 88.0, 100.0, 22.0 ],
                    "text": "prepend low",
                    "varname": "linn_lplow"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-95",
                    "maxclass": "number",
                    "maximum": 127,
                    "minimum": -1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1767.0, 28.0, 59.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 396.0, 365.0, 33.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_llow",
                            "parameter_mmin": -1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_llow",
                            "parameter_type": 0
                        }
                    },
                    "varname": "linn_llow"
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
                    "presentation_rect": [ 365.0, 338.0, 46.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "3", "5", "7", "11", "13" ],
                            "parameter_longname": "linn_llimit",
                            "parameter_mmax": 4,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_llimit",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_llimit"
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
                    "varname": "linn_llimitidx"
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
                    "varname": "linn_lsetsubharmonics"
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
                    "varname": "linn_lsetharmonics"
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
                    "varname": "linn_lharmidx"
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
                    "varname": "linn_lsetmossize"
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
                    "varname": "linn_lsetgenerator"
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1508.0, 88.0, 131.0, 22.0 ],
                    "text": "prepend subharmonics",
                    "varname": "linn_lpsubharmonics"
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1383.0, 88.0, 111.0, 22.0 ],
                    "text": "prepend harmonics",
                    "varname": "linn_lpharmonics"
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
                    "varname": "linn_lharmexpr"
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1269.0, 88.0, 100.0, 22.0 ],
                    "text": "prepend mossize",
                    "varname": "linn_lpmossize"
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1148.0, 88.0, 107.0, 22.0 ],
                    "text": "prepend generator",
                    "varname": "linn_lpgenerator"
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
                    "presentation_rect": [ 638.0, 365.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "linn_lsubharmonics",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lsubharmonics",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_lsubharmonics"
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
                    "patching_rect": [ 1383.0, 28.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 526.0, 364.0, 46.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "16", "32" ],
                            "parameter_longname": "linn_lharmonics",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lharmonics",
                            "parameter_type": 2
                        }
                    },
                    "varname": "linn_lharmonics"
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
                    "presentation_rect": [ 528.0, 338.0, 47.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "linn_lmossize",
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lmossize",
                            "parameter_type": 3
                        }
                    },
                    "varname": "linn_lmossize"
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
                    "presentation_rect": [ 645.0, 338.0, 58.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "linn_lgenerator",
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lgenerator",
                            "parameter_type": 3
                        }
                    },
                    "varname": "linn_lgenerator"
                }
            },
            {
                "box": {
                    "filename": "linn.preview.js",
                    "id": "obj-71",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 480.0, 560.0, 650.0, 208.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 159.0, 60.0, 710.0, 251.0 ],
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
                    "varname": "linn_lsetlimit"
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
                    "text": "prepend limit",
                    "varname": "linn_lplimit"
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
                    "presentation_rect": [ 345.0, 389.0, 38.0, 26.0 ],
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
                        "ji_11.scl": "{\"scheme\":\"wijmenga\",\"offset\":5,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1}",
                        "31-edo.scl": "{\"scheme\":\"ji\",\"offset\":13,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":8,\"mossize\":3,\"harmonics\":16,\"subharmonics\":1,\"low\":-1}",
                        "ji_13.scl": "{\"scheme\":\"kite\",\"offset\":5,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":3,\"root\":60,\"refhz\":0,\"generator\":0,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1}",
                        "ji_17.scl": "{\"scheme\":\"ji\",\"offset\":7,\"rootcolor\":\"magenta\",\"bend\":48,\"limit\":7,\"root\":60,\"refhz\":0,\"generator\":5,\"mossize\":0,\"harmonics\":16,\"subharmonics\":1,\"low\":-1}"
                    },
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 474.0, 332.0, 125.0, 22.0 ],
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
                    "varname": "linn_lsetbend"
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
                    "patching_rect": [ 2109.0, 88.0, 100.0, 22.0 ],
                    "text": "prepend bend",
                    "varname": "linn_lpbend"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 920.0, 88.0, 100.0, 22.0 ],
                    "text": "prepend scheme",
                    "varname": "linn_lpscheme"
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
                    "patching_rect": [ 2109.0, 52.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 97.0, 204.0, 36.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "linn_lbend",
                            "parameter_mmax": 96.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "linn_lbend",
                            "parameter_type": 0
                        }
                    },
                    "varname": "linn_lbend"
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
                    "presentation_rect": [ 403.0, 315.0, 100.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "root", "ji", "names", "mos", "chain", "moskeys", "wijmenga", "kite", "factors", "steps", "nested", "consonance", "harmonics" ],
                            "parameter_longname": "linn_lscheme",
                            "parameter_mmax": 12,
                            "parameter_modmode": 0,
                            "parameter_shortname": "linn_lscheme",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9255475997924805, 0.9250496029853821, 0.5176522731781006, 1.0 ],
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
                    "patching_rect": [ 920.0, 200.0, 100.0, 22.0 ],
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
                    "patching_rect": [ 14.0, 445.0, 141.0, 114.0 ],
                    "pattrstorage": "linnstrument-relay",
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 60.0, 149.0, 64.0 ],
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
                    "patching_rect": [ 14.0, 395.0, 171.0, 22.0 ],
                    "saved_object_attributes": {
                        "client_rect": [ 580, 87, 949, 304 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 583, 69, 1034, 197 ]
                    },
                    "text": "pattrstorage linnstrument-relay",
                    "varname": "linnstrument-relay"
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
                        "linn_lmidisetup": [ 1 ],
                        "linn_rlegato": [ 0 ],
                        "linn_ronset": [ 40 ],
                        "linn_rport": [ "AU DLS Synth 1" ],
                        "linn_rtarget": [ "k2600" ],
                        "linn_rvibrato": [ 2.5 ],
                        "linn_rvoices": [ 4 ],
                        "linn_scale": [ "31-edo.scl" ]
                    },
                    "text": "autopattr",
                    "varname": "linn_autopattr"
                }
            },
            {
                "box": {
                    "autopopulate": 1,
                    "fontsize": 16.0,
                    "id": "obj-14",
                    "items": [ "22edo.scl", ",", "31-edo.scl", ",", "ji_11.scl", ",", "ji_13.scl", ",", "ji_17.scl", ",", "ji_7.scl", ",", "ji_7a.scl", ",", "ji_8coh.scl", ",", "ji_9.scl", ",", "ji_9coh.scl" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 114.0, 62.0, 100.0, 26.0 ],
                    "pattrmode": 1,
                    "prefix": "SCL/",
                    "presentation": 1,
                    "presentation_rect": [ 159.0, 315.0, 147.0, 26.0 ],
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
                    "textcolor": [ 0.9254901960784314, 0.9254901960784314, 0.5176470588235295, 1.0 ],
                    "varname": "linn_scale"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 14.0, 278.0, 153.0, 22.0 ],
                    "saved_object_attributes": {
                        "alias": "",
                        "group": ""
                    },
                    "text": "maxmcp linnstrument-relay"
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
                    "presentation_rect": [ 59.0, 266.0, 46.0, 26.0 ],
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
                    "presentation_rect": [ 59.0, 295.0, 81.0, 26.0 ],
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
                    "presentation_rect": [ 59.0, 327.0, 64.0, 26.0 ],
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
                    "presentation_rect": [ 59.0, 355.0, 64.0, 26.0 ],
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
                    "presentation_rect": [ 60.0, 383.0, 63.0, 26.0 ],
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
                    "patching_rect": [ 1269.0, 6.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 448.0, 339.0, 84.0, 24.0 ],
                    "text": "MOS size",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "varname": "cmt_mossize"
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
                    "patching_rect": [ 1995.0, 6.0, 110.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 382.0, 390.0, 62.0, 24.0 ],
                    "text": "root Hz",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "varname": "cmt_refhz"
                }
            },
            {
                "box": {
                    "id": "obj-900",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 400.0, 8.0, 60.0, 22.0 ],
                    "text": "loadbang",
                    "varname": "linn_rloadbang"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 2467.0, 500.0, 260.0, 22.0 ],
                    "text": "route lightsstate offsetmenu offsetindex",
                    "varname": "linn_lstateroute"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-1", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "source": [ "obj-102", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
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
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-13", 0 ]
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
                    "destination": [ "obj-4", 1 ],
                    "order": 1,
                    "source": [ "obj-14", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
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
                    "order": 0,
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
                    "destination": [ "obj-5", 0 ],
                    "order": 9,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "order": 1,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "order": 10,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "order": 7,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "order": 6,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "order": 5,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "order": 4,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "order": 8,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "order": 2,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "midpoints": [ 2745.0, 572.0, 2745.0, 490.0 ],
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
                    "destination": [ "obj-35", 0 ],
                    "source": [ "obj-29", 1 ]
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
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-35", 0 ]
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
                    "destination": [ "obj-44", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-46", 0 ]
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
                    "destination": [ "obj-4", 0 ],
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
                    "destination": [ "obj-3", 0 ],
                    "midpoints": [ 905.0, 290.0, 905.0, 200.0 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 2 ],
                    "source": [ "obj-53", 1 ]
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
                    "source": [ "obj-6", 0 ]
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
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-62", 0 ]
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
                    "destination": [ "obj-4", 0 ],
                    "order": 1,
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
                    "destination": [ "obj-32", 0 ],
                    "order": 0,
                    "source": [ "obj-68", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "order": 1,
                    "source": [ "obj-68", 2 ]
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
                    "destination": [ "obj-91", 0 ],
                    "source": [ "obj-68", 3 ]
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
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "midpoints": [ 489.5, 235.0, 23.5, 235.0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "order": 0,
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "order": 1,
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
                    "destination": [ "obj-82", 0 ],
                    "source": [ "obj-77", 0 ]
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
                    "destination": [ "obj-79", 0 ],
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "source": [ "obj-900", 0 ]
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
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "source": [ "obj-95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-98", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 0 ],
                    "source": [ "obj-98", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-88", 0 ],
                    "source": [ "obj-98", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-90", 0 ],
                    "source": [ "obj-98", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "source": [ "obj-98", 4 ]
                }
            }
        ],
        "parameters": {
            "obj-102": [ "linn_ronset", "linn_ronset", 0 ],
            "obj-11": [ "linn_lbend", "linn_lbend", 0 ],
            "obj-13": [ "linn_loffsetmenu", "linn_loffsetmenu", 0 ],
            "obj-14": [ "linn_scale", "linn_scale", 0 ],
            "obj-29": [ "linn_rtarget", "linn_rtarget", 0 ],
            "obj-43": [ "linn_rlegato", "linn_rlegato", 0 ],
            "obj-46": [ "linn_lmidisetup", "linn_lmidisetup", 0 ],
            "obj-5": [ "linn_lscheme", "linn_lscheme", 0 ],
            "obj-53": [ "linn_rport", "linn_rport", 0 ],
            "obj-54": [ "linn_lroot", "linn_lroot", 0 ],
            "obj-62": [ "linn_rvoices", "linn_rvoices", 0 ],
            "obj-73": [ "linn_lgenerator", "linn_lgenerator", 0 ],
            "obj-75": [ "linn_lmossize", "linn_lmossize", 0 ],
            "obj-77": [ "linn_lharmonics", "linn_lharmonics", 0 ],
            "obj-79": [ "linn_lsubharmonics", "linn_lsubharmonics", 0 ],
            "obj-92": [ "linn_rvibrato", "linn_rvibrato", 0 ],
            "obj-93": [ "linn_llimit", "linn_llimit", 0 ],
            "obj-95": [ "linn_llow", "linn_llow", 0 ],
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