package ;
import gml.Draw;
import gml.Mathf;
import gml.Syntax;
import gml.assets.Sprite;
import gml.ds.ArrayList;
import gml.ds.Color;
import gml.ds.Queue;
import gml.gpu.GPU;
import gml.gpu.TextAlign;
import gml.input.Display;
import gml.input.Mouse;
import gml.input.MouseButton;
import gml.input.Window;
import gml.input.Window.WindowCursor;
import haxe.Rest;

/**
 * ...
 * @author YellowAfterlife
 */
@:doc @:nativeGen @:keep
class WindowFrame {
	public var sprBorder:Sprite;
	public var sprCaption:Sprite;
	public var sprButtons:Sprite;
	public var sprPixel:Sprite;
	
	public var debug = false;
	public function mylog(args:Rest<Any>) {
		if (!debug) return;
		var s = "[WindowFrame] ";
		for (arg in args) s += Std.string(arg);
		gml.Lib.trace(s);
	}
	
	public var blend = Color.white;
	public var alpha = 1.;
	public var doubleClickTime = BorderlessExt.borderless_tools_double_click_time();
	public var mouseOverFrame = false;
	
	public var canInput = true;
	public var canResize = true;
	
	public var titlebarHeight:Int;
	public var titlebarHeightMaximized = 21;
	
	public var lastTitleClickAt = -5000;
	public var resizePadding = 6;
	public var borderWidth = 2;
	
	public var buttons:WindowFrameButtons;
	public var drag:WindowFrameDrag;
	public var delayMgr:WindowFrameDelay;
	public var cover:WindowFrameCover;
	
	public var defaultCursor:WindowCursor = WindowCursor.arrow;
	public var isMaximized = false;
	public var isFullscreen = false;
	public var restoreRect = new WindowFrameRect();
	
	public function new(
		?sprBorder:Sprite,
		?sprCaption:Sprite,
		?sprButtons:Sprite,
		?sprPixel:Sprite
	) {
		if (sprBorder == null) sprBorder = WindowFrameDefaults.spr_window_border;
		if (sprCaption == null) sprCaption = WindowFrameDefaults.spr_window_caption;
		if (sprButtons == null) sprButtons = WindowFrameDefaults.spr_window_buttons;
		if (sprPixel == null) sprPixel = WindowFrameDefaults.spr_window_pixel;
		
		this.sprBorder = sprBorder;
		this.sprCaption = sprCaption;
		this.sprButtons = sprButtons;
		this.sprPixel = sprPixel;
		
		titlebarHeight = sprCaption.height;
		drag = new WindowFrameDrag(this);
		delayMgr = new WindowFrameDelay();
		cover = new WindowFrameCover(this);
		restoreRect.getWindowRect();
		buttons = new WindowFrameButtons(this);
		buttons.addDefaultButtons();
	}
	
	public inline function delay0(func:()->Void, delay:Int) {
		delayMgr.add(func, delay);
	}
	public inline function delay1<A>(arg0:A, delay:Int, func:A->Void) {
		delayMgr.add(func, delay, arg0);
	}
	public inline function delay2<A,B>(arg0:A, arg1:B, delay:Int, func:A->B->Void) {
		delayMgr.add(func, delay, arg0, arg1);
	}
	public inline function delay3<A,B,C>(func:A->B->C->Void, delay:Int, ?arg0:A, ?arg1:B, ?arg2:C) {
		delayMgr.add(func, delay, arg0, arg1, arg2);
	}
	public inline function delay4<A,B,C,D>(func:A->B->C->D->Void, delay:Int, ?arg0:A, ?arg1:B, ?arg2:C, ?arg3:D) {
		delayMgr.add(func, delay, arg0, arg1, arg2, arg3);
	}
	
	public function getButtonsX(_width:Int) {
		return (isMaximized ? _width : _width - borderWidth) - buttons.getWidth();
	}
	
	static var getActiveMonitor_list:ArrayList<WindowFrameMonitorInfo> = null;
	public function getActiveMonitor():WindowFrameMonitorInfo {
		var _list = getActiveMonitor_list;
		if (_list == null) {
			_list = new ArrayList();
			getActiveMonitor_list = _list;
		}
		var _count = untyped BorderlessExt.borderless_tools_get_monitors(_list);
		var _cx = Window.x + Syntax.div(Window.width, 2);
		var _cy = Window.y + Syntax.div(Window.height, 2);
		for (i in 0 ... _count) {
			var _item = _list[i];
			var _mntr = _item.screen;
			if (_cx >= _mntr.x && _cy >= _mntr.y && _cx < _mntr.right && _cy < _mntr.bottom) return _item;
		}
		var _item = _list[0];
		if (_item == null) {
			_item = {
				screen: new WindowFrameRect(0, 0, Display.width, Display.height),
				workspace: new WindowFrameRect(0, 0, Display.width, Display.height - 40),
				flags: 0x0,
			};
			_list[0] = _item;
		}
		return _item;
	}
	
