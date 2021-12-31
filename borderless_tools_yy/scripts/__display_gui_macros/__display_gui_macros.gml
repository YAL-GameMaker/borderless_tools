#macro __display_set_gui_size_base display_set_gui_size
#macro display_set_gui_size __display_set_gui_size_hook
#macro __display_set_gui_maximize_base display_set_gui_maximize
#macro __display_set_gui_maximise_base display_set_gui_maximise
#macro display_set_gui_maximize __display_set_gui_maximize_hook
#macro display_set_gui_maximise __display_set_gui_maximize_hook
gml_pragma("global", "global.__display_gui_args = [0, 0, 0, 0, 0];");