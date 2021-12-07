function WindowFrame() constructor {
	sprBorder = spr_window_border;
	sprCaption = spr_window_caption;
	sprButtons = spr_window_buttons;
	sprPixel = spr_window_pixel;
	
	debug = false;
	/// @param ...concat
	static mylog = function() {
		if (!debug) exit;
		var s = "[WindowFrame] ";
		for (var i = 0; i < argument_count; i++) s += string(argument[i]);
		show_debug_message(s);
	}
	
	blend = c_white;
	alpha = 1;
	doubleClickTime = borderless_tools_double_click_time(); // in ms!
	mouseOverFrame = false;
	
	canInput = true;
	canResize = true;
	
	titlebarHeight = sprite_get_height(sprCaption);
	titlebarHeightMaximized = 21;
	lastTitleClickAt = -5000;
	resizePadding = 6;
	borderWidth = 2;
	drag = new WindowFrameDrag(self);
	hotkeys = new WindowFrameHotkeys(self);
	cover = new WindowFrameCover(self);
	defaultCursor = cr_arrow;
	isMaximized = false;
	isFullscreen = false; // borderless fullscreen, that is
	restoreRect = [window_get_x(), window_get_y(), window_get_width(), window_get_height()];
	
	buttons = new WindowFrameButtons(self);
	WindowFrameButtons_addDefaultButtons(buttons);
	
	frame_index = 0;
	delayQueue = ds_queue_create();
	static delay = function(_func, _delay, _arg0 = undefined, _arg1 = undefined, _arg2 = undefined, _arg3 = undefined) {
		ds_queue_enqueue(delayQueue, [_func, frame_index + _delay, _arg0, _arg1, _arg2, _arg3]);
	}
	static delayUpdate = function() {
		frame_index += 1;
		while (!ds_queue_empty(delayQueue)) {
			var _head = ds_queue_head(delayQueue);
			if (_head[1] > frame_index) break;
			ds_queue_dequeue(delayQueue);
			if 0 {
				var fn = _head[0];
				var _script = is_method(fn) ? method_get_index(fn) : fn;
				trace(_head[1], frame_index, script_get_name(_script), _head);
			}
			_head[0](_head[2], _head[3], _head[4], _head[5]);
		}
	}
	
	static getButtonsX = function(_width) {
		return (isMaximized ? _width : _width - borderWidth) - buttons.getWidth();
	}
	
	static getActiveMonitor = function()/*->tuple<array<int>,array<int>,int>*/ {
		static _list = ds_list_create();
		var _count = borderless_tools_get_monitors(_list);
		var _cx = window_get_x() + window_get_width() div 2;
		var _cy = window_get_y() + window_get_height() div 2;
		for (var i = 0; i < _count; i++) {
			var _item = _list[|i];
			var _mntr = _item[0];
			if (_cx >= _mntr[0] && _cy >= _mntr[1]
				&& _cx < _mntr[0] + _mntr[2] && _cy < _mntr[1] + _mntr[3]
			) return _item;
		}
		var _item = _list[|0];
		if (_item == undefined) {
			_item = [
				[0, 0, display_get_width(), display_get_height()],
				[0, 0, display_get_width(), display_get_height() - 40],
				0x0,
			];
			_list[|0] = _item;
		}
		return _item;
	}
	
	static maximize = function() {
		if (isMaximized || isFullscreen) exit;
		isMaximized = true;
		storeRect();
		maximize_1();
	}
	static maximize_1 = function() {
		var _work = getActiveMonitor()[1];
		if (debug) mylog("maximize: ", _work);
		window_set_rectangle(_work[0], _work[1], _work[2], _work[3]);
		borderless_tools_set_shadow(false);
	}
	static storeRect = function() {
		restoreRect[@0] = window_get_x();
		restoreRect[@1] = window_get_y();
		restoreRect[@2] = window_get_width();
		restoreRect[@3] = window_get_height();
		if (debug) mylog("storeRect: ", restoreRect);
	}
	static restore = function(_force = false) {
		if (window_get_fullscreen()) {
			window_set_fullscreen(false);
			delay(restore, 1);
			exit;
		}
		if (!_force && !isMaximized && !isFullscreen) exit;
		isMaximized = false;
		isFullscreen = false;
		var _rect = restoreRect;
		if (debug) mylog("restore: ", _rect);
		window_set_rectangle(_rect[0], _rect[1], _rect[2], _rect[3]);
		borderless_tools_set_shadow(true);
	}
	static setFullscreen = function(_mode, _wasFullscreen = false) {
		if (debug) mylog("setFullscreen(mode:", _mode, ", wasfs:", _wasFullscreen, ")");
		if (_mode == 1 || _mode == 2) {
			buttons.reset();
			drag.stop();
		}
		switch (_mode) {
			case 1: // true fullscreen
				if (window_get_fullscreen()) exit;
				if (isFullscreen) {
					restore();
					delay(setFullscreen, 1, 1);
					exit;
				} else storeRect();
				window_set_fullscreen(true);
				break;
			case 2: // fullscreen window
				if (window_get_fullscreen()) {
					window_set_fullscreen(false);
					delay(setFullscreen, 10, 2, true);
					exit;
				}
				if (isFullscreen) break;
				isFullscreen = true;
				if (!isMaximized && !_wasFullscreen) storeRect();
				var _rect = getActiveMonitor()[0];
				window_set_rectangle(_rect[0], _rect[1], _rect[2], _rect[3]);
				borderless_tools_set_shadow(false);
				break;
			default: // windowed
				if (window_get_fullscreen() && isFullscreen) {
					window_set_fullscreen(false);
					delay(setFullscreen, 1, 0);
					exit;
				}
				if (window_get_fullscreen()) {
					window_set_fullscreen(false);
				} else {
					if (isMaximized) {
						isFullscreen = false;
						maximize_1();
					} else restore();
				}
				break;
		}
	}
	
	static setWindowCursor = function(_cursor) {
		if (window_get_cursor() != _cursor) {
			window_set_cursor(_cursor);
		}
	}
	static getBorderWidth = function() {
		return isMaximized ? 0 : borderWidth;
	}
	static getTitlebarHeight = function() {
		return isMaximized ? titlebarHeightMaximized : titlebarHeight;
	}
	static getWidth = function() { return window_get_width() }
	static getHeight = function() { return window_get_height() }
	
	static update = function() {
		mouseOverFrame = false;
		delayUpdate();
		cover.ensure();
		if (window_get_fullscreen() || isFullscreen) exit;
		hotkeys.update();
		var mx = window_mouse_get_x();
		var my = window_mouse_get_y();
		var gw = getWidth();
		var gh = getHeight();
		var _borderWidth = isMaximized ? 0 : borderWidth;
		var _titleHeight = isMaximized ? titlebarHeightMaximized : titlebarHeight;
		var _buttons_x = getButtonsX(gw);
		
		var _flags = 0x0, _titleHit = false;
		var _hitSomething = true;
		if (window_get_fullscreen()) {
			//
		}
		else if (point_in_rectangle(mx, my,
			_buttons_x, _borderWidth,
			gw - _borderWidth - (isMaximized ? 0 : resizePadding),
			_borderWidth + _titleHeight
		)) { // mouse over window buttons
			//
		}
		else if (!isMaximized && !point_in_rectangle(mx, my,
			resizePadding,
			resizePadding,
			gw - resizePadding,
			gh - resizePadding,
		)) { // mouse over borders
			if (mx < resizePadding) _flags |= WindowFrameDragFlags.Left;
			if (my < resizePadding) _flags |= WindowFrameDragFlags.Top;
			if (mx >= gw - resizePadding) _flags |= WindowFrameDragFlags.Right;
			if (my >= gh - resizePadding) _flags |= WindowFrameDragFlags.Bottom;
		}
		else if (point_in_rectangle(mx, my,
			0, 0, gw, titlebarHeight,
		)) {
			_titleHit = true;
		}
		else {
			_hitSomething = false;
		}
		mouseOverFrame = _hitSomething;
		
		if (drag.flags == 0) {
			var _cursor/*:window_cursor*/ = defaultCursor;
			if (canInput && canResize) switch (_flags) {
				case 1: case 4: _cursor = cr_size_we; break;
				case 2: case 8: _cursor = cr_size_ns; break;
				case 3: case 12: _cursor = cr_size_nwse; break;
				case 6: case 9: _cursor = cr_size_nesw; break;
			}
			setWindowCursor(_cursor);
		}
		
		buttons.update(_buttons_x, _borderWidth, _titleHeight, mx, my);
		if (canInput && mouse_check_button_pressed(mb_left)) {
			if (_titleHit) {
				var _now = current_time;
				if (_now < lastTitleClickAt + doubleClickTime) {
					if (isMaximized) {
						restore();
					} else maximize();
				} else {
					lastTitleClickAt = _now;
					if (isMaximized) {
						drag.start(WindowFrameDragFlags.Unmax);
					} else {
						drag.start(WindowFrameDragFlags.Move);
					}
				}
			} else if (_flags != 0) {
				drag.start(_flags);
			}
		}
		if (!canInput) {
			if (drag.flags != 0) drag.stop();
		} else if (mouse_check_button_released(mb_left)) {
			drag.stop();
		} else {
			drag.update();
		}
	}
	static drawBorder = function(_x, _y, _width, _height) {
		draw_sprite_stretched_ext(sprBorder, 0, _x, _y, _width, _height, blend, alpha);
	}
	static drawCaptionRect = function(_x, _y, _width, _height, _buttons_x) {
		draw_sprite_stretched_ext(sprCaption, window_has_focus(), _x, _y, _width, _height, blend, alpha);
	}
	static drawCaptionText = function(_x, _y, _width, _height) {
		var _h = draw_get_halign();
		var _v = draw_get_valign();
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_text_ext(_x + 4, _y + _height div 2, "", -1, _width);
		draw_set_halign(_h);
		draw_set_valign(_v);
	}
	static draw = function() {
		if (window_get_fullscreen() || isFullscreen) exit;
		
		var gw = getWidth();
		var gh = getHeight();
		__display_set_gui_maximise_base(browser_width/gw, browser_height/gh, (gw%2)/-2, (gh%2)/-2);
		var _borderWidth = getBorderWidth();
		var _titlebarHeight = getTitlebarHeight();
		var _buttons_x = getButtonsX(gw);
		
		if (!isMaximized) drawBorder(0, 0, gw, gh);
		drawCaptionRect(_borderWidth, _borderWidth, gw-_borderWidth*2, _titlebarHeight, _buttons_x);
		drawCaptionText(_borderWidth, _borderWidth, _buttons_x-_borderWidth, _titlebarHeight);
		buttons.draw(_buttons_x, _borderWidth, _titlebarHeight);
		
		__display_gui_restore();
	}
}

