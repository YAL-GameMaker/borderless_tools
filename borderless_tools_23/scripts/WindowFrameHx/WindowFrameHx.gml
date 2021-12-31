// Generated at 2021-12-27 06:19:59 (384ms) for v2.3.1+
/// @lint nullToAny true
#region metatype
globalvar haxe_type_markerValue; haxe_type_markerValue = [];
globalvar mt_WindowFrameCover; mt_WindowFrameCover = new haxe_class(-1, "WindowFrameCover");
globalvar mt_haxe_class; mt_haxe_class = new haxe_class(-1, "haxe_class");
#endregion

#region Std

function Std_stringify(_value) {
	// Std_stringify(value:any)->string
	if (_value == undefined) return "null";
	if (is_string(_value)) return _value;
	var _n, _i, _s;
	if (is_struct(_value)) {
		var _e = variable_struct_get(_value, "__enum__");
		if (_e == undefined) return string(_value);
		var _ects = _e.constructors;
		if (_ects != undefined) {
			_i = _value.__enumIndex__;
			if (_i >= 0 && _i < array_length(_ects)) _s = _ects[_i]; else _s = "?";
		} else {
			_s = instanceof(_value);
			if (string_copy(_s, 1, 3) == "mc_") _s = string_delete(_s, 1, 3);
			_n = string_length(_e.name);
			if (string_copy(_s, 1, _n) == _e.name) _s = string_delete(_s, 1, _n + 1);
		}
		_s += "(";
		var _fields = _value.__enumParams__;
		_n = array_length(_fields);
		for (_i = -1; ++_i < _n; _s += Std_stringify(variable_struct_get(_value, _fields[_i]))) {
			if (_i > 0) _s += ", ";
		}
		return _s + ")";
	}
	if (is_real(_value)) {
		_s = string_format(_value, 0, 16);
		if (os_browser != browser_not_a_browser) {
			_n = string_length(_s);
			_i = _n;
			while (_i > 0) {
				switch (string_ord_at(_s, _i)) {
					case 48:
						_i--;
						continue;
					case 46: _i--; break;
				}
				break;
			}
		} else {
			_n = string_byte_length(_s);
			_i = _n;
			while (_i > 0) {
				switch (string_byte_at(_s, _i)) {
					case 48:
						_i--;
						continue;
					case 46: _i--; break;
				}
				break;
			}
		}
		return string_copy(_s, 1, _i);
	}
	return string(_value);
}

#endregion

#region WindowFrame

