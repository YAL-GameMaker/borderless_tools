#define window_frame_init
// Generated at 2022-01-13 13:05:05 (561ms) for v2.2.5+
/// @lint nullToAny true
//{ prototypes
globalvar mq_window_frame_caption; mq_window_frame_caption = [undefined, /* 1:frame */undefined, /* 2:text */undefined, /* 3:font */undefined, /* 4:icon */undefined, /* 5:height_normal */0, /* 6:height_maximized */0, /* 7:draw_background */undefined, /* 8:draw_text */undefined];
globalvar mq_window_frame_cover; mq_window_frame_cover = [undefined, /* 1:frame */undefined, /* 2:check_for_success */undefined, /* 3:ignore_rect */undefined, /* 4:can_ignore */undefined, /* 5:curr_rect */undefined];
globalvar mq_window_frame_std_haxe_class; mq_window_frame_std_haxe_class = [undefined, /* 1:marker */undefined, /* 2:index */0, /* 3:name */undefined, /* 4:superClass */undefined, /* 5:constructor */undefined];
//}
//{ functions
globalvar f_window_frame_minimize_lf; f_window_frame_minimize_lf = asset_get_index("window_frame_minimize_lf");
globalvar f_window_frame_minimise_lf; f_window_frame_minimise_lf = asset_get_index("window_frame_minimise_lf");
globalvar f_window_frame_restore_lf; f_window_frame_restore_lf = asset_get_index("window_frame_restore_lf");
globalvar f_window_frame_set_fullscreen_1_lf; f_window_frame_set_fullscreen_1_lf = asset_get_index("window_frame_set_fullscreen_1_lf");
globalvar f_window_frame_set_fullscreen_1_lf1; f_window_frame_set_fullscreen_1_lf1 = asset_get_index("window_frame_set_fullscreen_1_lf1");
globalvar f_window_frame_set_fullscreen_1_lf2; f_window_frame_set_fullscreen_1_lf2 = asset_get_index("window_frame_set_fullscreen_1_lf2");
globalvar f_window_frame_draw_border_default; f_window_frame_draw_border_default = asset_get_index("window_frame_draw_border_default");
globalvar f_window_frame_new_lf; f_window_frame_new_lf = asset_get_index("window_frame_new_lf");
globalvar f_window_frame_button_draw_icon_default; f_window_frame_button_draw_icon_default = asset_get_index("window_frame_button_draw_icon_default");
globalvar f_window_frame_button_draw_underlay_default; f_window_frame_button_draw_underlay_default = asset_get_index("window_frame_button_draw_underlay_default");
globalvar f_window_frame_button_new_update; f_window_frame_button_new_update = asset_get_index("window_frame_button_new_update");
globalvar f_window_frame_button_get_width_default; f_window_frame_button_get_width_default = asset_get_index("window_frame_button_get_width_default");
globalvar f_window_frame_buttons_add_default_buttons_lf; f_window_frame_buttons_add_default_buttons_lf = asset_get_index("window_frame_buttons_add_default_buttons_lf");
globalvar f_window_frame_buttons_add_default_buttons_lf1; f_window_frame_buttons_add_default_buttons_lf1 = asset_get_index("window_frame_buttons_add_default_buttons_lf1");
globalvar f_window_frame_buttons_add_default_buttons_update; f_window_frame_buttons_add_default_buttons_update = asset_get_index("window_frame_buttons_add_default_buttons_update");
globalvar f_window_frame_buttons_add_default_buttons_lf2; f_window_frame_buttons_add_default_buttons_lf2 = asset_get_index("window_frame_buttons_add_default_buttons_lf2");
globalvar f_window_frame_buttons_add_default_buttons_draw_underlay; f_window_frame_buttons_add_default_buttons_draw_underlay = asset_get_index("window_frame_buttons_add_default_buttons_draw_underlay");
globalvar f_window_frame_caption_draw_caption_text_default; f_window_frame_caption_draw_caption_text_default = asset_get_index("window_frame_caption_draw_caption_text_default");
globalvar f_window_frame_caption_draw_caption_rect_default; f_window_frame_caption_draw_caption_rect_default = asset_get_index("window_frame_caption_draw_caption_rect_default");
globalvar f_window_frame_draw_border; f_window_frame_draw_border = asset_get_index("window_frame_draw_border");
globalvar f_window_frame_button_click; f_window_frame_button_click = asset_get_index("window_frame_button_click");
globalvar f_window_frame_button_get_width; f_window_frame_button_get_width = asset_get_index("window_frame_button_get_width");
globalvar f_window_frame_button_update; f_window_frame_button_update = asset_get_index("window_frame_button_update");
globalvar f_window_frame_button_draw_underlay; f_window_frame_button_draw_underlay = asset_get_index("window_frame_button_draw_underlay");
globalvar f_window_frame_button_draw_icon; f_window_frame_button_draw_icon = asset_get_index("window_frame_button_draw_icon");
globalvar f_window_frame_caption_draw_background; f_window_frame_caption_draw_background = asset_get_index("window_frame_caption_draw_background");
globalvar f_window_frame_caption_draw_text; f_window_frame_caption_draw_text = asset_get_index("window_frame_caption_draw_text");
//}
//{ metatype
globalvar window_frame_std_haxe_type_markerValue; window_frame_std_haxe_type_markerValue = [];
globalvar mt_window_frame_caption; mt_window_frame_caption = window_frame_std_haxe_class_create(8, "window_frame_caption");
globalvar mt_window_frame_cover; mt_window_frame_cover = window_frame_std_haxe_class_create(9, "window_frame_cover");
globalvar mt_window_frame_std_haxe_class; mt_window_frame_std_haxe_class = window_frame_std_haxe_class_create(11, "window_frame_std_haxe_class");
//}
// window_frame:
globalvar g_window_frame_get_active_monitor_list; /// @is {ds_list<WindowFrameMonitorInfo>}
g_window_frame_get_active_monitor_list = undefined;

//{ window_frame_std.Std

#define window_frame_std_Std_string
// window_frame_std_Std_string(value:any)->string
var _value = argument[0];
if (_value == undefined) return "null";
if (is_string(_value)) return _value;
var _n, _i, _s;
if (is_real(_value)) {
	_s = string_format(_value, 0, 16);
	if (os_browser != browser_not_a_browser) {
		_n = string_length(_s);
		_i = _n;
		while (_i > 0) {
			switch (string_ord_at(_s, _i)) {
				case 48:
					--_i;
					continue;
				case 46: --_i; break;
			}
			break;
		}
	} else {
		_n = string_byte_length(_s);
		_i = _n;
		while (_i > 0) {
			switch (string_byte_at(_s, _i)) {
				case 48:
					--_i;
					continue;
				case 46: --_i; break;
			}
			break;
		}
	}
	return string_copy(_s, 1, _i);
}
return string(_value);

//}

//{ window_frame

