/// @description Creation code

/**
 * @desc Choose sprite according to a given direction
 */
function pick_sprite_direction(_sprite_name, _angle) {
	if(_angle % 90) return;
	
	switch(_angle) {
		case 0:
			sprite_index = asset_get_index(_sprite_name + "_right");
			image_xscale = 1;
			break;
		case 90: sprite_index = asset_get_index(_sprite_name + "_up"); break;
		case 180:
			sprite_index = asset_get_index(_sprite_name + "_right");
			image_xscale = -1;
			break;
		case 270: sprite_index = asset_get_index(_sprite_name + "_down"); break;
	}
}
