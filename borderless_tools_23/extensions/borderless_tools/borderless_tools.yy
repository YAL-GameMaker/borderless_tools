{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": 113497714299118,
  "extensionVersion": "1.0.0",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2019-12-12T01:34:29",
  "license": "Proprietary",
  "description": "",
  "helpfile": "",
  "iosProps": true,
  "tvosProps": false,
  "androidProps": true,
  "installdir": "",
  "files": [
    {"filename":"borderless_tools.dll","origname":"extensions\\borderless_tools.dll","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"externalName":"borderless_tools_mouse_in_window","kind":11,"help":"","hidden":true,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"borderless_tools_mouse_in_window","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"borderless_tools_init_raw","kind":11,"help":"","hidden":true,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"borderless_tools_init_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"borderless_tools_syscommand","kind":11,"help":"","hidden":true,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"borderless_tools_syscommand","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"borderless_tools_get_monitors_1","kind":11,"help":"","hidden":true,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"borderless_tools_get_monitors_1","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"borderless_tools_get_monitors_2","kind":11,"help":"","hidden":true,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"borderless_tools_get_monitors_2","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"borderless_tools_double_click_time","kind":11,"help":"","hidden":true,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"borderless_tools_double_click_time","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[
        {"value":"32","hidden":true,"resourceVersion":"1.0","name":"display_measure_all_name_len","tags":[],"resourceType":"GMExtensionConstant",},
      ],"ProxyFiles":[
        {"name":"borderless_tools_x64.dll","tags":[],"resourceVersion":"1.0","resourceType":"GMProxyFile","TargetMask":6,},
      ],"copyToTargets":9223372036854775807,"order":[
        {"name":"borderless_tools_mouse_in_window","path":"extensions/borderless_tools/borderless_tools.yy",},
        {"name":"borderless_tools_init_raw","path":"extensions/borderless_tools/borderless_tools.yy",},
        {"name":"borderless_tools_syscommand","path":"extensions/borderless_tools/borderless_tools.yy",},
        {"name":"borderless_tools_get_monitors_1","path":"extensions/borderless_tools/borderless_tools.yy",},
        {"name":"borderless_tools_get_monitors_2","path":"extensions/borderless_tools/borderless_tools.yy",},
        {"name":"borderless_tools_double_click_time","path":"extensions/borderless_tools/borderless_tools.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"borderless_tools.gml","origname":"extensions\\gml.gml","init":"borderless_tools_init","final":"","kind":2,"uncompress":false,"functions":[
        {"externalName":"borderless_tools_init","kind":11,"help":"","hidden":true,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"borderless_tools_init","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"borderless_tools_get_monitors","kind":2,"help":"borderless_tools_get_monitors(?out_list)->","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"borderless_tools_get_monitors","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"borderless_tools_prepare_buffer","kind":2,"help":"borderless_tools_prepare_buffer(size:int)->buffer~","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"borderless_tools_prepare_buffer","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"borderless_tools_buffer_read_chars","kind":2,"help":"borderless_tools_buffer_read_chars(buffer:buffer, len:int)->string~","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"borderless_tools_buffer_read_chars","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[
        
      ],"ProxyFiles":[],"copyToTargets":9223372036854775807,"order":[
        {"name":"borderless_tools_init","path":"extensions/borderless_tools/borderless_tools.yy",},
        {"name":"borderless_tools_get_monitors","path":"extensions/borderless_tools/borderless_tools.yy",},
        {"name":"borderless_tools_prepare_buffer","path":"extensions/borderless_tools/borderless_tools.yy",},
        {"name":"borderless_tools_buffer_read_chars","path":"extensions/borderless_tools/borderless_tools.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"autogen.gml","origname":"extensions\\autogen.gml","init":"","final":"","kind":2,"uncompress":false,"functions":[
        
      ],"constants":[
        
      ],"ProxyFiles":[],"copyToTargets":-1,"order":[
        
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": "",
  "tvosdelegatename": "",
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "androidcodeinjection": "",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 113497714299118,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "borderless_tools",
  "tags": [],
  "resourceType": "GMExtension",
}