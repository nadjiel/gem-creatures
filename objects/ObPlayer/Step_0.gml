/// @description Step event

// TODO: make sprite frame rate faster according to the speed

// Checking for key input
function check_keys() {
	keys.right = keyboard_check(ord("D"));
	keys.up = keyboard_check(ord("W"));
	keys.left = keyboard_check(ord("A"));
	keys.down = keyboard_check(ord("S"));
	keys.ctrl = keyboard_check(vk_control);
	keys.shift = keyboard_check(vk_shift);
	keys.space = keyboard_check_pressed(vk_space);
}

check_keys();

// Calculating input derived values
x_input = keys.right - keys.left;
y_input = keys.down - keys.up;
input_direction = point_direction(0, 0, x_input, y_input);

// Updating player speed
hspeed = x_input != 0 ? lengthdir_x(walking_speed, input_direction) : 0;
vspeed = y_input != 0 ? lengthdir_y(walking_speed, input_direction) : 0;
