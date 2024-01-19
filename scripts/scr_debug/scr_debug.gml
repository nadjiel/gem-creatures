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

/**
 * @desc Draws a point showing the object's origin
 * @param {Constant.Color} _color the color with which to draw the point, (default is white)
 */
function draw_origin(_color = c_white) {
	draw_set_color(_color);
	
	draw_point(x, y);
}

/**
 * @desc Shows information about the game window and other visual aspects
 */
function show_game_size_info() {
	draw_set_font(global.font);
	draw_set_halign(fa_right);
	
	draw_text(display_get_gui_width(), 0,
		string("Display: {0} x {1}\n", display_get_width(), display_get_height()) +
		string("Fullscreen: {0}\n", string(window_get_fullscreen())) +
		string("Window: {0} x {1}\n", window_get_width(), window_get_height()) +
		string("GUI: {0} x {1}\n", display_get_gui_width(), display_get_gui_height()) +
		string("Application Surface: {0} x {1}\n", surface_get_width(application_surface), surface_get_height(application_surface)) +
		string("View Port: {0} x {1}\n", view_wport[0], view_hport[0]) +
		string("Camera: {0} x {1}", camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
	);
}
