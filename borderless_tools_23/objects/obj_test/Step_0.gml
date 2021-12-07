frame.update();
if (keyboard_check_pressed(ord("1"))) frame.setFullscreen(0);
if (keyboard_check_pressed(ord("2"))) frame.setFullscreen(1);
if (keyboard_check_pressed(ord("3"))) frame.setFullscreen(2);
if (keyboard_check_pressed(ord("4"))) targetAlpha = targetAlpha == 1 ? 0.3 : 1;
if (keyboard_check_pressed(ord("5"))) frame.canInput = !frame.canInput;
if (keyboard_check_pressed(ord("6"))) frame.canResize = !frame.canResize;
if (frame.alpha != targetAlpha) {
	frame.alpha = lerp(frame.alpha, targetAlpha, 0.1);
	if (frame.alpha == targetAlpha) frame.alpha = targetAlpha; // force if within epsilon
}