/**
 * @desc Constructor for a struct that allows the player to control an entity that has it.
 */
function Controllable() constructor {
	// Stores in what frame the step method was last executed
	last_step = global.frame_counter;
	// Stores in what frame the creature_collision method was last executed
	last_creature_collision = global.frame_counter;
	
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
	dir_input = false;
	
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
	static step = function() {
		// Executes the following code only if it hasn't been executed in this frame yet
		if(global.frame_counter == last_step) return;
		
		// Checking for key input
		check_keys();
		
		// Tries to execute a party swap
		party_swap();

		// Calculating x and y inputs
		x_input = keys.right - keys.left;
		y_input = keys.down - keys.up;
		dir_input = abs(x_input) || abs(y_input);

		// Calculating direction from input
		if(dir_input) other.dir = point_direction(0, 0, x_input, y_input);

		// Calculating speed based on input
		other.spd = dir_input * other.walking_spd;
		if(other.spd > 0) {
			if(keys.ctrl) other.spd = other.running_spd;
			if(keys.shift) other.spd = other.tiptoeing_spd;
		}

		// Jumping if player is on the floor
		if(other.coord.z == 0) other.z_spd = keys.space * -other.jumping_spd;
		
		// Assigns the number of the current frame to the last_step variable
		last_step = global.frame_counter;
	}
	
	/**
	 * @desc Handles what happens when entity owner of this controllable collides with a creature
	 */
	static creature_collision = function() {
		// Executes the following code only if it hasn't been executed in this frame yet
		if(global.frame_counter == last_creature_collision) return;
		
		// Adds the collider creature to the party if the leader is the hero
		if(object_get_name(party.leader.object_index) == "obj_hero") {
			if(!party.contains(other)) party.add_follower(other);
		}
		
		// Assigns the number of the current frame to the last_creature_collision variable
		last_creature_collision = global.frame_counter;
	}

}
