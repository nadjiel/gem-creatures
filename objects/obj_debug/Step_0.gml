/// @description Checking input

keys.f1 = keyboard_check_pressed(vk_f1);
keys.f2 = keyboard_check_pressed(vk_f2);
keys.one = keyboard_check_pressed(ord("1"));
keys.two = keyboard_check_pressed(ord("2"));
keys.three = keyboard_check_pressed(ord("3"));
keys.four = keyboard_check_pressed(ord("4"));
keys.five = keyboard_check_pressed(ord("5"));

if(keys.f1) debug = !debug;
if(keys.f2) {/*
	instance_id[5].party_add_leader(instance_id[4]);
	instance_id[4].party_add_leader(instance_id[3]);
	instance_id[4].party_add_leader(instance_id[2]);
	instance_id[3].party_add_leader(instance_id[1]);*/
	
	instance_id[1].party_add_leader(instance_id[2]);
	instance_id[2].party_add_leader(instance_id[3]);
	instance_id[3].party_add_leader(instance_id[4]);
	instance_id[4].party_add_leader(instance_id[5]);
}
if(keys.one) instance_id[1].party_add_leader(instance_id[2]);
if(keys.two) instance_id[2].party_add_leader(instance_id[3]);
if(keys.three) instance_id[3].party_add_leader(instance_id[4]);
if(keys.four) instance_id[4].party_add_leader(instance_id[5]);
if(keys.five) instance_id[5].party_add_leader(instance_id[6]);
