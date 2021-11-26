function WindowFrameButton(_sprite, _subimg, _onClick) constructor {
	frame = /*#cast*/ undefined; /// @is {WindowFrame}
	sprite = _sprite;
	subimg = _subimg;
	marginLeft = 0;
	marginRight = 0;
	
	hover = false;
	pressed = false;
	enabled = true;
	fade = 0;
	
	click = _onClick;
	
	static ease_inout_expo = function(argument0, argument1, argument2, argument3) {
		argument0 /= argument3 * 0.5;
	
		if (argument0 < 1) {
			return argument2 * 0.5 * power(2, 10 * (argument0 - 1)) + argument1;
		}
	
		argument0 -= 1;
		return argument2 * 0.5 * (-power(2, -10 * argument0) + 2) + argument1;
	}
	static getWidth = function() {
		return sprite_get_width(sprite);
	}
	static drawUnderlay = function(_x, _y, _width, _height) {
		var _alpha;
		if (!enabled) {
			_alpha = 0.1;
		} else if (pressed) {
			_alpha = 0.7;
			fade = 1;
		} else {
			var dt = delta_time / 1000000;
			if (hover) {
				if (fade < 1) fade = min(fade + dt / frame.buttons.fadeTime, 1);
			} else if (fade > 0) {
				fade = max(fade - dt / frame.buttons.fadeTime, 0);
			}
			_alpha = fade * 0.3;//ease_inout_expo(fade, 0, 1, 1);
		}
		draw_sprite_stretched_ext(frame.sprPixel, 0, _x, _y, getWidth(), _height, frame.blend, frame.alpha * _alpha);
	}
	static drawIcon = function(_x, _y, _width, _height) {
		draw_sprite_ext(sprite, subimg,
			_x + (_width - sprite_get_width(sprite)) div 2,
			_y + (_height - sprite_get_height(sprite)) div 2,
			1, 1, 0, frame.blend, frame.alpha
		);
	}
}

function WindowFrameButtons(_frame) constructor {
	frame = _frame;
	buttons = [];
	fadeTime = 0.2;
	waitForMovement = { enabled: false, x: 0, y: 0 };
	
	static add = function(_button/*:WindowFrameButton*/)/*->WindowFrameButton*/ {
		_button.frame = frame;
		array_push(buttons, _button);
		return _button;
	}
	static getWidth = function() {
		var n = array_length(buttons);
		var w = 0;
		for (var i = 0; i < n; i++) {
			var _button = buttons[i];
			w += _button.marginLeft + _button.getWidth() + _button.marginRight;
		}
		return w;
	}
	static reset = function() {
		var n = array_length(buttons);
		for (var i = 0; i < n; i++) {
			var _button = buttons[i];
			_button.hover = false;
			_button.fade = 0;
			_button.pressed = false;
		}
	}
	static update = function(_x, _y, _height, _mx, _my) {
		var _over_row = (_my >= _y && _my < _y + _height) && borderless_tools_mouse_in_window();
		if (waitForMovement.enabled) {
			if (_mx != waitForMovement.x || _my != waitForMovement.y) {
				waitForMovement.enabled = false;
			} else _over_row = false;
		}
		var _pressed = mouse_check_button_pressed(mb_left);
		var _released = mouse_check_button_released(mb_left);
		var _disable = frame.drag.flags != WindowFrameDragFlags.None || !frame.input;
		var n = array_length(buttons);
		for (var i = 0; i < n; i++) {
			var _button = buttons[i];
			_x += _button.marginLeft;
			var _width = _button.getWidth();
			if (_disable) {
				_button.hover = false;
				_button.pressed = false;
			} else if (_over_row && _mx >= _x && _mx < _x + _width) {
				_button.hover = true;
				if (_pressed) _button.pressed = true;
			} else {
				_button.hover = false;
			}
			if (_released && _button.pressed && _button.hover) {
				_button.pressed = false;
				_button.click();
			}
			_x += _width + _button.marginRight;
		}
		return false;
	}
	static draw = function(_x, _y, _height) {
		var n = array_length(buttons);
		for (var i = 0; i < n; i++) {
			var _button = buttons[i];
			_x += _button.marginLeft;
			var _width = _button.getWidth();
			_button.drawUnderlay(_x, _y, _width, _height);
			_button.drawIcon(_x, _y, _width, _height);
			_x += _width + _button.marginRight;
		}
	}
}

function WindowFrameButtons_addDefaultButtons(_buttons/*:WindowFrameButtons*/) {
	var _frame = _buttons.frame;
	_buttons.minimize = buttons.add(new WindowFrameButton(_frame.sprButtons, 0, method(_frame, function(_frame) {
		buttons.reset();
		delay(function() {
			buttons.waitForMovement.enabled = true;
			buttons.waitForMovement.x = window_mouse_get_x();
			buttons.waitForMovement.y = window_mouse_get_y();
			borderless_tools_syscommand(0xF020);
		}, 1)
	})));
	_buttons.maxrest = buttons.add(new WindowFrameButton(sprButtons, 1, method(_frame, function(_frame) {
		if (isMaximized) restore(); else maximize();
		buttons.reset();
	})));
	_buttons.close = buttons.add(new WindowFrameButton(sprButtons, 3, function(_frame) {
		game_end();
	}));
	_buttons.close.drawUnderlay = method(buttons.close, function(_x, _y, _width, _height) {
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
}