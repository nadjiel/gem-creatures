/// @description Step event

event_inherited();

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

// Calculating x and y inputs
x_input = keys.right - keys.left;
y_input = keys.down - keys.up;
direction_input = abs(x_input) || abs(y_input);

// Calculating direction from input
if(direction_input) direction = point_direction(0, 0, x_input, y_input);

// Picking sprite based on direction
pick_sprite_direction("spr_player_walking", direction);

// Calculating speed based on input
speed = direction_input * walking_speed;
if(speed > 0) {
	if(keys.ctrl) speed = running_speed;
	if(keys.shift) speed = tiptoeing_speed;
}

// Jumping if player is on the floor
if(z == 0) z_speed = keys.space * -jumping_speed;
