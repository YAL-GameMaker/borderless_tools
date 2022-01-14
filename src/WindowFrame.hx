package ;
import gml.Draw;
import gml.Mathf;
import gml.Syntax;
import gml.assets.Font;
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
import WindowFrameHelpers.*;
import haxe.Rest;

/**
 * Represents a window frame itself
 * @author YellowAfterlife
 * @dmdPath ["", "Frame"]
 * @dmdOrder 1
 */
@:doc @:nativeGen @:keep
class WindowFrame {
	/**
	 * @dmdPrefix Essentials:
	 * If enabled, logs semi-important events.
	 */
	public var debug = false;
	
	/** Can be set to quickly apply color blending to default elements */
	public var blend = Color.white;
	/** Can be set to quickly apply an alpha multiplier to default elements */
	public var alpha = 1.;
	@:noDoc public var doubleClickTime = BorderlessExt.borderless_tools_double_click_time();
	/** Can be read to figure out whether the mouse is currently over the border/titlebar - you should not be handling mouse press events when it is */
	public var mouseOverFrame = false;
	
	/**
	 * Can be set to `false` to disable all input polling.
	 * A common use case is to fade out the frame (using [alpha]) and disable polling
	 * when your game is in "play" state to avoid dealing with window border UI.
	 */
	public var canInput = true;
	/** Can be set to `false` to disable resizing and maximize/restore button */
	public var canResize = true;
	
	/**
	 * @dmdPrefix Sprites:
	 * Outer window border (9-slice, 2 frames - inactive, active)
	 */
	public var sprBorder:Sprite;
	/** Window caption (9-slice, 2 frames - inactive, active) */
	public var sprCaption:Sprite;
	/** Window button icons (4 frames - minimize, maximize, restore, close) */
	public var sprButtons:Sprite;
	/** A white square to be stretched when drawing colored rectangles */
	public var sprPixel:Sprite;
	
	@:noDoc public function mylog(args:Rest<Any>) {
		if (!debug) return;
		var s = "[WindowFrame] ";
		for (arg in args) s += Std.string(arg);
		gml.Lib.trace(s);
	}
	
	/**
	 * @dmdPrefix Controllers:
	 * A reference to the window button controller ([WindowFrameButtons])
	 */
	public var buttons:WindowFrameButtons;
	/** A reference to the window caption controller ([WindowFrameCaption]) */
	public var caption:WindowFrameCaption;
	@:noDoc public var drag:WindowFrameDrag;
	@:noDoc public var delayMgr:WindowFrameDelay;
	@:noDoc public var cover:WindowFrameCover;
	
	@:noDoc public var lastTitleClickAt = -5000;
	/** Clicking this close (in pixels) to the window edge initiates the resize operation, if enabled */
	public var resizePadding = 6;
	/** Effective width of window border, used for deciding where to draw the window buttons */
	public var borderWidth = 2;
	
	/**
	 * @dmdPrefix Cursor-related:
	 * The cursor to use while the mouse isn't over the window border.  
	 * Defaults to `cr_arrow`
	 */
	public var defaultCursor:WindowCursor = WindowCursor.arrow;
	/** If set to false, the extension will not try changing the cursor at all */
	public var setCursor:Bool = true;
	/**
	 * If [setCursor] is false, you can read this to see what cursor the extension wanted to show
	 * and show your own.
	 */
	public var currentCursor:WindowCursor = WindowCursor.arrow;
	
	/**
	 * Initializes the extension context.  
	 * If not provided, sprites are assumed to be --{
	 * - `spr_window_border` 
	 * - `spr_window_caption`
	 * - `spr_window_buttons`
	 * - `spr_window_pixel`
	 * }
	 */
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
		
		caption = new WindowFrameCaption(this);
		drag = new WindowFrameDrag(this);
		delayMgr = new WindowFrameDelay();
		cover = new WindowFrameCover(this);
		restoreRect.getWindowRect();
		buttons = new WindowFrameButtons(this);
		buttons.addDefaultButtons();
		