#define window_frame_create
// window_frame_create(...:sprite?)
var _this = array_create(26);
/// @typedef {tuple<debug:bool,blend:int,alpha:number,double_click_time:int,mouse_over_frame:bool,can_input:bool,can_resize:bool,spr_border:sprite,spr_caption:sprite,spr_buttons:sprite,spr_pixel:sprite,buttons:window_frame_buttons,caption:window_frame_caption,drag:window_frame_drag,delay_mgr:window_frame_delay,cover:window_frame_cover,last_title_click_at:int,resize_padding:int,border_width:int,default_cursor:cr,set_cursor:bool,current_cursor:cr,__isMaximized:bool,is_fullscreen:bool,restore_rect:WindowFrameRect,draw_border:function<frame:window_frame; x:int; y:int; width:int; height:int; void>>} window_frame
var _sprBorder, _sprCaption, _sprButtons, _sprPixel;
if (argument_count > 0) _sprBorder = argument[0]; else _sprBorder = undefined;
if (argument_count > 1) _sprCaption = argument[1]; else _sprCaption = undefined;
if (argument_count > 2) _sprButtons = argument[2]; else _sprButtons = undefined;
if (argument_count > 3) _sprPixel = argument[3]; else _sprPixel = undefined;
_this[@25/* draw_border */] = f_window_frame_draw_border_default;
_this[@24/* restore_rect */] = _window_frame_rect_window_frame_rect_impl___new();
_this[@23/* is_fullscreen */] = false;
_this[@22/* __isMaximized */] = false;
_this[@21/* current_cursor */] = cr_arrow;
_this[@20/* set_cursor */] = true;
_this[@19/* default_cursor */] = cr_arrow;
_this[@18/* border_width */] = 2;
_this[@17/* resize_padding */] = 6;
_this[@16/* last_title_click_at */] = -5000;
_this[@6/* can_resize */] = true;
_this[@5/* can_input */] = true;
_this[@4/* mouse_over_frame */] = false;
_this[@3/* double_click_time */] = borderless_tools_double_click_time();
_this[@2/* alpha */] = 1.;
_this[@1/* blend */] = 16777215;
_this[@0/* debug */] = false;
if (_sprBorder == undefined) _sprBorder = spr_window_border;
if (_sprCaption == undefined) _sprCaption = spr_window_caption;
if (_sprButtons == undefined) _sprButtons = spr_window_buttons;
if (_sprPixel == undefined) _sprPixel = spr_window_pixel;
_this[@7/* spr_border */] = _sprBorder;
_this[@8/* spr_caption */] = _sprCaption;
_this[@9/* spr_buttons */] = _sprButtons;
_this[@10/* spr_pixel */] = _sprPixel;
_this[@12/* caption */] = window_frame_caption_create(_this);
_this[@13/* drag */] = window_frame_drag_create(_this);
_this[@14/* delay_mgr */] = window_frame_delay_create();
_this[@15/* cover */] = window_frame_cover_create(_this);
_window_frame_rect_window_frame_rect_impl__get_window_rect(_this[24/* restore_rect */]);
_this[@11/* buttons */] = window_frame_buttons_create(_this);
window_frame_buttons_add_default_buttons(_this[11/* buttons */]);
window_frame_delay_add(_this[14/* delay_mgr */], f_window_frame_new_lf, 3, _this);
return _this;

#define window_frame_draw_border_default
// window_frame_draw_border_default(frame:window_frame, _x:int, _y:int, _width:int, _height:int)
var _frame = argument[0];
window_frame_helpers_draw9slice(_frame[7/* spr_border */], (window_has_focus() ? 1 : 0), argument[1], argument[2], argument[3], argument[4], _frame[1/* blend */], _frame[2/* alpha */], false);

#define window_frame_minimize_lf
// window_frame_minimize_lf(buttons:window_frame_buttons)
var _buttons = argument[0];
window_frame_std_haxe_boot_wset(_buttons[3/* wait_for_movement */], 0, true);
window_frame_std_haxe_boot_wset(_buttons[3/* wait_for_movement */], 1, window_mouse_get_x());
window_frame_std_haxe_boot_wset(_buttons[3/* wait_for_movement */], 2, window_mouse_get_y());
borderless_tools_syscommand(61472);

#define window_frame_minimise_lf
// window_frame_minimise_lf(buttons:window_frame_buttons)
var _buttons = argument[0];
window_frame_std_haxe_boot_wset(_buttons[3/* wait_for_movement */], 0, true);
window_frame_std_haxe_boot_wset(_buttons[3/* wait_for_movement */], 1, window_mouse_get_x());
window_frame_std_haxe_boot_wset(_buttons[3/* wait_for_movement */], 2, window_mouse_get_y());
borderless_tools_syscommand(61472);

#define window_frame_restore_lf
// window_frame_restore_lf(f:window_frame)
var _f = argument[0];
window_frame_restore(_f);

#define window_frame_set_fullscreen_1_lf
// window_frame_set_fullscreen_1_lf(f:window_frame)
var _f = argument[0];
window_frame_set_fullscreen_1(_f, 1);

#define window_frame_set_fullscreen_1_lf1
// window_frame_set_fullscreen_1_lf1(f:window_frame)
var _f = argument[0];
window_frame_set_fullscreen_1(_f, 2, true);

#define window_frame_set_fullscreen_1_lf2
// window_frame_set_fullscreen_1_lf2(f:window_frame)
var _f = argument[0];
window_frame_set_fullscreen_1(_f, 0);

#define window_frame_new_lf
// window_frame_new_lf(frame:window_frame)
var _frame = argument[0];
if (_frame[22/* __isMaximized */] || _frame[23/* is_fullscreen */] || window_get_fullscreen()) return 0;
borderless_tools_set_shadow(true);

#define window_frame_mylog
// window_frame_mylog(this:window_frame, args:haxe_Rest<any>)
var _this = argument[0];
if (!_this[0/* debug */]) return 0;
var _s = "[WindowFrame] ";
var __g_current = 0;
var __g_args = argument[1];
while (__g_current < array_length_1d(__g_args)) {
	_s += window_frame_std_Std_string(__g_args[__g_current++]);
}
show_debug_message(_s);

#define window_frame_delay0
// window_frame_delay0(this:window_frame, func:function<void>, delay:int)
var _this = argument[0];
window_frame_delay_add(_this[14/* delay_mgr */], argument[1], argument[2]);

#define window_frame_delay1
// window_frame_delay1(this:window_frame, arg:A, delay:int, func:function<A; void>)
var _this = argument[0];
window_frame_delay_add(_this[14/* delay_mgr */], argument[3], argument[2], argument[1]);

#define window_frame_delay2
// window_frame_delay2(this:window_frame, arg:A, arg:B, delay:int, func:function<A; B; void>)
var _this = argument[0];
window_frame_delay_add(_this[14/* delay_mgr */], argument[4], argument[3], argument[1], argument[2]);

#define window_frame_delay3
// window_frame_delay3(this:window_frame, func:function<A; B; C; void>, delay:int, ?arg:A, ?arg:B, ?arg:C)
var _this = argument[0], _arg0, _arg1, _arg2;
if (argument_count > 3) _arg0 = argument[3]; else _arg0 = undefined;
if (argument_count > 4) _arg1 = argument[4]; else _arg1 = undefined;
if (argument_count > 5) _arg2 = argument[5]; else _arg2 = undefined;
window_frame_delay_add(_this[14/* delay_mgr */], argument[1], argument[2], _arg0, _arg1, _arg2);

#define window_frame_delay4
// window_frame_delay4(this:window_frame, func:function<A; B; C; D; void>, delay:int, ?arg:A, ?arg:B, ?arg:C, ?arg:D)
var _this = argument[0], _arg0, _arg1, _arg2, _arg3;
if (argument_count > 3) _arg0 = argument[3]; else _arg0 = undefined;
if (argument_count > 4) _arg1 = argument[4]; else _arg1 = undefined;
if (argument_count > 5) _arg2 = argument[5]; else _arg2 = undefined;
if (argument_count > 6) _arg3 = argument[6]; else _arg3 = undefined;
window_frame_delay_add(_this[14/* delay_mgr */], argument[1], argument[2], _arg0, _arg1, _arg2, _arg3);

