gml_pragma("global", "global.__draw_halign = 0; global.__draw_valign = 0;");
//#macro draw_set_halign __draw_set_halign_hook
//#macro draw_set_valign __draw_set_valign_hook
//#macro __draw_set_halign_base draw_set_halign
//#macro __draw_set_valign_base draw_set_valign

#define __draw_set_halign_hook
var _h = argument0;
global.__draw_halign = _h;
__draw_set_halign_base(_h);

#define draw_get_halign
return global.__draw_halign;

#define __draw_set_valign_hook
var _v = argument0;
global.__draw_valign = _v;
__draw_set_valign_base(_v);

#define draw_get_valign
return global.__draw_valign;
