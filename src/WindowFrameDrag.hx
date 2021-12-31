package ;
import gml.Mathf;
import gml.input.Display;
import gml.input.Window;

/**
 * ...
 * @author YellowAfterlife
 */
@:nativeGen
class WindowFrameDrag {
	public var frame:WindowFrame;
	public var flags = 0x0;
	public var mx = 0;
	public var my = 0;
	public var left = 0;
	public var top = 0;
	public var right = 0;
	public var bottom = 0;
	public function new(frame:WindowFrame) {
		this.frame = frame;
	}
	public function start(flags:Int) {
		this.flags = flags;
		mx = Std.int(Display.mouseX);
		my = Std.int(Display.mouseY);
		left = Window.x;
		top = Window.y;
		right = left + Window.width;
		bottom = top + Window.height;
	}
	public function stop() {
		flags = WindowFrameDragFlags.None;
	}
	inline function setRect(x:Int, y:Int, w:Int, h:Int) {
		Window.setRect(x, y, w, h);
	}
	public function update() {
		if (flags == WindowFrameDragFlags.None) return;
		var _mx =  Std.int(Display.mouseX);
		var _my =  Std.int(Display.mouseY);
		switch (flags) {
			case WindowFrameDragFlags.Move:
				Window.move(
					_mx - (mx - left),
					_my - (my - top)
				);
				
			case WindowFrameDragFlags.Unmax:
				if (Mathf.dist2d(_mx, _my, mx, my) > 5) {
					var _x, _y = my - top;
					if (mx - left < (right - left) / 2) {
						_x = Mathf.min(mx - left, frame.restoreRect.width >> 1);
					} else {
						_x = Mathf.max(frame.restoreRect.width + mx - right, frame.restoreRect.width >> 1);
					}
					frame.isMaximized = false;
					setRect(_mx - _x, _my - _y, frame.restoreRect.width, frame.restoreRect.height);
					start(WindowFrameDragFlags.Move);
					//trace(_x);
				}
				
			case WindowFrameDragFlags.Left:
				var _x = _mx - (mx - left);
				setRect(_x, top, right - _x, bottom - top);
				
			case WindowFrameDragFlags.Top:
				var _y = _my - (my - top);
				setRect(left, _y, right - left, bottom - _y);
				
			case WindowFrameDragFlags.Right:
				setRect(left, top, right - left - mx + _mx, bottom - top);
				
			case WindowFrameDragFlags.Bottom:
				setRect(left, top, right - left, bottom - top - my + _my);
				
			
			case WindowFrameDragFlags.TopLeft:
				var _x = _mx - (mx - left);
				var _y = _my - (my - top);
				setRect(_x, _y, right - _x, bottom - _y);
				
			case WindowFrameDragFlags.BottomLeft:
				var _x = _mx - (mx - left);
				setRect(_x, top, right - _x, bottom - top - my + _my);
				
			case WindowFrameDragFlags.TopRight:
				var _y = _my - (my - top);
				setRect(left, _y, right - left - mx + _mx, bottom - _y);
				
			case WindowFrameDragFlags.BottomRight:
				setRect(left, top, right - left - mx + _mx, bottom - top - my + _my);
				
		}
	}
}