#define window_frame_get_active_monitor
// window_frame_get_active_monitor(this:window_frame)->WindowFrameMonitorInfo
var _this = argument[0];
var __list = g_window_frame_get_active_monitor_list;
if (__list == undefined) {
	__list = ds_list_create();
	g_window_frame_get_active_monitor_list = __list;
}
var __count = borderless_tools_get_monitors(__list);
var __cx1 = window_get_x() + (window_get_width() div 2);
var __cy1 = window_get_y() + (window_get_height() div 2);
var _i = 0;
for (var __g1 = __count; _i < __g1; _i++) {
	var __item = __list[|_i];
	var __mntr = __item[0/* screen */];
	if (__cx1 >= __mntr[0/* x */] && __cy1 >= __mntr[1/* y */] && __cx1 < __mntr[0/* x */] + __mntr[2/* width */] && __cy1 < __mntr[1/* y */] + __mntr[3/* height */]) return __item;
}
var __item = __list[|0];
if (__item == undefined) {
	__item = [/* screen: */_window_frame_rect_window_frame_rect_impl___new(0, 0, display_get_width(), display_get_height()), /* workspace: */_window_frame_rect_window_frame_rect_impl___new(0, 0, display_get_width(), display_get_height() - 40), /* flags: */0];
	__list[|0] = __item;
}
return __item;

#define window_frame_minimize
// window_frame_minimize(this:window_frame)
var _this = argument[0];
if (borderless_tools_is_minimized()) return 0;
window_frame_buttons_reset(_this[11/* buttons */]);
window_frame_delay_add(_this[14/* delay_mgr */], f_window_frame_minimize_lf, 1, _this[11/* buttons */]);

#define window_frame_minimise
// window_frame_minimise(this:window_frame)
var _this = argument[0];
if (!borderless_tools_is_minimized()) {
	window_frame_buttons_reset(_this[11/* buttons */]);
	window_frame_delay_add(_this[14/* delay_mgr */], f_window_frame_minimise_lf, 1, _this[11/* buttons */]);
}

#define window_frame_is_minimized
// window_frame_is_minimized(this:window_frame)->any
var _this = argument[0];
return borderless_tools_is_minimized();

#define window_frame_is_minimised
// window_frame_is_minimised(this:window_frame)->any
var _this = argument[0];
return borderless_tools_is_minimized();

#define window_frame_maximize
// window_frame_maximize(this:window_frame)
var _this = argument[0];
if (_this[22/* __isMaximized */] || _this[23/* is_fullscreen */] || window_get_fullscreen()) return 0;
_this[@22/* __isMaximized */] = true;
window_frame_store_rect(_this);
window_frame_maximize_1(_this);

#define window_frame_maximise
// window_frame_maximise(this:window_frame)
var _this = argument[0];
if (!(_this[22/* __isMaximized */] || _this[23/* is_fullscreen */] || window_get_fullscreen())) {
	_this[@22/* __isMaximized */] = true;
	window_frame_store_rect(_this);
	window_frame_maximize_1(_this);
}

#define window_frame_is_maximized
// window_frame_is_maximized(this:window_frame)->bool
var _this = argument[0];
return _this[22/* __isMaximized */];

#define window_frame_is_maximised
// window_frame_is_maximised(this:window_frame)->bool
var _this = argument[0];
return _this[22/* __isMaximized */];

#define window_frame_maximize_1
// window_frame_maximize_1(this:window_frame)
var _this = argument[0];
var __work = window_frame_std_haxe_boot_wget(window_frame_get_active_monitor(_this), 1);
if (_this[0/* debug */]) window_frame_mylog(_this, "maximize: ", __work);
_window_frame_rect_window_frame_rect_impl__set_window_rect(__work);
borderless_tools_set_shadow(false);

#define window_frame_store_rect
// window_frame_store_rect(this:window_frame)
var _this = argument[0];
_window_frame_rect_window_frame_rect_impl__get_window_rect(_this[24/* restore_rect */]);
if (_this[0/* debug */]) window_frame_mylog(_this, "storeRect: ", _this[24/* restore_rect */]);

#define window_frame_restore
// window_frame_restore(this:window_frame, _force:bool = false)
var _this = argument[0], __force;
if (argument_count > 1) __force = argument[1]; else __force = false;
if (window_get_fullscreen()) {
	window_set_fullscreen(false);
	window_frame_delay_add(_this[14/* delay_mgr */], f_window_frame_restore_lf, 1, _this);
	return 0;
}
if (!__force && !_this[22/* __isMaximized */] && !_this[23/* is_fullscreen */]) return 0;
_this[@22/* __isMaximized */] = false;
_this[@23/* is_fullscreen */] = false;
var __rect = _this[24/* restore_rect */];
if (_this[0/* debug */]) window_frame_mylog(_this, "restore: ", __rect);
_window_frame_rect_window_frame_rect_impl__set_window_rect(__rect);
borderless_tools_set_shadow(true);

#define window_frame_set_fullscreen
// window_frame_set_fullscreen(this:window_frame, mode:int)
var _this = argument[0];
window_frame_set_fullscreen_1(_this, argument[1]);

#define window_frame_get_fullscreen
// window_frame_get_fullscreen(this:window_frame)->int
var _this = argument[0];
if (window_get_fullscreen()) return 1;
if (_this[23/* is_fullscreen */]) return 2; else return 0;

#define window_frame_set_fullscreen_1
// window_frame_set_fullscreen_1(this:window_frame, _mode:int, _wasFullscreen:bool = false)
var _this = argument[0], __mode = argument[1], __wasFullscreen;
if (argument_count > 2) __wasFullscreen = argument[2]; else __wasFullscreen = false;
if (_this[0/* debug */]) window_frame_mylog(_this, "setFullscreen(mode:", __mode, ", wasfs:", __wasFullscreen, ")");
if (__mode == 1 || __mode == 2) {
	window_frame_buttons_reset(_this[11/* buttons */]);
	window_frame_drag_stop(_this[13/* drag */]);
}
switch (__mode) {
	case 1:
		if (window_get_fullscreen()) return 0;
		if (_this[23/* is_fullscreen */]) {
			window_frame_restore(_this);
			window_frame_delay_add(_this[14/* delay_mgr */], f_window_frame_set_fullscreen_1_lf, 1, _this);
			return 0;
		} else window_frame_store_rect(_this);
		window_set_fullscreen(true);
		break;
	case 2:
		if (window_get_fullscreen()) {
			window_set_fullscreen(false);
			window_frame_delay_add(_this[14/* delay_mgr */], f_window_frame_set_fullscreen_1_lf1, 10, _this);
			return 0;
		}
		if (_this[23/* is_fullscreen */]) return 0;
		_this[@23/* is_fullscreen */] = true;
		if (!_this[22/* __isMaximized */] && !__wasFullscreen) window_frame_store_rect(_this);
		_window_frame_rect_window_frame_rect_impl__set_window_rect(window_frame_std_haxe_boot_wget(window_frame_get_active_monitor(_this), 0));
		borderless_tools_set_shadow(false);
		break;
	default:
		if (window_get_fullscreen() && _this[23/* is_fullscreen */]) {
			window_set_fullscreen(false);
			window_frame_delay_add(_this[14/* delay_mgr */], f_window_frame_set_fullscreen_1_lf2, 1, _this);
			return 0;
		}
		if (window_get_fullscreen()) {
			window_set_fullscreen(false);
		} else if (_this[22/* __isMaximized */]) {
			_this[@23/* is_fullscreen */] = false;
			window_frame_maximize_1(_this);
		} else window_frame_restore(_this);
}

#define window_frame_set_window_cursor
// window_frame_set_window_cursor(this:window_frame, cr:cr)
var _this = argument[0], _cr1 = argument[1];
_this[@21/* current_cursor */] = _cr1;
if (_this[20/* set_cursor */]) {
	if (window_get_cursor() != _cr1) window_set_cursor(_cr1);
}