function WindowFrame(_sprBorder, _sprCaption, _sprButtons, _sprPixel) constructor {
	/// WindowFrame(...:sprite?:sprite?)
	/// @param ...
	static sprBorder = undefined; /// @is {sprite}
	static sprCaption = undefined; /// @is {sprite}
	static sprButtons = undefined; /// @is {sprite}
	static sprPixel = undefined; /// @is {sprite}
	static debug = undefined; /// @is {bool}
	static mylog = function(_args1) {
		if (!self.debug) return 0;
		var _s = "[WindowFrame] ";
		var __g_current = 0;
		var __g_args = _args1;
		while (__g_current < array_length(__g_args)) {
			_s += Std_stringify(__g_args[__g_current++]);
		}
		show_debug_message(_s);
	}
	static blend = undefined; /// @is {int}
	static alpha = undefined; /// @is {number}
	static doubleClickTime = undefined; /// @is {int}
	static mouseOverFrame = undefined; /// @is {bool}
	static canInput = undefined; /// @is {bool}
	static canResize = undefined; /// @is {bool}
	static titlebarHeight = undefined; /// @is {int}
	static titlebarHeightMaximized = undefined; /// @is {int}
	static lastTitleClickAt = undefined; /// @is {int}
	static resizePadding = undefined; /// @is {int}
	static borderWidth = undefined; /// @is {int}
	static buttons = undefined; /// @is {WindowFrameButtons}
	static drag = undefined; /// @is {WindowFrameDrag}
	static delayMgr = undefined; /// @is {WindowFrameDelay}
	static cover = undefined; /// @is {WindowFrameCover}
	static defaultCursor = undefined; /// @is {cr}
	static isMaximized = undefined; /// @is {bool}
	static isFullscreen = undefined; /// @is {bool}
	static restoreRect = undefined; /// @is {WindowFrameRect}
	static delay0 = function(_func, _delay) {
		self.delayMgr.add(_func, _delay);
	}
	static delay1 = function(_arg0, _delay, _func) {
		self.delayMgr.add(_func, _delay, _arg0);
	}
	static delay2 = function(_arg0, _arg1, _delay, _func) {
		self.delayMgr.add(_func, _delay, _arg0, _arg1);
	}
	static delay3 = function(_func, _delay, _arg0, _arg1, _arg2) {
		if (false) show_debug_message(argument[4]);
		self.delayMgr.add(_func, _delay, _arg0, _arg1, _arg2);
	}
	static delay4 = function(_func, _delay, _arg0, _arg1, _arg2, _arg3) {
		if (false) show_debug_message(argument[5]);
		self.delayMgr.add(_func, _delay, _arg0, _arg1, _arg2, _arg3);
	}
	static getButtonsX = function(__width) {
		return ((self.isMaximized ? __width : __width - self.borderWidth)) - self.buttons.getWidth();
	}
	static getActiveMonitor = function() {
		var __list = WindowFrame_getActiveMonitor_list;
		if (__list == undefined) {
			__list = ds_list_create();
			WindowFrame_getActiveMonitor_list = __list;
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
			var _x = 0;
			var _y = 0;
			var _w = display_get_width();
			var _h = display_get_height();
			if (_h == undefined) _h = 0;
			if (_w == undefined) _w = 0;
			if (_y == undefined) _y = 0;
			if (_x == undefined) _x = 0;
			var _this1 = [/* x: */_x, /* y: */_y, /* width: */_w, /* height: */_h];
			var _x = 0;
			var _y = 0;
			var _w = display_get_width();
			var _h = display_get_height() - 40;
			if (_h == undefined) _h = 0;
			if (_w == undefined) _w = 0;
			if (_y == undefined) _y = 0;
			if (_x == undefined) _x = 0;
			__item = [/* screen: */_this1, /* workspace: */[/* x: */_x, /* y: */_y, /* width: */_w, /* height: */_h], /* flags: */0];
			__list[|0] = __item;
		}
		return __item;
	}
	static maximize = function() {
		if (self.isMaximized || self.isFullscreen) return 0;
		self.isMaximized = true;
		self.storeRect();
		self.maximize_1();
	}
	static maximize_1 = function() {
		var __work = self.getActiveMonitor()[1/* workspace */];
		if (self.debug) self.mylog("maximize: ", __work);
		_WindowFrameRect_WindowFrameRect_Impl__setWindowRect(__work);
		borderless_tools_set_shadow(false);
	}
	static storeRect = function() {
		_WindowFrameRect_WindowFrameRect_Impl__getWindowRect(self.restoreRect);
		if (self.debug) self.mylog("storeRect: ", self.restoreRect);
	}
	static restore = function(__force) {
		if (__force == undefined) __force = false;
		if (false) show_debug_message(argument[0]);
		if (window_get_fullscreen()) {
			window_set_fullscreen(false);
			self.delayMgr.add(function(_f) {
				_f.restore()
			}, 1, self);
			return 0;
		}
		if (!__force && !self.isMaximized && !self.isFullscreen) return 0;
		self.isMaximized = false;
		self.isFullscreen = false;
		var __rect = self.restoreRect;
		if (self.debug) self.mylog("restore: ", __rect);
		_WindowFrameRect_WindowFrameRect_Impl__setWindowRect(__rect);
		borderless_tools_set_shadow(true);
	}
	static setFullscreen = function(__mode, __wasFullscreen) {
		if (__wasFullscreen == undefined) __wasFullscreen = false;
		if (false) show_debug_message(argument[1]);
		if (self.debug) self.mylog("setFullscreen(mode:", __mode, ", wasfs:", __wasFullscreen, ")");
		if (__mode == 1 || __mode == 2) {
			self.buttons.reset();
			self.drag.stop();
		}
		switch (__mode) {
			case 1:
				if (window_get_fullscreen()) return 0;
				if (self.isFullscreen) {
					self.restore();
					self.delayMgr.add(function(_f) {
						_f.setFullscreen(1)
					}, 1, self);
					return 0;
				} else self.storeRect();
				window_set_fullscreen(true);
				break;
			case 2:
				if (window_get_fullscreen()) {
					window_set_fullscreen(false);
					self.delayMgr.add(function(_f) {
						_f.setFullscreen(2, true)
					}, 10, self);
					return 0;
				}
				if (self.isFullscreen) return 0;
				self.isFullscreen = true;
				if (!self.isMaximized && !__wasFullscreen) self.storeRect();
				_WindowFrameRect_WindowFrameRect_Impl__setWindowRect(self.getActiveMonitor()[0/* screen */]);
				borderless_tools_set_shadow(false);
				break;
			default:
				if (window_get_fullscreen() && self.isFullscreen) {
					window_set_fullscreen(false);
					self.delayMgr.add(function(_f) {
						_f.setFullscreen(0)
					}, 1, self);
					return 0;
				}
				if (window_get_fullscreen()) {
					window_set_fullscreen(false);
				} else if (self.isMaximized) {
					self.isFullscreen = false;
					self.maximize_1();
				} else self.restore();
		}
	}
	static setWindowCursor = function(_cr1) {
		if (window_get_cursor() != _cr1) window_set_cursor(_cr1);
	}
	static getBorderWidth = function() {
		if (self.isMaximized) return 0; else return self.borderWidth;
	}
	static getTitlebarHeight = function() {
		if (self.isMaximized) return self.titlebarHeightMaximized; else return self.titlebarHeight;
	}
	static getWidth = function() {
		return window_get_width();
	}
	static getHeight = function() {
		return window_get_height();
	}
	static update = function() {
		self.mouseOverFrame = false;
		self.delayMgr.update();
		self.cover.ensure();
		if (window_get_fullscreen() || self.isFullscreen) return 0;
		var _mx = (window_mouse_get_x() | 0);
		var _my = (window_mouse_get_y() | 0);
		var _gw = window_get_width();
		var _gh = window_get_height();
		var __borderWidth = (self.isMaximized ? 0 : self.borderWidth);
		var __titleHeight = (self.isMaximized ? self.titlebarHeightMaximized : self.titlebarHeight);
		var __buttons_x = self.getButtonsX(_gw);
		var __flags = 0;
		var __titleHit = false;
		var __hitSomething = true;
		if (!window_get_fullscreen()) {
			if (!point_in_rectangle(_mx, _my, __buttons_x, __borderWidth, _gw - __borderWidth - ((self.isMaximized ? 0 : self.resizePadding)), __borderWidth + __titleHeight)) {
				if (!self.isMaximized && !point_in_rectangle(_mx, _my, self.resizePadding, self.resizePadding, _gw - self.resizePadding, _gh - self.resizePadding)) {
					if (_mx < self.resizePadding) __flags |= 1;
					if (_my < self.resizePadding) __flags |= 2;
					if (_mx >= _gw - self.resizePadding) __flags |= 4;
					if (_my >= _gh - self.resizePadding) __flags |= 8;
				} else if (point_in_rectangle(_mx, _my, 0, 0, _gw, self.titlebarHeight)) {
					__titleHit = true;
				} else __hitSomething = false;
			}
		}
		self.mouseOverFrame = __hitSomething;
		if (self.drag.flags == 0) {
			var __cursor = self.defaultCursor;
			if (self.canInput && self.canResize) switch (__flags) {
				case 1: case 4: __cursor = cr_size_we; break;
				case 2: case 8: __cursor = cr_size_ns; break;
				case 3: case 12: __cursor = cr_size_nwse; break;
				case 6: case 9: __cursor = cr_size_nesw; break;
			}
			if (window_get_cursor() != __cursor) window_set_cursor(__cursor);
		}
		self.buttons.update(__buttons_x, __borderWidth, __titleHeight, _mx, _my);
		if (self.canInput && mouse_check_button_pressed(1)) {
			if (__titleHit) {
				var __now = current_time;
				if (__now < self.lastTitleClickAt + self.doubleClickTime) {
					if (self.isMaximized) self.restore(); else self.maximize();
				} else {
					self.lastTitleClickAt = __now;
					if (self.isMaximized) self.drag.start(32); else self.drag.start(16);
				}
			} else if (__flags != 0 && self.canResize) {
				self.drag.start(__flags);
			}
		}
		if (self.canInput) {
			if (mouse_check_button_released(1)) self.drag.stop(); else self.drag.update();
		} else if (self.drag.flags != 0) {
			self.drag.stop();
		}
	}
	static drawBorder = function(__x, __y, __width, __height) {
		draw_sprite_stretched_ext(self.sprBorder, 0, __x, __y, __width, __height, self.blend, self.alpha);
	}
	static drawCaptionRect = function(__x, __y, __width, __height, __buttons_x) {
		draw_sprite_stretched_ext(self.sprCaption, (window_has_focus() ? 1 : 0), __x, __y, __width, __height, self.blend, self.alpha);
	}
	static drawCaptionText = function(__x, __y, __width, __height) {
		var __h = draw_get_halign();
		var __v = draw_get_valign();
		draw_set_halign(0);
		draw_set_valign(0);
		draw_text_ext(__x + 4, __y + (__height div 2), "", -1, __width);
		draw_set_halign(__h);
		draw_set_valign(__v);
	}
	static draw = function() {
		if (window_get_fullscreen() || self.isFullscreen) return 0;
		var _gw = window_get_width();
		var _gh = window_get_height();
		__display_set_gui_maximise_base(browser_width / _gw, browser_height / _gh, _gw % 2 / -2, _gh % 2 / -2);
		var __borderWidth = (self.isMaximized ? 0 : self.borderWidth);
		var __titlebarHeight = (self.isMaximized ? self.titlebarHeightMaximized : self.titlebarHeight);
		var __buttons_x = self.getButtonsX(_gw);
		if (!self.isMaximized) self.drawBorder(0, 0, _gw, _gh);
		self.drawCaptionRect(__borderWidth, __borderWidth, _gw - __borderWidth * 2, __titlebarHeight, __buttons_x);
		self.drawCaptionText(__borderWidth, __borderWidth, __buttons_x - __borderWidth, __titlebarHeight);
		self.buttons.draw(__buttons_x, __borderWidth, __titlebarHeight);
		__display_gui_restore();
	}
	static getDragFlags = function() {
		return self.drag.flags;
	}
	if (false) show_debug_message(argument[3]);
	self.restoreRect = [/* x: */0, /* y: */0, /* width: */0, /* height: */0];
	self.isFullscreen = false;
	self.isMaximized = false;
	self.defaultCursor = cr_arrow;
	self.borderWidth = 2;
	self.resizePadding = 6;
	self.lastTitleClickAt = -5000;
	self.titlebarHeightMaximized = 21;
	self.canResize = true;
	self.canInput = true;
	self.mouseOverFrame = false;
	self.doubleClickTime = borderless_tools_double_click_time();
	self.alpha = 1.;
	self.blend = 16777215;
	self.debug = false;
	if (_sprBorder == undefined) _sprBorder = spr_window_border;
	if (_sprCaption == undefined) _sprCaption = spr_window_caption;
	if (_sprButtons == undefined) _sprButtons = spr_window_buttons;
	if (_sprPixel == undefined) _sprPixel = spr_window_pixel;
	self.sprBorder = _sprBorder;
	self.sprCaption = _sprCaption;
	self.sprButtons = _sprButtons;
	self.sprPixel = _sprPixel;
	self.titlebarHeight = sprite_get_height(_sprCaption);
	self.drag = new WindowFrameDrag(self);
	self.delayMgr = new WindowFrameDelay();
	self.cover = new WindowFrameCover(self);
	_WindowFrameRect_WindowFrameRect_Impl__getWindowRect(self.restoreRect);
	self.buttons = new WindowFrameButtons(self);
	self.buttons.addDefaultButtons();
	//
}

