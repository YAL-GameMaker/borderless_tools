window_frame_update(frame);

if (keyboard_check_pressed(ord("1"))) window_frame_set_fullscreen(frame, 0);
if (keyboard_check_pressed(ord("2"))) window_frame_set_fullscreen(frame, 1);
if (keyboard_check_pressed(ord("3"))) window_frame_set_fullscreen(frame, 2);
if (keyboard_check_pressed(ord("4"))) targetAlpha = targetAlpha == 1 ? 0.3 : 1;
if (keyboard_check_pressed(ord("5"))) frame[@window_frame_can_input] = !frame[window_frame_can_input];
if (keyboard_check_pressed(ord("6"))) frame[@window_frame_can_resize]= !frame[window_frame_can_resize];
if (frame[window_frame_alpha] != targetAlpha) {
	frame[@window_frame_alpha] = lerp(frame[window_frame_alpha], targetAlpha, 0.1);
	if (frame[window_frame_alpha] == targetAlpha) frame[@window_frame_alpha] = targetAlpha; // force if within epsilon
}