#define window_frame_get_border_width
// window_frame_get_border_width(this:window_frame)->int
var _this = argument[0];
if (_this[22/* __isMaximized */]) return 0; else return _this[18/* border_width */];

#define window_frame_get_width
// window_frame_get_width(this:window_frame)->int
var _this = argument[0];
return window_get_width();

#define window_frame_get_height
// window_frame_get_height(this:window_frame)->int
var _this = argument[0];
return window_get_height();

#define window_frame_get_drag_flags
// window_frame_get_drag_flags(this:window_frame)->int
var _this = argument[0];
return window_frame_std_haxe_boot_wget(_this[13/* drag */], 1);

#define window_frame_update
// window_frame_update(this:window_frame)
var _this = argument[0];
_this[@4/* mouse_over_frame */] = false;
window_frame_delay_update(_this[14/* delay_mgr */]);
window_frame_cover_ensure(_this[15/* cover */]);
if (window_get_fullscreen() || _this[23/* is_fullscreen */]) return 0;
var _mx = (window_mouse_get_x() | 0);
var _my = (window_mouse_get_y() | 0);
var _gw = window_get_width();
var _gh = window_get_height();
var __borderWidth = (_this[22/* __isMaximized */] ? 0 : _this[18/* border_width */]);
var __this = _this[12/* caption */];
var __titleHeight = (window_frame_std_haxe_boot_wget(__this[1/* frame */], 22) ? __this[6/* height_maximized */] : __this[5/* height_normal */]);
var __buttons_x = window_frame_buttons_get_x(_this[11/* buttons */], _gw);
var __flags = 0;
var __titleHit = false;
var __hitSomething = true;
if (!window_get_fullscreen()) {
	if (!point_in_rectangle(_mx, _my, __buttons_x, __borderWidth, _gw - __borderWidth - ((_this[22/* __isMaximized */] ? 0 : _this[17/* resize_padding */])), __borderWidth + __titleHeight)) {
		if (!_this[22/* __isMaximized */] && _this[6/* can_resize */] && !point_in_rectangle(_mx, _my, _this[17/* resize_padding */], _this[17/* resize_padding */], _gw - _this[17/* resize_padding */], _gh - _this[17/* resize_padding */])) {
			if (_mx < _this[17/* resize_padding */]) __flags |= 1;
			if (_my < _this[17/* resize_padding */]) __flags |= 2;
			if (_mx >= _gw - _this[17/* resize_padding */]) __flags |= 4;
			if (_my >= _gh - _this[17/* resize_padding */]) __flags |= 8;
		} else if (point_in_rectangle(_mx, _my, 0, 0, _gw, __titleHeight)) {
			__titleHit = true;
		} else __hitSomething = false;
	}
}
_this[@4/* mouse_over_frame */] = __hitSomething;
if (window_frame_std_haxe_boot_wget(_this[13/* drag */], 1) == 0) {
	var __cursor = _this[19/* default_cursor */];
	if (_this[5/* can_input */] && _this[6/* can_resize */]) switch (__flags) {
		case 1: case 4: __cursor = cr_size_we; break;
		case 2: case 8: __cursor = cr_size_ns; break;
		case 3: case 12: __cursor = cr_size_nwse; break;
		case 6: case 9: __cursor = cr_size_nesw; break;
	}
	window_frame_set_window_cursor(_this, __cursor);
}
window_frame_buttons_update(_this[11/* buttons */], __buttons_x, __borderWidth, __titleHeight, _mx, _my);
if (_this[5/* can_input */] && mouse_check_button_pressed(1)) {
	if (__titleHit) {
		var __now = current_time;
		if (__now < _this[16/* last_title_click_at */] + _this[3/* double_click_time */]) {
			if (_this[22/* __isMaximized */]) window_frame_restore(_this); else window_frame_maximize(_this);
		} else {
			_this[@16/* last_title_click_at */] = __now;
			if (_this[22/* __isMaximized */]) window_frame_drag_start(_this[13/* drag */], 32); else window_frame_drag_start(_this[13/* drag */], 16);
		}
	} else if (__flags != 0 && _this[6/* can_resize */]) {
		window_frame_drag_start(_this[13/* drag */], __flags);
	}
}
if (_this[5/* can_input */]) {
	if (mouse_check_button_released(1)) window_frame_drag_stop(_this[13/* drag */]); else window_frame_drag_update(_this[13/* drag */]);
} else if (window_frame_std_haxe_boot_wget(_this[13/* drag */], 1) != 0) {
	window_frame_drag_stop(_this[13/* drag */]);
}

#define window_frame_draw
// window_frame_draw(this:window_frame)
var _this = argument[0];
if (window_get_fullscreen() || _this[23/* is_fullscreen */]) return 0;
var _gw = window_get_width();
var _gh = window_get_height();
__display_set_gui_maximise_base(browser_width / _gw, browser_height / _gh, _gw % 2 / -2, _gh % 2 / -2);
var __borderWidth = (_this[22/* __isMaximized */] ? 0 : _this[18/* border_width */]);
var __this = _this[12/* caption */];
var __titlebarHeight = (window_frame_std_haxe_boot_wget(__this[1/* frame */], 22) ? __this[6/* height_maximized */] : __this[5/* height_normal */]);
var __buttons_x = window_frame_buttons_get_x(_this[11/* buttons */], _gw);
if (!_this[22/* __isMaximized */]) script_execute(_this[25/* draw_border */], _this, 0, 0, _gw, _gh);
script_execute(window_frame_std_haxe_boot_wget(_this[12/* caption */], 7), _this, __borderWidth, __borderWidth, _gw - __borderWidth * 2, __titlebarHeight, __buttons_x);
script_execute(window_frame_std_haxe_boot_wget(_this[12/* caption */], 8), _this, __borderWidth, __borderWidth, __buttons_x - __borderWidth, __titlebarHeight);
window_frame_buttons_draw(_this[11/* buttons */], __buttons_x, __borderWidth, __titlebarHeight);
__display_gui_restore();

//}

//{ window_frame_button

#define window_frame_button_create
// window_frame_button_create(frame:window_frame, icon:sprite, subimg:int, onClick:function<button:window_frame_button; void>)
var _this = array_create(14);
/// @typedef {tuple<frame:window_frame,icon:sprite,subimg:int,margin_left:int,margin_right:int,hover:bool,pressed:bool,enabled:bool,fade:number,click:function<button:window_frame_button; void>,get_width:function<button:window_frame_button; int>,update:function<button:window_frame_button; void>,draw_underlay:function<button:window_frame_button; x:number; y:number; width:number; height:number; void>,draw_icon:function<button:window_frame_button; x:int; y:int; width:int; height:int; void>>} window_frame_button
_this[@13/* draw_icon */] = f_window_frame_button_draw_icon_default;
_this[@12/* draw_underlay */] = f_window_frame_button_draw_underlay_default;
_this[@11/* update */] = f_window_frame_button_new_update;
_this[@10/* get_width */] = f_window_frame_button_get_width_default;
_this[@8/* fade */] = 0.;
_this[@7/* enabled */] = true;
_this[@6/* pressed */] = false;
_this[@5/* hover */] = false;
_this[@4/* margin_right */] = 0;
_this[@3/* margin_left */] = 0;
_this[@0/* frame */] = undefined;
_this[@0/* frame */] = argument[0];
_this[@1/* icon */] = argument[1];
_this[@2/* subimg */] = argument[2];
_this[@9/* click */] = argument[3];
return _this;

#define window_frame_button_ease_inout_expo
// window_frame_button_ease_inout_expo(a:number, b:number, c:number, d:number)->number
var _a = argument[0], _b = argument[1], _c = argument[2];
_a /= argument[3] * 0.5;
if (_a < 1) return _c * 0.5 * power(2, 10 * (_a - 1)) + _b;
--_a;
return _c * 0.5 * (-power(2, -10 * _a) + 2) + _b;

