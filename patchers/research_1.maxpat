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
        "rect": [ -1078.0, 540.0, 1000.0, 780.0 ],
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "preset", "int", "preset", "int", "" ],
                    "patching_rect": [ 93.0, 430.0, 100.0, 40.0 ],
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
                    "patching_rect": [ 93.0, 380.0, 136.0, 22.0 ],
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
                    "patching_rect": [ 93.0, 330.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 93.0, 330.0, 100.0, 22.0 ],
                    "restore": {
                        "linn_scale": [ "22edo.scl" ],
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
                                    "blob": "10425.CMlaKA....fQPMDZ....ArTXoYG...vv....A........................................fRe6oPBh.WXzMFZhnSB6oPBIHxZkk2W18VZiU1bhnSBwvhBIjfHqUVde01ajIhNIDCKJjPBhrVY48kXk4FYhnSBxvhBIjfHqUVdeUmaoM2atIhNI.CKJjPBhrVY480YrkFYkIhNI.CKJjPBhLWYw8EauMVXrIhNIDCKJjPBhLWYw8EZuMGchnSBvvhBIjfHyUVbew1auAmH5jPLrnPBIHxbkE2WzIWZmIhNIDCKJjPBhLWYw8kbgQWYhnSBv3hL1XCLv.CKJjPBhLWYw8kbgQWZuIhNIDCKJjPBhLWYw8kbgQWYeAmH5j.LrnPBIHxbkE2WyQWYvMmH5jPL1vhBIjfHyUVbeMGckA2beAmH5j.LrnPBIHxbkE2WuYlYyUFchnSBvvhBIjfHyUVbe8lYlMWYz8EbhnSBvvhBIjfHyUVbeIWXtcVYhnSBwHCKJjPBhLWYw8Ub0ElazkldkIhNI.CKJjPBhLWYw80YrkFYkIhNI.CKJjPBhLWYw8Eb2IhNIXiLrnPBIHxbkE2W1EFa0U1WjUFagkmH5j.NrnPBIHxbkE2WvUGayU1WjUFagkmH5j.LrnPBIHxbkE2W1EFa0UFLhnSBvvhBIjfHyUVbeYWXrUWYwHhNI.CKJjPBhLWYw8kcgwVckIiH5j.LrnPBIHxbkE2W1EFa0U1LhnSBvvhBIjfHyUVbeYWXrUWYzHhNI.CKJjPBhLWYw8kcgwVckUiH5j.LrnPBIHxbkE2W1EFa0UlMhnSBvvhBIjfHyUVbeYWXrUWY2HhNI.CKJjPBhLWYw8kcgwVckgiH5jPLrnPBIHxbkE2W1EFa0UVNhnSBwvhBIjfHyUVbeYWXrUWYw.iH5jPLrnPBIHxbkE2W1EFa0UVLwHhNIDCKJjPBhLWYw8kcgwVckEiLhnSBwvhBIjfHyUVbeYWXrUWYwLiH5jPLrnPBIHxbkE2W1EFa0UVLzHhNIDCKJjPBhLWYw8kcgwVckESMhnSBwvhBIjfHyUVbeAWcrMWYvHhNIDCKJjPBhLWYw8Eb0w1bkEiH5j.LrnPBIHxbkE2WvUGayUlLhnSBvvhBIjfHyUVbeAWcrMWYyHhNI.CKJjPBhLWYw8Eb0w1bkQiH5j.LrnPBIHxbkE2WvUGayUVMhnSBvvhBIjfHyUVbeAWcrMWY1HhNI.CKJjPBhLWYw8Eb0w1bkciH5j.LrnPBIHxbkE2WvUGayUFNhnSBwvhBIjfHyUVbeAWcrMWY4HhNI.CKJjPBhLWYw8Eb0w1bkECLhnSBvvhBIjfHyUVbeAWcrMWYwDiH5j.LrnPBIHxbkE2WvUGayUVLxHhNI.CKJjPBhLWYw8Eb0w1bkEyLhnSBvvhBIjfHyUVbeAWcrMWYwPiH5j.LrnPBIHxbkE2WvUGayUVL0HhNI.CKJjPBhvlYu80alY1bkQmH5j.LrnPBIHBal81WuYlYyUFcegmH5jPKv3BLz.CLv.CKJjPBhvlYu80alY1bkQ2W4IhNIzhLtHyL0DyMzTVKvfCKJjPBhvlYu8kbgQWYhnSBv3hL3.CLv.CKJjPBhvlYu8EakYWYrIhNIDCKJjPBhvlYu8Ub0ElazkldkIhNI.CKJjPBhvlYu80alY1bkQ2WvIhNI.CKJjPBhvlYu8kbgQWYeAmH5jPKv3hLz.CLv.CKJjPBhvlYu8EakYWYr8EbhnSBv3RNz.CLv.CKJjPBhvlYu8kY041Xzk1atIhNIHxXoI2XrUlHrnPBIHhauk1bk8EbkE1ZyIhNITCKJjPBh31aoMWYecWZjQGZhnSBv3RN1.CLv.CKJjPBh31aoMWYeYVXrw1alYlH5j.Lt.SLv.CLvvhBIjfHt8VZyU1WuYlYyUFchnSBs.iKvDCLv.CLrnPBIHhauk1bk8kbgQWYhnSBw.CLv.CKJjPBh31aoMWYewVY1UFahnSBxvhBIjfHt8VZyU1WgUGcuIhNIDCKJjPBh31aoMWYeYVZrQWYxIhNI.CKJjPBh31aoMWYe8lYlMWYz8EbhnSBwvhBIjfHt8VZyU1WxEFck8EbhnSBvvhBIjfHt8VZyU1WrUlckw1WvIhNI.CKJjPBhTla1EyWgQGcgM1ZhnSBv3BLvDCLv.CKJjPBhTla1EyWjU1XgkmH5j.Lt.SLv.CLvvhBIjfHk4lcw70b0MGcgklahnSBv3BL4.CLv.CKJjPBhTla1EyWxUFakE1bkIhNIDiK0TCLv.CLrnPBIHRYtYWLewVY1UFahnSBwvhBIjfHk4lcw7Ed1UFahnSBwvhBIjfHk4lcw7UXzQWXis1WvIhNI.CKJjPBhTla1EyWjU1Xgk2WvIhNI.CKJjPBhTla1EyWxUFakE1bk8EbhnSBvvhBIjfHk4lcx7kbkAWYgQmH5j.LrnPBIHRYtYmLeQVYrEVdhnSBvvhBIjfHk4lcx7UXzQWXislH5j.Lt.CLw.CLvvhBIjfHk4lcx70b0MGcgklahnSBvvhBIjfHk4lcx7kbkwVYgMWYhnSBv3RLx.CLv.CKJjPBhTla1IyW3YWYrIhNI.CKJjPBhTla1IyW3Ula1EiH5jPLrnPBIHRYtYmLeQVYrEVdeAmH5j.LrnPBIHRYtYmLeEFczE1Xq8EbhnSBvvhBIjfHk4lcx7kbkAWYgQ2WvIhNIDCKJjPBhTla1IyWxUFakE1bk8EbhnSBvvhBIjfHmIWXt8EbuMWZzk1at8EdhnSBv3RM0.CLv.CKJjPBhblbg41Wv81boQWZu41W4IhNIDCKJjPBhblbg41WxEFck8kauk1bkIhNI.CKJjPBhblbg41WxEFckIhNIDCKJjPBhblbg41WjUlaykFc4IhNIPCKJjPBhblbg41WvkFciglH5j.LrnPBIHxYxElaeAWZzMFZeUla1IhNIHiK4fCLxLiLk0BL3vhBIjfHmIWXt8Ebg4lH5jPKx3hLyTSL2PSYs.CNrnPBIHxYxElaeY1arw1a2IhNIDCKJjPBhblbg41Wy01auQGZhnSBwvhBIjfHmIWXt80cxEFbhnSBwvhBIjfHmIWXt8EbuMWZzk1at8EdeAmH5j.LtHCNv.CLvvhBIjfHmIWXt8EbuMWZzk1at8UdeAmH5jPLrnPBIHxYxElaeIWXzU1WvIhNIDCKJjPBhblbg41WjUlaykFc48EbhnSBwvhBIjfHmIWXt8EboQ2Xn8EbhnSBwvhBIjfHmIWXt8EboQ2Xn8Eao41WvIhNI.CKJjPBhblbg41WvkFcig1Wk4lceAmH5jPLrnPBIHxYxElaeAWXt8EbhnSBvvhBIjfHmEFck8EakYWYrIhNI.CKJjPBhbVXzU1Ws8FYkIhNIDCKJjPBhbVXzU1WjU1XgkmH5jfLrnPBIHxYgQWYewVYgslH5j.LtTCNv.CLvvhBIjfHmEFck8EakYWYr8EbhnSBv3hM3.CLv.CKJjPBhHWYy8EbuMWZzk1atIhNI.iKzXCLv.CLrnPBIHhbkM2WhIWZmgFctU1byIhNI.CKJjPBhHWYy8EboQ2XnIhNIHiLvvhBIjfHxU1be41atwVZtIhNI.CKJjPBhHWYy80b0MGcgklahnSBv3xM2.CLv.CKJjPBhHWYy8Ebg4lH5j.LtPSLv.CLvvhBIjfHxU1be01ajUlH5jfHrElbmUFHyAmbo41YhvhBIjfHxU1beA2aykFco8laeAmH5j.LtTiMv.CLvvhBIjfHxU1beIlbocFZz4VYyM2WvIhNI.iK3.CLv.CLrnPBIHhbkM2WvkFcig1WvIhNIDCKJjPBhHWYy8EboQ2Xn8Eao41WvIhNI.CKJjPBhHWYy8kau4Fao41WvIhNI.iK0.CLv.CLrnPBIHhbkM2WyU2bzEVZt8EbhnSBsHiKxLSMwbCMk0BL3vhBIjfHxU1beAWXt8EbhnSBsHiKxLSMwbCMk0BL3vhBIjfHxU1be0VZ380ckQmH5j.LtPiLv.CLvvhBIjfHxU1be0VZ38EYxkmH5j.LtTCLv.CLvvhBIjfHh8FY48EbuMWZzk1at8EdhnSBv3RMv.CLv.CKJjPBhH1ajk2Wv81boQWZu41W4IhNI.iKyHCLv.CLrnPBIHhXuQVde41atwVZtIhNI.iK2fCLv.CLrnPBIHhXuQVdeQ2atUlH5j.LrnPBIHhXuQVdeAWZzMFZhnSBwvhBIjfHh8FY480b0MGcgklahnSBv3xLy.CLv.CKJjPBhH1ajk2WvkFcig1Ws8FYkIhNIHCKJjPBhH1ajk2Ws8FYkIhNIHhYxEVakABYxUWahvhBIjfHh8FY48EbuMWZzk1at8EdeAmH5jPKw3RLwbSM3bSYs.CNrnPBIHhXuQVdeA2aykFco8laek2WvIhNI.iK0.CLv.CLrnPBIHhXuQVde41atwVZt8EbhnSBvvhBIjfHh8FY48Ecu4VYeAmH5j.LtfCNv.CLvvhBIjfHh8FY48EboQ2Xn8EbhnSBwvhBIjfHh8FY480b0MGcgklaeAmH5j.LtLCMv.CLvvhBIjfHh8FY48Uaog2W2UFchnSBwvhBIjfHh8FY48Uaog2WjIWdhnSBv3BMy.CLv.CKJjPBh7VczAWcz8EcowFchnSBsLCKJjPBh7VczAWcz80Xn8lb0MmH5j.LrnPBIHxa0QGb0Q2WrkVaoQmH5jPLrnPBIHBbgQ2XnUlbe0VXzIWZ3IhNIrmBIjPBhPWdvUlH5jfHyk1YtEFahvhBIjPBhbWZjQGZhnSBwbCKJjPBIHBZkk1YnQmH5j.MzvhBIjPBhPVYvQGZhnSBwvhBIjPBhPVXzElH5jvVvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvzkBIjPernPBIHxZkk2WyMVXrUlH5jfHwHSKkEWcgwlHrnPBIHxZkk2Ws8FYe0Fbk8EdhnSB2LCKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHxbkE2WxEFck8Ub0ElazkldkIhNI.CKJjPBh.mbkMWYzIhNIHxRgklcuABbkI2X0M2bo8lauXVZlQWdfbVXrw1atABcg41ZhvhBIjfHyEVavwVYe4VXsUlH5jfHSkmazgVYzk1Xu31aoMWYr.Bbo41ZfP2afbGZoQWYtbWX1IBKJjPBhzVXqUlbe4VXsUlH5jfHMEFYx8lagABSgI1bhvhBIjfHgAGbe4VXsUlH5jfHKEVZ18lHrnPBIHRXvA2W1Ulbyk1atIhNIXyM3PSMJjPernPBhTla1klbu4Vak4FchnSB6oPBIHBbx8FcuM1arIhNI.CKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHRYjkFcuI2Wg4VZsIhNIDCKJjPBhTFYoQ2ax8kXuUmajMmH5jvdJjPBIHBc4AWYhnSBhLWZm4VXrIBKJjPBIHxcoQFcnIhNIPCKJjPBIHBZkk1YnQmH5jPLrnPBIjfHjUFbzglH5jPLrnPBIjfHjEFcgIhNIrELr.BLr.RN1bCKfTiLzzkBIjPernPBIHRYjkFcuI2WtUWahnSBwvhBIjfHuM2XeUlagIFakQlH5j.LrnPBIHxayM1Wv8lbz80alY1bkQmH5j.LrnPBIHRagsVYx8kag0VYhnSBhzTXjI2atEFHLElXyIBKJjPBhDFbv8kag0VYhnSBhrTXoY2aEQVZz8lbhvhBIjfHgAGbeYWYxMWZu4lH5jfM2fCM0nPB8oPe"
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
                    "patching_rect": [ 420.0, 180.0, 100.0, 22.0 ],
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
                    "patching_rect": [ 520.0, 110.0, 100.0, 22.0 ],
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
                    "patching_rect": [ 93.0, 263.0, 104.0, 22.0 ],
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
                    "patching_rect": [ 695.0, 152.0, 31.0, 22.0 ],
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
                    "patching_rect": [ 654.0, 236.0, 93.0, 22.0 ],
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
                            "blob": "10425.CMlaKA....fQPMDZ....ArTXoYG...vv....A........................................fRe6oPBh.WXzMFZhnSB6oPBIHxZkk2W18VZiU1bhnSBwvhBIjfHqUVde01ajIhNIDCKJjPBhrVY48kXk4FYhnSBxvhBIjfHqUVdeUmaoM2atIhNI.CKJjPBhrVY480YrkFYkIhNI.CKJjPBhLWYw8EauMVXrIhNIDCKJjPBhLWYw8EZuMGchnSBvvhBIjfHyUVbew1auAmH5jPLrnPBIHxbkE2WzIWZmIhNIDCKJjPBhLWYw8kbgQWYhnSBv3hL1XCLv.CKJjPBhLWYw8kbgQWZuIhNIDCKJjPBhLWYw8kbgQWYeAmH5j.LrnPBIHxbkE2WyQWYvMmH5jPL1vhBIjfHyUVbeMGckA2beAmH5j.LrnPBIHxbkE2WuYlYyUFchnSBvvhBIjfHyUVbe8lYlMWYz8EbhnSBvvhBIjfHyUVbeIWXtcVYhnSBwHCKJjPBhLWYw8Ub0ElazkldkIhNI.CKJjPBhLWYw80YrkFYkIhNI.CKJjPBhLWYw8Eb2IhNIXiLrnPBIHxbkE2W1EFa0U1WjUFagkmH5j.NrnPBIHxbkE2WvUGayU1WjUFagkmH5j.LrnPBIHxbkE2W1EFa0UFLhnSBvvhBIjfHyUVbeYWXrUWYwHhNI.CKJjPBhLWYw8kcgwVckIiH5j.LrnPBIHxbkE2W1EFa0U1LhnSBvvhBIjfHyUVbeYWXrUWYzHhNI.CKJjPBhLWYw8kcgwVckUiH5j.LrnPBIHxbkE2W1EFa0UlMhnSBvvhBIjfHyUVbeYWXrUWY2HhNI.CKJjPBhLWYw8kcgwVckgiH5jPLrnPBIHxbkE2W1EFa0UVNhnSBwvhBIjfHyUVbeYWXrUWYw.iH5jPLrnPBIHxbkE2W1EFa0UVLwHhNIDCKJjPBhLWYw8kcgwVckEiLhnSBwvhBIjfHyUVbeYWXrUWYwLiH5jPLrnPBIHxbkE2W1EFa0UVLzHhNIDCKJjPBhLWYw8kcgwVckESMhnSBwvhBIjfHyUVbeAWcrMWYvHhNIDCKJjPBhLWYw8Eb0w1bkEiH5j.LrnPBIHxbkE2WvUGayUlLhnSBvvhBIjfHyUVbeAWcrMWYyHhNI.CKJjPBhLWYw8Eb0w1bkQiH5j.LrnPBIHxbkE2WvUGayUVMhnSBvvhBIjfHyUVbeAWcrMWY1HhNI.CKJjPBhLWYw8Eb0w1bkciH5j.LrnPBIHxbkE2WvUGayUFNhnSBwvhBIjfHyUVbeAWcrMWY4HhNI.CKJjPBhLWYw8Eb0w1bkECLhnSBvvhBIjfHyUVbeAWcrMWYwDiH5j.LrnPBIHxbkE2WvUGayUVLxHhNI.CKJjPBhLWYw8Eb0w1bkEyLhnSBvvhBIjfHyUVbeAWcrMWYwPiH5j.LrnPBIHxbkE2WvUGayUVL0HhNI.CKJjPBhvlYu80alY1bkQmH5j.LrnPBIHBal81WuYlYyUFcegmH5jPKv3BLz.CLv.CKJjPBhvlYu80alY1bkQ2W4IhNIzhLtHyL0DyMzTVKvfCKJjPBhvlYu8kbgQWYhnSBv3hL3.CLv.CKJjPBhvlYu8EakYWYrIhNIDCKJjPBhvlYu8Ub0ElazkldkIhNI.CKJjPBhvlYu80alY1bkQ2WvIhNI.CKJjPBhvlYu8kbgQWYeAmH5jPKv3hLz.CLv.CKJjPBhvlYu8EakYWYr8EbhnSBv3RNz.CLv.CKJjPBhvlYu8kY041Xzk1atIhNIHxXoI2XrUlHrnPBIHhauk1bk8EbkE1ZyIhNITCKJjPBh31aoMWYecWZjQGZhnSBv3RN1.CLv.CKJjPBh31aoMWYeYVXrw1alYlH5j.Lt.SLv.CLvvhBIjfHt8VZyU1WuYlYyUFchnSBs.iKvDCLv.CLrnPBIHhauk1bk8kbgQWYhnSBw.CLv.CKJjPBh31aoMWYewVY1UFahnSBxvhBIjfHt8VZyU1WgUGcuIhNIDCKJjPBh31aoMWYeYVZrQWYxIhNI.CKJjPBh31aoMWYe8lYlMWYz8EbhnSBwvhBIjfHt8VZyU1WxEFck8EbhnSBvvhBIjfHt8VZyU1WrUlckw1WvIhNI.CKJjPBhTla1EyWgQGcgM1ZhnSBv3BLvDCLv.CKJjPBhTla1EyWjU1XgkmH5j.Lt.SLv.CLvvhBIjfHk4lcw70b0MGcgklahnSBv3BL4.CLv.CKJjPBhTla1EyWxUFakE1bkIhNIDiK0TCLv.CLrnPBIHRYtYWLewVY1UFahnSBwvhBIjfHk4lcw7Ed1UFahnSBwvhBIjfHk4lcw7UXzQWXis1WvIhNI.CKJjPBhTla1EyWjU1Xgk2WvIhNI.CKJjPBhTla1EyWxUFakE1bk8EbhnSBvvhBIjfHk4lcx7kbkAWYgQmH5j.LrnPBIHRYtYmLeQVYrEVdhnSBvvhBIjfHk4lcx7UXzQWXislH5j.Lt.CLw.CLvvhBIjfHk4lcx70b0MGcgklahnSBvvhBIjfHk4lcx7kbkwVYgMWYhnSBv3RLx.CLv.CKJjPBhTla1IyW3YWYrIhNI.CKJjPBhTla1IyW3Ula1EiH5jPLrnPBIHRYtYmLeQVYrEVdeAmH5j.LrnPBIHRYtYmLeEFczE1Xq8EbhnSBvvhBIjfHk4lcx7kbkAWYgQ2WvIhNIDCKJjPBhTla1IyWxUFakE1bk8EbhnSBvvhBIjfHmIWXt8EbuMWZzk1at8EdhnSBv3RM0.CLv.CKJjPBhblbg41Wv81boQWZu41W4IhNIDCKJjPBhblbg41WxEFck8kauk1bkIhNI.CKJjPBhblbg41WxEFckIhNIDCKJjPBhblbg41WjUlaykFc4IhNIPCKJjPBhblbg41WvkFciglH5j.LrnPBIHxYxElaeAWZzMFZeUla1IhNIHiK4fCLxLiLk0BL3vhBIjfHmIWXt8Ebg4lH5jPKx3hLyTSL2PSYs.CNrnPBIHxYxElaeY1arw1a2IhNIDCKJjPBhblbg41Wy01auQGZhnSBwvhBIjfHmIWXt80cxEFbhnSBwvhBIjfHmIWXt8EbuMWZzk1at8EdeAmH5j.LtHCNv.CLvvhBIjfHmIWXt8EbuMWZzk1at8UdeAmH5jPLrnPBIHxYxElaeIWXzU1WvIhNIDCKJjPBhblbg41WjUlaykFc48EbhnSBwvhBIjfHmIWXt8EboQ2Xn8EbhnSBwvhBIjfHmIWXt8EboQ2Xn8Eao41WvIhNI.CKJjPBhblbg41WvkFcig1Wk4lceAmH5jPLrnPBIHxYxElaeAWXt8EbhnSBvvhBIjfHmEFck8EakYWYrIhNI.CKJjPBhbVXzU1Ws8FYkIhNIDCKJjPBhbVXzU1WjU1XgkmH5jfLrnPBIHxYgQWYewVYgslH5j.LtTCNv.CLvvhBIjfHmEFck8EakYWYr8EbhnSBv3hM3.CLv.CKJjPBhHWYy8EbuMWZzk1atIhNI.iKzXCLv.CLrnPBIHhbkM2WhIWZmgFctU1byIhNI.CKJjPBhHWYy8EboQ2XnIhNIHiLvvhBIjfHxU1be41atwVZtIhNI.CKJjPBhHWYy80b0MGcgklahnSBv3xM2.CLv.CKJjPBhHWYy8Ebg4lH5j.LtPSLv.CLvvhBIjfHxU1be01ajUlH5jfHrElbmUFHyAmbo41YhvhBIjfHxU1beA2aykFco8laeAmH5j.LtTiMv.CLvvhBIjfHxU1beIlbocFZz4VYyM2WvIhNI.iK3.CLv.CLrnPBIHhbkM2WvkFcig1WvIhNIDCKJjPBhHWYy8EboQ2Xn8Eao41WvIhNI.CKJjPBhHWYy8kau4Fao41WvIhNI.iK0.CLv.CLrnPBIHhbkM2WyU2bzEVZt8EbhnSBsHiKxLSMwbCMk0BL3vhBIjfHxU1beAWXt8EbhnSBsHiKxLSMwbCMk0BL3vhBIjfHxU1be0VZ380ckQmH5j.LtPiLv.CLvvhBIjfHxU1be0VZ38EYxkmH5j.LtTCLv.CLvvhBIjfHh8FY48EbuMWZzk1at8EdhnSBv3RMv.CLv.CKJjPBhH1ajk2Wv81boQWZu41W4IhNI.iKyHCLv.CLrnPBIHhXuQVde41atwVZtIhNI.iK2fCLv.CLrnPBIHhXuQVdeQ2atUlH5j.LrnPBIHhXuQVdeAWZzMFZhnSBwvhBIjfHh8FY480b0MGcgklahnSBv3xLy.CLv.CKJjPBhH1ajk2WvkFcig1Ws8FYkIhNIHCKJjPBhH1ajk2Ws8FYkIhNIHhYxEVakABYxUWahvhBIjfHh8FY48EbuMWZzk1at8EdeAmH5jPKw3RLwbSM3bSYs.CNrnPBIHhXuQVdeA2aykFco8laek2WvIhNI.iK0.CLv.CLrnPBIHhXuQVde41atwVZt8EbhnSBvvhBIjfHh8FY48Ecu4VYeAmH5j.LtfCNv.CLvvhBIjfHh8FY48EboQ2Xn8EbhnSBwvhBIjfHh8FY480b0MGcgklaeAmH5j.LtLCMv.CLvvhBIjfHh8FY48Uaog2W2UFchnSBwvhBIjfHh8FY48Uaog2WjIWdhnSBv3BMy.CLv.CKJjPBh7VczAWcz8EcowFchnSBsLCKJjPBh7VczAWcz80Xn8lb0MmH5j.LrnPBIHxa0QGb0Q2WrkVaoQmH5jPLrnPBIHBbgQ2XnUlbe0VXzIWZ3IhNIrmBIjPBhPWdvUlH5jfHyk1YtEFahvhBIjPBhbWZjQGZhnSBwbCKJjPBIHBZkk1YnQmH5j.MzvhBIjPBhPVYvQGZhnSBwvhBIjPBhPVXzElH5jvVvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvzkBIjPernPBIHxZkk2WyMVXrUlH5jfHwHSKkEWcgwlHrnPBIHxZkk2Ws8FYe0Fbk8EdhnSB2LCKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHxbkE2WxEFck8Ub0ElazkldkIhNI.CKJjPBh.mbkMWYzIhNIHxRgklcuABbkI2X0M2bo8lauXVZlQWdfbVXrw1atABcg41ZhvhBIjfHyEVavwVYe4VXsUlH5jfHSkmazgVYzk1Xu31aoMWYr.Bbo41ZfP2afbGZoQWYtbWX1IBKJjPBhzVXqUlbe4VXsUlH5jfHMEFYx8lagABSgI1bhvhBIjfHgAGbe4VXsUlH5jfHKEVZ18lHrnPBIHRXvA2W1Ulbyk1atIhNIXyM3PSMJjPernPBhTla1klbu4Vak4FchnSB6oPBIHBbx8FcuM1arIhNI.CKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHRYjkFcuI2Wg4VZsIhNIDCKJjPBhTFYoQ2ax8kXuUmajMmH5jvdJjPBIHBc4AWYhnSBhLWZm4VXrIBKJjPBIHxcoQFcnIhNIPCKJjPBIHBZkk1YnQmH5jPLrnPBIjfHjUFbzglH5jPLrnPBIjfHjEFcgIhNIrELr.BLr.RN1bCKfTiLzzkBIjPernPBIHRYjkFcuI2WtUWahnSBwvhBIjfHuM2XeUlagIFakQlH5j.LrnPBIHxayM1Wv8lbz80alY1bkQmH5j.LrnPBIHRagsVYx8kag0VYhnSBhzTXjI2atEFHLElXyIBKJjPBhDFbv8kag0VYhnSBhrTXoY2aEQVZz8lbhvhBIjfHgAGbeYWYxMWZu4lH5jfM2fCM0nPB8oPe"
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
                                        "blob": "10425.CMlaKA....fQPMDZ....ArTXoYG...vv....A........................................fRe6oPBh.WXzMFZhnSB6oPBIHxZkk2W18VZiU1bhnSBwvhBIjfHqUVde01ajIhNIDCKJjPBhrVY48kXk4FYhnSBxvhBIjfHqUVdeUmaoM2atIhNI.CKJjPBhrVY480YrkFYkIhNI.CKJjPBhLWYw8EauMVXrIhNIDCKJjPBhLWYw8EZuMGchnSBvvhBIjfHyUVbew1auAmH5jPLrnPBIHxbkE2WzIWZmIhNIDCKJjPBhLWYw8kbgQWYhnSBv3hL1XCLv.CKJjPBhLWYw8kbgQWZuIhNIDCKJjPBhLWYw8kbgQWYeAmH5j.LrnPBIHxbkE2WyQWYvMmH5jPL1vhBIjfHyUVbeMGckA2beAmH5j.LrnPBIHxbkE2WuYlYyUFchnSBvvhBIjfHyUVbe8lYlMWYz8EbhnSBvvhBIjfHyUVbeIWXtcVYhnSBwHCKJjPBhLWYw8Ub0ElazkldkIhNI.CKJjPBhLWYw80YrkFYkIhNI.CKJjPBhLWYw8Eb2IhNIXiLrnPBIHxbkE2W1EFa0U1WjUFagkmH5j.NrnPBIHxbkE2WvUGayU1WjUFagkmH5j.LrnPBIHxbkE2W1EFa0UFLhnSBvvhBIjfHyUVbeYWXrUWYwHhNI.CKJjPBhLWYw8kcgwVckIiH5j.LrnPBIHxbkE2W1EFa0U1LhnSBvvhBIjfHyUVbeYWXrUWYzHhNI.CKJjPBhLWYw8kcgwVckUiH5j.LrnPBIHxbkE2W1EFa0UlMhnSBvvhBIjfHyUVbeYWXrUWY2HhNI.CKJjPBhLWYw8kcgwVckgiH5jPLrnPBIHxbkE2W1EFa0UVNhnSBwvhBIjfHyUVbeYWXrUWYw.iH5jPLrnPBIHxbkE2W1EFa0UVLwHhNIDCKJjPBhLWYw8kcgwVckEiLhnSBwvhBIjfHyUVbeYWXrUWYwLiH5jPLrnPBIHxbkE2W1EFa0UVLzHhNIDCKJjPBhLWYw8kcgwVckESMhnSBwvhBIjfHyUVbeAWcrMWYvHhNIDCKJjPBhLWYw8Eb0w1bkEiH5j.LrnPBIHxbkE2WvUGayUlLhnSBvvhBIjfHyUVbeAWcrMWYyHhNI.CKJjPBhLWYw8Eb0w1bkQiH5j.LrnPBIHxbkE2WvUGayUVMhnSBvvhBIjfHyUVbeAWcrMWY1HhNI.CKJjPBhLWYw8Eb0w1bkciH5j.LrnPBIHxbkE2WvUGayUFNhnSBwvhBIjfHyUVbeAWcrMWY4HhNI.CKJjPBhLWYw8Eb0w1bkECLhnSBvvhBIjfHyUVbeAWcrMWYwDiH5j.LrnPBIHxbkE2WvUGayUVLxHhNI.CKJjPBhLWYw8Eb0w1bkEyLhnSBvvhBIjfHyUVbeAWcrMWYwPiH5j.LrnPBIHxbkE2WvUGayUVL0HhNI.CKJjPBhvlYu80alY1bkQmH5j.LrnPBIHBal81WuYlYyUFcegmH5jPKv3BLz.CLv.CKJjPBhvlYu80alY1bkQ2W4IhNIzhLtHyL0DyMzTVKvfCKJjPBhvlYu8kbgQWYhnSBv3hL3.CLv.CKJjPBhvlYu8EakYWYrIhNIDCKJjPBhvlYu8Ub0ElazkldkIhNI.CKJjPBhvlYu80alY1bkQ2WvIhNI.CKJjPBhvlYu8kbgQWYeAmH5jPKv3hLz.CLv.CKJjPBhvlYu8EakYWYr8EbhnSBv3RNz.CLv.CKJjPBhvlYu8kY041Xzk1atIhNIHxXoI2XrUlHrnPBIHhauk1bk8EbkE1ZyIhNITCKJjPBh31aoMWYecWZjQGZhnSBv3RN1.CLv.CKJjPBh31aoMWYeYVXrw1alYlH5j.Lt.SLv.CLvvhBIjfHt8VZyU1WuYlYyUFchnSBs.iKvDCLv.CLrnPBIHhauk1bk8kbgQWYhnSBw.CLv.CKJjPBh31aoMWYewVY1UFahnSBxvhBIjfHt8VZyU1WgUGcuIhNIDCKJjPBh31aoMWYeYVZrQWYxIhNI.CKJjPBh31aoMWYe8lYlMWYz8EbhnSBwvhBIjfHt8VZyU1WxEFck8EbhnSBvvhBIjfHt8VZyU1WrUlckw1WvIhNI.CKJjPBhTla1EyWgQGcgM1ZhnSBv3BLvDCLv.CKJjPBhTla1EyWjU1XgkmH5j.Lt.SLv.CLvvhBIjfHk4lcw70b0MGcgklahnSBv3BL4.CLv.CKJjPBhTla1EyWxUFakE1bkIhNIDiK0TCLv.CLrnPBIHRYtYWLewVY1UFahnSBwvhBIjfHk4lcw7Ed1UFahnSBwvhBIjfHk4lcw7UXzQWXis1WvIhNI.CKJjPBhTla1EyWjU1Xgk2WvIhNI.CKJjPBhTla1EyWxUFakE1bk8EbhnSBvvhBIjfHk4lcx7kbkAWYgQmH5j.LrnPBIHRYtYmLeQVYrEVdhnSBvvhBIjfHk4lcx7UXzQWXislH5j.Lt.CLw.CLvvhBIjfHk4lcx70b0MGcgklahnSBvvhBIjfHk4lcx7kbkwVYgMWYhnSBv3RLx.CLv.CKJjPBhTla1IyW3YWYrIhNI.CKJjPBhTla1IyW3Ula1EiH5jPLrnPBIHRYtYmLeQVYrEVdeAmH5j.LrnPBIHRYtYmLeEFczE1Xq8EbhnSBvvhBIjfHk4lcx7kbkAWYgQ2WvIhNIDCKJjPBhTla1IyWxUFakE1bk8EbhnSBvvhBIjfHmIWXt8EbuMWZzk1at8EdhnSBv3RM0.CLv.CKJjPBhblbg41Wv81boQWZu41W4IhNIDCKJjPBhblbg41WxEFck8kauk1bkIhNI.CKJjPBhblbg41WxEFckIhNIDCKJjPBhblbg41WjUlaykFc4IhNIPCKJjPBhblbg41WvkFciglH5j.LrnPBIHxYxElaeAWZzMFZeUla1IhNIHiK4fCLxLiLk0BL3vhBIjfHmIWXt8Ebg4lH5jPKx3hLyTSL2PSYs.CNrnPBIHxYxElaeY1arw1a2IhNIDCKJjPBhblbg41Wy01auQGZhnSBwvhBIjfHmIWXt80cxEFbhnSBwvhBIjfHmIWXt8EbuMWZzk1at8EdeAmH5j.LtHCNv.CLvvhBIjfHmIWXt8EbuMWZzk1at8UdeAmH5jPLrnPBIHxYxElaeIWXzU1WvIhNIDCKJjPBhblbg41WjUlaykFc48EbhnSBwvhBIjfHmIWXt8EboQ2Xn8EbhnSBwvhBIjfHmIWXt8EboQ2Xn8Eao41WvIhNI.CKJjPBhblbg41WvkFcig1Wk4lceAmH5jPLrnPBIHxYxElaeAWXt8EbhnSBvvhBIjfHmEFck8EakYWYrIhNI.CKJjPBhbVXzU1Ws8FYkIhNIDCKJjPBhbVXzU1WjU1XgkmH5jfLrnPBIHxYgQWYewVYgslH5j.LtTCNv.CLvvhBIjfHmEFck8EakYWYr8EbhnSBv3hM3.CLv.CKJjPBhHWYy8EbuMWZzk1atIhNI.iKzXCLv.CLrnPBIHhbkM2WhIWZmgFctU1byIhNI.CKJjPBhHWYy8EboQ2XnIhNIHiLvvhBIjfHxU1be41atwVZtIhNI.CKJjPBhHWYy80b0MGcgklahnSBv3xM2.CLv.CKJjPBhHWYy8Ebg4lH5j.LtPSLv.CLvvhBIjfHxU1be01ajUlH5jfHrElbmUFHyAmbo41YhvhBIjfHxU1beA2aykFco8laeAmH5j.LtTiMv.CLvvhBIjfHxU1beIlbocFZz4VYyM2WvIhNI.iK3.CLv.CLrnPBIHhbkM2WvkFcig1WvIhNIDCKJjPBhHWYy8EboQ2Xn8Eao41WvIhNI.CKJjPBhHWYy8kau4Fao41WvIhNI.iK0.CLv.CLrnPBIHhbkM2WyU2bzEVZt8EbhnSBsHiKxLSMwbCMk0BL3vhBIjfHxU1beAWXt8EbhnSBsHiKxLSMwbCMk0BL3vhBIjfHxU1be0VZ380ckQmH5j.LtPiLv.CLvvhBIjfHxU1be0VZ38EYxkmH5j.LtTCLv.CLvvhBIjfHh8FY48EbuMWZzk1at8EdhnSBv3RMv.CLv.CKJjPBhH1ajk2Wv81boQWZu41W4IhNI.iKyHCLv.CLrnPBIHhXuQVde41atwVZtIhNI.iK2fCLv.CLrnPBIHhXuQVdeQ2atUlH5j.LrnPBIHhXuQVdeAWZzMFZhnSBwvhBIjfHh8FY480b0MGcgklahnSBv3xLy.CLv.CKJjPBhH1ajk2WvkFcig1Ws8FYkIhNIHCKJjPBhH1ajk2Ws8FYkIhNIHhYxEVakABYxUWahvhBIjfHh8FY48EbuMWZzk1at8EdeAmH5jPKw3RLwbSM3bSYs.CNrnPBIHhXuQVdeA2aykFco8laek2WvIhNI.iK0.CLv.CLrnPBIHhXuQVde41atwVZt8EbhnSBvvhBIjfHh8FY48Ecu4VYeAmH5j.LtfCNv.CLvvhBIjfHh8FY48EboQ2Xn8EbhnSBwvhBIjfHh8FY480b0MGcgklaeAmH5j.LtLCMv.CLvvhBIjfHh8FY48Uaog2W2UFchnSBwvhBIjfHh8FY48Uaog2WjIWdhnSBv3BMy.CLv.CKJjPBh7VczAWcz8EcowFchnSBsLCKJjPBh7VczAWcz80Xn8lb0MmH5j.LrnPBIHxa0QGb0Q2WrkVaoQmH5jPLrnPBIHBbgQ2XnUlbe0VXzIWZ3IhNIrmBIjPBhPWdvUlH5jfHyk1YtEFahvhBIjPBhbWZjQGZhnSBwbCKJjPBIHBZkk1YnQmH5j.MzvhBIjPBhPVYvQGZhnSBwvhBIjPBhPVXzElH5jvVvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHwvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvvBHvzkBIjPernPBIHxZkk2WyMVXrUlH5jfHwHSKkEWcgwlHrnPBIHxZkk2Ws8FYe0Fbk8EdhnSB2LCKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHxbkE2WxEFck8Ub0ElazkldkIhNI.CKJjPBh.mbkMWYzIhNIHxRgklcuABbkI2X0M2bo8lauXVZlQWdfbVXrw1atABcg41ZhvhBIjfHyEVavwVYe4VXsUlH5jfHSkmazgVYzk1Xu31aoMWYr.Bbo41ZfP2afbGZoQWYtbWX1IBKJjPBhzVXqUlbe4VXsUlH5jfHMEFYx8lagABSgI1bhvhBIjfHgAGbe4VXsUlH5jfHKEVZ18lHrnPBIHRXvA2W1Ulbyk1atIhNIXyM3PSMJjPernPBhTla1klbu4Vak4FchnSB6oPBIHBbx8FcuM1arIhNI.CKJjPBhrVY48kXk4FYe0FbkIhNIPCNrnPBIHRYjkFcuI2Wg4VZsIhNIDCKJjPBhTFYoQ2ax8kXuUmajMmH5jvdJjPBIHBc4AWYhnSBhLWZm4VXrIBKJjPBIHxcoQFcnIhNIPCKJjPBIHBZkk1YnQmH5jPLrnPBIjfHjUFbzglH5jPLrnPBIjfHjEFcgIhNIrELr.BLr.RN1bCKfTiLzzkBIjPernPBIHRYjkFcuI2WtUWahnSBwvhBIjfHuM2XeUlagIFakQlH5j.LrnPBIHxayM1Wv8lbz80alY1bkQmH5j.LrnPBIHRagsVYx8kag0VYhnSBhzTXjI2atEFHLElXyIBKJjPBhDFbv8kag0VYhnSBhrTXoY2aEQVZz8lbhvhBIjfHgAGbeYWYxMWZu4lH5jfM2fCM0nPB8oPe"
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
                    "patching_rect": [ 786.0, 382.0, 45.0, 45.0 ]
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
                    "patching_rect": [ 420.0, 70.0, 152.0, 22.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 420.0, 70.0, 143.0, 35.0 ],
                    "text": "midiin \"LinnStrument MIDI\"",
                    "varname": "linn_midiin"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-15", 1 ],
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
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-6", 0 ]
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