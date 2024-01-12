/// @description Step event

#region Speed calculations
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
// Setting the depth so farther objects are drawn behind
depth = -coord.y;
#endregion