	public function maximize() {
		if (isMaximized || isFullscreen) return;
		isMaximized = true;
		storeRect();
		maximize_1();
	}
	function maximize_1() {
		var _work = getActiveMonitor().workspace;
		if (debug) mylog("maximize: ", _work);
		_work.setWindowRect();
		BorderlessExt.borderless_tools_set_shadow(false);
	}
	function storeRect() {
		restoreRect.getWindowRect();
		if (debug) mylog("storeRect: ", restoreRect);
	}
	public function restore(_force = false) {
		if (Window.fullscreen) {
			Window.fullscreen = false;
			delay1(this, 1, f -> f.restore());
			return;
		}
		if (!_force && !isMaximized && !isFullscreen) return;
		isMaximized = false;
		isFullscreen = false;
		var _rect = restoreRect;
		if (debug) mylog("restore: ", _rect);
		_rect.setWindowRect();
		BorderlessExt.borderless_tools_set_shadow(true);
	}
	public function setFullscreen(_mode:Int, _wasFullscreen = false) {
		if (debug) mylog("setFullscreen(mode:", _mode, ", wasfs:", _wasFullscreen, ")");
		if (_mode == 1 || _mode == 2) {
			buttons.reset();
			drag.stop();
		}
		switch (_mode) {
			case 1: // true fullscreen
				if (Window.fullscreen) return;
				if (isFullscreen) {
					restore();
					delay1(this, 1, f -> f.setFullscreen(1));
					return;
				} else storeRect();
				Window.fullscreen = true;
			case 2: // fullscreen window
				if (Window.fullscreen) {
					Window.fullscreen = false;
					delay1(this, 10, f -> f.setFullscreen(2, true));
					return;
				}
				if (isFullscreen) return;
				isFullscreen = true;
				if (!isMaximized && !_wasFullscreen) storeRect();
				var _rect = getActiveMonitor().screen;
				_rect.setWindowRect();
				BorderlessExt.borderless_tools_set_shadow(false);
			default: // windowed
				if (Window.fullscreen && isFullscreen) {
					Window.fullscreen = false;
					delay1(this, 1, f -> f.setFullscreen(0));
					return;
				}
				if (Window.fullscreen) {
					Window.fullscreen = false;
				} else {
					if (isMaximized) {
						isFullscreen = false;
						maximize_1();
					} else restore();
				}
		}
	}
	
	inline function setWindowCursor(cr:WindowCursor) {
		if (Window.mouseCursor != cr) {
			Window.mouseCursor = cr;
		}
	}
	
	inline function getBorderWidth() return isMaximized ? 0 : borderWidth;
	inline function getTitlebarHeight() return isMaximized ? titlebarHeightMaximized : titlebarHeight;
	inline function getWidth() return Window.width;
	inline function getHeight() return Window.height;
	
