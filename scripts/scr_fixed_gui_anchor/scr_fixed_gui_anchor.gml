/**
 * @desc Creates a fixed interface anchor that makes the offsets be relative to the game gui
 */
function FixedGUIAnchor(_interface): GUIAnchor(_interface) constructor {
	
	static name = "fixed";
	
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
	 * @desc Draws the border of the interface with the offsets of this anchor
	 */
	static draw_border = function() {
		if(interface.border_sprite == 0) return;
		
		draw_sprite_stretched(
			interface.border_sprite, interface.border_image,
			left, top,
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
			left + interface.border.left,
			top + interface.border.top,
			interface.get_padding_width(), interface.get_padding_height()
		);
	}
	
}
