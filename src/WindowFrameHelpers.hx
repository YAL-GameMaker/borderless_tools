package ;
import gml.assets.Sprite;
import gml.ds.Color;

/**
 * ...
 * @author YellowAfterlife
 */
class WindowFrameHelpers {
	#if sfgml.modern
	@:noDoc public static inline function draw9slice(spr:Sprite, subimg:Int, x:Int, y:Int, w:Int, h:Int, c:Color, a:Float, fill:Bool) {
		spr.drawStretchedExt(subimg, x, y, w, h, c, a);
	}
	#else
	@:noDoc public static function draw9slice(spr:Sprite, subimg:Int, x:Int, y:Int, w:Int, h:Int, c:Color, a:Float, fill:Bool) {
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
		
		if (fill) stretch(sw2, sh2, sw1, sh1, x + sw2, y + sh2, w - sw1, h - sh1);
	}
	#end
}