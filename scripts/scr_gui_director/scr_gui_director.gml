/**
 * @desc Determines the GUI layout
 */
function GUIDirector() constructor {
	
	/**
	 * @desc Updates the content size of the passed GUI
	 * @param {Struct.GUI} _gui the gui of which to update the content size
	 */
	static update_content_size = function(_gui) {
		update_content_width(_gui);
		update_content_height(_gui);
	}
	
}
