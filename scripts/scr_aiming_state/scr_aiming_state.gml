/**
 * @desc Constructor for a Aiming State struct.
 * @param {Id.Instance} _context the instance that has this state
 */
function AimingState(_context) : State(_context) constructor {
	
	// Quick way to retrieve this state's name
	static name = instanceof(self);
	
	/**
	 * @desc Executes the code for this state
	 * @param {Struct} _input struct with user input information
	 */
	static exec = function(_input) {
		// Executes the action that the player wants, if it exists
		if(_input.action1.release) {
			if(context.actions[0]) {
				context.actions[0].release();
			}
		}
		
		// Calculating direction from input
		if(_input.dir_input) context.dir = point_direction(0, 0, _input.x_input, _input.y_input);

		// Calculating speed based on input
		context.spd = _input.dir_input * context.walking_spd / 2;

		// Jumping if player is on the floor
		if(context.coord.z == 0) context.spds.z = _input.space * -context.jumping_spd;
	}
	
}
