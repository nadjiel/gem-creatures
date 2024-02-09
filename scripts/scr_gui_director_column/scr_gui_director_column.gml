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
			if(!_child.in_flow) return _prev;
			
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
			if(!_child.in_flow) return _prev;
			
			return _prev + _child.margin.top + _child.margin.bottom + _child.height;
		}, _content_height);
		
		// Updates the content height
		_gui.content_height = _content_height;
	}
	
	/**
	 * @desc Updates the x position of the passed GUI's children
	 * @param {Struct.GUI} _gui the GUI to update the children positions
	 */
	static update_children_x_position = function(_gui) {
		var _children_amount = array_length(_gui.children);
		
		for(var _i = 0; _i < _children_amount; _i++) {
			var _child = _gui.children[_i];
			
			if(!_child.auto_position) continue;
			
			// Sets x to be just inside GUI
			_child.x = _child.margin.left;
			
			// Sets x to be just inside parent
			_child.x = _gui.x + _gui.border.left + _gui.padding.left + _child.margin.left;
			
			// Updates the position of the children as well
			_child.update_children_x_position();
		}
	}
	
	/**
	 * @desc Updates the y position of the passed GUI's children
	 * @param {Struct.GUI} _gui the GUI to update the children positions
	 */
	static update_children_y_position = function(_gui) {
		var _children_amount = array_length(_gui.children);
		
		for(var _i = 0; _i < _children_amount; _i++) {
			var _child = _gui.children[_i];
			
			if(!_child.auto_position) continue;
			
			// Sets y to be just inside GUI
			_child.y = _child.margin.top;
			
			// Sets y to be just inside parent
			_child.y = _gui.y + _gui.border.top + _gui.padding.top + _child.margin.top;
			
			// Looks for the last sibling in the flow
			var _child_index = _gui.get_child_index(_child);
			var _last_sibling_in_flow_index = array_find_index(_gui.children, method({ index: _child_index }, function(_child, _i) {
				if(_i == index) return false;
			
				return _child.in_flow;
			}), _child_index, -infinity);
			
			// If the last child was found
			if(_last_sibling_in_flow_index != -1) {
				var _last_sibling_in_flow = _gui.children[_last_sibling_in_flow_index];
				
				// Sets the y coordinate of the new child to be right under its younger sibling
				_child.y = _last_sibling_in_flow.y + _last_sibling_in_flow.height + _last_sibling_in_flow.margin.bottom + _child.margin.top;
			}
			
			// Updates the position of the children as well
			_child.update_children_y_position();
		}
	}
	
}
