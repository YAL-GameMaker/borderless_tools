global.__display_gui_args[@0] = argument_count;
var i = 0;
for (; i < argument_count; i++) global.__display_gui_args[@i + 1] = argument[i];
for (; i < 4; i++) global.__display_gui_args[@i + 1] = 0;