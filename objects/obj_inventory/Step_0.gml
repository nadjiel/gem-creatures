/// @description Inventory management

keys.enter = keyboard_check_pressed(vk_enter);
keys.right = keyboard_check_pressed(vk_right);
keys.up = keyboard_check_pressed(vk_up);
keys.left = keyboard_check_pressed(vk_left);
keys.down = keyboard_check_pressed(vk_down);

input_x = keys.right - keys.left;
input_y = keys.down - keys.up;

if(keys.enter) opened = !opened;

selected_slot += input_x;
