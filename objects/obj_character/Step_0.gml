/// @description Step event

event_inherited();

// Following leader, if any
if(leader) {
	if(point_distance(coord.x, coord.y, leader.coord.x, leader.coord.y) > TILE_SIZE) {
		spd = leader.spd;
		dir = point_direction(coord.x, coord.y, leader.coord.x, leader.coord.y);
	} else {
		spd = 0;
	}
}

// Calculating direction to which face with the direction
if(!aiming) facing_dir = round_angle(dir);

// Adjusting image speed according to entity speed
image_speed = (max_image_spd * spd) / running_spd;
