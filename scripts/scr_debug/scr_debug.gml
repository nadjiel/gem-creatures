///
function show_speed() {
	draw_text(x, y, speed);
}

function draw_bbox() {
	draw_line(bbox_right, bbox_bottom, bbox_right, bbox_top);
	draw_line(bbox_right, bbox_top, bbox_left, bbox_top);
	draw_line(bbox_left, bbox_top, bbox_left, bbox_bottom);
	draw_line(bbox_left, bbox_bottom, bbox_right, bbox_bottom);
}

function draw_sprite_bbox() {
	show_debug_message("sprite_width: " + string(sprite_width))
	show_debug_message("sprite_height: " + string(sprite_height))
	show_debug_message("sprite_bbox_right: " + string(sprite_get_bbox_right(image_index)))
	show_debug_message("sprite_bbox_top: " + string(sprite_get_bbox_top(image_index)))
	show_debug_message("sprite_bbox_left: " + string(sprite_get_bbox_left(image_index)))
	show_debug_message("sprite_bbox_bottom: " + string(sprite_get_bbox_bottom(image_index)))
	show_debug_message("bbox_right: " + string(bbox_right))
	show_debug_message("bbox_top: " + string(bbox_top))
	show_debug_message("bbox_left: " + string(bbox_left))
	show_debug_message("bbox_bottom: " + string(bbox_bottom))
	
	var _right = bbox_right + sprite_width - sprite_get_bbox_right(image_index);
	var _top = bbox_top - sprite_get_bbox_top(image_index);
	var _left = bbox_left - sprite_get_bbox_left(image_index);
	var _bottom = bbox_bottom + sprite_height - sprite_get_bbox_bottom(image_index);
	
	draw_line(_right, _bottom, _right, _top);
	draw_line(_right, _top, _left, _top);
	draw_line(_left, _top, _left, _bottom);
	draw_line(_left, _bottom, _right, _bottom);
}