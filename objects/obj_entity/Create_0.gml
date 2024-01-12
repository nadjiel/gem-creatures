/// @description Variable definitions

// Struct storing the coordinates of this entity
coord = new Vector3(x, y, z);

// Variable that allows this entity to be controllable
controllable = undefined;

// Party variables
leader = noone;
follower = noone;

// Array with the 4 actions executable by this entity
actions = array_create(4, undefined);
