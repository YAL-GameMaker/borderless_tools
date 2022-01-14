package ;
import gml.Draw;
import gml.Syntax;
import gml.assets.Font;
import gml.assets.Sprite;
import gml.gpu.GPU;
import gml.gpu.TextAlign;
import gml.input.Window;
import WindowFrameHelpers.*;

/**
 * A controller for titlebar area things.  
 * Found in [WindowFrame.caption]
 * @author YellowAfterlife
 * @dmdPath ["", "Caption"]
 * @dmdOrder 2
 */
@:keep @:doc
class WindowFrameCaption {
	/** The associated window frame controller, for convenience */
	public var frame:WindowFrame;
	
	/**
	 * Drawn in caption area by the default [drawText].  
	 * Is initially set to value of `window_get_caption()`.
	 */
	public var text:String = Window.caption;
	
	/** If set, is used for drawing the above */
	public var font:Font = Font.defValue;
	
	/** If set, drawn in caption area by the default [drawText] */
	public var icon:Sprite = Sprite.defValue;
	
	/** Titlebar area height, in pixels. Defaults to [WindowFrame.sprCaption]'s height */
	public var heightNormal:Int;
	/** Titlebar area height while maximized, in pixels. Defaults to 2/3 of [WindowFrame.sprCaption]'s height */
	public var heightMaximized:Int;
	
	@:noDoc public function new(frame:WindowFrame) {
		this.frame = frame;
		heightNormal = frame.sprCaption.height;
		heightMaximized = Math.round(heightNormal * 2 / 3);
	}
	
	/** Returns current height (depending on whether the window is maximized) */
	public inline function getHeight() {
		return frame.isMaximized ? heightMaximized : heightNormal;
	}
	
	/**
	 * Is called to draw the window caption background.  
	 * By default, this will draw [WindowFrame.sprCaption]
	 */
	public var drawBackground:(frame:WindowFrame, x:Int, y:Int, width:Int, height:Int, buttonsX:Int)->Void = drawCaptionRect_default;
	@:noDoc static function drawCaptionRect_default(frame:WindowFrame, _x:Int, _y:Int, _width:Int, _height:Int, _buttons_x:Int):Void {
		draw9slice(frame.sprCaption, Window.hasFocus ? 1 : 0, _x, _y, _width, _height, frame.blend, frame.alpha, true);
	}
	
	/**
	 * Is called to draw the window caption text.  
	 * By default, this will draw [icon] and [text] using [font] (if set).
	 */
	public var drawText:(frame:WindowFrame, x:Int, y:Int, width:Int, height:Int)->Void = drawCaptionText_default;
	@:noDoc static function drawCaptionText_default(frame:WindowFrame, _x, _y, _width, _height):Void {
		var caption = frame.caption;
		
		// icon:
		_x += 6;
		var icon = caption.icon;
		if (icon != Sprite.defValue) {
			icon.draw( -1, _x + icon.offsetX, _y + Syntax.div(_height - icon.height, 2) + icon.offsetY);
			_x += 4 + icon.width;
		}
		
		//
		var text = caption.text;
		if (text == "") return;
		
		var _newFont = caption.font;
		#if sfgml_next
		var _h = GPU.halign;
		var _v = GPU.valign;
		var _oldFont:Font;
		if (_newFont != Font.defValue) {
			_oldFont = GPU.font;
			GPU.font = _newFont;
		} else _oldFont = Font.defValue;
		#else
		if (_newFont != Font.defValue) GPU.font = _newFont;
		#end
		
		GPU.halign = TextAlign.Left;
		GPU.valign = TextAlign.Top;
		Draw.textExt(_x, _y + Syntax.div(_height - Draw.textHeightExt(text, -1, _width), 2), text, -1, _width);
		
		#if sfgml_next
		if (_newFont != Font.defValue) GPU.font = _oldFont;
		GPU.halign = _h;
		GPU.valign = _v;
		#end
	}
	
}