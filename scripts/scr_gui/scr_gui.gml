/**
 * @desc Creates a GUI node
 */
function GUI(): Tree() constructor {
	static super_add_child = add_child;
	
	x = 0; y = 0;
	width = 0;
	height = 0;
	padding = new BoundingBox(0, 0, 0, 0);
	border = new BoundingBox(0, 0, 0, 0);
	margin = new BoundingBox(0, 0, 0, 0);
	
	anchor = new RelativeGUIAnchor(self);
	
	background_sprite = 0;
	background_image = 0;
	border_sprite = 0;
	border_image = 0;
	
	/**
	 * @desc Sets the width of this interface respecting its padding and borders
	 * @param {Real} _width the width to set
	 */
	static set_width = function(_width) {
		if(_width < padding.left + padding.right + border.left + border.right) _width = padding.left + padding.right + border.left + border.right;
		width = _width;
		
		// Making sure the right position is correct with the new width
		anchor.update_right_position();
		array_foreach(children, function(_child) { _child.anchor.update_right_position(); });
	}
	
	/**
	 * @desc Sets the height of this interface respecting its padding and borders and updates
	 * @param {Real} _height the height to set
	 */
	static set_height = function(_height) {
		if(_height < padding.top + padding.bottom + border.top + border.bottom) _height = padding.top + padding.bottom + border.top + border.bottom;
		height = _height;
		
		// Making sure the bottom position is correct with the new height
		anchor.update_bottom_position();
		array_foreach(children, function(_child) { _child.anchor.update_bottom_position(); });
	}
	
	/**
	 * @desc Sets the width and height of this interface
	 * @param {Real} _width the width to set
	 * @param {Real} _height the height to set
	 */
	static set_size = function(_width, _height) {
		set_width(_width);
		set_height(_height);
	}
	
	static set_right_padding = function(_right) {
		if(_right + padding.left + border.left + border.right > width) set_width(_right + padding.left + border.left + border.right);
		
		padding.right = _right;
	}
	
	static set_top_padding = function(_top) {
		if(_top + padding.bottom + border.top + border.bottom > height) set_height(_top + padding.bottom + border.top + border.bottom);
		
		padding.top = _top;
	}
	
	static set_left_padding = function(_left) {
		if(_left + padding.right + border.left + border.right > width) set_width(_left + padding.right + border.left + border.right);
		
		padding.left = _left;
	}
	
	static set_bottom_padding = function(_bottom) {
		if(_bottom + padding.top + border.top + border.bottom > height) set_height(_bottom + padding.top + border.top + border.bottom);
		
		padding.bottom = _bottom;
	}
	
	static set_x_padding = function(_padding) {
		set_right_padding(_padding);
		set_left_padding(_padding);
	}
	
	static set_y_padding = function(_padding) {
		set_top_padding(_padding);
		set_bottom_padding(_padding);
	}
	
	/**
	 * @desc Sets the right, top, left and bottom paddings to the respective parameters
	 * @param {Real} _right the right padding to set
	 * @param {Real} _top the top padding to set
	 * @param {Real} _left the left padding to set
	 * @param {Real} _bottom the bottom padding to set
	 */
	static set_padding = function(_right, _top, _left, _bottom) {
		set_right_padding(_right);
		set_top_padding(_top);
		set_left_padding(_left);
		set_bottom_padding(_bottom);
	}
	
	static set_right_border = function(_right) {
		if(_right + border.left + padding.left + padding.right > width) set_width(_right + border.left + padding.right + padding.left);
		
		border.right = _right;
	}
	
	static set_top_border = function(_top) {
		if(_top + border.bottom + padding.top + padding.bottom > height) set_height(_top + border.bottom + padding.top + padding.bottom);
		
		border.top = _top;
	}
	
	static set_left_border = function(_left) {
		if(_left + border.right + padding.left + padding.right > width) set_width(_left + border.right + padding.left + padding.right);
		
		border.left = _left;
	}
	
	static set_bottom_border = function(_bottom) {
		if(_bottom + border.top + padding.top + padding.bottom > height) set_height(_bottom + border.top + padding.top + padding.bottom);
		
		border.bottom = _bottom;
	}
	
	static set_x_border = function(_border) {
		set_right_border(_border);
		set_left_border(_border);
	}
	
	static set_y_border = function(_border) {
		set_top_border(_border);
		set_bottom_border(_border);
	}
	
	/**
	 * @desc Sets the right, top, left and bottom borders to the respective parameters
	 * @param {Real} _right the right border to set
	 * @param {Real} _top the top border to set
	 * @param {Real} _left the left border to set
	 * @param {Real} _bottom the bottom border to set
	 */
	static set_border = function(_right, _top, _left, _bottom) {
		set_right_border(_right);
		set_top_border(_top);
		set_left_border(_left);
		set_bottom_border(_bottom);
	}
	
	static set_right_margin = function(_margin) {
		margin.right = _margin;
	}
	
	static set_top_margin = function(_margin) {
		if(parent == 0) y = _margin;
		
		margin.top = _margin;
	}
	
	static set_left_margin = function(_margin) {
		if(parent == 0) x = _margin;
		
		margin.left = _margin;
	}
	
	static set_bottom_margin = function(_margin) {
		margin.bottom = _margin;
	}
	
	static set_x_margin = function(_margin) {
		set_right_margin(_margin);
		set_left_margin(_margin);
	}
	
	static set_y_margin = function(_margin) {
		set_top_margin(_margin);
		set_bottom_margin(_margin);
	}
	
	/**
	 * @desc Sets the right, top, left and bottom margins to the respective parameters
	 * @param {Real} _right the right margin to set
	 * @param {Real} _top the top margin to set
	 * @param {Real} _left the left margin to set
	 * @param {Real} _bottom the bottom margin to set
	 */
	static set_margin = function(_right, _top, _left, _bottom) {
		set_right_margin(_right);
		set_top_margin(_top);
		set_left_margin(_left);
		set_bottom_margin(_bottom);
	}
	
	/**
	 * @desc Returns the width desconsidering the borders
	 */
	static get_padding_width = function() {
		return width - border.left - border.right;
	}
	
	/**
	 * @desc Returns the height desconsidering the borders
	 */
	static get_padding_height = function() {
		return height - border.top - border.bottom;
	}
	
	/**
	 * @desc Returns the width desconsidering the paddings and borders
	 */
	static get_content_width = function() {
		return get_padding_width() - padding.left - padding.right;
	}
	
	/**
	 * @desc Returns the height desconsidering the paddings and borders
	 */
	static get_content_height = function() {
		return get_padding_height() - padding.top - padding.bottom;
	}
	
	static fit_children = function() {
		var _width = border.left + border.right + padding.left + padding.right;
		var _height = border.top + border.bottom + padding.top + padding.bottom;
		for(var _i = 0; _i < array_length(children); _i++) {
			if(children[_i].anchor.name != "relative") continue;
			
			var _child = children[_i];
			
			_width = max(_width, anchor.left + border.left + border.right + padding.left + padding.right + (_child.x - x) + _child.width + _child.margin.left + _child.margin.right);
			_height = max(_height, anchor.top + border.top + border.bottom + padding.top + padding.bottom + (_child.y - y) + _child.height + _child.margin.top + _child.margin.bottom);
		}
		
		set_size(_width, _height);
	}
	
	static add_child = function(_child, _fit = true) {
		super_add_child(_child);
		
		// Sets x and y of child to be just inside parent
		_child.x = x + anchor.left + border.left + padding.left + _child.margin.left;
		_child.y = y + anchor.top + border.top + padding.top + _child.margin.top;
		
		// Looks for the last relative anchored child
		var _last_child_index = array_find_index(children, function(_child, _i) {
			if(_i == array_length(children) - 1) return false;
			
			return _child.anchor.name == "relative";
		}, -1, -infinity);
		
		// If the last child was found
		if(_last_child_index != -1) {
			var _last_child = children[_last_child_index];
			
			// Sets the y coordinate of the new child to be right under its younger sibling
			_child.y = _last_child.y + _last_child.height + _last_child.margin.bottom + _child.margin.top;
		}
		
		// Fits the interface to contain the children
		if(_fit) fit_children();
	}
	
	static draw_border = function() {
		anchor.draw_border();
	}
	
	static draw_background = function() {
		anchor.draw_background();
	}
	
	static draw = function() {
		draw_border();
		draw_background();
		
		array_foreach(children, function(_child) { _child.draw(); });
	}
	
	static toString = function() {
		return "{\n" +
			string("\tcoordinate: {0} x {1};\n", x, y) +
			string("\tcontent: {0} x {1};\n", width, height) +
			string("\tpadding: {0};\n", padding) +
			string("\tborder: {0};\n", border) +
			string("\tmargin: {0};\n", margin) +
			string("\tanchor: {0};\n", anchor) +
		"}";
	}
	
}
