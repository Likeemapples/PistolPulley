/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_sprite(spr_Textbox, 0, 48, 72);

draw_sprite(spr_Buttons, 0, 16, 32);
draw_sprite(spr_Buttons, 1, 80, 32);

draw_set_valign(fa_bottom);
draw_set_halign(fa_middle);
draw_set_color(c_white);
draw_text_transformed(48, 69, "Text text text", 0.4, 0.4, 0);
draw_set_valign(fa_top);