function WindowFrameTools_t() constructor {
	/// @template T
	/// @param {T[]} array
	/// @param {int} index
	/// @param {T} ...values
	static setArrayRest = function(_array, _index) {
		for (var i = 2; i < argument_count; i++) {
			_array[@ _index + i - 2] = argument[i];
		}
	}
	static getWindowRect = function(_out_rect) {
		_out_rect[@0] = window_get_x();
		_out_rect[@1] = window_get_y();
		_out_rect[@2] = window_get_width();
		_out_rect[@3] = window_get_height();
	}
	static setWindowRect = function(_rect) {
		window_set_rectangle(_rect[0], _rect[1], _rect[2], _rect[3]);
	}
}
globalvar WindowFrameTools; /// @is {WindowFrameTools_t}
WindowFrameTools = new WindowFrameTools_t();