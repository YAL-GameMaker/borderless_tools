package ;
import gml.Mathf;
import gml.NativeDate;
import gml.input.Mouse;
import gml.input.MouseButton;
import gml.input.Window;

/**
 * A controller for window caption's buttons (by default, minimize-maximize-restore).  
 * Found in [WindowFrame.buttons]
 * @author YellowAfterlife
 * @dmdPath ["", "Buttons"]
 * @dmdOrder 3
 */
@:nativeGen @:keep
class WindowFrameButtons {
	/** The associated window frame controller, for convenience */
	@:doc public var frame:WindowFrame;
	
	/** The buttons themselves */
	@:doc public var array:Array<WindowFrameButton> = [];
	
	/** Controls how fast (in seconds) buttons fade in/out on hover */
	@:doc public var fadeTime = 0.2;
	
	public var waitForMovement = new WindowFrameButtons_waitForMovement();
	
	/** The default "minimize" button */
	@:doc public var minimize:WindowFrameButton;
	/** The default "maximize/restore" button */
	@:doc public var maxrest:WindowFrameButton;
	/** The default "close" button */
	@:doc public var close:WindowFrameButton;
	
	public function new(frame:WindowFrame) {
		this.frame = frame;
	}
	
	/** Adds a button to the set */
	public inline function add(button:WindowFrameButton):WindowFrameButton {
		array.push(button);
		return button;
	}
	
	/** Returns combined width of all buttons */
	@:doc public function getWidth():Int {
		var w = 0;
		for (button in array) {
			w += button.marginLeft + button.getWidth(button) + button.marginRight;
		}
		return w;
	}
	
	/** Returns where the window buttons should be, given the specified window width */
	@:doc public function getX(windowWidth:Int) {
		return windowWidth - (frame.isMaximized ? 0 : frame.borderWidth) - getWidth();
	}
	
	/** Un-presses and un-hovers every button */
	@:doc public function reset() {
		for (button in array) {
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
		for (i in 0 ... array.length) {
			var button = array[i];
			button.update(button);
			x += button.marginLeft;
			var width = button.getWidth(button);
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
				button.click(button);
			}
			x += width + button.marginRight;
		}
	}
	public function draw(x:Int, y:Int, height:Int) {
		for (i in 0 ... array.length) {
			var button = array[i];
			x += button.marginLeft;
			var width = button.getWidth(button);
			button.drawUnderlay(button, x, y, width, height);
			button.drawIcon(button, x, y, width, height);
			x += width + button.marginRight;
		}
	}
	
	public function addDefaultButtons() {
		minimize = add(new WindowFrameButton(frame, frame.sprButtons, 0, function(button) {
			button.frame.minimize();
		}));
		
		maxrest = add(new WindowFrameButton(frame, frame.sprButtons, 1, function(button) {
			var frame = button.frame;
			if (frame.isMaximized) {
				frame.restore();
			} else frame.maximize();
			frame.buttons.reset();
		}));
		maxrest.update = function(b) {
			b.subimg = b.frame.isMaximized ? 2 : 1;
			b.enabled = b.frame.canResize;
		}
		
		close = add(new WindowFrameButton(frame, frame.sprButtons, 3, function(_) {
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
			frame.sprPixel.drawStretchedExt(0, _x, _y, b.getWidth(b), _height, 0x2311E8, _alpha);
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