function WindowFrame_draw9slice(_spr, _subimg, _x, _y, _w, _h, _c, _a) {
	/// WindowFrame_draw9slice(spr:sprite, subimg:int, x:int, y:int, w:int, h:int, c:int, a:number)
	/// @param {sprite} spr
	/// @param {int} subimg
	/// @param {int} x
	/// @param {int} y
	/// @param {int} w
	/// @param {int} h
	/// @param {int} c
	/// @param {number} a
	draw_sprite_stretched_ext(_spr, _subimg, _x, _y, _w, _h, _c, _a);
}

function WindowFrame_main() {
	/// WindowFrame_main()
	
}

#endregion

#region WindowFrameButton

function WindowFrameButton(_sprite1, _subimg, _onClick) constructor {
	/// WindowFrameButton(sprite:sprite, subimg:int, onClick:function<WindowFrame; void>)
	/// @param {sprite} sprite
	/// @param {int} subimg
	/// @param {function<WindowFrame; void>} onClick
	static frame = undefined; /// @is {WindowFrame}
	static sprite = undefined; /// @is {sprite}
	static subimg = undefined; /// @is {int}
	static marginLeft = undefined; /// @is {int}
	static marginRight = undefined; /// @is {int}
	static hover = undefined; /// @is {bool}
	static pressed = undefined; /// @is {bool}
	static enabled = undefined; /// @is {bool}
	static fade = undefined; /// @is {number}
	static click = undefined; /// @is {function<WindowFrame; void>}
	static getWidth = function() {
		return sprite_get_width(self.sprite);
	}
	static update = undefined; /// @is {function<b:WindowFrameButton; void>}
	static drawUnderlay = undefined; /// @is {function<b:WindowFrameButton; _x:number; _y:number; _width:number; _height:number; void>}
	static drawIcon = undefined; /// @is {function<b:WindowFrameButton; x:int; y:int; width:int; height:int; void>}
	self.drawIcon = WindowFrameButton_drawIcon_default;
	self.drawUnderlay = WindowFrameButton_drawUnderlay_default;
	self.update = function(__) {}
	self.fade = 0.;
	self.enabled = true;
	self.pressed = false;
	self.hover = false;
	self.marginRight = 0;
	self.marginLeft = 0;
	self.frame = undefined;
	self.sprite = _sprite1;
	self.subimg = _subimg;
	self.click = _onClick;
	//
}

