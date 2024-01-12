/**
 * @desc Constructor for a key input struct
 * @param {Real | Constant.VirtualKey} _key the code for identifying the key with keyboard checks
 */
function KeyInput(_key) constructor {
	
	// Stores the code of this key
	code = _key;
	
	// Information about key state
	press = false;
	hold = false;
	release = false;
	
	// Updates the key information
	static get_input = function() {
		press = keyboard_check_pressed(code);
		hold = keyboard_check(code);
		release = keyboard_check_released(code);
	}
	
}
