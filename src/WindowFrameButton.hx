package ;
import gml.Lib;
import gml.NativeDate;
import gml.Syntax;
import gml.assets.Sprite;

/**
 * Represents a single button residing in the window caption.
 * @author YellowAfterlife
 * @dmdPath ["", "WindowFrameButton"]
 * @dmdOrder 3
 */
@:doc @:nativeGen @:keep
class WindowFrameButton {
	/** The associated window frame controller, for convenience */
	public var frame:WindowFrame = null;
	
	/** A sprite to be used for the button's icon (drawn by the default [drawIcon] and used for measurement) */
	public var icon:Sprite;
	/** Subimage of above sprite to use */
	public var subimg:Int;
	/** Empty space to add to the left of the button */
	public var marginLeft = 0;
	/** Empty space to add to the right of the button */
	public var marginRight = 0;
	
	/** Indicates whether the mouse is over the button. */
	public var hover = false;
	
	/**
	 * Indicates whether the button is currently being held down.  
	 * (note that the mouse may no longer be over the button while doing so)
	 */
	public var pressed = false;
	
	/**
	 * Indicates whether the button is active.  
	 * (setting this to `false` disables interactions with it).
	 */
	public var enabled = true;
	
	/** A helper variable for fade effect, usually modified by [drawUnderlay]. */
	public var fade = 0.;
	
	/** Executed when the button is clicked. */
	public var click:(button:WindowFrameButton)->Void;
	public function new(frame:WindowFrame, icon:Sprite, subimg:Int, onClick:(button:WindowFrameButton)->Void) {
		this.frame = frame;
		this.icon = icon;
		this.subimg = subimg;
		this.click = onClick;
	}
	@:noDoc static function ease_inout_expo(a:Float, b:Float, c:Float, d:Float):Float {
		a /= d * 0.5;
		if (a < 1) return c * 0.5 * Math.pow(2, 10 * (a - 1)) + b;
		a -= 1;
		return c * 0.5 * (-Math.pow(2, -10 * a) + 2) + b;
	}
	
	/**
	 * Should return the button's width, in pixels.  
	 * By default, returns the button sprite's width.
	 */
	public var getWidth:(button:WindowFrameButton)->Int = getWidth_default;
	@:noDoc static function getWidth_default(b:WindowFrameButton) {
		return b.icon.width;
	}
	
	/**
	 * Ran during update loop.  
	 * Can be used for things like changing [icon]/[subimg]/[enabled] to reflect button's state.  
	 * The default maximize/restore button uses this to change state.
	 */
	public var update:(button:WindowFrameButton)->Void = function(_) {}
	
	/**
	 * Should draw the button underlay at specified location.  
	 * By default, draws a rectangle and does fade in/out based on button state.  
	 * Note that the default "close" button has its own handler for a red highlight!
	 */
	public var drawUnderlay:(button:WindowFrameButton, x:Float, y:Float, width:Float, height:Float)->Void = drawUnderlay_default;
	@:noDoc static function drawUnderlay_default(b:WindowFrameButton, x:Float, y:Float, width:Float, height:Float) {
		var alpha;
		var frame = b.frame;
		if (!b.enabled) {
			alpha = 0.;
		} else if (b.pressed) {
			alpha = 0.7;
			b.fade = 1;
		} else {
			var dt = NativeDate.deltaTime / 1000000;
			if (b.hover) {
				if (b.fade < 1) b.fade = Math.min(b.fade + dt / frame.buttons.fadeTime, 1);
			} else if (b.fade > 0) {
				b.fade = Math.max(b.fade - dt / frame.buttons.fadeTime, 0);
			}
			alpha = b.fade * 0.3;//ease_inout_expo(fade, 0, 1, 1);
		}
		frame.sprPixel.drawStretchedExt(0, x, y, width, height, frame.blend, frame.alpha * alpha);
	}
	
	/**
	 * Should draw the button icon at the specified location.  
	 * By default, this draws the button's sprite amid the area.
	 */
	public var drawIcon:(button:WindowFrameButton, x:Int, y:Int, width:Int, height:Int)->Void = drawIcon_default;
	@:noDoc static function drawIcon_default(b:WindowFrameButton, x:Int, y:Int, width:Int, height:Int) {
		var frame = b.frame;
		var icon = b.icon;
		icon.drawExt(b.subimg,
			x + Syntax.div(width - icon.width, 2),
			y + Syntax.div(height - icon.height, 2),
			1, 1, 0, frame.blend, frame.alpha * (b.enabled ? 1 : 0.3)
		);
	}
}