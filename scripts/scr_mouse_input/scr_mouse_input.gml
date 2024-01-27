/**
 * @desc Constructor for a mouse input struct
 * @param {Real | Constant.MouseButton} _key the code for identifying the key with mouse checks
 */
function MouseInput(_key) : Input(_key) constructor {
	
	// Updates the key information
	static get_input = function() {
		press = mouse_check_button_pressed(code);
		hold = mouse_check_button(code);
		release = mouse_check_button_released(code);
	}
	
}
