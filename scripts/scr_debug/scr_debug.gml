// Variable that counts how many frames have passed in the game
global.frame_counter = 0;

/**
 * @desc Draws the object bounding box
 */
function draw_bbox() {
	draw_line(bbox_right, bbox_bottom, bbox_right, bbox_top);
	draw_line(bbox_right, bbox_top, bbox_left, bbox_top);
	draw_line(bbox_left, bbox_top, bbox_left, bbox_bottom);
	draw_line(bbox_left, bbox_bottom, bbox_right, bbox_bottom);
}

/**
 * @desc Draws a cross on the screen
 * @param {Real} _x the x position of the center of the cross
 * @param {Real} _y the y position of the center of the cross
 * @param {Real} _size the length of the cross lines
 * @param {Constant.Color} _color the color with which to draw the cross
 */
function draw_cross(_x, _y, _size, _color = c_white) {
	draw_set_color(_color);
	
	draw_line(_x - _size / 2, _y, _x + _size / 2, _y);
	draw_line(_x, _y - _size / 2, _x, _y + _size / 2);
}
