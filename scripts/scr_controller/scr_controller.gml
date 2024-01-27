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
	
	/**
	 * @desc Handles the user input to control the entity that has this struct
	 */
	static step = function() {
		// Executes the following code only if it hasn't been executed in this frame yet
		if(global.frame_counter == last_step) return;
		
		// Executing state relative code
		controlled.state.exec();
		
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
		obj_inventory.content.add_item(_collectible_name);
		
		// Destroys the collected instance
		instance_destroy(other);
		
		// Assigns the number of the current frame to the last_collectible_collision variable
		last_collectible_collision = global.frame_counter;
	}

}
