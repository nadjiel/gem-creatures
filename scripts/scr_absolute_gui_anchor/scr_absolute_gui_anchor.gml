/**
 * @desc Creates an absolute interface anchor that makes the offsets be relative to the interface's parent, or the game gui
 */
function AbsoluteGUIAnchor(_interface): GUIAnchor(_interface) constructor {
	
	static name = "absolute";
	
	/**
	 * @desc Updates the right position of this interface anchor based on its left position
	 */
	static update_right_position = function() {
		if(interface.parent == 0) { right = display_get_gui_width() - left - interface.width; return; }
		
		right = interface.parent.width - left - interface.width;
	}
	
	/**
	 * @desc Updates the right position of this interface anchor based on its bottom position
	 */
	static update_top_position = function() {
		if(interface.parent == 0) { top = display_get_gui_height() - bottom - interface.height; return; }
		
		top = interface.parent.height - bottom - interface.height;
	}
	
	/**
	 * @desc Updates the right position of this interface anchor based on its right position
	 */
	static update_left_position = function() {
		if(interface.parent == 0) { left = display_get_gui_width() - right - interface.width; return; }
		
		left = interface.parent.width - right - interface.width;
	}
	
	/**
	 * @desc Updates the right position of this interface anchor based on its top position
	 */
	static update_bottom_position = function() {
		if(interface.parent == 0) { bottom = display_get_gui_height() - top - interface.height; return; }
		
		bottom = interface.parent.height - top - interface.height;
	}
	
	/**
	 * @desc Returns the x position of the anchored interface
	 * @returns {Real} the x position of the anchored interface
	 */
	static get_x = function() {
		if(!interface.parent) return left;
		
		return interface.parent.get_anchored_x() + left;
	}
	
	/**
	 * @desc Returns the y position of the anchored interface
	 * @returns {Real} the y position of the anchored interface
	 */
	static get_y = function() {
		if(!interface.parent) return top;
		
		return interface.parent.get_anchored_y() + top;
	}
	
	/**
	 * @desc Returns false since absolute anchors are not in the flow
	 * @returns {Bool} false indicating the anchor isn't in the flow
	 */
	static is_in_flow = function() {
		return false;
	}
	
}
