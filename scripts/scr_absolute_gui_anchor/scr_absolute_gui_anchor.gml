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
	 * @desc Draws the border of the interface with the offsets of this anchor
	 */
	static draw_border = function() {
		if(interface.border_sprite == 0) return;
		
		if(interface.parent == 0) {
			draw_sprite_stretched(
				interface.border_sprite, interface.border_image,
				left, top,
				interface.width, interface.height
			);
			return;
		}
		
		draw_sprite_stretched(
			interface.border_sprite, interface.border_image,
			interface.parent.x + interface.parent.position.left + left,
			interface.parent.y + interface.parent.anchor.top + top,
			interface.width, interface.height
		);
	}
	
	/**
	 * @desc Draws the background of the interface with the offsets of this anchor
	 */
	static draw_background = function() {
		if(interface.background_sprite == 0) return;
		
		if(interface.parent == 0) {
			draw_sprite_stretched(
				interface.background_sprite, interface.background_image,
				left + interface.border.left,
				top + interface.border.top,
				interface.get_padding_width(), interface.get_padding_height()
			);
			return;
		}
		
		draw_sprite_stretched(
			interface.background_sprite, interface.background_image,
			interface.parent.x + interface.parent.anchor.left + left + interface.border.left + interface.padding.left,
			interface.parent.y + interface.parent.anchor.top + top + interface.border.top + interface.padding.top,
			interface.get_content_width(), interface.get_content_height()
		);
	}
	
}
