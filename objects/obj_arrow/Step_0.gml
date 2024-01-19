/// @description Collision and angle

if(global.pause) exit;

event_inherited();

// Destroys this instance if it is outside of the camera view
var _camera_rectangle = get_camera_rectangle();
if(!point_in_rectangle(
	coord.x, coord.y,
	_camera_rectangle.x1, _camera_rectangle.y1,
	_camera_rectangle.x2, _camera_rectangle.y2
)) instance_destroy();

// Manages the collision of the arrow with an entity
function entity_collision() {
	var _collider = instance_place(coord.x, coord.y, obj_entity);
	
	if(_collider == noone) return;
	if(_collider == creator) return;
	if(_collider.creator == creator) return;
	if(global.party.contains(creator) && global.party.contains(_collider)) return;
	
	instance_destroy(_collider);
	instance_destroy();
}

entity_collision();

// Changing the image angle according to the arrow direction
image_angle = dir;
