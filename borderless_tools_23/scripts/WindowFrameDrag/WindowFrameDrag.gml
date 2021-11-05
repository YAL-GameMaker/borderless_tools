function WindowFrameDrag(_frame) constructor {
	frame = _frame; /// @is {WindowFrame}
	flags = WindowFrameDragFlags.None;
	mx = 0;
	my = 0;
	left = 0;
	top = 0;
	right = 0;
	bottom = 0;
	static start = function (_flags) {
		flags = _flags;
		mx = display_mouse_get_x();
		my = display_mouse_get_y();
		left = window_get_x();
		top = window_get_y();
		right = left + window_get_width();
		bottom = top + window_get_height();
	}
	static stop = function() {
		flags = WindowFrameDragFlags.None;
	}
	static setRect = function(_x, _y, _width, _height) {
		window_set_rectangle(_x, _y, _width, _height)
	}
	static update = function() {
		if (flags == WindowFrameDragFlags.None) exit;
		var _mx = display_mouse_get_x();
		var _my = display_mouse_get_y();
		switch (flags) {
			case WindowFrameDragFlags.Move:
				window_set_position(
					_mx - (mx - left),
					_my - (my - top),
				);
				break;
			case WindowFrameDragFlags.Unmax:
				if (point_distance(_mx, _my, mx, my) > 5) {
					var _x, _y = my - top;
					if (mx - left < (right - left) / 2) {
						_x = min(mx - left, frame.restoreRect[2] div 2);
					} else {
						_x = max(frame.restoreRect[2] + mx - right, frame.restoreRect[2] div 2);
					}
					frame.isMaximized = false;
					window_set_rectangle(_mx - _x, _my - _y, frame.restoreRect[2], frame.restoreRect[3]);
					start(WindowFrameDragFlags.Move);
					//trace(_x);
				}
				break;
			
			case WindowFrameDragFlags.Left:
				var _x = _mx - (mx - left);
				setRect(_x, top, right - _x, bottom - top);
				break;
			case WindowFrameDragFlags.Top:
				var _y = _my - (my - top);
				setRect(left, _y, right - left, bottom - _y);
				break;
			case WindowFrameDragFlags.Right:
				setRect(left, top, right - left - mx + _mx, bottom - top);
				break;
			case WindowFrameDragFlags.Bottom:
				setRect(left, top, right - left, bottom - top - my + _my);
				break;
			
			case WindowFrameDragFlags.Left|WindowFrameDragFlags.Top:
				var _x = _mx - (mx - left);
				var _y = _my - (my - top);
				setRect(_x, _y, right - _x, bottom - _y);
				break;
			case WindowFrameDragFlags.Left|WindowFrameDragFlags.Bottom:
				var _x = _mx - (mx - left);
				setRect(_x, top, right - _x, bottom - top - my + _my);
				break;
			case WindowFrameDragFlags.Top|WindowFrameDragFlags.Right:
				var _y = _my - (my - top);
				setRect(left, _y, right - left - mx + _mx, bottom - _y);
				break;
			case WindowFrameDragFlags.Bottom|WindowFrameDragFlags.Right:
				setRect(left, top, right - left - mx + _mx, bottom - top - my + _my);
				break;
		}
	}
}
enum WindowFrameDragFlags {
	None = 0,
	Left = 1,
	Top = 2,
	Right = 4,
	Bottom = 8,
	Move = 16,
	Unmax = 32,
}