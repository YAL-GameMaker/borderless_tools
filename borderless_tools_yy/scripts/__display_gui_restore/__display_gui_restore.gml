var _args = global.__display_gui_args;
switch (_args[0]) {
	case -1: __display_set_gui_size_base(_args[1], _args[2]); break;
	case  0: __display_set_gui_maximise_base(); break;
	case  1: __display_set_gui_maximise_base(_args[1]); break;
	case  2: __display_set_gui_maximise_base(_args[1], _args[2]); break;
	case  3: __display_set_gui_maximise_base(_args[1], _args[2], _args[3]); break;
	case  4: __display_set_gui_maximise_base(_args[1], _args[2], _args[3], _args[4]); break;
}