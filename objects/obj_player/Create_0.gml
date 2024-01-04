/// @description Creation code

// Keys that control the player
keys = {
	right: false,
	up: false,
	left: false,
	down: false,
	ctrl: false,
	shift: false,
	space: false
};

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

// Input variables
x_input = 0;
y_input = 0;
input_direction = 0;
input_speed = 0;
jump_input = 0;

// Stablished variables
z = 0;
z_speed = 0;
walking_speed = 1;
running_speed = 1.5;
tiptoeing_speed = 0.5;
jumping_speed = 1;
falling_accelaration = 0.1;

// Sprite variables
max_image_speed = 1.5;
