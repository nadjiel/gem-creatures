/// @description Input update

// Gets input for this step
var _key_names = struct_get_names(keys);
for(var _i = 0; _i < array_length(_key_names); _i++) {
	keys[$ _key_names[_i]].get_input();
}

// Calculates input derived info
input_x = keys.right.hold - keys.left.hold;
input_y = keys.down.hold - keys.up.hold;
input_dir = point_direction(0, 0, input_x, input_y);
