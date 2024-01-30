/**
 * @desc Creates a interface anchor that contains information about the offsets of an interface
 */
function GUIAnchor(_interface): BoundingBox(0, 0, 0, 0) constructor {
	
	interface = _interface;
	
	/**
	 * @desc Sets the right position of this interface anchor and updates its left accordingly
	 * @param {Real} _position the position to set as the new right position
	 */
	static set_right_position = function(_position) {
		right = _position;
		
		update_left_position();
	}
	
	/**
	 * @desc Sets the top position of this interface anchor and updates its bottom accordingly
	 * @param {Real} _position the position to set as the new top position
	 */
	static set_top_position = function(_position) {
		top = _position;
		
		update_bottom_position();
	}
	
	/**
	 * @desc Sets the left position of this interface anchor and updates its right accordingly
	 * @param {Real} _position the position to set as the new left position
	 */
	static set_left_position = function(_position) {
		left = _position;
		
		update_right_position();
	}
	
	/**
	 * @desc Sets the bottom position of this interface anchor and updates its top accordingly
	 * @param {Real} _position the position to set as the new bottom position
	 */
	static set_bottom_position = function(_position) {
		bottom = _position;
		
		update_top_position();
	}
	
}
