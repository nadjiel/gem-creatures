/**
 * @desc Constructor for a struct that allows the player to control an entity that has it.
 */
function Controllable() constructor {
	// Stores in what frame the control method was last executed
	last_control = global.frame_counter;
	
	// Stores the party of this entity
	party = new Party(other);
	
	// Stores when in miliseconds the last_party_swap occured
	last_party_swap = current_time;
	
	// Keys that control the entity
	keys = {
		right: false,
		up: false,
		left: false,
		down: false,
		ctrl: false,
		shift: false,
		space: false,
		one: false,
		two: false,
		three: false,
		four: false
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
	static check_keys = function() {
		keys.right = keyboard_check(ord("D"));
		keys.up = keyboard_check(ord("W"));
		keys.left = keyboard_check(ord("A"));
		keys.down = keyboard_check(ord("S"));
		keys.ctrl = keyboard_check(vk_control);
		keys.shift = keyboard_check(vk_shift);
		keys.space = keyboard_check_pressed(vk_space);
		keys.one = keyboard_check_pressed(ord("1"));
		keys.two = keyboard_check_pressed(ord("2"));
		keys.three = keyboard_check_pressed(ord("3"));
		keys.four = keyboard_check_pressed(ord("4"));
	}
	
	/**
	 * @desc Executes a party swap if the input tells to do so and
	 * the last party swap was executed at least half second ago
	 */
	static party_swap = function() {
		if(current_time - last_party_swap <= seconds_to_miliseconds(0.5)) return;
		if(!keys.one && !keys.two && !keys.three && !keys.four) return;
		
		last_party_swap = current_time;
		
		if(keys.one) return party.swap_leader(1);
		if(keys.two) return party.swap_leader(2);
		if(keys.three) return party.swap_leader(3);
		if(keys.four) return party.swap_leader(4);
	}
	
	/**
	 * @desc Handles the user input to control the entity that has this struct
	 */
	static control = function() {
		// Executes the following code only if it hasn't been executed in this frame yet
		if(global.frame_counter == last_control) return;
		
		// Checking for key input
		check_keys();
		
		// Tries to execute a party swap
		party_swap();
		
		//show_debug_message(party.is_full())

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
		
		// Assigns the number of the current frame to the last_control variable
		last_control = global.frame_counter;
	}

}
