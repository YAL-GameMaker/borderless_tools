function WindowFrameHotkeys(_frame) constructor {
	frame = _frame; /// @is {WindowFrame}
	mod_shift = 1;
	mod_control = 2;
	mod_alt = 4;
	static updateWin = function() {
		var _mods = 0x0;
		if (keyboard_check(vk_control)) _mods |= mod_control;
		if (keyboard_check(vk_shift)) _mods |= mod_shift;
		if (keyboard_check(vk_alt)) _mods |= mod_alt;
		if (keyboard_check_pressed(vk_up)) {
			if (_mods == 0) {
				frame.maximize();
			} else if (_mods == mod_shift) {
				var _rect = frame.getActiveMonitor()[1];
				window_set_rectangle(
					window_get_x(),
					_rect[1],
					window_get_width(),
					_rect[3]
				);
			}
		}
	}
	static update = function() {
		// a good idea, except keyboard_check* doesn't trigger while Windows key is held
		// think about a smarter way to do this with keyboard_check_direct (and no extra polling)
		//if (keyboard_check_direct(0x5B) || keyboard_check_direct(0x5C)) updateWin();
	}
}