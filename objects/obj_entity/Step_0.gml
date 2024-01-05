/// @description Step event

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
