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
	 * @desc Draws the border of the interface with the offsets of this anchor
	 */
	static draw_border = function() {
		if(interface.border_sprite == 0) return;
		
		draw_sprite_stretched(
			interface.border_sprite, interface.border_image,
			interface.x + left,
			interface.y + top,
			interface.width, interface.height
		);
	}
	
	/**
	 * @desc Draws the background of the interface with the offsets of this anchor
	 */
	static draw_background = function() {
		if(interface.background_sprite == 0) return;
		
		draw_sprite_stretched(
			interface.background_sprite, interface.background_image,
			interface.x + left + interface.border.left,
			interface.y + top + interface.border.top,
			interface.get_padding_width(), interface.get_padding_height()
		);
	}
	
}