function WindowFrameButton_ease_inout_expo(_argument0, _argument1, _argument2, _argument3) {
	/// WindowFrameButton_ease_inout_expo(argument:number, argument:number, argument:number, argument:number)->number
	/// @param {number} argument
	/// @param {number} argument
	/// @param {number} argument
	/// @param {number} argument
	_argument0 /= _argument3 * 0.5;
	if (_argument0 < 1) return _argument2 * 0.5 * power(2, 10 * (_argument0 - 1)) + _argument1;
	_argument0--;
	return _argument2 * 0.5 * (-power(2, -10 * _argument0) + 2) + _argument1;
}

function WindowFrameButton_drawUnderlay_default(_b, __x, __y, __width, __height) {
	/// WindowFrameButton_drawUnderlay_default(b:WindowFrameButton, _x:number, _y:number, _width:number, _height:number)
	/// @param {WindowFrameButton} b
	/// @param {number} _x
	/// @param {number} _y
	/// @param {number} _width
	/// @param {number} _height
	var __alpha;
	var _frame = _b.frame;
	if (_b.enabled) {
		if (_b.pressed) {
			__alpha = 0.7;
			_b.fade = 1;
		} else {
			var _dt = delta_time / 1000000;
			if (_b.hover) {
				if (_b.fade < 1) _b.fade = min(_b.fade + _dt / _frame.buttons.fadeTime, 1);
			} else if (_b.fade > 0) {
				_b.fade = max(_b.fade - _dt / _frame.buttons.fadeTime, 0);
			}
			__alpha = _b.fade * 0.3;
		}
	} else __alpha = 0.;
	draw_sprite_stretched_ext(_frame.sprPixel, 0, __x, __y, _b.getWidth(), __height, _frame.blend, _frame.alpha * __alpha);
}

