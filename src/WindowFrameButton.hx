package ;
import gml.Lib;
import gml.NativeDate;
import gml.Syntax;
import gml.assets.Sprite;

/**
 * ...
 * @author YellowAfterlife
 */
@:doc @:nativeGen @:keep
class WindowFrameButton {
	public var frame:WindowFrame = null;
	
	public var sprite:Sprite;
	public var subimg:Int;
	public var marginLeft = 0;
	public var marginRight = 0;
	
	public var hover = false;
	public var pressed = false;
	public var enabled = true;
	public var fade = 0.;
	public static var current:WindowFrameButton;
	
	public var click:WindowFrame->Void;
	public function new(sprite:Sprite, subimg:Int, onClick:WindowFrame-> Void) {
		this.sprite = sprite;
		this.subimg = subimg;
		this.click = onClick;
	}
	static function ease_inout_expo(argument0:Float, argument1:Float, argument2:Float, argument3:Float):Float {
		argument0 /= argument3 * 0.5;
	
		if (argument0 < 1) {
			return argument2 * 0.5 * Math.pow(2, 10 * (argument0 - 1)) + argument1;
		}
	
		argument0 -= 1;
		return argument2 * 0.5 * (-Math.pow(2, -10 * argument0) + 2) + argument1;
	}
	public dynamic function getWidth() return sprite.width;
	public var update:(b:WindowFrameButton)->Void = function(_) {}
	public var drawUnderlay:(b:WindowFrameButton, _x:Float, _y:Float, _width:Float, _height:Float)->Void = drawUnderlay_default;
	static function drawUnderlay_default(b:WindowFrameButton, _x:Float, _y:Float, _width:Float, _height:Float) {
		var _alpha;
		var frame = b.frame;
		if (!b.enabled) {
			_alpha = 0.;
		} else if (b.pressed) {
			_alpha = 0.7;
			b.fade = 1;
		} else {
			var dt = NativeDate.deltaTime / 1000000;
			if (b.hover) {
				if (b.fade < 1) b.fade = Math.min(b.fade + dt / frame.buttons.fadeTime, 1);
			} else if (b.fade > 0) {
				b.fade = Math.max(b.fade - dt / frame.buttons.fadeTime, 0);
			}
			_alpha = b.fade * 0.3;//ease_inout_expo(fade, 0, 1, 1);
		}
		frame.sprPixel.drawStretchedExt(0, _x, _y, b.getWidth(), _height, frame.blend, frame.alpha * _alpha);
	}
	public var drawIcon:(b:WindowFrameButton, x:Int, y:Int, width:Int, height:Int)->Void = drawIcon_default;
	static function drawIcon_default(b:WindowFrameButton, x:Int, y:Int, width:Int, height:Int) {
		var frame = b.frame;
		b.sprite.drawExt(b.subimg,
			x + Syntax.div(width - b.sprite.width, 2),
			y + Syntax.div(height - b.sprite.height, 2),
			1, 1, 0, frame.blend, frame.alpha * (b.enabled ? 1 : 0.3)
		);
	}
}