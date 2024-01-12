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
function pick_sprite_direction(_sprite_name, _angle) {
	var _direction = angle_to_direction(_angle);
	
	if(_direction == "right") image_xscale = 1;
	if(_direction == "left") {
		_direction = "right";
		image_xscale = -1;
	}
	
	sprite_index = asset_get_index(_sprite_name + "_" + _direction);
}

/**
 * Constructs a rectangle struct with information about its top left and bottom right axis
 * @param {Real} _x1 the top left corner x coordinate
 * @param {Real} _y1 the top left corner y coordinate
 * @param {Real} _x2 the bottom right corner x coordinate
 * @param {Real} _y2 the bottom right corner y coordinate
 */
function Rectangle(_x1, _y1, _x2, _y2) constructor {
	x1 = _x1;
	y1 = _y1;
	x2 = _x2;
	y2 = _y2;
}

/**
 * Returns a rectangle representing where the camera is currently located
 * @returns {Struct.Rectangle} a rectangle representing the camera location
 */
function get_camera_rectangle() {
	var _x = camera_get_view_x(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);
	var _width = camera_get_view_width(view_camera[0]);
	var _height = camera_get_view_height(view_camera[0]);
	
	return new Rectangle(
		_x, _y, _x + _width, _y + _height
	);
}