function WindowFrameButton_drawIcon_default(_b, _x, _y, _width, _height) {
	/// WindowFrameButton_drawIcon_default(b:WindowFrameButton, x:int, y:int, width:int, height:int)
	/// @param {WindowFrameButton} b
	/// @param {int} x
	/// @param {int} y
	/// @param {int} width
	/// @param {int} height
	var _frame = _b.frame;
	draw_sprite_ext(_b.sprite, _b.subimg, (_x + ((_width - sprite_get_width(_b.sprite)) div 2)), _y + ((_height - sprite_get_height(_b.sprite)) div 2), 1, 1, 0, _frame.blend, _frame.alpha * ((_b.enabled ? 1 : 0.3)));
}

#endregion

#region WindowFrameButtons

function WindowFrameButtons(_frame) constructor {
	/// WindowFrameButtons(frame:WindowFrame)
	/// @param {WindowFrame} frame
	static frame = undefined; /// @is {WindowFrame}
	static buttons = undefined; /// @is {array<WindowFrameButton>}
	static fadeTime = undefined; /// @is {number}
	static waitForMovement = undefined; /// @is {WindowFrameButtons_waitForMovement}
	static minimize = undefined; /// @is {WindowFrameButton}
	static maxrest = undefined; /// @is {WindowFrameButton}
	static close = undefined; /// @is {WindowFrameButton}
	static add = function(_button) {
		_button.frame = self.frame;
		gml_internal_ArrayImpl_push(self.buttons, _button);
		return _button;
	}
	static getWidth = function() {
		var _w = 0;
		var __g = 0;
		var __g1 = self.buttons;
		while (__g < array_length(__g1)) {
			var _button = __g1[__g];
			__g++;
			_w += _button.marginLeft + _button.getWidth() + _button.marginRight;
		}
		return _w;
	}
	static reset = function() {
		var __g = 0;
		var __g1 = self.buttons;
		while (__g < array_length(__g1)) {
			var _button = __g1[__g];
			__g++;
			_button.hover = false;
			_button.fade = 0.;
			_button.pressed = false;
		}
	}
	static update = function(_x, _y, _height, _mx, _my) {
		var _over_row = _mx >= _y && _my < _y + _height && borderless_tools_mouse_in_window();
		if (self.waitForMovement.enabled) {
			if (_mx != self.waitForMovement.x || _my != self.waitForMovement.y) self.waitForMovement.enabled = false; else _over_row = false;
		}
		var _pressed = mouse_check_button_pressed(1);
		var _released = mouse_check_button_released(1);
		var _disable = self.frame.drag.flags != 0 || !self.frame.canInput;
		var _i = 0;
		for (var __g1 = array_length(self.buttons); _i < __g1; _i++) {
			var _button = self.buttons[_i];
			WindowFrameButton_current = _button;
			_button.update(_button);
			_x += _button.marginLeft;
			var _width = _button.getWidth();
			if (_disable || !_button.enabled) {
				_button.hover = false;
				_button.pressed = false;
			} else if (_over_row && _mx >= _x && _mx < _x + _width) {
				_button.hover = true;
				if (_pressed) _button.pressed = true;
			} else _button.hover = false;
			if (_released && _button.pressed && _button.hover) {
				_button.pressed = false;
				_button.click(self.frame);
			}
			_x += _width + _button.marginRight;
		}
		WindowFrameButton_current = undefined;
	}
	static draw = function(_x, _y, _height) {
		var _i = 0;
		for (var __g1 = array_length(self.buttons); _i < __g1; _i++) {
			var _button = self.buttons[_i];
			WindowFrameButton_current = _button;
			_x += _button.marginLeft;
			var _width = _button.getWidth();
			_button.drawUnderlay(_button, _x, _y, _width, _height);
			_button.drawIcon(_button, _x, _y, _width, _height);
			_x += _width + _button.marginRight;
		}
		WindowFrameButton_current = undefined;
	}
	static addDefaultButtons = function() {
		self.minimize = self.add(new WindowFrameButton(self.frame.sprButtons, 0, function(_frame) {
			_frame.buttons.reset();
			_frame.delayMgr.add(function(_buttons) {
				_buttons.waitForMovement.enabled = true;
				_buttons.waitForMovement.x = window_mouse_get_x();
				_buttons.waitForMovement.y = window_mouse_get_y();
				borderless_tools_syscommand(61472);
			}, 1, _frame.buttons);
		}));
		self.maxrest = self.add(new WindowFrameButton(self.frame.sprButtons, 1, function(_frame) {
			if (_frame.isMaximized) _frame.restore(); else _frame.maximize();
			_frame.buttons.reset();
		}));
		self.maxrest.update = function(_b) {
			_b.subimg = (_b.frame.isMaximized ? 2 : 1);
			_b.enabled = _b.frame.canResize;
		}
		self.close = self.add(new WindowFrameButton(self.frame.sprButtons, 3, function(_frame) {
			game_end()
		}));
		self.close.drawUnderlay = function(_b, __x, __y, __width, __height) {
			var _frame = _b.frame;
			var __alpha = 0.;
			if (_b.pressed) {
				__alpha = 0.7;
				_b.fade = 1;
			} else {
				var _dt = delta_time / 1000000;
				if (_b.hover) {
					if (_b.fade < 1) {
						_b.fade = max(_b.fade, 0.5);
						_b.fade = min(_b.fade + _dt / _frame.buttons.fadeTime, 1);
					}
				} else if (_b.fade > 0) {
					_b.fade = max(_b.fade - _dt / _frame.buttons.fadeTime, 0);
				}
				__alpha = _frame.alpha * _b.fade;
			}
			draw_sprite_stretched_ext(_frame.sprPixel, 0, __x, __y, _b.getWidth(), __height, 2298344, __alpha);
		}
	}
	self.waitForMovement = new WindowFrameButtons_waitForMovement();
	self.fadeTime = 0.2;
	self.buttons = [];
	self.frame = _frame;
	//
}

