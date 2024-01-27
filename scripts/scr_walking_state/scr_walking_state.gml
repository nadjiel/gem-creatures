/**
 * @desc Constructor for a Walking State struct.
 * @param {Id.Instance} _context the instance that has this state
 */
function WalkingState(_context) : State(_context) constructor {
	
	// Quick way to retrieve this state's name
	static name = instanceof(self);
	
	/**
	 * @desc Executes a party swap if the input tells to do so and
	 * the last party swap was executed at least half second ago or
	 * there wasn't a last party swap
	 */
	static party_swap = function() {
		if(
			global.last_party_swap != 0 &&
			current_time - global.last_party_swap <= seconds_to_miliseconds(0.5)
		) return;
		if(!obj_input.keys.key_1.press && !obj_input.keys.key_2.press && !obj_input.keys.key_3.press && !obj_input.keys.key_4.press) return;
		
		global.last_party_swap = current_time;
		
		if(obj_input.keys.key_1.press) return global.party.swap_leader(1);
		if(obj_input.keys.key_2.press) return global.party.swap_leader(2);
		if(obj_input.keys.key_3.press) return global.party.swap_leader(3);
		if(obj_input.keys.key_4.press) return global.party.swap_leader(4);
	}
	
	/**
	 * @desc Executes the code for this state
	 */
	static exec = function() {
		// Tries to execute a party swap
		if(!context.aiming) party_swap();
		
		// Executes the action that the player wants, if it exists
		if(obj_input.keys.key_z.press) {
			if(context.actions[0]) {
				context.actions[0].act();
			}
		}
		if(obj_input.keys.key_z.hold) {
			if(context.actions[0]) {
				context.actions[0].charge();
			}
		}
		if(obj_input.keys.key_z.release) {
			if(context.actions[0]) {
				context.actions[0].release();
			}
		}

		// Calculating direction from input
		if(abs(obj_input.input_x) || abs(obj_input.input_y)) context.dir = obj_input.input_dir;

		// Calculating speed based on input
		context.spd = abs(obj_input.input_x) || abs(obj_input.input_y) * context.walking_spd;
		if(context.spd > 0) {
			if(obj_input.keys.control.hold) context.spd = context.running_spd;
			if(obj_input.keys.shift.hold) context.spd = context.tiptoeing_spd;
			if(context.aiming) context.spd = context.aiming_spd;
		}

		// Jumping if player is on the floor
		if(context.coord.z == 0) context.spds.z = obj_input.keys.space.press * -context.jumping_spd;
	}
	
}