#define window_frame_button_get_width_default
// window_frame_button_get_width_default(b:window_frame_button)->int
var _b = argument[0];
return sprite_get_width(_b[1/* icon */]);

#define window_frame_button_draw_underlay_default
// window_frame_button_draw_underlay_default(b:window_frame_button, x:number, y:number, width:number, height:number)
var _b = argument[0];
var _alpha1;
var _frame = _b[0/* frame */];
if (_b[7/* enabled */]) {
	if (_b[6/* pressed */]) {
		_alpha1 = 0.7;
		_b[@8/* fade */] = 1;
	} else {
		var _dt = delta_time / 1000000;
		if (_b[5/* hover */]) {
			if (_b[8/* fade */] < 1) _b[@8/* fade */] = min(_b[8/* fade */] + _dt / window_frame_std_haxe_boot_wget(_frame[11/* buttons */], 2), 1);
		} else if (_b[8/* fade */] > 0) {
			_b[@8/* fade */] = max(_b[8/* fade */] - _dt / window_frame_std_haxe_boot_wget(_frame[11/* buttons */], 2), 0);
		}
		_alpha1 = _b[8/* fade */] * 0.3;
	}
} else _alpha1 = 0.;
draw_sprite_stretched_ext(_frame[10/* spr_pixel */], 0, argument[1], argument[2], argument[3], argument[4], _frame[1/* blend */], _frame[2/* alpha */] * _alpha1);

#define window_frame_button_draw_icon_default
// window_frame_button_draw_icon_default(b:window_frame_button, x:int, y:int, width:int, height:int)
var _b = argument[0];
var _frame = _b[0/* frame */];
var _icon = _b[1/* icon */];
draw_sprite_ext(_icon, _b[2/* subimg */], (argument[1] + ((argument[3] - sprite_get_width(_icon)) div 2)), argument[2] + ((argument[4] - sprite_get_height(_icon)) div 2), 1, 1, 0, _frame[1/* blend */], _frame[2/* alpha */] * ((_b[7/* enabled */] ? 1 : 0.3)));

#define window_frame_button_new_update
// window_frame_button_new_update(_:window_frame_button)


//}

//{ window_frame_buttons

#define window_frame_buttons_create
// window_frame_buttons_create(frame:window_frame)
var _this = array_create(7);
/// @typedef {tuple<frame:window_frame,array:array<window_frame_button>,fade_time:number,wait_for_movement:window_frame_buttons_wait_for_movement,minimize:window_frame_button,maxrest:window_frame_button,close:window_frame_button>} window_frame_buttons
_this[@3/* wait_for_movement */] = window_frame_buttons_wait_for_movement_create();
_this[@2/* fade_time */] = 0.2;
_this[@1/* array */] = [];
_this[@0/* frame */] = argument[0];
return _this;

#define window_frame_buttons_add_default_buttons_lf
// window_frame_buttons_add_default_buttons_lf(button:window_frame_button)
var _button = argument[0];
window_frame_minimize(_button[0/* frame */]);

#define window_frame_buttons_add_default_buttons_lf1
// window_frame_buttons_add_default_buttons_lf1(button:window_frame_button)
var _button = argument[0];
var _frame = _button[0/* frame */];
if (_frame[22/* __isMaximized */]) window_frame_restore(_frame); else window_frame_maximize(_frame);
window_frame_buttons_reset(_frame[11/* buttons */]);

#define window_frame_buttons_add_default_buttons_update
// window_frame_buttons_add_default_buttons_update(b:window_frame_button)
var _b = argument[0];
_b[@2/* subimg */] = (window_frame_std_haxe_boot_wget(_b[0/* frame */], 22) ? 2 : 1);
_b[@7/* enabled */] = window_frame_std_haxe_boot_wget(_b[0/* frame */], 6);

#define window_frame_buttons_add_default_buttons_lf2
// window_frame_buttons_add_default_buttons_lf2(_:window_frame_button)
game_end();

#define window_frame_buttons_add_default_buttons_draw_underlay
// window_frame_buttons_add_default_buttons_draw_underlay(b:window_frame_button, _x:number, _y:number, _width:number, _height:number)
var _b = argument[0];
var _frame = _b[0/* frame */];
var __alpha = 0.;
if (_b[6/* pressed */]) {
	__alpha = 0.7;
	_b[@8/* fade */] = 1;
} else {
	var _dt = delta_time / 1000000;
	if (_b[5/* hover */]) {
		if (_b[8/* fade */] < 1) {
			_b[@8/* fade */] = max(_b[8/* fade */], 0.5);
			_b[@8/* fade */] = min(_b[8/* fade */] + _dt / window_frame_std_haxe_boot_wget(_frame[11/* buttons */], 2), 1);
		}
	} else if (_b[8/* fade */] > 0) {
		_b[@8/* fade */] = max(_b[8/* fade */] - _dt / window_frame_std_haxe_boot_wget(_frame[11/* buttons */], 2), 0);
	}
	__alpha = _frame[2/* alpha */] * _b[8/* fade */];
}
draw_sprite_stretched_ext(_frame[10/* spr_pixel */], 0, argument[1], argument[2], script_execute(_b[10/* get_width */], _b), argument[4], 2298344, __alpha);

#define window_frame_buttons_add
// window_frame_buttons_add(this:window_frame_buttons, button:window_frame_button)->window_frame_button
var _this = argument[0], _button = argument[1];
window_frame_std_gml_internal_ArrayImpl_push(_this[1/* array */], _button);
return _button;

#define window_frame_buttons_get_width
// window_frame_buttons_get_width(this:window_frame_buttons)->int
var _this = argument[0];
var _w = 0;
var __g = 0;
var __g1 = _this[1/* array */];
while (__g < array_length_1d(__g1)) {
	var _button = __g1[__g];
	++__g;
	_w += _button[3/* margin_left */] + script_execute(_button[10/* get_width */], _button) + _button[4/* margin_right */];
}
return _w;

#define window_frame_buttons_get_x
// window_frame_buttons_get_x(this:window_frame_buttons, windowWidth:int)->int
var _this = argument[0];
return argument[1] - ((window_frame_std_haxe_boot_wget(_this[0/* frame */], 22) ? 0 : window_frame_std_haxe_boot_wget(_this[0/* frame */], 18))) - window_frame_buttons_get_width(_this);

#define window_frame_buttons_reset
// window_frame_buttons_reset(this:window_frame_buttons)
var _this = argument[0];
var __g = 0;
var __g1 = _this[1/* array */];
while (__g < array_length_1d(__g1)) {
	var _button = __g1[__g];
	++__g;
	_button[@5/* hover */] = false;
	_button[@8/* fade */] = 0.;
	_button[@6/* pressed */] = false;
}

