/**
 * @desc Constructor for a struct that allows the player to control an entity that has it
 */
function Controllable() constructor {
	// Keys that control the entity
	keys = {
		right: false,
		up: false,
		left: false,
		down: false,
		ctrl: false,
		shift: false,
		space: false
	};

	// Input variables
	x_input = 0;
	y_input = 0;
	direction_input = false;
	input_direction = 0;
	input_speed = 0;
	
	/**
	 * @desc Checks which keys are being inputed by the user
	 */
	function check_keys() {
		keys.right = keyboard_check(ord("D"));
		keys.up = keyboard_check(ord("W"));
		keys.left = keyboard_check(ord("A"));
		keys.down = keyboard_check(ord("S"));
		keys.ctrl = keyboard_check(vk_control);
		keys.shift = keyboard_check(vk_shift);
		keys.space = keyboard_check_pressed(vk_space);
	}
	
	/**
	 * @desc Handles the user input to control the entity that has this struct
	 */
	function control() {
		// Checking for key input
		check_keys();

		// Calculating x and y inputs
		x_input = keys.right - keys.left;
		y_input = keys.down - keys.up;
		direction_input = abs(x_input) || abs(y_input);

		// Calculating direction from input
		if(direction_input) other.direction = point_direction(0, 0, x_input, y_input);

		// Calculating speed based on input
		other.speed = direction_input * other.walking_speed;
		if(other.speed > 0) {
			if(keys.ctrl) other.speed = other.running_speed;
			if(keys.shift) other.speed = other.tiptoeing_speed;
		}

		// Jumping if player is on the floor
		if(other.z == 0) other.z_speed = keys.space * -other.jumping_speed;
	}

}
