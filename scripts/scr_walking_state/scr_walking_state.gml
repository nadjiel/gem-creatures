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
	static party_swap = function(_input) {
		if(global.last_party_swap != 0 && current_time - global.last_party_swap <= seconds_to_miliseconds(0.5)) return;
		if(!_input.one && !_input.two && !_input.three && !_input.four) return;
		
		global.last_party_swap = current_time;
		
		if(_input.one) return global.party.swap_leader(1);
		if(_input.two) return global.party.swap_leader(2);
		if(_input.three) return global.party.swap_leader(3);
		if(_input.four) return global.party.swap_leader(4);
	}
	
	/**
	 * @desc Executes the code for this state
	 * @param {Struct} _input struct with user input information
	 */
	static exec = function(_input) {
		// Tries to execute a party swap
		party_swap(_input);
		
		// Executes the action that the player wants, if it exists
		if(_input.action1) {
			if(context.actions[0]) {
				context.actions[0].exec();
			}
		}

		// Calculating direction from input
		if(_input.dir_input) context.dir = point_direction(0, 0, _input.x_input, _input.y_input);

		// Calculating speed based on input
		context.spd = _input.dir_input * context.walking_spd;
		if(context.spd > 0) {
			if(_input.ctrl) context.spd = context.running_spd;
			if(_input.shift) context.spd = context.tiptoeing_spd;
		}

		// Jumping if player is on the floor
		if(context.coord.z == 0) context.spds.z = _input.space * -context.jumping_spd;
	}
	
}
