/// @description Step event

// Allows the user to control this entity, if it is controllable
if(controllable) controllable.control();

// Following leader, if any
if(leader) {
	//show_debug_message(point_distance(x, y, leader.x, leader.y))
	if(point_distance(x, y, leader.x, leader.y) > TILE_SIZE) {
		speed = leader.speed;
		direction = point_direction(x, y, leader.x, leader.y);
	} else {
		speed = 0;
	}
}

// Falling if in midair
if(z < 0) z_speed += falling_accelaration;

// Colliding with the floor
if(z + z_speed >= 0) {
	z_speed = 0;
	z = 0;
}

// Incrementing the z speed into the z axis
z += z_speed;

// Adjusting image speed according to entity speed
image_speed = (max_image_speed * speed) / running_speed;

// Setting the depth so farther objects are drawn behind
depth = -y;