#define window_frame_buttons_update
// window_frame_buttons_update(this:window_frame_buttons, x:int, y:int, height:int, mx:int, my:int)
var _this = argument[0], _x = argument[1], _y = argument[2], _mx = argument[4], _my = argument[5];
var _over_row = _mx >= _y && _my < _y + argument[3] && borderless_tools_mouse_in_window();
if (window_frame_std_haxe_boot_wget(_this[3/* wait_for_movement */], 0)) {
	if (_mx != window_frame_std_haxe_boot_wget(_this[3/* wait_for_movement */], 1) || _my != window_frame_std_haxe_boot_wget(_this[3/* wait_for_movement */], 2)) window_frame_std_haxe_boot_wset(_this[3/* wait_for_movement */], 0, false); else _over_row = false;
}
var _pressed = mouse_check_button_pressed(1);
var _released = mouse_check_button_released(1);
var _disable = window_frame_std_haxe_boot_wget(window_frame_std_haxe_boot_wget(_this[0/* frame */], 13), 1) != 0 || !window_frame_std_haxe_boot_wget(_this[0/* frame */], 5);
var _i = 0;
for (var __g1 = array_length_1d(_this[1/* array */]); _i < __g1; _i++) {
	var _button = window_frame_std_haxe_boot_wget(_this[1/* array */], _i);
	script_execute(_button[11/* update */], _button);
	_x += _button[3/* margin_left */];
	var _width = script_execute(_button[10/* get_width */], _button);
	if (_disable || !_button[7/* enabled */]) {
		_button[@5/* hover */] = false;
		_button[@6/* pressed */] = false;
	} else if (_over_row && _mx >= _x && _mx < _x + _width) {
		_button[@5/* hover */] = true;
		if (_pressed) _button[@6/* pressed */] = true;
	} else _button[@5/* hover */] = false;
	if (_released && _button[6/* pressed */] && _button[5/* hover */]) {
		_button[@6/* pressed */] = false;
		script_execute(_button[9/* click */], _button);
	}
	_x += _width + _button[4/* margin_right */];
}

#define window_frame_buttons_draw
// window_frame_buttons_draw(this:window_frame_buttons, x:int, y:int, height:int)
var _this = argument[0], _x = argument[1], _y = argument[2], _height = argument[3];
var _i = 0;
for (var __g1 = array_length_1d(_this[1/* array */]); _i < __g1; _i++) {
	var _button = window_frame_std_haxe_boot_wget(_this[1/* array */], _i);
	_x += _button[3/* margin_left */];
	var _width = script_execute(_button[10/* get_width */], _button);
	script_execute(_button[12/* draw_underlay */], _button, _x, _y, _width, _height);
	script_execute(_button[13/* draw_icon */], _button, _x, _y, _width, _height);
	_x += _width + _button[4/* margin_right */];
}

#define window_frame_buttons_add_default_buttons
// window_frame_buttons_add_default_buttons(this:window_frame_buttons)
var _this = argument[0];
var _button = window_frame_button_create(_this[0/* frame */], window_frame_std_haxe_boot_wget(_this[0/* frame */], 9), 0, f_window_frame_buttons_add_default_buttons_lf);
window_frame_std_gml_internal_ArrayImpl_push(_this[1/* array */], _button);
_this[@4/* minimize */] = _button;
var _button = window_frame_button_create(_this[0/* frame */], window_frame_std_haxe_boot_wget(_this[0/* frame */], 9), 1, f_window_frame_buttons_add_default_buttons_lf1);
window_frame_std_gml_internal_ArrayImpl_push(_this[1/* array */], _button);
_this[@5/* maxrest */] = _button;
window_frame_std_haxe_boot_wset(_this[5/* maxrest */], 11, f_window_frame_buttons_add_default_buttons_update);
var _button = window_frame_button_create(_this[0/* frame */], window_frame_std_haxe_boot_wget(_this[0/* frame */], 9), 3, f_window_frame_buttons_add_default_buttons_lf2);
window_frame_std_gml_internal_ArrayImpl_push(_this[1/* array */], _button);
_this[@6/* close */] = _button;
window_frame_std_haxe_boot_wset(_this[6/* close */], 12, f_window_frame_buttons_add_default_buttons_draw_underlay);

//}

//{ window_frame_buttons_wait_for_movement

#define window_frame_buttons_wait_for_movement_create
// window_frame_buttons_wait_for_movement_create()
var _this = array_create(3);
/// @typedef {tuple<enabled:bool,x:number,y:number>} window_frame_buttons_wait_for_movement
_this[@2/* y */] = 0.;
_this[@1/* x */] = 0.;
_this[@0/* enabled */] = false;
return _this;

//}

//{ window_frame_caption

#define window_frame_caption_create
// window_frame_caption_create(frame:window_frame)
var _this = [mt_window_frame_caption];
array_copy(_this, 1, mq_window_frame_caption, 1, 8);
/// @typedef {tuple<any,frame:window_frame,text:string,font:font,icon:sprite,height_normal:int,height_maximized:int,draw_background:function<frame:window_frame; x:int; y:int; width:int; height:int; buttonsX:int; void>,draw_text:function<frame:window_frame; x:int; y:int; width:int; height:int; void>>} window_frame_caption
var _frame = argument[0];
_this[@8/* draw_text */] = f_window_frame_caption_draw_caption_text_default;
_this[@7/* draw_background */] = f_window_frame_caption_draw_caption_rect_default;
_this[@4/* icon */] = -1;
_this[@3/* font */] = -1;
_this[@2/* text */] = window_get_caption();
_this[@1/* frame */] = _frame;
_this[@5/* height_normal */] = sprite_get_height(_frame[8/* spr_caption */]);
_this[@6/* height_maximized */] = round(_this[5/* height_normal */] * 2 / 3);
return _this;

#define window_frame_caption_draw_caption_rect_default
// window_frame_caption_draw_caption_rect_default(frame:window_frame, _x:int, _y:int, _width:int, _height:int, _buttons_x:int)
var _frame = argument[0];
window_frame_helpers_draw9slice(_frame[8/* spr_caption */], (window_has_focus() ? 1 : 0), argument[1], argument[2], argument[3], argument[4], _frame[1/* blend */], _frame[2/* alpha */], true);

#define window_frame_caption_draw_caption_text_default
// window_frame_caption_draw_caption_text_default(frame:window_frame, _x:int, _y:int, _width:number, _height:int)
var _frame = argument[0], __x = argument[1], __y = argument[2], __width = argument[3], __height = argument[4];
var _caption = _frame[12/* caption */];
__x += 6;
var _icon = _caption[4/* icon */];
if (_icon != -1) {
	draw_sprite(_icon, -1, (__x + sprite_get_xoffset(_icon)), __y + ((__height - sprite_get_height(_icon)) div 2) + sprite_get_yoffset(_icon));
	__x += 4 + sprite_get_width(_icon);
}
var _text = _caption[2/* text */];
if (_text == "") return 0;
var __newFont = _caption[3/* font */];
var __h = draw_get_halign();
var __v = draw_get_valign();
var __oldFont;
if (__newFont != -1) {
	__oldFont = draw_get_font();
	draw_set_font(__newFont);
} else __oldFont = -1;
draw_set_halign(0);
draw_set_valign(0);
draw_text_ext(__x, __y + ((__height - string_height_ext(_text, -1, __width)) div 2), _text, -1, __width);
if (__newFont != -1) draw_set_font(__oldFont);
draw_set_halign(__h);
draw_set_valign(__v);

#define window_frame_caption_get_height
// window_frame_caption_get_height(this:window_frame_caption)->int
var _this = argument[0];
if (window_frame_std_haxe_boot_wget(_this[1/* frame */], 22)) return _this[6/* height_maximized */]; else return _this[5/* height_normal */];

//}

//{ window_frame_cover

#define window_frame_cover_create
// window_frame_cover_create(frame:window_frame)
var _this = [mt_window_frame_cover];
array_copy(_this, 1, mq_window_frame_cover, 1, 5);
/// @typedef {tuple<any,frame:window_frame,check_for_success:bool,ignore_rect:WindowFrameRect,can_ignore:bool,curr_rect:WindowFrameRect>} window_frame_cover
_this[@5/* curr_rect */] = _window_frame_rect_window_frame_rect_impl___new();
_this[@4/* can_ignore */] = false;
_this[@3/* ignore_rect */] = _window_frame_rect_window_frame_rect_impl___new();
_this[@2/* check_for_success */] = false;
_this[@1/* frame */] = argument[0];
return _this;

