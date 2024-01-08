/**
 * @desc Util function that converts seconds into miliseconds
 * @param {Real} _seconds the amount of seconds to convert
 * @returns {Real} the amount of seconds received in miliseconds
 */
function seconds_to_miliseconds(_seconds) {
	return _seconds * 1000;
}

/**
 * @desc Returns a string ("right", "up", "left" or "down") describing the passed angle
 * @param {Real} _angle an angle from 0 to 360
 * @returns {String} either "right", "up", "left" or "down"
 */
function angle_to_direction(_angle) {
	switch(round(_angle / 90)) {
		case 0: return "right";
		case 1: return "up";
		case 2: return "left";
		case 3: return "down";
		case 4: return "right";
	}
}

/**
 * @desc Choose a sprite that matches a given angle
 * @param {String} _sprite_name the name of the sprites to choose from without the "_direction" suffix
 * @param {Real} _angle the angle with which to choose the sprite
 */
function pick_sprite_direction(_sprite_name, _angle = direction) {
	var _direction = angle_to_direction(_angle);
	
	if(_direction == "right") image_xscale = 1;
	if(_direction == "left") {
		_direction = "right";
		image_xscale = -1;
	}
	
	sprite_index = asset_get_index(_sprite_name + "_" + _direction);
}