#endregion

#region WindowFrameButtons_waitForMovement

function WindowFrameButtons_waitForMovement() constructor {
	// WindowFrameButtons_waitForMovement()
	static enabled = undefined; /// @is {bool}
	/* static */x = undefined; /// @is {number}
	/* static */y = undefined; /// @is {number}
	self.y = 0.;
	self.x = 0.;
	self.enabled = false;
	//
}

#endregion

#region WindowFrameCover

function WindowFrameCover(_frame) constructor {
	// WindowFrameCover(frame:WindowFrame)
	static frame = undefined; /// @is {WindowFrame}
	static checkForSuccess = undefined; /// @is {bool}
	static ignoreRect = undefined; /// @is {WindowFrameRect}
	static canIgnore = undefined; /// @is {bool}
	static currRect = undefined; /// @is {WindowFrameRect}
	static ensure = function() {
		var __just_changed = self.checkForSuccess;
		if (__just_changed) self.checkForSuccess = false;
		var __target_rect;
		if (window_get_fullscreen()) {
			self.canIgnore = false;
			return 0;
		} else if (self.frame.isFullscreen) {
			__target_rect = self.frame.getActiveMonitor()[0/* screen */];
		} else if (self.frame.isMaximized) {
			__target_rect = self.frame.getActiveMonitor()[1/* workspace */];
		} else {
			self.canIgnore = false;
			return 0;
		}
		_WindowFrameRect_WindowFrameRect_Impl__getWindowRect(self.currRect);
		if (!_WindowFrameRect_WindowFrameRect_Impl__equals(self.currRect, __target_rect)) {
			if (__just_changed) {
				self.canIgnore = true;
				_WindowFrameRect_WindowFrameRect_Impl__setTo(self.ignoreRect, __target_rect);
				if (self.frame.debug) self.frame.mylog("[cover] Resize failed - ignoring");
				return 0;
			}
			if (self.canIgnore && _WindowFrameRect_WindowFrameRect_Impl__equals(__target_rect, self.ignoreRect)) return 0;
			if (self.frame.debug) self.frame.mylog("[cover] Adjusting window rectangle to ", __target_rect);
			_WindowFrameRect_WindowFrameRect_Impl__setWindowRect(__target_rect);
			self.checkForSuccess = true;
		}
	}
	self.currRect = [/* x: */0, /* y: */0, /* width: */0, /* height: */0];
	self.canIgnore = false;
	self.ignoreRect = [/* x: */0, /* y: */0, /* width: */0, /* height: */0];
	self.checkForSuccess = false;
	self.frame = _frame;
	static __class__ = mt_WindowFrameCover;
}