#define window_frame_cover_ensure
// window_frame_cover_ensure(this:window_frame_cover)
var _this = argument[0];
var __just_changed = _this[2/* check_for_success */];
if (__just_changed) _this[@2/* check_for_success */] = false;
var __target_rect;
if (window_get_fullscreen()) {
	_this[@4/* can_ignore */] = false;
	return 0;
} else if (window_frame_std_haxe_boot_wget(_this[1/* frame */], 23)) {
	__target_rect = window_frame_std_haxe_boot_wget(window_frame_get_active_monitor(_this[1/* frame */]), 0);
} else if (window_frame_std_haxe_boot_wget(_this[1/* frame */], 22)) {
	__target_rect = window_frame_std_haxe_boot_wget(window_frame_get_active_monitor(_this[1/* frame */]), 1);
} else {
	_this[@4/* can_ignore */] = false;
	return 0;
}
_window_frame_rect_window_frame_rect_impl__get_window_rect(_this[5/* curr_rect */]);
if (!_window_frame_rect_window_frame_rect_impl__equals(_this[5/* curr_rect */], __target_rect)) {
	if (__just_changed) {
		_this[@4/* can_ignore */] = true;
		_window_frame_rect_window_frame_rect_impl__set_to(_this[3/* ignore_rect */], __target_rect);
		if (window_frame_std_haxe_boot_wget(_this[1/* frame */], 0)) window_frame_mylog(_this[1/* frame */], "[cover] Resize failed - ignoring");
		return 0;
	}
	if (_this[4/* can_ignore */] && _window_frame_rect_window_frame_rect_impl__equals(__target_rect, _this[3/* ignore_rect */])) return 0;
	if (window_frame_std_haxe_boot_wget(_this[1/* frame */], 0)) window_frame_mylog(_this[1/* frame */], "[cover] Adjusting window rectangle to ", __target_rect);
	_window_frame_rect_window_frame_rect_impl__set_window_rect(__target_rect);
	_this[@2/* check_for_success */] = true;
}

//}

//{ window_frame_delay

#define window_frame_delay_create
// window_frame_delay_create()
var _this = array_create(2);
/// @typedef {tuple<queue:ds_queue<WindowFrameDelayItem>,frame_index:int>} window_frame_delay
_this[@1/* frame_index */] = 0;
_this[@0/* queue */] = ds_queue_create();
return _this;

#define window_frame_delay_add
// window_frame_delay_add(this:window_frame_delay, func:any, delay:int, ...:any?)
var _this = argument[0], _arg0, _arg1, _arg2, _arg3;
if (argument_count > 3) _arg0 = argument[3]; else _arg0 = undefined;
if (argument_count > 4) _arg1 = argument[4]; else _arg1 = undefined;
if (argument_count > 5) _arg2 = argument[5]; else _arg2 = undefined;
if (argument_count > 6) _arg3 = argument[6]; else _arg3 = undefined;
ds_queue_enqueue(_this[0/* queue */], [/* func: */argument[1], /* time: */_this[1/* frame_index */] + argument[2], /* arg0: */_arg0, /* arg1: */_arg1, /* arg2: */_arg2, /* arg3: */_arg3]);

#define window_frame_delay_update
// window_frame_delay_update(this:window_frame_delay)
var _this = argument[0];
_this[@1/* frame_index */] += 1;
var _f;
while (!ds_queue_empty(_this[0/* queue */])) {
	var _head = ds_queue_head(_this[0/* queue */]);
	if (_head[1/* time */] > _this[1/* frame_index */]) break;
	ds_queue_dequeue(_this[0/* queue */]);
	_f = _head[0/* func */];
	script_execute(_f, _head[2/* arg0 */], _head[3/* arg1 */], _head[4/* arg2 */], _head[5/* arg3 */]);
}

//}

//{ window_frame_drag

#define window_frame_drag_create
// window_frame_drag_create(frame:window_frame)
var _this = array_create(8);
/// @typedef {tuple<frame:window_frame,flags:int,mx:int,my:int,left:int,top:int,right:int,bottom:int>} window_frame_drag
_this[@7/* bottom */] = 0;
_this[@6/* right */] = 0;
_this[@5/* top */] = 0;
_this[@4/* left */] = 0;
_this[@3/* my */] = 0;
_this[@2/* mx */] = 0;
_this[@1/* flags */] = 0;
_this[@0/* frame */] = argument[0];
return _this;

#define window_frame_drag_start
// window_frame_drag_start(this:window_frame_drag, flags:int)
var _this = argument[0];
_this[@1/* flags */] = argument[1];
_this[@2/* mx */] = (display_mouse_get_x() | 0);
_this[@3/* my */] = (display_mouse_get_y() | 0);
_this[@4/* left */] = window_get_x();
_this[@5/* top */] = window_get_y();
_this[@6/* right */] = _this[4/* left */] + window_get_width();
_this[@7/* bottom */] = _this[5/* top */] + window_get_height();

#define window_frame_drag_stop
// window_frame_drag_stop(this:window_frame_drag)
var _this = argument[0];
_this[@1/* flags */] = 0;

#define window_frame_drag_update
// window_frame_drag_update(this:window_frame_drag)
var _this = argument[0];
if (_this[1/* flags */] == 0) return 0;
var __mx = (display_mouse_get_x() | 0);
var __my = (display_mouse_get_y() | 0);
switch (_this[1/* flags */]) {
	case 16: window_set_position(__mx - (_this[2/* mx */] - _this[4/* left */]), __my - (_this[3/* my */] - _this[5/* top */])); break;
	case 32:
		if (point_distance(__mx, __my, _this[2/* mx */], _this[3/* my */]) > 5) {
			var __x;
			var __y = _this[3/* my */] - _this[5/* top */];
			if (_this[2/* mx */] - _this[4/* left */] < (_this[6/* right */] - _this[4/* left */]) / 2) __x = min(_this[2/* mx */] - _this[4/* left */], (window_frame_std_haxe_boot_wget(window_frame_std_haxe_boot_wget(_this[0/* frame */], 24), 2) >> 1)); else __x = max(window_frame_std_haxe_boot_wget(window_frame_std_haxe_boot_wget(_this[0/* frame */], 24), 2) + _this[2/* mx */] - _this[6/* right */], (window_frame_std_haxe_boot_wget(window_frame_std_haxe_boot_wget(_this[0/* frame */], 24), 2) >> 1));
			window_frame_std_haxe_boot_wset(_this[0/* frame */], 22, false);
			window_set_rectangle(__mx - __x, __my - __y, window_frame_std_haxe_boot_wget(window_frame_std_haxe_boot_wget(_this[0/* frame */], 24), 2), window_frame_std_haxe_boot_wget(window_frame_std_haxe_boot_wget(_this[0/* frame */], 24), 3));
			window_frame_drag_start(_this, 16);
		}
		break;
	case 1:
		var __x = __mx - (_this[2/* mx */] - _this[4/* left */]);
		window_set_rectangle(__x, _this[5/* top */], _this[6/* right */] - __x, _this[7/* bottom */] - _this[5/* top */]);
		break;
	case 2:
		var __y = __my - (_this[3/* my */] - _this[5/* top */]);
		window_set_rectangle(_this[4/* left */], __y, _this[6/* right */] - _this[4/* left */], _this[7/* bottom */] - __y);
		break;
	case 4: window_set_rectangle(_this[4/* left */], _this[5/* top */], _this[6/* right */] - _this[4/* left */] - _this[2/* mx */] + __mx, _this[7/* bottom */] - _this[5/* top */]); break;
	case 8: window_set_rectangle(_this[4/* left */], _this[5/* top */], _this[6/* right */] - _this[4/* left */], _this[7/* bottom */] - _this[5/* top */] - _this[3/* my */] + __my); break;
	case 3:
		var __x = __mx - (_this[2/* mx */] - _this[4/* left */]);
		var __y = __my - (_this[3/* my */] - _this[5/* top */]);
		window_set_rectangle(__x, __y, _this[6/* right */] - __x, _this[7/* bottom */] - __y);
		break;
	case 9:
		var __x = __mx - (_this[2/* mx */] - _this[4/* left */]);
		window_set_rectangle(__x, _this[5/* top */], _this[6/* right */] - __x, _this[7/* bottom */] - _this[5/* top */] - _this[3/* my */] + __my);
		break;
	case 6:
		var __y = __my - (_this[3/* my */] - _this[5/* top */]);
		window_set_rectangle(_this[4/* left */], __y, _this[6/* right */] - _this[4/* left */] - _this[2/* mx */] + __mx, _this[7/* bottom */] - __y);
		break;
	case 12: window_set_rectangle(_this[4/* left */], _this[5/* top */], _this[6/* right */] - _this[4/* left */] - _this[2/* mx */] + __mx, _this[7/* bottom */] - _this[5/* top */] - _this[3/* my */] + __my); break;
}

