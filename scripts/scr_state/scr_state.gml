/**
 * @desc Constructor for a State struct.
 * This should be extended by the concrete state implementations
 * and those should have a name attribute and an exec method.
 * @param {Id.Instance} _context the instance that has this state
 */
function State(_context) constructor {
	
	context = _context;
	
	/**
	 * @desc Changes the state of who has this state to the passed one,
	 * if it is not already the current state
	 * @param {Struct.State} _state the state to change to
	 */
	static change = function(_state) {
		if(instanceof(_state) == instanceof(context.state)) return;
		
		context.state = _state;
	}
	
}