#endregion

#region WindowFrameDelay

function WindowFrameDelay() constructor {
	// WindowFrameDelay()
	static queue = undefined; /// @is {ds_queue<WindowFrameDelayItem>}
	static frameIndex = undefined; /// @is {int}
	static add = function(_func, _delay, _arg0, _arg1, _arg2, _arg3) {
		if (false) show_debug_message(argument[5]);
		ds_queue_enqueue(self.queue, [/* func: */_func, /* time: */self.frameIndex + _delay, /* arg0: */_arg0, /* arg1: */_arg1, /* arg2: */_arg2, /* arg3: */_arg3]);
	}
	static update = function() {
		self.frameIndex += 1;
		var _f;
		while (!ds_queue_empty(self.queue)) {
			var _head = ds_queue_head(self.queue);
			if (_head[1/* time */] > self.frameIndex) break;
			ds_queue_dequeue(self.queue);
			_f = _head[0/* func */];
			_f(_head[2/* arg0 */], _head[3/* arg1 */], _head[4/* arg2 */], _head[5/* arg3 */]);
		}
	}
	self.frameIndex = 0;
	self.queue = ds_queue_create();
	//
}

#endregion

#region WindowFrameDrag

function WindowFrameDrag(_frame) constructor {
	// WindowFrameDrag(frame:WindowFrame)
	static frame = undefined; /// @is {WindowFrame}
	static flags = undefined; /// @is {int}
	static mx = undefined; /// @is {int}
	static my = undefined; /// @is {int}
	static left = undefined; /// @is {int}
	static top = undefined; /// @is {int}
	static right = undefined; /// @is {int}
	static bottom = undefined; /// @is {int}
	static start = function(_flags) {
		self.flags = _flags;
		self.mx = (display_mouse_get_x() | 0);
		self.my = (display_mouse_get_y() | 0);
		self.left = window_get_x();
		self.top = window_get_y();
		self.right = self.left + window_get_width();
		self.bottom = self.top + window_get_height();
	}
	static stop = function() {
		self.flags = 0;
	}
	static update = function() {
		if (self.flags == 0) return 0;
		var __mx = (display_mouse_get_x() | 0);
		var __my = (display_mouse_get_y() | 0);
		switch (self.flags) {
			case 16: window_set_position(__mx - (self.mx - self.left), __my - (self.my - self.top)); break;
			case 32:
				if (point_distance(__mx, __my, self.mx, self.my) > 5) {
					var __x;
					var __y = self.my - self.top;
					if (self.mx - self.left < (self.right - self.left) / 2) __x = min(self.mx - self.left, (self.frame.restoreRect[2/* width */] >> 1)); else __x = max(self.frame.restoreRect[2/* width */] + self.mx - self.right, (self.frame.restoreRect[2/* width */] >> 1));
					self.frame.isMaximized = false;
					window_set_rectangle(__mx - __x, __my - __y, self.frame.restoreRect[2/* width */], self.frame.restoreRect[3/* height */]);
					self.start(16);
				}
				break;
			case 1:
				var __x = __mx - (self.mx - self.left);
				window_set_rectangle(__x, self.top, self.right - __x, self.bottom - self.top);
				break;
			case 2:
				var __y = __my - (self.my - self.top);
				window_set_rectangle(self.left, __y, self.right - self.left, self.bottom - __y);
				break;
			case 4: window_set_rectangle(self.left, self.top, self.right - self.left - self.mx + __mx, self.bottom - self.top); break;
			case 8: window_set_rectangle(self.left, self.top, self.right - self.left, self.bottom - self.top - self.my + __my); break;
			case 3:
				var __x = __mx - (self.mx - self.left);
				var __y = __my - (self.my - self.top);
				window_set_rectangle(__x, __y, self.right - __x, self.bottom - __y);
				break;
			case 9:
				var __x = __mx - (self.mx - self.left);
				window_set_rectangle(__x, self.top, self.right - __x, self.bottom - self.top - self.my + __my);
				break;
			case 6:
				var __y = __my - (self.my - self.top);
				window_set_rectangle(self.left, __y, self.right - self.left - self.mx + __mx, self.bottom - __y);
				break;
			case 12: window_set_rectangle(self.left, self.top, self.right - self.left - self.mx + __mx, self.bottom - self.top - self.my + __my); break;
		}
	}
	self.bottom = 0;
	self.right = 0;
	self.top = 0;
	self.left = 0;
	self.my = 0;
	self.mx = 0;
	self.flags = 0;
	self.frame = _frame;
	//
}

