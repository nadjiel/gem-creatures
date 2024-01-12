/**
 * @desc Constructor for a struct that allows the user to control
 * a playable character that has it.
 */
function Controllable() constructor {
	// Stores in what frame the step method was last executed
	last_step = global.frame_counter;
	// Stores in what frame the creature_collision method was last executed
	last_creature_collision = global.frame_counter;
	
	// Input information
	input = {
		right: false,
		up: false,
		left: false,
		down: false,
		action1: {
			hold: false
		},
		action2: {
			hold: false
		},
		action3: {
			hold: false
		},
		action4: {
			hold: false
		},
		ctrl: false,
		shift: false,
		space: false,
		one: false,
		two: false,
		three: false,
		four: false,
		x_input: 0,
		y_input: 0,
		dir_input: false
	};
	
	/**
	 * @desc Checks the current input of the user
	 */
	static check_input = function() {
		input.right = keyboard_check(vk_right);
		input.up = keyboard_check(vk_up);
		input.left = keyboard_check(vk_left);
		input.down = keyboard_check(vk_down);
		input.action1 = keyboard_check_pressed(ord("Z"));
		input.action2 = keyboard_check_pressed(ord("X"));
		input.action3 = keyboard_check_pressed(ord("A"));
		input.action4 = keyboard_check_pressed(ord("S"));
		input.ctrl = keyboard_check(vk_control);
		input.shift = keyboard_check(vk_shift);
		input.space = keyboard_check_pressed(vk_space);
		input.one = keyboard_check_pressed(ord("1"));
		input.two = keyboard_check_pressed(ord("2"));
		input.three = keyboard_check_pressed(ord("3"));
		input.four = keyboard_check_pressed(ord("4"));
		input.x_input = input.right - input.left;
		input.y_input = input.down - input.up;
		input.dir_input = abs(input.x_input) || abs(input.y_input);
	}
	
	/**
	 * @desc Handles the user input to control the entity that has this struct
	 */
	static step = function() {
		// Executes the following code only if it hasn't been executed in this frame yet
		if(global.frame_counter == last_step) return;
		
		// Checking for user key input
		check_input();
		
		// Executing state relative code with the input information
		other.state.exec(input);
		
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
		if(object_get_name(global.party.leader.object_index) == "obj_hero") {
			if(!global.party.contains(other)) global.party.add_follower(other);
		}
		
		// Assigns the number of the current frame to the last_creature_collision variable
		last_creature_collision = global.frame_counter;
	}

}
