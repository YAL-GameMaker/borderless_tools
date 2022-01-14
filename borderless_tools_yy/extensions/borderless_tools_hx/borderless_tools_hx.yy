{
    "id": "7e41c0d6-103f-4587-a810-fdb845b8c8ae",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "borderless_tools_hx",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": -1,
    "date": "2021-22-27 05:12:33",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "b7363917-318a-48b2-9498-4092d991c883",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "8f1ce42c-3ebf-eb43-c584-a272bac5c8c0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_get_active_monitor_list",
                    "hidden": true,
                    "value": "g_window_frame_get_active_monitor_list"
                },
                {
                    "id": "ab8e0aff-fb9a-c6c3-0673-afc135f964b6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_debug",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "1228067a-77c9-5a5c-a733-94835bed3af4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_blend",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "4859c32e-e6cc-5159-31f4-bd423c090e5f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_alpha",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "5fe00cd8-e5b3-cae2-cc5c-aa1e52745c42",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_mouse_over_frame",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "89e88a60-99ab-6c66-763e-d02473ae2c4d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_can_input",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "2d70a3c0-e8c2-954d-e645-ecec653a30b7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_can_resize",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "8ac52b81-76b9-5dfe-c5b3-967cfbe83975",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_spr_border",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "272b03c3-cf0b-f9c5-69e6-4631f9bff7ec",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_spr_caption",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "acc47831-8bad-e987-c661-fce1475df9cf",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_spr_buttons",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "9537676d-47c7-851b-294e-b29c63f0fc5f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_spr_pixel",
                    "hidden": false,
                    "value": "10"
                },
                {
                    "id": "91b0b47f-c27d-1bec-58cb-3845f47de440",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_buttons",
                    "hidden": false,
                    "value": "11"
                },
                {
                    "id": "a6ab0ae2-5509-36e0-050e-c0f815ddc35c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_caption",
                    "hidden": false,
                    "value": "12"
                },
                {
                    "id": "abc017d4-85cd-cdc5-1e5e-4808146e31ae",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_resize_padding",
                    "hidden": false,
                    "value": "17"
                },
                {
                    "id": "256e23e0-70b0-212e-3ad5-8e89d69b45a8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_border_width",
                    "hidden": false,
                    "value": "18"
                },
                {
                    "id": "67056612-6fe9-28b6-c060-2c74abd16cc0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_default_cursor",
                    "hidden": false,
                    "value": "19"
                },
                {
                    "id": "6ba454d6-8b59-4088-59a4-0bc38620c141",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_set_cursor",
                    "hidden": false,
                    "value": "20"
                },
                {
                    "id": "860c8723-fbdf-1586-a6fa-1b92749da5c7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_current_cursor",
                    "hidden": false,
                    "value": "21"
                },
                {
                    "id": "67808d62-0c81-fc83-21e8-c7982e4d971f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_draw_border",
                    "hidden": false,
                    "value": "25"
                },
                {
                    "id": "2dee4291-ec5e-ae68-0a5e-c44d3faf02cc",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_frame",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "134bdfb6-9d00-853d-48de-fa9aa8bef85f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_icon",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "193beee7-d4ae-8af9-6cfc-3dd679cba214",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_subimg",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "345b4e26-b9ba-4cce-fd18-8c8a70a5af48",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_margin_left",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "5b7cbb66-befe-45cf-420a-2033e8dd99f2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_margin_right",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "d3cf87ff-ba77-8333-a7c2-d78cfd9ea7cd",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_hover",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "235ae7a3-0756-be6a-faee-57dd8c58e528",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_pressed",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "cea47140-db4d-cacb-7e41-c581d98b2a98",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_enabled",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "4a7396b9-17da-ee3f-d2a5-2452bb7975cb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_fade",
                    "hidden": false,
                    "value": "8"
                },
                {
                    "id": "0d4027cd-95e3-9a8c-8947-db0c45bb0d06",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_click",
                    "hidden": false,
                    "value": "9"
                },
                {
                    "id": "33a1a6ed-aaef-fbc6-307b-f0dc2e2c3d5f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_get_width",
                    "hidden": false,
                    "value": "10"
                },
                {
                    "id": "05d8df0c-9451-8a23-8a11-a9d705e19a01",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_update",
                    "hidden": false,
                    "value": "11"
                },
                {
                    "id": "4e819618-84a3-a26c-b02a-5a4100080502",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_draw_underlay",
                    "hidden": false,
                    "value": "12"
                },
                {
                    "id": "6813c1f4-5e9d-a35f-25c0-fbaa4410c8fa",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_button_draw_icon",
                    "hidden": false,
                    "value": "13"
                },
                {
                    "id": "705af205-d37b-8eae-27b8-1c9249559cd5",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_buttons_frame",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "1b99aa19-6f3d-bf4c-3dc5-db7c76358b3b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_buttons_array",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "ece70c39-8bbe-1093-ab79-3460157b0d1f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_buttons_fade_time",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "6d4d7762-7b09-7733-04c6-327ac7b8126d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_buttons_minimize",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "d47436ce-4d49-adfc-937a-408045e936cb",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_buttons_maxrest",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "4623d647-6ea9-85fc-8d1e-d80754694901",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_buttons_close",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "565c9b74-3d2a-4ab2-7a42-d370cc11d778",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_caption_frame",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "c9ca9a99-600f-6444-8240-a3856757218b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_caption_text",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "f6227f5e-af7e-373d-ebc0-f64f9bad1a6b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_caption_font",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "0673e439-b022-4521-f289-09e5ed978930",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_caption_icon",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "831a6fc7-1b1a-c1f9-b25b-926a8e168716",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_caption_height_normal",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "83543bc3-54ea-bae5-efb9-01894235d83d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_caption_height_maximized",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "a4e0f031-74bb-9a9f-5f0d-ec169ac8fc75",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_caption_draw_background",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "aa3bc5d3-6950-ab60-6bf0-db763e8acb2e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_frame_caption_draw_text",
                    "hidden": false,
                    "value": "8"
                }
            ],
            "copyToTargets": -1,
            "filename": "borderless_tools_hx.gml",
            "final": "",
            "functions": [
                {
                    "id": "f3dca2cd-326e-83a3-7d7a-acee1088beda",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_init",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_init",
                    "returnType": 2
                },
                {
                    "id": "9a86b8b2-6eec-4ed0-f8f7-37a0a13546d7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_std_Std_string",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_std_Std_string",
                    "returnType": 2
                },
                {
                    "id": "c5c434d1-b8ad-2780-56df-935f65e56740",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_draw_border_default",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_draw_border_default",
                    "returnType": 2
                },
                {
                    "id": "72751ee7-0d62-5edc-6428-fc9a17478aef",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_minimize_lf",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_minimize_lf",
                    "returnType": 2
                },
                {
                    "id": "df9d5999-7a4d-26a2-8046-0a2065850512",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_minimise_lf",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_minimise_lf",
                    "returnType": 2
                },
                {
                    "id": "b48a9d12-ace9-64aa-e55d-ebb005746f44",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_restore_lf",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_restore_lf",
                    "returnType": 2
                },
                {
                    "id": "77552bee-1544-e2e4-a049-864a1686e38f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_set_fullscreen_1_lf",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_set_fullscreen_1_lf",
                    "returnType": 2
                },
                {
                    "id": "7e53daca-0bfe-bd17-ebcb-6e562b670119",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_set_fullscreen_1_lf1",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_set_fullscreen_1_lf1",
                    "returnType": 2
                },
                {
                    "id": "02ceabc9-2662-108a-7d66-8d205e8a369e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_set_fullscreen_1_lf2",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_set_fullscreen_1_lf2",
                    "returnType": 2
                },
                {
                    "id": "f8ae2313-a71e-e945-acee-18aa3f18bb5b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_new_lf",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_new_lf",
                    "returnType": 2
                },
                {
                    "id": "44afcaa7-0c77-2f1b-e33d-6e123ac7e185",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_create",
                    "help": "window_frame_create(...:sprite?)->window_frame",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_create",
                    "returnType": 2
                },
                {
                    "id": "870650b0-d89d-f6d8-e519-2467c0f8c8bc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_mylog",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_mylog",
                    "returnType": 2
                },
                {
                    "id": "985eaef6-2a97-e3c1-dce6-b76991c2ab91",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_delay0",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_delay0",
                    "returnType": 2
                },
                {
                    "id": "9b0377e9-cc24-163c-99dc-bb300b3f3543",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_delay1",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_delay1",
                    "returnType": 2
                },
                {
                    "id": "56e8e4ff-03ef-5bd1-a70f-02bb5bdcfe48",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_delay2",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_delay2",
                    "returnType": 2
                },
                {
                    "id": "a8e029bf-752b-4f38-b1d3-ecd68784146b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_delay3",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_delay3",
                    "returnType": 2
                },
                {
                    "id": "1373a3a1-9bca-3b45-f0fc-666bee5a2b35",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_delay4",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_delay4",
                    "returnType": 2
                },
                {
                    "id": "d5f3611b-dbdb-0052-8d44-da5bb8413b7b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_get_active_monitor",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_get_active_monitor",
                    "returnType": 2
                },
                {
                    "id": "e2db2518-5c5d-7084-3c47-7b7004b624c7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_minimize",
                    "help": "window_frame_minimize(this:window_frame)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_minimize",
                    "returnType": 2
                },
                {
                    "id": "d05f7bf8-8a7f-387d-a1fd-5ae269679d00",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_minimise",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_minimise",
                    "returnType": 2
                },
                {
                    "id": "1538aa97-b09f-4be1-c7b0-4a99ba25be24",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_is_minimized",
                    "help": "window_frame_is_minimized(this:window_frame)->any\/\/ * Returns whether the window is currently minimized.",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_is_minimized",
                    "returnType": 2
                },
                {
                    "id": "57d96d47-d9dd-2456-7463-ac86730f82c9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_is_minimised",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_is_minimised",
                    "returnType": 2
                },
                {
                    "id": "7b59c4fe-f39f-1fff-5f69-d1baffab800f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_maximize",
                    "help": "window_frame_maximize(this:window_frame)\/\/ * Maximizes the window (much like pressing the button would)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_maximize",
                    "returnType": 2
                },
                {
                    "id": "eab1d832-ed62-ea2f-9281-e551486e9e90",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_maximise",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_maximise",
                    "returnType": 2
                },
                {
                    "id": "dabe3987-7596-c38c-6f63-3ef078facd78",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_is_maximized",
                    "help": "window_frame_is_maximized(this:window_frame)->bool\/\/ * Returns whether the window is currently maximized.",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_is_maximized",
                    "returnType": 2
                },
                {
                    "id": "3d3a4843-5495-d5a1-9e1b-8bde8c1d4c72",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_is_maximised",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_is_maximised",
                    "returnType": 2
                },
                {
                    "id": "bec46e5f-9bbd-10da-1a80-554aae3f4e16",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_maximize_1",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_maximize_1",
                    "returnType": 2
                },
                {
                    "id": "6d77e85e-d456-f2de-8dbf-ec49eb9e277a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_store_rect",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_store_rect",
                    "returnType": 2
                },
                {
                    "id": "4ba56b88-b031-118e-dacd-21c4cb40a38e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_restore",
                    "help": "window_frame_restore(this:window_frame, _force:bool = false)\/\/ * Restores the window to non-maximized, non-full-screen state.",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_restore",
                    "returnType": 2
                },
                {
                    "id": "89e35757-dc68-4229-d5cb-aa249f3c3909",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "window_frame_set_fullscreen",
                    "help": "window_frame_set_fullscreen(this:window_frame, mode:int)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_set_fullscreen",
                    "returnType": 2
                },
                {
                    "id": "0b00cc55-dea9-ff79-88d1-182858bc2ee8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_get_fullscreen",
                    "help": "window_frame_get_fullscreen(this:window_frame)->int\/\/ Returns the current fullscreen mode",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_get_fullscreen",
                    "returnType": 2
                },
                {
                    "id": "752bb110-5bb9-268a-d981-2fe43a0fcff7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_set_fullscreen_1",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_set_fullscreen_1",
                    "returnType": 2
                },
                {
                    "id": "dbd00671-e319-6c34-1bc1-773cd723cf90",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_set_window_cursor",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_set_window_cursor",
                    "returnType": 2
                },
                {
                    "id": "d9297143-b08b-d1ad-7f07-7788b7d0c949",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_get_border_width",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_get_border_width",
                    "returnType": 2
                },
                {
                    "id": "b661d53d-87ac-1e1e-cd6d-91c67c79cd29",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_get_width",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_get_width",
                    "returnType": 2
                },
                {
                    "id": "358f4ba3-4351-fe4b-e2c2-8c650073e23e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_get_height",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_get_height",
                    "returnType": 2
                },
                {
                    "id": "ca3b7ae6-13a7-3abe-f080-2dabd131369c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_get_drag_flags",
                    "help": "window_frame_get_drag_flags(this:window_frame)->int\/\/ This returns a non-zero value if a move\/resize operation is underway",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_get_drag_flags",
                    "returnType": 2
                },
                {
                    "id": "fa952b49-c030-b11f-493c-243348902674",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_update",
                    "help": "window_frame_update(this:window_frame)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_update",
                    "returnType": 2
                },
                {
                    "id": "6bf60cd7-89a1-e92a-fdde-4aac5e3c4fac",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_draw",
                    "help": "window_frame_draw(this:window_frame)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_draw",
                    "returnType": 2
                },
                {
                    "id": "b92d63e4-f79f-427b-723d-a297381822c6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_button_ease_inout_expo",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_button_ease_inout_expo",
                    "returnType": 2
                },
                {
                    "id": "3ac6a2f8-c628-7184-cf1d-7761951282c0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_button_get_width_default",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_button_get_width_default",
                    "returnType": 2
                },
                {
                    "id": "b1794c6a-a427-7d6e-33cf-cf3d8b248bce",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_button_draw_underlay_default",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_button_draw_underlay_default",
                    "returnType": 2
                },
                {
                    "id": "166055eb-8ff9-c57c-1de0-c09286b3fb74",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_button_draw_icon_default",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_button_draw_icon_default",
                    "returnType": 2
                },
                {
                    "id": "9f3daa2c-b46b-28a4-5eb5-b45280d8c31a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_button_new_update",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_button_new_update",
                    "returnType": 2
                },
                {
                    "id": "552e106d-360a-9c01-17a2-3c7964b8b16a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "window_frame_button_create",
                    "help": "window_frame_button_create(frame:window_frame, icon:sprite, subimg:int, onClick:function<button:window_frame_button; void>)->window_frame_button",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_button_create",
                    "returnType": 2
                },
                {
                    "id": "561d1f27-4f46-b1cb-7840-67af8d14acd2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_add_default_buttons_lf",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_add_default_buttons_lf",
                    "returnType": 2
                },
                {
                    "id": "388ea260-688f-c4f1-ccc4-3e3a36600ed3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_add_default_buttons_lf1",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_add_default_buttons_lf1",
                    "returnType": 2
                },
                {
                    "id": "0a9db886-d1fc-fe9b-a4a3-31ad5d0d7325",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_add_default_buttons_update",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_add_default_buttons_update",
                    "returnType": 2
                },
                {
                    "id": "c1152e92-9b29-d30f-e0f0-50f47c9cd9ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_add_default_buttons_lf2",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_add_default_buttons_lf2",
                    "returnType": 2
                },
                {
                    "id": "e3d058dd-f843-1423-ba7d-e860e7d06cae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_add_default_buttons_draw_underlay",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_add_default_buttons_draw_underlay",
                    "returnType": 2
                },
                {
                    "id": "eff0cb4c-d96d-f299-7302-83304082a66b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_create",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_create",
                    "returnType": 2
                },
                {
                    "id": "49e10066-fbb6-3d58-075e-c25c6763a655",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_add",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_add",
                    "returnType": 2
                },
                {
                    "id": "9b95f251-bd88-9427-c94f-2dc1c04c5881",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_buttons_get_width",
                    "help": "window_frame_buttons_get_width(this:window_frame_buttons)->int\/\/ Returns combined width of all buttons",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_buttons_get_width",
                    "returnType": 2
                },
                {
                    "id": "42542e22-15b1-9fa9-66ef-520fc30352ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "window_frame_buttons_get_x",
                    "help": "window_frame_buttons_get_x(this:window_frame_buttons, windowWidth:int)->int\/\/ Returns where the window buttons should be, given the specified window width",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_buttons_get_x",
                    "returnType": 2
                },
                {
                    "id": "b140f8f0-2928-cce2-6643-f399440ed61c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_buttons_reset",
                    "help": "window_frame_buttons_reset(this:window_frame_buttons)\/\/ Un-presses and un-hovers every button",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_buttons_reset",
                    "returnType": 2
                },
                {
                    "id": "a5c2eb1b-37b6-c342-880a-e6c9d239c92c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_update",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_update",
                    "returnType": 2
                },
                {
                    "id": "60e301b4-a210-2519-3302-b420f80b54d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_draw",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_draw",
                    "returnType": 2
                },
                {
                    "id": "53d7979b-d75e-dba1-7b5d-28eb512dc917",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_add_default_buttons",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_add_default_buttons",
                    "returnType": 2
                },
                {
                    "id": "e38afacc-40e3-8609-3702-c7e5d37574e1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_buttons_wait_for_movement_create",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_buttons_wait_for_movement_create",
                    "returnType": 2
                },
                {
                    "id": "dc6c9bc7-d415-337f-e343-c8a44aa4ea18",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_caption_draw_caption_rect_default",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_caption_draw_caption_rect_default",
                    "returnType": 2
                },
                {
                    "id": "73cb167e-0423-f56e-dd5c-47d9eff6d67d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_caption_draw_caption_text_default",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_caption_draw_caption_text_default",
                    "returnType": 2
                },
                {
                    "id": "819ef46d-c99a-49a4-5fd4-b4a5e8e97a51",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_caption_create",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_caption_create",
                    "returnType": 2
                },
                {
                    "id": "3440afa2-7727-3f8e-5475-1745b64e363a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_frame_caption_get_height",
                    "help": "window_frame_caption_get_height(this:window_frame_caption)->int\/\/ Returns current height (depending on whether the window is maximized)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_frame_caption_get_height",
                    "returnType": 2
                },
                {
                    "id": "dbf79b86-f608-70a7-ec82-2d5c514edc2b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_cover_create",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_cover_create",
                    "returnType": 2
                },
                {
                    "id": "ab7ca8b1-6dce-f8de-8048-f3e0f9532a7f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_cover_ensure",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_cover_ensure",
                    "returnType": 2
                },
                {
                    "id": "d2dcce60-2978-d233-3faa-ba8969ce5b12",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_delay_create",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_delay_create",
                    "returnType": 2
                },
                {
                    "id": "76ca9f5f-fae7-acdc-5cf3-7f8ef0298c80",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_delay_add",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_delay_add",
                    "returnType": 2
                },
                {
                    "id": "465442fe-1c65-40bf-571c-07fcfadc6c73",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_delay_update",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_delay_update",
                    "returnType": 2
                },
                {
                    "id": "058ef1e7-3695-cf6e-c33b-d57c1af6d9b3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_drag_create",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_drag_create",
                    "returnType": 2
                },
                {
                    "id": "0dc275f6-799d-2579-1e6a-e2aaf315111e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_drag_start",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_drag_start",
                    "returnType": 2
                },
                {
                    "id": "d606a42e-e4f1-59a2-34ea-e986cdbc3c92",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_drag_stop",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_drag_stop",
                    "returnType": 2
                },
                {
                    "id": "5e8c2c33-5780-8588-14de-38755175a871",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_drag_update",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_drag_update",
                    "returnType": 2
                },
                {
                    "id": "92394f4b-159d-efd9-0609-abc209756f3a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_helpers_draw9slice",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_helpers_draw9slice",
                    "returnType": 2
                },
                {
                    "id": "58b1f5e0-6902-c183-af01-418cb130e611",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "_window_frame_rect_window_frame_rect_impl___new",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "_window_frame_rect_window_frame_rect_impl___new",
                    "returnType": 2
                },
                {
                    "id": "12b3e54d-fc3a-b6af-c47b-c02adf82b140",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "_window_frame_rect_window_frame_rect_impl__get_window_rect",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "_window_frame_rect_window_frame_rect_impl__get_window_rect",
                    "returnType": 2
                },
                {
                    "id": "ece29326-87e3-da25-f37a-fb06e942f758",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "_window_frame_rect_window_frame_rect_impl__set_window_rect",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "_window_frame_rect_window_frame_rect_impl__set_window_rect",
                    "returnType": 2
                },
                {
                    "id": "97108cab-eef7-413f-948c-b0d7b6f72621",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "_window_frame_rect_window_frame_rect_impl__equals",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "_window_frame_rect_window_frame_rect_impl__equals",
                    "returnType": 2
                },
                {
                    "id": "5012946c-1227-b778-7167-42fd087cce6b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "_window_frame_rect_window_frame_rect_impl__set_to",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "_window_frame_rect_window_frame_rect_impl__set_to",
                    "returnType": 2
                },
                {
                    "id": "cc50134e-40ec-5469-b839-2e7e75ee179a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_std_haxe_class_create",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_std_haxe_class_create",
                    "returnType": 2
                },
                {
                    "id": "a9fb48ad-6931-5cb9-10bf-53fec12ad4b3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_std_gml_internal_ArrayImpl_push",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_std_gml_internal_ArrayImpl_push",
                    "returnType": 2
                },
                {
                    "id": "5d488d44-29fc-c2d1-6f84-efa22973ddf8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_std_haxe_boot_wget",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_std_haxe_boot_wget",
                    "returnType": 2
                },
                {
                    "id": "e666c52e-322e-1502-c380-64f2b7e2936e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_frame_std_haxe_boot_wset",
                    "help": "",
                    "hidden": true,
                    "kind": 2,
                    "name": "window_frame_std_haxe_boot_wset",
                    "returnType": 2
                }
            ],
            "init": "window_frame_init",
            "kind": 2,
            "order": [
                "f3dca2cd-326e-83a3-7d7a-acee1088beda",
                "6be5f1c8-5401-2fdd-5226-0a1d9f748661",
                "b48a9d12-ace9-64aa-e55d-ebb005746f44",
                "93feddf0-20d7-132c-a48f-d538454d7120",
                "7594da5e-5ce2-6ca6-5f68-64c0075a7215",
                "1ed7905f-3b33-d083-9539-eb6453ceb255",
                "44afcaa7-0c77-2f1b-e33d-6e123ac7e185",
                "870650b0-d89d-f6d8-e519-2467c0f8c8bc",
                "985eaef6-2a97-e3c1-dce6-b76991c2ab91",
                "9b0377e9-cc24-163c-99dc-bb300b3f3543",
                "56e8e4ff-03ef-5bd1-a70f-02bb5bdcfe48",
                "a8e029bf-752b-4f38-b1d3-ecd68784146b",
                "1373a3a1-9bca-3b45-f0fc-666bee5a2b35",
                "24bf2e27-7554-f02c-fc4b-35b6958b0b19",
                "d5f3611b-dbdb-0052-8d44-da5bb8413b7b",
                "7b59c4fe-f39f-1fff-5f69-d1baffab800f",
                "bec46e5f-9bbd-10da-1a80-554aae3f4e16",
                "6d77e85e-d456-f2de-8dbf-ec49eb9e277a",
                "4ba56b88-b031-118e-dacd-21c4cb40a38e",
                "89e35757-dc68-4229-d5cb-aa249f3c3909",
                "dbd00671-e319-6c34-1bc1-773cd723cf90",
                "d9297143-b08b-d1ad-7f07-7788b7d0c949",
                "cbc9cdf5-b6ef-b3d4-9b1a-9303364499b7",
                "b661d53d-87ac-1e1e-cd6d-91c67c79cd29",
                "358f4ba3-4351-fe4b-e2c2-8c650073e23e",
                "fa952b49-c030-b11f-493c-243348902674",
                "8c33a7b8-8603-4b0a-f32a-7d2b675f4369",
                "4d9ea072-d386-7a39-a2aa-1a56a96e065b",
                "ed8ba3b6-c838-1824-bff2-4ddda70ec240",
                "6bf60cd7-89a1-e92a-fdde-4aac5e3c4fac",
                "b92d63e4-f79f-427b-723d-a297381822c6",
                "552e106d-360a-9c01-17a2-3c7964b8b16a",
                "cef9eef6-32fc-88fa-44c8-bad661547531",
                "9f4f3fbc-650f-0f84-7822-dd64141ecd94",
                "7098c6f8-45b0-90a4-af00-db5c377eea68",
                "162feaa5-91b6-f3a3-0f03-351e95ff0630",
                "388ea260-688f-c4f1-ccc4-3e3a36600ed3",
                "561d1f27-4f46-b1cb-7840-67af8d14acd2",
                "c1152e92-9b29-d30f-e0f0-50f47c9cd9ae",
                "0a9db886-d1fc-fe9b-a4a3-31ad5d0d7325",
                "6af65ce7-3385-3ba7-24db-d3443c17503b",
                "e3d058dd-f843-1423-ba7d-e860e7d06cae",
                "eff0cb4c-d96d-f299-7302-83304082a66b",
                "49e10066-fbb6-3d58-075e-c25c6763a655",
                "9b95f251-bd88-9427-c94f-2dc1c04c5881",
                "b140f8f0-2928-cce2-6643-f399440ed61c",
                "a5c2eb1b-37b6-c342-880a-e6c9d239c92c",
                "60e301b4-a210-2519-3302-b420f80b54d6",
                "53d7979b-d75e-dba1-7b5d-28eb512dc917",
                "e38afacc-40e3-8609-3702-c7e5d37574e1",
                "dbf79b86-f608-70a7-ec82-2d5c514edc2b",
                "ab7ca8b1-6dce-f8de-8048-f3e0f9532a7f",
                "d2dcce60-2978-d233-3faa-ba8969ce5b12",
                "76ca9f5f-fae7-acdc-5cf3-7f8ef0298c80",
                "465442fe-1c65-40bf-571c-07fcfadc6c73",
                "058ef1e7-3695-cf6e-c33b-d57c1af6d9b3",
                "0dc275f6-799d-2579-1e6a-e2aaf315111e",
                "d606a42e-e4f1-59a2-34ea-e986cdbc3c92",
                "5e8c2c33-5780-8588-14de-38755175a871",
                "58b1f5e0-6902-c183-af01-418cb130e611",
                "12b3e54d-fc3a-b6af-c47b-c02adf82b140",
                "ece29326-87e3-da25-f37a-fb06e942f758",
                "97108cab-eef7-413f-948c-b0d7b6f72621",
                "5012946c-1227-b778-7167-42fd087cce6b",
                "fb09c6b4-81a4-03e8-18d4-714c475fcb7e",
                "085aeeb8-1574-cf6c-abb5-b454a39b3dc7",
                "d76815fa-4363-25dc-0859-bbc2bcf63eb5",
                "6961b9f5-aa89-9f2d-6eb8-062ef0754641"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "supportedTargets": -1,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "0.0.1"
}