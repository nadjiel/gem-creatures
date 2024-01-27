/// @description Draws the game GUI

draw_set_font(global.font);
draw_set_color(c_red);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(display_get_gui_width(), 0, global.party.leader.hp);
