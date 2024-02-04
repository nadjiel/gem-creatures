/**
 * @desc GUIDirector that implements a column layout
 */
function GUIDirectorColumn(): GUIDirector() constructor {
	
	/**
	 * @desc Updates the content width of the passed GUI
	 * @param {Struct.GUI} _gui the gui of which to update the content width
	 */
	static update_content_width = function(_gui) {
		// Initial content width
		var _content_width = 0;
		
		// Iterating over the children
		_content_width = array_reduce(_gui.children, function(_prev, _child) {
			if(_child.anchor.name != "relative") return _prev;
			
			return max(_prev, _child.margin.left + _child.margin.right + _child.width);
		}, _content_width);
		
		// Updates the content width
		_gui.content_width = _content_width;
	}
	
	/**
	 * @desc Updates the content height of the passed GUI
	 * @param {Struct.GUI} _gui the gui of which to update the content height
	 */
	static update_content_height = function(_gui) {
		// Initial content height
		var _content_height = 0;
		
		// Iterating over the children
		_content_height = array_reduce(_gui.children, function(_prev, _child) {
			if(_child.anchor.name != "relative") return _prev;
			
			return _prev + _child.margin.top + _child.margin.bottom + _child.height;
		}, _content_height);
		
		// Updates the content height
		_gui.content_height = _content_height;
	}
	
}
