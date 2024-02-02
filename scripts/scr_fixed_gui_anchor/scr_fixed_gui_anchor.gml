/**
 * @desc Creates a fixed interface anchor that makes the offsets be relative to the game gui
 */
function FixedGUIAnchor(_interface): GUIAnchor(_interface) constructor {
	
	static name = "fixed";
	
	// Sets the correct positions to be top-left since creation
	set_top_position(0);
	set_left_position(0);
	
	/**
	 * @desc Updates the right position of this interface anchor based on its left position
	 */
	static update_right_position = function() {
		right = display_get_gui_width() - left - interface.width;
	}
	
	/**
	 * @desc Updates the right position of this interface anchor based on its bottom position
	 */
	static update_top_position = function() {
		top = display_get_gui_height() - bottom - interface.height;
	}
	
	/**
	 * @desc Updates the right position of this interface anchor based on its right position
	 */
	static update_left_position = function() {
		left = display_get_gui_width() - right - interface.width;
	}
	
	/**
	 * @desc Updates the right position of this interface anchor based on its top position
	 */
	static update_bottom_position = function() {
		bottom = display_get_gui_height() - top - interface.height;
	}
	
	/**
	 * @desc Returns the x position of the anchored interface
	 * @returns {Real} the x position of the anchored interface
	 */
	static get_x = function() {
		return left;
	}
	
	/**
	 * @desc Returns the y position of the anchored interface
	 * @returns {Real} the y position of the anchored interface
	 */
	static get_y = function() {
		return top;
	}
	
}