	function update() {
		mouseOverFrame = false;
		delayMgr.update();
		cover.ensure();
		
		if (Window.fullscreen || isFullscreen) return;
		var mx = Std.int(Window.mouseX);
		var my = Std.int(Window.mouseY);
		var gw = getWidth();
		var gh = getHeight();
		var _borderWidth = isMaximized ? 0 : borderWidth;
		var _titleHeight = isMaximized ? titlebarHeightMaximized : titlebarHeight;
		var _buttons_x = getButtonsX(gw);
		
		var _flags = 0x0, _titleHit = false;
		var _hitSomething = true;
		if (Window.fullscreen) {
			//
		}
		else if (Mathf.pointInRect(mx, my,
			_buttons_x, _borderWidth,
			gw - _borderWidth - (isMaximized ? 0 : resizePadding),
			_borderWidth + _titleHeight
		)) { // mouse over window buttons
			//
		}
		else if (!isMaximized && !Mathf.pointInRect(mx, my,
			resizePadding,
			resizePadding,
			gw - resizePadding,
			gh - resizePadding
		)) { // mouse over borders
			if (mx < resizePadding) _flags |= WindowFrameDragFlags.Left;
			if (my < resizePadding) _flags |= WindowFrameDragFlags.Top;
			if (mx >= gw - resizePadding) _flags |= WindowFrameDragFlags.Right;
			if (my >= gh - resizePadding) _flags |= WindowFrameDragFlags.Bottom;
		}
		else if (Mathf.pointInRect(mx, my,0, 0, gw, titlebarHeight)) {
			_titleHit = true;
		}
		else {
			_hitSomething = false;
		}
		mouseOverFrame = _hitSomething;
		
		if (drag.flags == 0) {
			var _cursor = defaultCursor;
			if (canInput && canResize) switch (_flags) {
				case 1, 4: _cursor = WindowCursor.sizeWE;
				case 2, 8: _cursor = WindowCursor.sizeNS;
				case 3, 12: _cursor = WindowCursor.sizeNWSE;
				case 6, 9: _cursor = WindowCursor.sizeNESW;
			}
			setWindowCursor(_cursor);
		}
		
		buttons.update(_buttons_x, _borderWidth, _titleHeight, mx, my);
		if (canInput && Mouse.pressed(MouseButton.MbLeft)) {
			if (_titleHit) {
				var _now = gml.Lib.getTimer();
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
			} else if (_flags != 0 && canResize) {
				drag.start(_flags);
			}
		}
		if (!canInput) {
			if (drag.flags != 0) drag.stop();
		} else if (Mouse.released(MouseButton.MbLeft)) {
			drag.stop();
		} else {
			drag.update();
		}
	}
	#if sfgml.modern
	public static inline function draw9slice(spr:Sprite, subimg:Int, x:Int, y:Int, w:Int, h:Int, c:Color, a:Float) {
		spr.drawStretchedExt(subimg, x, y, w, h, c, a);
	}
	#else
	public static function draw9slice(spr:Sprite, subimg:Int, x:Int, y:Int, w:Int, h:Int, c:Color, a:Float) {
		var sw = spr.width;
		var sw1 = sw >> 1;
		var sw2 = sw >> 2;
		var sw3 = sw - sw2;
		var sh = spr.height;
		var sh1 = sh >> 1;
		var sh2 = sh >> 2;
		var sh3 = sh - sh2;
		inline function part(pl:Int, pt:Int, pw:Int, ph:Int, x:Int, y:Int) {
			spr.drawPartExt(subimg, pl, pt, pw, ph, x, y, 1, 1, c, a);
		}
		part(0, 0, sw2, sh2, x, y);
		part(sw3, 0, sw2, sh2, x + w - sw2, y);
		part(0, sh3, sw2, sh2, x, y + h - sh2);
		part(sw3, sh3, sw2, sh2, x + w - sw2, y + h - sh2);
		inline function stretch(pl:Int, pt:Int, pw:Int, ph:Int, x:Int, y:Int, w:Int, h:Int) {
			spr.drawPartExt(subimg, pl, pt, pw, ph, x, y, w / pw, h / ph, c, a);
		}
		stretch(sw2, 0, sw1, sh2, x + sw2, y, w - sw1, sh2); // T
		stretch(sw2, sh3, sw1, sh2, x + sw2, y + h - sh2, w - sw1, sh2); // B
		stretch(0, sh2, sw2, sh1, x, y + sh2, sw2, h - sh1); // L
		stretch(sw3, sh2, sw2, sh1, x + w - sw2, y + sh2, sw2, h - sh1); // R
		
		stretch(sw2, sh2, sw1, sh1, x + sw2, y + sh2, w - sw1, h - sh1);
	}
	#end
	dynamic function drawBorder(_x, _y, _width, _height) {
		draw9slice(sprBorder, 0, _x, _y, _width, _height, blend, alpha);
	}
	dynamic function drawCaptionRect(_x, _y, _width, _height, _buttons_x) {
		draw9slice(sprCaption, Window.hasFocus ? 1 : 0, _x, _y, _width, _height, blend, alpha);
	}
	dynamic function drawCaptionText(_x, _y, _width, _height) {
		var _h = GPU.halign;
		var _v = GPU.valign;
		GPU.halign = TextAlign.Left;
		GPU.valign = TextAlign.Top;
		Draw.textExt(_x + 4, _y + Syntax.div(_height, 2), "", -1, _width);
		GPU.halign = _h;
		GPU.valign = _v;
	}
	public function draw() {
		if (Window.fullscreen || isFullscreen) return;
		
		var gw = getWidth();
		var gh = getHeight();
		untyped __display_set_gui_maximise_base(browser_width/gw, browser_height/gh, (gw%2)/-2, (gh%2)/-2);
		var _borderWidth = getBorderWidth();
		var _titlebarHeight = getTitlebarHeight();
		var _buttons_x = getButtonsX(gw);
		
		if (!isMaximized) drawBorder(0, 0, gw, gh);
		drawCaptionRect(_borderWidth, _borderWidth, gw-_borderWidth*2, _titlebarHeight, _buttons_x);
		drawCaptionText(_borderWidth, _borderWidth, _buttons_x-_borderWidth, _titlebarHeight);
		buttons.draw(_buttons_x, _borderWidth, _titlebarHeight);
		
		untyped __display_gui_restore();
	}
	public function getDragFlags() return drag.flags;
	static inline function main() {}
}
@:std @:native("") extern enum abstract WindowFrameDefaults(Sprite) from Sprite to Sprite {
	var spr_window_border ;
	var spr_window_caption;
	var spr_window_buttons;
	var spr_window_pixel  ;
}
@:gml.linear typedef WindowFrameMonitorInfo = {
	var screen:WindowFrameRect;
	var workspace:WindowFrameRect;
	var flags:Int;
}