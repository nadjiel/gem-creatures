/**
 * @desc Creates the relative interface anchor that makes the offsets be relative to the interface x and y
 */
function RelativeGUIAnchor(_interface): GUIAnchor(_interface) constructor {
	
	static name = "relative";
	
	/**
	 * @desc Updates the right position of this interface anchor based on its left position
	 */
	static update_right_position = function() {
		right = -left;
	}
	
	/**
	 * @desc Updates the top position of this interface anchor based on its bottom position
	 */
	static update_top_position = function() {
		top = -bottom;
	}
	
	/**
	 * @desc Updates the left position of this interface anchor based on its right position
	 */
	static update_left_position = function() {
		left = -right;
	}
	
	/**
	 * @desc Updates the bottom position of this interface anchor based on its top position
	 */
	static update_bottom_position = function() {
		bottom = -top;
	}
	
	/**
	 * @desc Returns the x position of the anchored interface
	 * @returns {Real} the x position of the anchored interface
	 */
	static get_x = function() {
		return interface.x + left;
	}
	
	/**
	 * @desc Returns the y position of the anchored interface
	 * @returns {Real} the y position of the anchored interface
	 */
	static get_y = function() {
		return interface.y + top;
	}
	
	/**
	 * @desc Returns true if the anchor isn't offset
	 * @returns {Bool} true or false depending if the anchor is offset
	 */
	static is_in_flow = function() {
		return right == 0 && top == 0 && left == 0 && bottom == 0;
	}
	
}
