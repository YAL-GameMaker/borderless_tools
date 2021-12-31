package ;
import gml.Mathf;
import gml.NativeDate;
import gml.input.Mouse;
import gml.input.MouseButton;
import gml.input.Window;

/**
 * ...
 * @author YellowAfterlife
 */
@:doc @:nativeGen @:keep
class WindowFrameButtons {
	public var frame:WindowFrame;
	public var buttons:Array<WindowFrameButton> = [];
	public var fadeTime = 0.2;
	public var waitForMovement = new WindowFrameButtons_waitForMovement();
	
	public var minimize:WindowFrameButton;
	public var maxrest:WindowFrameButton;
	public var close:WindowFrameButton;
	
	public function new(frame:WindowFrame) {
		this.frame = frame;
	}
	
	public function add(button:WindowFrameButton):WindowFrameButton {
		button.frame = frame;
		buttons.push(button);
		return button;
	}
	public function getWidth():Int {
		var w = 0;
		for (button in buttons) {
			w += button.marginLeft + button.getWidth() + button.marginRight;
		}
		return w;
	}
	public function reset() {
		for (button in buttons) {
			button.hover = false;
			button.fade = 0.;
			button.pressed = false;
		}
	}
	public function update(x, y, height, mx, my) {
		var over_row = (mx >= y && my < y + height) && BorderlessExt.borderless_tools_mouse_in_window();
		if (waitForMovement.enabled) {
			if (mx != waitForMovement.x || my != waitForMovement.y) {
				waitForMovement.enabled = false;
			} else over_row = false;
		}
		var pressed = Mouse.pressed(MouseButton.MbLeft);
		var released = Mouse.released(MouseButton.MbLeft);
		var disable = frame.drag.flags != WindowFrameDragFlags.None || !frame.canInput;
		for (i in 0 ... buttons.length) {
			var button = buttons[i];
			WindowFrameButton.current = button;
			button.update(button);
			x += button.marginLeft;
			var width = button.getWidth();
			if (disable || !button.enabled) {
				button.hover = false;
				button.pressed = false;
			} else if (over_row && mx >= x && mx < x + width) {
				button.hover = true;
				if (pressed) button.pressed = true;
			} else {
				button.hover = false;
			}
			if (released && button.pressed && button.hover) {
				button.pressed = false;
				button.click(frame);
			}
			x += width + button.marginRight;
		}
		WindowFrameButton.current = null;
	}
	public function draw(x:Int, y:Int, height:Int) {
		for (i in 0 ... buttons.length) {
			var button = buttons[i];
			WindowFrameButton.current = button;
			x += button.marginLeft;
			var width = button.getWidth();
			button.drawUnderlay(button, x, y, width, height);
			button.drawIcon(button, x, y, width, height);
			x += width + button.marginRight;
		}
		WindowFrameButton.current = null;
	}
	
	public function addDefaultButtons() {
		minimize = add(new WindowFrameButton(frame.sprButtons, 0, function(frame) {
			frame.buttons.reset();
			frame.delay1(frame.buttons, 1, function(buttons:WindowFrameButtons) {
				buttons.waitForMovement.enabled = true;
				buttons.waitForMovement.x = Window.mouseX;
				buttons.waitForMovement.y = Window.mouseY;
				BorderlessExt.borderless_tools_syscommand(0xF020);
			});
		}));
		
		maxrest = add(new WindowFrameButton(frame.sprButtons, 1, function(frame) {
			if (frame.isMaximized) {
				frame.restore();
			} else frame.maximize();
			frame.buttons.reset();
		}));
		maxrest.update = function(b) {
			b.subimg = b.frame.isMaximized ? 2 : 1;
			b.enabled = b.frame.canResize;
		}
		
		close = add(new WindowFrameButton(frame.sprButtons, 3, function(frame) {
			Sys.exit(0);
		}));
		close.drawUnderlay = function(b, _x, _y, _width, _height) {
			var frame = b.frame;
			var _alpha = 0.;
			if (b.pressed) {
				_alpha = 0.7;
				b.fade = 1;
			} else {
				var dt = NativeDate.deltaTime / 1000000;
				if (b.hover) {
					if (b.fade < 1) {
						b.fade = Mathf.max(b.fade, 0.5);
						b.fade = Mathf.min(b.fade + dt / frame.buttons.fadeTime, 1);
					}
				} else if (b.fade > 0) {
					b.fade = Mathf.max(b.fade - dt / frame.buttons.fadeTime, 0);
				}
				_alpha = frame.alpha * b.fade;//ease_inout_expo(fade, 0, 1, 1);
			}
			frame.sprPixel.drawStretchedExt(0, _x, _y, b.getWidth(), _height, 0x2311E8, _alpha);
		}
	}
}
@:nativeGen
class WindowFrameButtons_waitForMovement {
	public var enabled = false;
	public var x = 0.;
	public var y = 0.;
	public function new(){}
}