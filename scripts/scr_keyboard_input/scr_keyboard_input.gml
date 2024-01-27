/**
 * @desc Constructor for a key input struct
 * @param {Real | Constant.VirtualKey} _key the code for identifying the key with keyboard checks
 */
function KeyboardInput(_key) : Input(_key) constructor {
	
	// Updates the key information
	static get_input = function() {
		press = keyboard_check_pressed(code);
		hold = keyboard_check(code);
		release = keyboard_check_released(code);
	}
	
}