//}

//{ window_frame_helpers

#define window_frame_helpers_draw9slice
// window_frame_helpers_draw9slice(spr:sprite, subimg:int, x:int, y:int, w:int, h:int, c:int, a:number, fill:bool)
var _spr = argument[0], _subimg = argument[1], _x = argument[2], _y = argument[3], _w = argument[4], _h = argument[5], _c = argument[6], _a = argument[7];
var _sw = sprite_get_width(_spr);
var _sw1 = (_sw >> 1);
var _sw2 = (_sw >> 2);
var _sw3 = _sw - _sw2;
var _sh = sprite_get_height(_spr);
var _sh1 = (_sh >> 1);
var _sh2 = (_sh >> 2);
var _sh3 = _sh - _sh2;
draw_sprite_part_ext(_spr, _subimg, 0, 0, _sw2, _sh2, _x, _y, 1, 1, _c, _a);
draw_sprite_part_ext(_spr, _subimg, _sw3, 0, _sw2, _sh2, _x + _w - _sw2, _y, 1, 1, _c, _a);
draw_sprite_part_ext(_spr, _subimg, 0, _sh3, _sw2, _sh2, _x, _y + _h - _sh2, 1, 1, _c, _a);
draw_sprite_part_ext(_spr, _subimg, _sw3, _sh3, _sw2, _sh2, _x + _w - _sw2, _y + _h - _sh2, 1, 1, _c, _a);
draw_sprite_part_ext(_spr, _subimg, _sw2, 0, _sw1, _sh2, _x + _sw2, _y, (_w - _sw1) / _sw1, _sh2 / _sh2, _c, _a);
draw_sprite_part_ext(_spr, _subimg, _sw2, _sh3, _sw1, _sh2, _x + _sw2, _y + _h - _sh2, (_w - _sw1) / _sw1, _sh2 / _sh2, _c, _a);
draw_sprite_part_ext(_spr, _subimg, 0, _sh2, _sw2, _sh1, _x, _y + _sh2, _sw2 / _sw2, (_h - _sh1) / _sh1, _c, _a);
draw_sprite_part_ext(_spr, _subimg, _sw3, _sh2, _sw2, _sh1, _x + _w - _sw2, _y + _sh2, _sw2 / _sw2, (_h - _sh1) / _sh1, _c, _a);
if (argument[8]) draw_sprite_part_ext(_spr, _subimg, _sw2, _sh2, _sw1, _sh1, _x + _sw2, _y + _sh2, (_w - _sw1) / _sw1, (_h - _sh1) / _sh1, _c, _a);

//}

//{ _window_frame_rect.window_frame_rect_impl_

#define _window_frame_rect_window_frame_rect_impl___new
// _window_frame_rect_window_frame_rect_impl___new(...:int)->WindowFrameRect
var _x, _y, _w, _h;
if (argument_count > 0) _x = argument[0]; else _x = 0;
if (argument_count > 1) _y = argument[1]; else _y = 0;
if (argument_count > 2) _w = argument[2]; else _w = 0;
if (argument_count > 3) _h = argument[3]; else _h = 0;
return [/* x: */_x, /* y: */_y, /* width: */_w, /* height: */_h];

#define _window_frame_rect_window_frame_rect_impl__get_window_rect
// _window_frame_rect_window_frame_rect_impl__get_window_rect(this:WindowFrameRectImpl)
var _this1 = argument[0];
_this1[@0/* x */] = window_get_x();
_this1[@1/* y */] = window_get_y();
_this1[@2/* width */] = window_get_width();
_this1[@3/* height */] = window_get_height();

#define _window_frame_rect_window_frame_rect_impl__set_window_rect
// _window_frame_rect_window_frame_rect_impl__set_window_rect(this:WindowFrameRectImpl)
var _this1 = argument[0];
window_set_rectangle(_this1[0/* x */], _this1[1/* y */], _this1[2/* width */], _this1[3/* height */]);

#define _window_frame_rect_window_frame_rect_impl__equals
// _window_frame_rect_window_frame_rect_impl__equals(this:WindowFrameRectImpl, o:WindowFrameRect)->bool
var _this1 = argument[0], _o = argument[1];
return _this1[0/* x */] == _o[0/* x */] && _this1[1/* y */] == _o[1/* y */] && _this1[2/* width */] == _o[2/* width */] && _this1[3/* height */] == _o[3/* height */];

#define _window_frame_rect_window_frame_rect_impl__set_to
// _window_frame_rect_window_frame_rect_impl__set_to(this:WindowFrameRectImpl, o:WindowFrameRect)
var _this1 = argument[0], _o = argument[1];
_this1[@0/* x */] = _o[0/* x */];
_this1[@1/* y */] = _o[1/* y */];
_this1[@2/* width */] = _o[2/* width */];
_this1[@3/* height */] = _o[3/* height */];

//}

//{ window_frame_std.haxe.class

#define window_frame_std_haxe_class_create
// window_frame_std_haxe_class_create(id:int, name:string)
var _this = ["mt_window_frame_std_haxe_class"];
array_copy(_this, 1, mq_window_frame_std_haxe_class, 1, 5);
/// @typedef {tuple<any,marker:any,index:int,name:string,superClass:haxe_class<any>,constructor:any>} window_frame_std_haxe_class
_this[@4/* superClass */] = undefined;
_this[@1/* marker */] = window_frame_std_haxe_type_markerValue;
_this[@2/* index */] = argument[0];
_this[@3/* name */] = argument[1];
return _this;

//}

//{ window_frame_std.gml.internal.ArrayImpl

#define window_frame_std_gml_internal_ArrayImpl_push
// window_frame_std_gml_internal_ArrayImpl_push(arr:array<T>, val:T)->int
var _arr = argument[0];
var _i = array_length_1d(_arr);
_arr[@_i] = argument[1];
return _i;

//}

//{ window_frame_std.haxe.boot

#define window_frame_std_haxe_boot_wget
// window_frame_std_haxe_boot_wget(arr:array<T>, index:int)->T
var _arr = argument[0], _index = argument[1];
return _arr[_index];

#define window_frame_std_haxe_boot_wset
// window_frame_std_haxe_boot_wset(arr:array<T>, index:int, value:T)
var _arr = argument[0], _index = argument[1];
_arr[@_index] = argument[2];

//}

/// @typedef {any} WindowFrameRectImpl
/// @typedef {any} WindowFrameRect
/// @typedef {any} WindowFrameDelayItem
/// @typedef {any} WindowFrameMonitorInfo