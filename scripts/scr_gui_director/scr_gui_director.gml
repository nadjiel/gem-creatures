/**
 * @desc Determines the GUI layout
 */
function GUIDirector() constructor {
	
	/**
	 * @desc Updates the content size of the passed GUI
	 * @param {Struct.GUI} _gui the GUI of which to update the content size
	 */
	static update_content_size = function(_gui) {
		update_content_width(_gui);
		update_content_height(_gui);
	}
	
	/**
	 * @desc Updates the position of the passed GUI's children
	 * @param {Struct.GUI} _gui the GUI to update the children positions
	 */
	static update_children_position = function(_gui) {
		update_children_x_position(_gui);
		update_children_y_position(_gui);
	}
	
}
