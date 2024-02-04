/**
 * @desc Creates a GUI node
 */
function GUI(): Tree() constructor {
	static super_add_child = add_child;
	
	x = 0; y = 0;
	width = 0; height = 0;
	padding = new BoundingBox(0, 0, 0, 0);
	border = new BoundingBox(0, 0, 0, 0);
	margin = new BoundingBox(0, 0, 0, 0);
	
	anchor = new RelativeGUIAnchor(self);
	
	background_sprite = 0;
	background_image = 0;
	border_sprite = 0;
	border_image = 0;
	
	surface = -1;
	overflow = "shown";
	
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
	
	/**
	 * @desc Updates the surface size to match the padding width and height
	 */
	static update_surface_size = function() {
		var _padding_width = get_padding_width();
		var _padding_height = get_padding_height();
		
		if(!surface_exists(surface)) return;
		if(_padding_width == 0 || _padding_height == 0) return;
		
		surface_resize(surface, _padding_width, _padding_height);
	}
	
	/**
	 * @desc Sets the width of this interface respecting its padding and borders
	 * @param {Real} _width the width to set
	 */
	static set_width = function(_width) {
		// Sets width, making sure it isn't smaller than the borders and paddings
		if(_width < padding.left + padding.right + border.left + border.right) _width = padding.left + padding.right + border.left + border.right;
		width = _width;
		
		// Updating surface with new width
		update_surface_size();
		
		// Making sure the right position is correct with the new width
		anchor.update_right_position();
		array_foreach(children, function(_child) { _child.anchor.update_right_position(); });
	}
	
	/**
	 * @desc Sets the height of this interface respecting its padding and borders
	 * @param {Real} _height the height to set
	 */
	static set_height = function(_height) {
		// Sets height, making sure it isn't smaller than the borders and paddings
		if(_height < padding.top + padding.bottom + border.top + border.bottom) _height = padding.top + padding.bottom + border.top + border.bottom;
		height = _height;
		
		// Updating surface with new height
		update_surface_size();
		
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
	
	/**
	 * @desc Sets the right padding
	 * @param {Real} _padding the padding to set
	 */
	static set_right_padding = function(_padding) {
		// If the padding is too big, updates the width
		if(_padding + padding.left + border.left + border.right > width) set_width(_padding + padding.left + border.left + border.right);
		
		padding.right = _padding;
	}
	
	/**
	 * @desc Sets the top padding
	 * @param {Real} _padding the padding to set
	 */
	static set_top_padding = function(_padding) {
		// If the padding is too big, updates the height
		if(_padding + padding.bottom + border.top + border.bottom > height) set_height(_padding + padding.bottom + border.top + border.bottom);
		
		padding.top = _padding;
	}
	
	/**
	 * @desc Sets the left padding
	 * @param {Real} _padding the padding to set
	 */
	static set_left_padding = function(_padding) {
		// If the padding is too big, updates the width
		if(_padding + padding.right + border.left + border.right > width) set_width(_padding + padding.right + border.left + border.right);
		
		padding.left = _padding;
	}
	
	/**
	 * @desc Sets the bottom padding
	 * @param {Real} _padding the padding to set
	 */
	static set_bottom_padding = function(_padding) {
		// If the padding is too big, updates the height
		if(_padding + padding.top + border.top + border.bottom > height) set_height(_padding + padding.top + border.top + border.bottom);
		
		padding.bottom = _padding;
	}
	
	/**
	 * @desc Sets the right and left paddings
	 * @param {Real} _padding the padding to set
	 */
	static set_x_padding = function(_padding) {
		set_right_padding(_padding);
		set_left_padding(_padding);
	}
	
	/**
	 * @desc Sets the top and bottom paddings
	 * @param {Real} _padding the padding to set
	 */
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
	
	/**
	 * @desc Sets the right border
	 * @param {Real} _border the border to set
	 */
	static set_right_border = function(_border) {
		// If the border is too big, updates the width
		if(_border + border.left + padding.left + padding.right > width) set_width(_border + border.left + padding.right + padding.left);
		
		border.right = _border;
	}
	
	/**
	 * @desc Sets the top border
	 * @param {Real} _border the border to set
	 */
	static set_top_border = function(_border) {
		// If the border is too big, updates the height
		if(_border + border.bottom + padding.top + padding.bottom > height) set_height(_border + border.bottom + padding.top + padding.bottom);
		
		border.top = _border;
	}
	
	/**
	 * @desc Sets the left border
	 * @param {Real} _border the border to set
	 */
	static set_left_border = function(_border) {
		// If the border is too big, updates the width
		if(_border + border.right + padding.left + padding.right > width) set_width(_border + border.right + padding.left + padding.right);
		
		border.left = _border;
	}
	
	/**
	 * @desc Sets the bottom border
	 * @param {Real} _border the border to set
	 */
	static set_bottom_border = function(_border) {
		// If the border is too big, updates the height
		if(_border + border.top + padding.top + padding.bottom > height) set_height(_border + border.top + padding.top + padding.bottom);
		
		border.bottom = _border;
	}
	
	/**
	 * @desc Sets the right and left borders
	 * @param {Real} _border the border to set
	 */
	static set_x_border = function(_border) {
		set_right_border(_border);
		set_left_border(_border);
	}
	
	/**
	 * @desc Sets the top and bottom borders
	 * @param {Real} _border the border to set
	 */
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
	
	/**
	 * @desc Updates the position of this interface taking a column layout in consideration
	 */
	static update_position = function() {
		// Sets x and y to be just inside GUI
		x = margin.left;
		y = margin.top;
		
		if(parent) {
			// Sets x and y to be just inside parent
			x = parent.get_anchored_x() + parent.border.left + parent.padding.left + margin.left;
			y = parent.get_anchored_y() + parent.border.top + parent.padding.top + margin.top;
		
			// Looks for the last relative anchored sibling
			var _index = parent.get_child_index(self);
			var _last_relative_sibling_index = array_find_index(parent.children, method({ index: _index }, function(_child, _i) {
				if(_i == index) return false;
			
				return _child.anchor.name == "relative";
			}), _index, -infinity);
		
			// If the last child was found
			if(_last_relative_sibling_index != -1) {
				var _last_relative_sibling = parent.children[_last_relative_sibling_index];
			
				// Sets the y coordinate of the new child to be right under its younger sibling
				y = _last_relative_sibling.y + _last_relative_sibling.height + _last_relative_sibling.margin.bottom + margin.top;
			}
		}
		
		// Updates the position of the children as well
		update_children_position();
	}
	
	/**
	 * @desc Updates the position of the children of this interface
	 */
	static update_children_position = function() {
		array_foreach(children, function(_child) { _child.update_position(); });
	}
	
	/**
	 * @desc Sets the right margin
	 * @param {Real} _margin the margin to set
	 */
	static set_right_margin = function(_margin) {
		margin.right = _margin;
	}
	
	/**
	 * @desc Sets the top margin
	 * @param {Real} _margin the margin to set
	 */
	static set_top_margin = function(_margin) {
		margin.top = _margin;
	}
	
	/**
	 * @desc Sets the left margin
	 * @param {Real} _margin the margin to set
	 */
	static set_left_margin = function(_margin) {
		margin.left = _margin;
	}
	
	/**
	 * @desc Sets the bottom margin
	 * @param {Real} _margin the margin to set
	 */
	static set_bottom_margin = function(_margin) {
		margin.bottom = _margin;
	}
	
	/**
	 * @desc Sets the left and right margins
	 * @param {Real} _margin the margin to set
	 */
	static set_x_margin = function(_margin) {
		set_right_margin(_margin);
		set_left_margin(_margin);
	}
	
	/**
	 * @desc Sets the top and bottom margins
	 * @param {Real} _margin the margin to set
	 */
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
	 * @desc Returns an anchor instance based on the passed anchor name. If the name is invalid, the return is -1
	 * @param {String} _anchor_name the name of the anchor to create (either "relative", "absolute" or "fixed")
	 * @returns {Real | Struct.GUIAnchor} the anchor identified by the name
	 */
	static anchor_factory = function(_anchor_name) {
		switch(_anchor_name) {
			case "relative": return new RelativeGUIAnchor(self);
			case "absolute": return new AbsoluteGUIAnchor(self);
			case "fixed": return new FixedGUIAnchor(self);
			default: return -1;
		}
	}
	
	/**
	 * @desc Sets a new anchor, chosen by the passed string, to this interface
	 * @param {String} _anchor_name the anchor to add to this interface (either "relative", "absolute" or "fixed")
	 */
	static set_anchor = function(_anchor_name) {
		var _anchor = anchor_factory(_anchor_name);
		
		if(_anchor == -1) return;
		
		anchor = _anchor;
		
		// Sets the correct positions to be top-left since creation
		anchor.set_top_position(0);
		anchor.set_left_position(0);
	}
	
	/**
	 * @desc Returns the x position of this interface with the anchor displacement
	 * @returns the anchored x position
	 */
	static get_anchored_x = function() {
		return anchor.get_x();
	}
	
	/**
	 * @desc Returns the y position of this interface with the anchor displacement
	 * @returns the anchored y position
	 */
	static get_anchored_y = function() {
		return anchor.get_y();
	}
	
	/**
	 * @desc Sets the width and height of this interface to fit its children nicely, taking a column layout in consideration
	 */
	static fit_children = function() {
		// Initial content size
		var _content_width = 0;
		var _content_height = 0;
		
		// Iterating over the children
		for(var _i = 0; _i < array_length(children); _i++) {
			var _child = children[_i];
			
			if(_child.anchor.name != "relative") continue;
			
			// Prioritizes the greatest child's width and sums the children heights
			_content_width = max(_content_width, _child.margin.left + _child.margin.right + _child.width);
			_content_height += _child.margin.top + _child.margin.bottom + _child.height;
		}
		
		// Sums the content width with the extremities
		var _width = _content_width + border.left + border.right + padding.left + padding.right;
		var _height = _content_height + border.top + border.bottom + padding.top + padding.bottom;
		
		// Updates the size
		set_size(_width, _height);
	}
	
	/**
	 * @desc Adds a child under the existing ones in a column layout
	 * @param {Struct.GUI} _child the child to add to this interface node
	 */
	static add_child = function(_child) {
		super_add_child(_child);
		
		// Calculates the position of the new child
		_child.update_position();
	}
	
	static select_self_surface = function(_parent_surface) {
		if(_parent_surface == -1) {
			if(surface_get_target() != -1) surface_reset_target();
			return;
		}
		if(_parent_surface != -1) {
			if(!anchor.is_in_flow()) {
				if(surface_get_target() != -1) surface_reset_target();
				return;
			}
			if(surface_get_target() == -1) surface_set_target(_parent_surface);
		}
	}
	
	static get_children_surface = function() {
		if(overflow == "shown") {
			surface_free(surface);
			return -1;
		}
		if(overflow == "hidden") {
			if(!surface_exists(surface)) surface = surface_create(get_padding_width(), get_padding_height());
			return surface;
		}
	}
	
	static draw_border = function() {
		if(border_sprite == 0) return;
		
		var _x = get_anchored_x();
		var _y = get_anchored_y();
		
		if(surface_get_target() != -1) {
			_x -= parent.get_anchored_x() + parent.border.left;
			_y -= parent.get_anchored_y() + parent.border.top;
		}
		
		draw_sprite_stretched(
			border_sprite, border_image,
			_x, _y,
			width, height
		);
	}
	
	static draw_background = function() {
		if(background_sprite == 0) return;
		
		var _x = get_anchored_x();
		var _y = get_anchored_y();
		
		if(surface_get_target() != -1) {
			_x -= parent.get_anchored_x() + parent.border.left;
			_y -= parent.get_anchored_y() + parent.border.top;
		}
		
		draw_sprite_stretched(
			background_sprite, background_image,
			_x + border.left,
			_y + border.top,
			get_padding_width(), get_padding_height()
		);
	}
	
	static draw = function(_surface) {
		select_self_surface(_surface);
		
		show_debug_message("Node {0} surf: {1}", id, surface_get_target())
		draw_border();
		draw_background();
		
		var _children_surface = get_children_surface();
		
		array_foreach(children, method({
			children_surface: _children_surface
		}, function(_child) { if(_child.anchor.is_in_flow()) _child.draw(children_surface); }));
		
		if(surface_get_target() != -1) surface_reset_target();
		
		if(surface_exists(surface)) draw_surface(surface, x + border.left, y + border.top);
		
		array_foreach(children, method({
			children_surface: _children_surface
		}, function(_child) { if(!_child.anchor.is_in_flow()) _child.draw(children_surface); }));
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