		#if sfgml.next
		BorderlessExt.borderless_tools_set_shadow(true);
		#else
		delay1(this, 3, (frame:WindowFrame) -> {
			if (frame.isMaximized || frame.isFullscreen || Window.fullscreen) return;
			BorderlessExt.borderless_tools_set_shadow(true);
		});
		#end
	}
	
	@:noDoc public inline function delay0(func:()->Void, delay:Int) {
		delayMgr.add(func, delay);
	}
	@:noDoc public inline function delay1<A>(arg0:A, delay:Int, func:A->Void) {
		delayMgr.add(func, delay, arg0);
	}
	@:noDoc public inline function delay2<A,B>(arg0:A, arg1:B, delay:Int, func:A->B->Void) {
		delayMgr.add(func, delay, arg0, arg1);
	}
	@:noDoc public inline function delay3<A,B,C>(func:A->B->C->Void, delay:Int, ?arg0:A, ?arg1:B, ?arg2:C) {
		delayMgr.add(func, delay, arg0, arg1, arg2);
	}
	@:noDoc public inline function delay4<A,B,C,D>(func:A->B->C->D->Void, delay:Int, ?arg0:A, ?arg1:B, ?arg2:C, ?arg3:D) {
		delayMgr.add(func, delay, arg0, arg1, arg2, arg3);
	}
	
	@:noDoc static var getActiveMonitor_list:ArrayList<WindowFrameMonitorInfo> = null;
	@:noDoc public function getActiveMonitor():WindowFrameMonitorInfo {
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
	
	@:noDoc @:native("__isMaximized") public var isMaximized = false;
	/** Whether the window is currently in borderless fullscreen mode */
	@:noDoc public var isFullscreen = false;
	@:noDoc public var restoreRect = new WindowFrameRect();
	
	/**
	 * @dmdPrefix State management:
	 * Minimizes the window.
	 */
	public function minimize() {
		if (BorderlessExt.borderless_tools_is_minimized()) return;
		buttons.reset();
		delay1(buttons, 1, function(buttons:WindowFrameButtons) {
			buttons.waitForMovement.enabled = true;
			buttons.waitForMovement.x = Window.mouseX;
			buttons.waitForMovement.y = Window.mouseY;
			BorderlessExt.borderless_tools_syscommand(0xF020);
		});
	}
	@:noDoc public function minimise() inline minimize();
	/**
	 * Returns whether the window is currently minimized.
	 */
	public function isMinimized() {
		return BorderlessExt.borderless_tools_is_minimized();
	}
	@:noDoc public function isMinimised() return inline isMinimized();
	
	/**
	 * Maximizes the window (much like pressing the button would)
	 */
	public function maximize() {
		if (isMaximized || isFullscreen || Window.fullscreen) return;
		isMaximized = true;
		storeRect();
		maximize_1();
	}
	@:noDoc public function maximise() inline maximize();
	
	/**
	 * Returns whether the window is currently maximized.
	 */
	#if sfgml_snake_case
	@:native("is_maximized")
	#else
	@:native("isMaximized")
	#end
	public function getMaximized() return isMaximized;
	#if sfgml_snake_case
	@:native("is_maximised")
	#else
	@:native("isMaximised")
	#end
	@:noDoc public function getMaximised() return isMaximized;
	
	@:noDoc function maximize_1() {
		var _work = getActiveMonitor().workspace;
		if (debug) mylog("maximize: ", _work);
		_work.setWindowRect();
		BorderlessExt.borderless_tools_set_shadow(false);
	}
	@:noDoc function storeRect() {
		restoreRect.getWindowRect();
		if (debug) mylog("storeRect: ", restoreRect);
	}
	/**
	 * Restores the window to non-maximized, non-full-screen state.
	 */
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
	/**
	 * Changes the fullscreen mode --{
	 * -- `0` for returning to windowed mode
	 * -- `1` for "exclusive" (DirectX) fullscreen
	 * -- `2` for borderless fullscreen
	 * }
	 */
	public function setFullscreen(mode:Int) {
		setFullscreen_1(mode);
	}
	/** Returns the current fullscreen mode */
	public function getFullscreen():Int {
		if (Window.fullscreen) return 1;
		return isFullscreen ? 2 : 0;
	}
	@:noDoc public function setFullscreen_1(_mode:Int, _wasFullscreen = false) {
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
					delay1(this, 1, f -> f.setFullscreen_1(1));
					return;
				} else storeRect();
				Window.fullscreen = true;
			case 2: // fullscreen window
				if (Window.fullscreen) {
					Window.fullscreen = false;
					delay1(this, 10, f -> f.setFullscreen_1(2, true));
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
					delay1(this, 1, f -> f.setFullscreen_1(0));
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
	
	@:noDoc function setWindowCursor(cr:WindowCursor) {
		currentCursor = cr;
		if (setCursor) {
			if (Window.mouseCursor != cr) {
				Window.mouseCursor = cr;
			}
		}
	}
	
	@:noDoc inline function getBorderWidth() return isMaximized ? 0 : borderWidth;
	@:noDoc inline function getWidth() return Window.width;
	@:noDoc inline function getHeight() return Window.height;
	
	/** This returns a non-zero value if a move/resize operation is underway */
	public function getDragFlags() return drag.flags;
	
	/**
	 * @dmdPrefix Drawing callbacks:
	 * Is called to draw the outer window border.  
	 * By default, this will draw [sprBorder].
	 */
	var drawBorder:(frame:WindowFrame, x:Int, y:Int, width:Int, height:Int)->Void = drawBorder_default;
	@:noDoc static function drawBorder_default(frame:WindowFrame, _x:Int, _y:Int, _width:Int, _height:Int) {
		draw9slice(frame.sprBorder, Window.hasFocus ? 1 : 0, _x, _y, _width, _height, frame.blend, frame.alpha, false);
	}
	
	/**
	 * @dmdPrefix Implementation:
	 * Should be called once a frame in Step event
	 */
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
		var _titleHeight = caption.getHeight();
		var _buttons_x = buttons.getX(gw);
		
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
		else if (!isMaximized && canResize && !Mathf.pointInRect(mx, my,
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
		else if (Mathf.pointInRect(mx, my,0, 0, gw, _titleHeight)) {
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
	
	/**
	 * Should be called in **Draw GUI** event to draw the frame.  
	 * If you don't rely on drawing logic, you may opt out of doing this when alpha is close to 0
	 * or you otherwise know that you don't need the frame.
	 */
	public function draw() {
		if (Window.fullscreen || isFullscreen) return;
		
		var gw = getWidth();
		var gh = getHeight();
		untyped __display_set_gui_maximise_base(browser_width/gw, browser_height/gh, (gw%2)/-2, (gh%2)/-2);
		var _borderWidth = getBorderWidth();
		var _titlebarHeight = caption.getHeight();
		var _buttons_x = buttons.getX(gw);
		
		if (!isMaximized) drawBorder(this, 0, 0, gw, gh);
		caption.drawBackground(this, _borderWidth, _borderWidth, gw-_borderWidth*2, _titlebarHeight, _buttons_x);
		caption.drawText(this, _borderWidth, _borderWidth, _buttons_x-_borderWidth, _titlebarHeight);
		buttons.draw(_buttons_x, _borderWidth, _titlebarHeight);
		
		untyped __display_gui_restore();
	}
	
	@:noDoc static inline function main() {}
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