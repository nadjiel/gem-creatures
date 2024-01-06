/// @description Checking input

keys.f1 = keyboard_check_pressed(vk_f1);
keys.f2 = keyboard_check_pressed(vk_f2);

if(keys.f1) debug = !debug;
if(keys.f2) {
	with(instance_id[2]) {
		leader = !leader ? instance_id[1] : noone;
	}
	with(instance_id[3]) {
		leader = !leader ? instance_id[2] : noone;
	}
}
