function WindowFrame() constructor {
	alpha = 1;
	sprBorder = spr_window_border;
	sprCaption = spr_window_caption;
	doubleClickTime = mouse_get_winapi_double_click_time(); // in ms!
	titlebarHeight = sprite_get_height(sprCaption);
	lastTitleClickAt = -5000;
	resizePadding = 6;
	dragFlags = 0x0;
	dragX = 0;
	dragY = 0;
	defaultCursor = cr_arrow;
	isMaximized = false;
	restoreRect = [window_get_x(), window_get_y(), window_get_width(), window_get_height()];
	static getActiveMonitor = function() {
		static _list = ds_list_create();
		var _count = display_measure_all(_list);
		var _cx = window_get_x() + window_get_width() div 2;
		var _cy = window_get_y() + window_get_height() div 2;
		for (var i = 0; i < _count; i++) {
			var _item = _list[|i];
			var _mntr = _item[0];
			if (_cx >= _mntr[0] && _cy >= _mntr[1] && _cx < _mntr[2] && _cy < _mntr[3]) {
				return _item;
			}
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
	static update = function() {
		display_set_gui_maximize(1, 1, 0, 0);
		display_set_gui_size(window_get_width(), window_get_height());
		var mx = device_mouse_x_to_gui(0);
		var my = device_mouse_y_to_gui(0);
		var gw = display_get_gui_width();
		var gh = display_get_gui_height();
		
		var _flags = 0x0, _titleHit = false;
		if (!point_in_rectangle(mx, my,
			resizePadding,
			resizePadding,
			gw - resizePadding,
			gh - resizePadding,
		)) {
			if (mx < resizePadding) _flags |= 1;
			if (my < resizePadding) _flags |= 2;
			if (mx >= gw - resizePadding) _flags |= 4;
			if (my >= gh - resizePadding) _flags |= 8;
		} else if (point_in_rectangle(mx, my,
			0, 0, gw, titlebarHeight,
		)) {
			_titleHit = true;
		}
		
		var _cursor/*:window_cursor*/ = defaultCursor;
		switch (_flags) {
			case 1: case 4: _cursor = cr_size_we; break;
			case 2: case 8: _cursor = cr_size_ns; break;
			case 3: case 12: _cursor = cr_size_nwse; break;
			case 6: case 9: _cursor = cr_size_nesw; break;
		}
		setCursor(_cursor);
		draw_text(5, 5, string(_flags));
		
		if (mouse_check_button_pressed(mb_left)) {
			if (_titleHit) {
				var _now = current_time;
				if (_now < lastTitleClickAt + doubleClickTime) {
					if (isMaximized) {
						restore();
					} else maximize();
				} else {
					lastTitleClickAt = _now;
					dragFlags = 16;
					dragX = display_mouse_get_x() - window_get_x();
					dragY = display_mouse_get_y() - window_get_y();
				}
			}
		}
		if (mouse_check_button_released(mb_left)) {
			dragFlags = 0;
		}
		if (dragFlags == 16) {
			window_set_position(
				display_mouse_get_x() - dragX,
				display_mouse_get_y() - dragY,
			)
		}
	}
	static draw = function() {
		var gw = display_get_gui_width();
		var gh = display_get_gui_height();
		draw_sprite_stretched(sprBorder, 0, 0, 0, gw, gh);
		draw_sprite_stretched(sprCaption, 0, 0, 0, gw, titlebarHeight);
		draw_text(5, 30, string(gw) + "x" + string(gh));
	}
}