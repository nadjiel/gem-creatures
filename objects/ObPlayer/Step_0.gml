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
}

// Updating player speed
hspeed = lengthdir_x(input_speed, input_direction);
vspeed = lengthdir_y(input_speed, input_direction);

// Jumping if player is on the floor
if(z == 0) z_speed = keys.space * -jumping_speed;

// Falling if player is midair
if(z < 0) z_speed += falling_accelaration;

// Colliding with the floor
if(z + z_speed >= 0) {
	z_speed = 0;
	z = 0;
}

// Incrementing the z speed into the z axis
z += z_speed;

show_debug_message("z_speed: " + string(z_speed))
show_debug_message("z: " + string(z))
