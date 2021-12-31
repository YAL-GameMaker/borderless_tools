package ;
import gml.input.Window;

/**
 * ...
 * @author YellowAfterlife
 */
class WindowFrameCover {
	var frame:WindowFrame;
	var checkForSuccess = false;
	var ignoreRect = new WindowFrameRect();
	var canIgnore = false;
	var currRect = new WindowFrameRect();
	public function new(frame:WindowFrame) {
		this.frame = frame;
	}
	public function ensure() {
		var _just_changed = checkForSuccess;
		if (_just_changed) checkForSuccess = false;
		var _target_rect;
		if (Window.fullscreen) {
			canIgnore = false;
			return;
		} else if (frame.isFullscreen) {
			_target_rect = frame.getActiveMonitor().screen;
		} else if (frame.isMaximized) {
			_target_rect = frame.getActiveMonitor().workspace;
		} else {
			canIgnore = false;
			return;
		}
		currRect.getWindowRect();
		if (!currRect.equals(_target_rect)) {
			if (_just_changed) {
				canIgnore = true;
				ignoreRect.setTo(_target_rect);
				if (frame.debug) frame.mylog("[cover] Resize failed - ignoring");
				return;
			}
			if (canIgnore && _target_rect.equals(ignoreRect)) return;
			if (frame.debug) frame.mylog("[cover] Adjusting window rectangle to ", _target_rect);
			_target_rect.setWindowRect();
			checkForSuccess = true;
		}
	}
}