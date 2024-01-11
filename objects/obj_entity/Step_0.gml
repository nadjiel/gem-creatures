/// @description Step event

#region Speed calculations
// Allows the user to control this entity, if it is controllable
if(controllable) controllable.step();

// Following leader, if any
if(leader) {
	if(point_distance(coord.x, coord.y, leader.coord.x, leader.coord.y) > TILE_SIZE) {
		spd = leader.spd;
		dir = point_direction(coord.x, coord.y, leader.coord.x, leader.coord.y);
	} else {
		spd = 0;
	}
}

// Falling if in midair
if(coord.z < 0) z_spd += falling_acc;
// Colliding with the floor
if(coord.z + z_spd >= 0) {
	z_spd = 0;
	coord.z = 0;
}

// Updating the x and y speeds based on the current entity speed and direction
x_spd = lengthdir_x(spd, dir);
y_spd = lengthdir_y(spd, dir);
#endregion

#region Coordinate incrementation
// Incrementing the speeds into the axis
coord.x += x_spd;
coord.y += y_spd;
coord.z += z_spd;

// Updating the x, y and z variables with the entity coordinates
x = coord.x;
y = coord.y;
z = coord.z;
#endregion

#region Sprite settings
// Adjusting image speed according to entity speed
image_speed = (max_image_spd * spd) / running_spd;

// Setting the depth so farther objects are drawn behind
depth = -coord.y;
#endregion
