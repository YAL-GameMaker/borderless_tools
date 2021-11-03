draw_set_font(fnt_test);
draw_set_color(c_white);
var _h = draw_get_halign();
var _v = draw_get_valign();
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(room_width/2, room_height/2, "Your videogame here")
draw_set_halign(_h)
draw_set_valign(_v)