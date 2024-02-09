/**
 * @desc Creates a GUI node
 */
function GUI(): Tree() constructor {
	static super_add_child = add_child;
	
	x = 0; y = 0;
	auto_position = true;
	in_flow = true;
	
	content_width = 0; content_height = 0;
	width = 0; height = 0;
	padding = new BoundingBox(0, 0, 0, 0);
	border = new BoundingBox(0, 0, 0, 0);
	margin = new BoundingBox(0, 0, 0, 0);
	
	director = new GUIDirectorColumn();
	
	background_sprite = 0;
	background_image = 0;
	border_sprite = 0;
	border_image = 0;
	
	surface = -1;
	overflow = "shown";
	
	x_scroll = 0;
	y_scroll = 0;
	
	#region Derived getters
	
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
	 * @desc Returns the width desconsidering the borders and paddings
	 */
	static get_inner_width = function() {
		return get_padding_width() - padding.left - padding.right;
	}
	
	/**
	 * @desc Returns the height desconsidering the borders and paddings
	 */
	static get_inner_height = function() {
		return get_padding_height() - padding.top - padding.bottom;
	}
	
	#endregion
	
	#region Size methods
	
	/**
	 * @desc Sets the width of this interface respecting its padding and borders
	 * @param {Real} _width the width to set
	 */
	static set_width = function(_width) {
		// Sets width, making sure it isn't smaller than the borders and paddings
		if(_width < padding.left + padding.right + border.left + border.right) _width = padding.left + padding.right + border.left + border.right;
		width = _width;
	}
	
	/**
	 * @desc Sets the height of this interface respecting its padding and borders
	 * @param {Real} _height the height to set
	 */
	static set_height = function(_height) {
		// Sets height, making sure it isn't smaller than the borders and paddings
		if(_height < padding.top + padding.bottom + border.top + border.bottom) _height = padding.top + padding.bottom + border.top + border.bottom;
		height = _height;
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
	
	#endregion
	
	#region Padding methods
	
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
	
	#endregion
	
	#region Border methods
	
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
	
	#endregion
	
	#region Margin methods
	
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
	
	#endregion
	
	#region Director methods
	
	/**
	 * @desc Updates the x position of the children of this GUI according to the director
	 */
	static update_children_x_position = function() {
		director.update_children_x_position(self);
	}
	
	/**
	 * @desc Updates the y position of the children of this GUI according to the director
	 */
	static update_children_y_position = function() {
		director.update_children_y_position(self);
	}
	
	/**
	 * @desc Updates the position of the children of this GUI according to the director
	 */
	static update_children_position = function() {
		director.update_children_position(self);
	}
	
	/**
	 * @desc Updates the x position of this GUI as the parent of the interface tree
	 */
	static update_x_position = function() {
		x = margin.left;
		
		update_children_x_position(self);
	}
	
	/**
	 * @desc Updates the y position of this GUI as the parent of the interface tree
	 */
	static update_y_position = function() {
		y = margin.top;
		
		update_children_y_position(self);
	}
	
	/**
	 * @desc Updates the position of this GUI as the parent of the interface tree
	 */
	static update_position = function() {
		update_x_position();
		update_y_position();
	}
	
	/**
	 * @desc Updates the content width of this GUI according to the director
	 */
	static update_content_width = function() {
		director.update_content_width(self);
	}
	
	/**
	 * @desc Updates the content height of this GUI according to the director
	 */
	static update_content_height = function() {
		director.update_content_height(self);
	}
	
	/**
	 * @desc Updates the content size of this GUI according to the director
	 */
	static update_content_size = function() {
		director.update_content_size(self);
	}
	
	#endregion
	
	/**
	 * @desc Sets the width and height of this interface to fit its children nicely
	 */
	static fit_children = function() {
		var _width = content_width + padding.left + padding.right + border.left + border.right;
		var _height = content_height + padding.top + padding.bottom + border.top + border.bottom;
		
		set_size(_width, _height);
	}
	
	#region Drawing methods
	
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
	
	static select_self_surface = function(_parent_surface) {
		if(_parent_surface == -1) {
			if(surface_get_target() != -1) surface_reset_target();
			return;
		}
		if(_parent_surface != -1) {
			if(!auto_position) {
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
	
	/**
	 * @desc Returns the x offset provoked by the parents scrolls
	 */
	static get_x_scroll_offset = function() {
		if(!parent) return 0;
		
		return (parent.content_width - parent.get_inner_width()) * parent.x_scroll + parent.get_x_scroll_offset();
	}
	
	/**
	 * @desc Returns the y offset provoked by the parents scrolls
	 */
	static get_y_scroll_offset = function() {
		if(!parent) return 0;
		
		return (parent.content_height - parent.get_inner_height()) * parent.y_scroll + parent.get_y_scroll_offset();
	}
	
	/**
	 * @desc Returns the x position taking the parent scroll into account
	 */
	static get_scrolled_x = function() {
		return x - get_x_scroll_offset();
	}
	
	/**
	 * @desc Returns the y position taking the parent scroll into account
	 */
	static get_scrolled_y = function() {
		return y - get_y_scroll_offset();
	}
	
	static draw_border = function() {
		if(border_sprite == 0) return;
		
		// Starting by the scroll affected positions
		var _x = get_scrolled_x();
		var _y = get_scrolled_y();
		
		if(surface_get_target() != -1) {
			// Transforming absolute position in relative to the parent surface
			_x -= parent.x + parent.border.left;
			_y -= parent.y + parent.border.top;
		}
		
		draw_sprite_stretched(
			border_sprite, border_image,
			_x, _y,
			width, height
		);
	}
	
	static draw_background = function() {
		if(background_sprite == 0) return;
		
		// Starting by the scroll affected positions
		var _x = get_scrolled_x();
		var _y = get_scrolled_y();
		
		if(surface_get_target() != -1) {
			// Transforming absolute position in relative to the parent surface
			_x -= parent.x + parent.border.left;
			_y -= parent.y + parent.border.top;
		}
		
		draw_sprite_stretched(
			background_sprite, background_image,
			_x + border.left,
			_y + border.top,
			get_padding_width(), get_padding_height()
		);
	}
	
	static draw = function(_surface = -1) {
		select_self_surface(_surface);
		
		draw_border();
		draw_background();
		
		var _children_surface = get_children_surface();
		
		array_foreach(children, method({
			children_surface: _children_surface
		}, function(_child) { if(_child.auto_position) _child.draw(children_surface); }));
		
		if(surface_get_target() != -1) surface_reset_target();
		
		if(surface_exists(surface)) draw_surface(surface, x + border.left, y + border.top);
		
		array_foreach(children, method({
			children_surface: _children_surface
		}, function(_child) { if(!_child.auto_position) _child.draw(children_surface); }));
	}
	
	#endregion
	
	static toString = function() {
		return "{\n" +
			string("\tcoordinate: {0} x {1};\n", x, y) +
			string("\tcontent size: {0} x {1};\n", content_width, content_height) +
			string("\tsize: {0} x {1};\n", width, height) +
			string("\tpadding: {0};\n", padding) +
			string("\tborder: {0};\n", border) +
			string("\tmargin: {0};\n", margin) +
			string("\tauto_position: {0};\n", auto_position) +
			string("\tin_flow: {0};\n", in_flow) +
			string("\tscroll: {0} x {1};\n", x_scroll, y_scroll) +
		"}";
	}
	
}
