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

// Calculating input direction
input_direction = point_direction(0, 0, x_input, y_input);

// Calculating speed according to input
input_speed = abs(x_input) || abs(y_input) * walking_speed;
if(input_speed > 0) {
	if(keys.ctrl) input_speed = running_speed;
	if(keys.shift) input_speed = tiptoeing_speed;
	
	// Choosing sprite according to input direction
	pick_sprite_direction("spr_player_walking", input_direction);
}

// Updating player speed
hspeed = lengthdir_x(input_speed, input_direction);
vspeed = lengthdir_y(input_speed, input_direction);

// Jumping if player is on the floor
if(z == 0) z_speed = keys.space * -jumping_speed;
