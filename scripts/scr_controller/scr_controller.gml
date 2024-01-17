/**
 * @desc Constructor for a struct that allows the user to control a character that has it.
 * @param {Id.Instance} _controlled the character that will be controlled by this Controller
 */
function Controller(_controlled) constructor {
	// Stores in what frame the step method was last executed
	last_step = global.frame_counter;
	// Stores in what frame the creature_collision method was last executed
	last_creature_collision = global.frame_counter;
	// Stores in what frame the collectible_collision method was last executed
	last_collectible_collision = global.frame_counter;
	
	// The character that is controlled by this controller
	controlled = _controlled;
	
	// Input information
	input = {
		right: new KeyInput(vk_right),
		up: new KeyInput(vk_up),
		left: new KeyInput(vk_left),
		down: new KeyInput(vk_down),
		action1: new KeyInput(ord("Z")),
		action2: new KeyInput(ord("X")),
		action3: new KeyInput(ord("A")),
		action4: new KeyInput(ord("S")),
		ctrl: new KeyInput(vk_control),
		shift: new KeyInput(vk_shift),
		space: new KeyInput(vk_space),
		one: new KeyInput(ord("1")),
		two: new KeyInput(ord("2")),
		three: new KeyInput(ord("3")),
		four: new KeyInput(ord("4")),
		x_input: 0,
		y_input: 0,
		dir_input: false
	};
	
	/**
	 * @desc Checks the current input of the user
	 */
	static check_input = function() {
		// Getting input for every key
		var _keys = variable_struct_get_names(input);
		
		for(var _i = 0; _i < array_length(_keys); _i++) {
			var _key = _keys[_i];
			var _value = input[$ _key];
			
			if(!is_instanceof(_value, KeyInput)) continue;
			
			_value.get_input();
		}
		
		// Calculating input based values
		input.x_input = input.right.hold - input.left.hold;
		input.y_input = input.down.hold - input.up.hold;
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
		controlled.state.exec(input);
		
		// Assigns the number of the current frame to the last_step variable
		last_step = global.frame_counter;
	}
	
	/**
	 * @desc Handles what happens when the controlled character collides with a creature
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
	
	/**
	 * @desc Handles what happens when the controlled character collides with a collectible
	 */
	static collectible_collision = function() {
		// Executes the following code only if it hasn't been executed in this frame yet
		if(global.frame_counter == last_collectible_collision) return;
		
		// Gets name of collectible without "obj_" prefix
		var _collectible_name = string_replace(object_get_name(other.object_index), "obj_", "");
		
		// Adds the to the collectible amount in the inventory
		global.inventory.items[$ _collectible_name].amount++;
		
		// Destroys the collected instance
		instance_destroy(other);
		
		// Assigns the number of the current frame to the last_collectible_collision variable
		last_collectible_collision = global.frame_counter;
	}

}
