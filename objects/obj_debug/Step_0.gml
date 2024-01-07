/// @description Checking input

keys.f1 = keyboard_check_pressed(vk_f1);
keys.f2 = keyboard_check_pressed(vk_f2);
keys.one = keyboard_check_pressed(ord("1"));
keys.two = keyboard_check_pressed(ord("2"));
keys.three = keyboard_check_pressed(ord("3"));
keys.four = keyboard_check_pressed(ord("4"));
keys.five = keyboard_check_pressed(ord("5"));

if(keys.f1) debug = !debug;
if(keys.f2) {
	instance_id[5].add_leader(instance_id[4]);
	instance_id[4].add_leader(instance_id[3]);
	instance_id[4].add_leader(instance_id[2]);
	instance_id[3].add_leader(instance_id[1]);
}/*
if(keys.one) {
	with(instance_id[2]) {
		set_leader(!leader ? instance_id[1] : noone);
	}
}
if(keys.two) {
	with(instance_id[3]) {
		set_leader(!leader ? instance_id[2] : noone);
	}
}
if(keys.three) {
	with(instance_id[4]) {
		set_leader(!leader ? instance_id[3] : noone);
	}
}
if(keys.four) {
	with(instance_id[5]) {
		set_leader(!leader ? instance_id[4] : noone);
	}
}
if(keys.five) {
	with(instance_id[6]) {
		set_leader(!leader ? instance_id[5] : noone);
	}
}*/
