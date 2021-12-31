draw_set_font(fnt_test);
draw_set_color(c_white);
var _h = draw_get_halign();
var _v = draw_get_valign();
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(room_width/2, room_height/2, "Your videogame here")
draw_set_halign(_h)
draw_set_valign(_v)

draw_text(5, 30,
	sfmt("window: %x%", window_frame_get_width(frame), window_frame_get_height(frame))
	+ sfmt("\nbackbuffer: %x%", browser_width, browser_height)
	+ sfmt("\nflags: %", window_frame_get_drag_flags(frame))
	+ "\n\nTry things:"
	+ "\n1: Windowed"
	+ sfmt("\n2: True fullscreen (%)", window_get_fullscreen() ? "on" : "off")
	+ sfmt("\n3: Fullscreen window (%)", frame[window_frame_is_fullscreen] ? "on" : "off")
	+ "\n4: Change alpha"
	+ sfmt("\n5: Toggle interactions (%)", frame[window_frame_can_input] ? "on" : "off")
	+ sfmt("\n6: Toggle resize (%)", frame[window_frame_can_resize] ? "on" : "off")
)