#endregion

#region _WindowFrameRect.WindowFrameRect_Impl_

function _WindowFrameRect_WindowFrameRect_Impl__getWindowRect(_this1) {
	// _WindowFrameRect_WindowFrameRect_Impl__getWindowRect(this:WindowFrameRectImpl)
	_this1[@0/* x */] = window_get_x();
	_this1[@1/* y */] = window_get_y();
	_this1[@2/* width */] = window_get_width();
	_this1[@3/* height */] = window_get_height();
}

function _WindowFrameRect_WindowFrameRect_Impl__setWindowRect(_this1) {
	// _WindowFrameRect_WindowFrameRect_Impl__setWindowRect(this:WindowFrameRectImpl)
	window_set_rectangle(_this1[0/* x */], _this1[1/* y */], _this1[2/* width */], _this1[3/* height */]);
}

function _WindowFrameRect_WindowFrameRect_Impl__equals(_this1, _o) {
	// _WindowFrameRect_WindowFrameRect_Impl__equals(this:WindowFrameRectImpl, o:WindowFrameRect)->bool
	return _this1[0/* x */] == _o[0/* x */] && _this1[1/* y */] == _o[1/* y */] && _this1[2/* width */] == _o[2/* width */] && _this1[3/* height */] == _o[3/* height */];
}

function _WindowFrameRect_WindowFrameRect_Impl__setTo(_this1, _o) {
	// _WindowFrameRect_WindowFrameRect_Impl__setTo(this:WindowFrameRectImpl, o:WindowFrameRect)
	_this1[@0/* x */] = _o[0/* x */];
	_this1[@1/* y */] = _o[1/* y */];
	_this1[@2/* width */] = _o[2/* width */];
	_this1[@3/* height */] = _o[3/* height */];
}

#endregion

#region haxe.class

function haxe_class(_id, _name) constructor {
	// haxe_class(id:int, name:string)
	static superClass = undefined; /// @is {haxe_class<any>}
	static marker = undefined; /// @is {any}
	static index = undefined; /// @is {int}
	static name = undefined; /// @is {string}
	self.superClass = undefined;
	self.marker = haxe_type_markerValue;
	self.index = _id;
	self.name = _name;
	static __class__ = "class";
}

#endregion

#region gml.internal.ArrayImpl

function gml_internal_ArrayImpl_push(_arr, _val) {
	// gml_internal_ArrayImpl_push(arr:array<T>, val:T)->int
	var _i = array_length(_arr);
	_arr[@_i] = _val;
	return _i;
}

#endregion

// WindowFrame:
globalvar WindowFrame_getActiveMonitor_list; /// @is {ds_list<WindowFrameMonitorInfo>}
WindowFrame_getActiveMonitor_list = undefined;
// WindowFrameButton:
globalvar WindowFrameButton_current; /// @is {WindowFrameButton}


/// @typedef {any} WindowFrameRectImpl
/// @typedef {any} WindowFrameRect
/// @typedef {any} WindowFrameDelayItem
/// @typedef {any} WindowFrameMonitorInfo