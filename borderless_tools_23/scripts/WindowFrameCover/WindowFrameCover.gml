// Makes sure that maximized/borderless fs modes cover the appropriate screen area -
// mostly when moving the window between monitors or changing display resolution.
function WindowFrameCover(_frame) constructor {
	frame = _frame; /// @is {WindowFrame}
	checkForSuccess = false;
	ignoreRect = array_create(4, 0);
	canIgnore = false;
	currRect = array_create(4, 0);
	static ensure = function() {
		var _just_changed = checkForSuccess;
		if (_just_changed) checkForSuccess = false;
		var _target_rect;
		if (window_get_fullscreen()) {
			canIgnore = false;
			exit;
		} else if (frame.isFullscreen) {
			_target_rect = frame.getActiveMonitor()[0];
		} else if (frame.isMaximized) {
			_target_rect = frame.getActiveMonitor()[1];
		} else {
			canIgnore = false;
			exit;
		}
		WindowFrameTools.getWindowRect(currRect);
		if (!array_equals(currRect, _target_rect)) {
			if (_just_changed) {
				canIgnore = true;
				array_copy(ignoreRect, 0, _target_rect, 0, 4);
				if (frame.debug) frame.mylog("[cover] Resize failed - ignoring");
				exit;
			}
			if (canIgnore && array_equals(_target_rect, ignoreRect)) exit;
			if (frame.debug) frame.mylog("[cover] Adjusting window rectangle to ", _target_rect);
			WindowFrameTools.setWindowRect(_target_rect);
			checkForSuccess = true;
		}
	}
}