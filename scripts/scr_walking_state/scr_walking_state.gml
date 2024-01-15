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
		if(
			global.last_party_swap != 0 &&
			current_time - global.last_party_swap <= seconds_to_miliseconds(0.5)
		) return;
		if(!_input.one.press && !_input.two.press && !_input.three.press && !_input.four.press) return;
		
		global.last_party_swap = current_time;
		
		if(_input.one.press) return global.party.swap_leader(1);
		if(_input.two.press) return global.party.swap_leader(2);
		if(_input.three.press) return global.party.swap_leader(3);
		if(_input.four.press) return global.party.swap_leader(4);
	}
	
	/**
	 * @desc Executes the code for this state
	 * @param {Struct} _input struct with user input information
	 */
	static exec = function(_input) {
		// Tries to execute a party swap
		if(!context.aiming) party_swap(_input);
		
		// Executes the action that the player wants, if it exists
		if(_input.action1.press) {
			if(context.actions[0]) {
				context.actions[0].act();
			}
		}
		if(_input.action1.hold) {
			if(context.actions[0]) {
				context.actions[0].charge();
			}
		}
		if(_input.action1.release) {
			if(context.actions[0]) {
				context.actions[0].release();
			}
		}

		// Calculating direction from input
		if(_input.dir_input) context.dir = point_direction(0, 0, _input.x_input, _input.y_input);

		// Calculating speed based on input
		context.spd = _input.dir_input * context.walking_spd;
		if(context.spd > 0) {
			if(_input.ctrl.hold) context.spd = context.running_spd;
			if(_input.shift.hold) context.spd = context.tiptoeing_spd;
			if(context.aiming) context.spd = context.aiming_spd;
		}

		// Jumping if player is on the floor
		if(context.coord.z == 0) context.spds.z = _input.space.press * -context.jumping_spd;
	}
	
}
