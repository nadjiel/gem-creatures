/// @description Variable definitions

keys = {
	esc: new KeyboardInput(vk_escape),
	f1: new KeyboardInput(vk_f1),
	f2: new KeyboardInput(vk_f2),
	f3: new KeyboardInput(vk_f3),
	f4: new KeyboardInput(vk_f4),
	f5: new KeyboardInput(vk_f5),
	enter: new KeyboardInput(vk_enter),
	left_mouse: new MouseInput(mb_left),
	right: new KeyboardInput(vk_right),
	up: new KeyboardInput(vk_up),
	left: new KeyboardInput(vk_left),
	down: new KeyboardInput(vk_down),
	key_z: new KeyboardInput(ord("Z")),
	key_x: new KeyboardInput(ord("X")),
	key_a: new KeyboardInput(ord("A")),
	key_s: new KeyboardInput(ord("S")),
	control: new KeyboardInput(vk_control),
	shift: new KeyboardInput(vk_shift),
	space: new KeyboardInput(vk_space),
	key_1: new KeyboardInput(ord("1")),
	key_2: new KeyboardInput(ord("2")),
	key_3: new KeyboardInput(ord("3")),
	key_4: new KeyboardInput(ord("4"))
};

// Horizontal input: -1, 0 or 1 to left, none or right
input_x = 0;
// Vertical input: -1, 0 or 1 to up, none or down
input_y = 0;
// Direction input: 0 to 360 where 0 can mean either no input or the right direction
input_dir = 0;
