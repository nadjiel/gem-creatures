/**
 * @desc Parent to the input constructors
 * @param {Real | Constant.VirtualKey | Constant.MouseButton} _key the code for identifying the key
 */
function Input(_key) constructor {
	
	// Stores the code of this key
	code = _key;
	
	// Information about key state
	press = false;
	hold = false;
	release = false;
	
}
