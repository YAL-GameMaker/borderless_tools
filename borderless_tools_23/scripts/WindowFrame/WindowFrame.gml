function WindowFrame() constructor {
	sprBorder = spr_window_border;
	sprCaption = spr_window_caption;
	sprButtons = spr_window_buttons;
	sprPixel = spr_window_pixel;
	
	alpha = 1;
	doubleClickTime = borderless_tools_double_click_time(); // in ms!
	
	titlebarHeight = sprite_get_height(sprCaption);
	titlebarHeightMaximized = 21;
	lastTitleClickAt = -5000;
	resizePadding = 6;
	borderWidth = 2;
	drag = new WindowFrameDrag(self);
	defaultCursor = cr_arrow;
	isMaximized = false;
	restoreRect = [window_get_x(), window_get_y(), window_get_width(), window_get_height()];
	postResizeTimer = 0;
	
	buttons = new WindowFrameButtons(self);
	buttons.minimize = buttons.add(new WindowFrameButton(sprButtons, 0, function(_frame) {
		buttons.reset();
		delay(function() {
			buttons.waitForMovement.enabled = true;
			buttons.waitForMovement.x = window_mouse_get_x();
			buttons.waitForMovement.y = window_mouse_get_y();
			borderless_tools_syscommand(0xF020);
		}, 1)
	}));
	buttons.maxrest = buttons.add(new WindowFrameButton(sprButtons, 1, function(_frame) {
		if (isMaximized) restore(); else maximize();
		buttons.reset();
	}));
	buttons.close = buttons.add(new WindowFrameButton(sprButtons, 3, function(_frame) {
		game_end();
	}));
	buttons.close.drawUnderlay = method(buttons.close, function(_x, _y, _width, _height) {
		var _alpha;
		if (pressed) {
			_alpha = 0.7;
			fade = 1;
		} else {
			var dt = delta_time / 1000000;
			if (hover) {
				if (fade < 1) {
					fade = max(fade, 0.5);
					fade = min(fade + dt / frame.buttons.fadeTime, 1);
				}
			} else if (fade > 0) {
				fade = max(fade - dt / frame.buttons.fadeTime, 0);
			}
			_alpha = frame.alpha * fade;//ease_inout_expo(fade, 0, 1, 1);
		}
		draw_sprite_stretched_ext(frame.sprPixel, 0, _x, _y, getWidth(), _height, /*#*/0x2311E8, _alpha);
	});
	
	frame_index = 0;
	delayQueue = ds_queue_create();
	static delay = function(_func, _delay, _arg0 = undefined, _arg1 = undefined, _arg2 = undefined, _arg3 = undefined) {
		ds_queue_enqueue(delayQueue, [_func, frame_index + _delay, _arg0, _arg1, _arg2, _arg3]);
	}
	static delayUpdate = function() {
		frame_index += 1;
		while (!ds_queue_empty(delayQueue)) {
			var _head = ds_queue_head(delayQueue);
			if (_head[1] < frame_index) break;
			ds_queue_dequeue(delayQueue);
			_head[0](_head[2], _head[3], _head[4], _head[5]);
		}
	}
	
	static getButtonsX = function(_width) {
		return (isMaximized ? _width : _width - borderWidth) - buttons.getWidth();
	}
	
	static getActiveMonitor = function() {
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
		if (isMaximized) exit;
		isMaximized = true;
		var _item = getActiveMonitor();
		restoreRect[@0] = window_get_x();
		restoreRect[@1] = window_get_y();
		restoreRect[@2] = window_get_width();
		restoreRect[@3] = window_get_height();
		var _work = _item[1];
		window_set_rectangle(_work[0], _work[1], _work[2], _work[3]);
	}
	static restore = function() {
		if (!isMaximized) exit;
		isMaximized = false;
		var _rect = restoreRect;
		window_set_rectangle(_rect[0], _rect[1], _rect[2], _rect[3]);
	}
	static setCursor = function(_cursor) {
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
	
	display_set_gui_maximise(1, 1, 0, 0);
	static aspectUpdate = function() {
		var _aw = surface_get_width(application_surface);
		var _ah = surface_get_height(application_surface);
		var _ww = window_get_width();
		var _wh = window_get_height();
		//display_set_gui_size(window_get_width(), window_get_height());
		//display_set_gui_maximize(1, 1, 0, 0);
		//var pos = application_get_position();
		//display_set_gui_maximise(1, 1, 0, 0);
	}
	static update = function() {
		aspectUpdate();
		delayUpdate();
		buttons.maxrest.subimg = isMaximized ? 2 : 1;
		var mx = window_mouse_get_x();
		var my = window_mouse_get_y();
		var gw = getWidth();
		var gh = getHeight();
		var _borderWidth = isMaximized ? 0 : borderWidth;
		var _titleHeight = isMaximized ? titlebarHeightMaximized : titlebarHeight;
		var _buttons_x = getButtonsX(gw);
		
		var _flags = 0x0, _titleHit = false;
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
		
		if (drag.flags == 0) {
			var _cursor/*:window_cursor*/ = defaultCursor;
			switch (_flags) {
				case 1: case 4: _cursor = cr_size_we; break;
				case 2: case 8: _cursor = cr_size_ns; break;
				case 3: case 12: _cursor = cr_size_nwse; break;
				case 6: case 9: _cursor = cr_size_nesw; break;
			}
			setCursor(_cursor);
			
			if (postResizeTimer > 0) {
				postResizeTimer -= 1;
				if (postResizeTimer <= 0) {
					var _width = window_get_width();
					var _height = window_get_height();
					window_set_size(_width - 10, _height - 10);
					delay(function(_width, _height) {
						window_set_size(_width, _height);
					}, 1, _width, _height)
					trace("force!");
				}
			}
		}
		
		buttons.update(_buttons_x, _borderWidth, _titleHeight, mx, my);
		if (mouse_check_button_pressed(mb_left)) {
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
		if (mouse_check_button_released(mb_left)) {
			drag.stop();
		} else {
			drag.update();
		}
	}
	static drawBorder = function(_x, _y, _width, _height) {
		draw_sprite_stretched(sprBorder, 0, _x, _y, _width, _height);
	}
	static drawCaptionRect = function(_x, _y, _width, _height, _buttons_x) {
		draw_sprite_stretched(sprCaption, window_has_focus(), _x, _y, _width, _height);
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
		var gw = getWidth();
		var gh = getHeight();
		display_set_gui_maximise(browser_width/gw, browser_height/gh, 0, 0)
		//var _mtx_orig = matrix_get(matrix_projection);
		//var _mtx_full = matrix_build_projection_ortho(window_get_width(), -window_get_height(), 0, 16000);
		//matrix_set(matrix_projection, _mtx_full);
		var _borderWidth = getBorderWidth();
		var _titlebarHeight = getTitlebarHeight();
		var _buttons_x = getButtonsX(gw);
		
		if (!isMaximized) drawBorder(0, 0, gw, gh);
		drawCaptionRect(_borderWidth, _borderWidth, gw-_borderWidth*2, _titlebarHeight, _buttons_x);
		drawCaptionText(_borderWidth, _borderWidth, _buttons_x-_borderWidth, _titlebarHeight);
		buttons.draw(_buttons_x, _borderWidth, _titlebarHeight);
		
		draw_text(5, 30,
			sfmt("window: %x%", gw, gh)
			+ sfmt("\nbackbuffer: %x%", browser_width, browser_height)
			+ sfmt("\nflags: %", drag.flags)
		)
		//matrix_set(matrix_projection, _mtx_orig);
		//display_set_gui_maximise()
		display_set_gui_size(480, 270);
	}
}