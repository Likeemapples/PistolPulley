/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_sprite(spr_Textbox, 0, 48, 72);





draw_sprite_ext(spr_Buttons, 0, 16, 32, yesSize, yesSize, 0, -1, 1);
draw_sprite_ext(spr_Buttons, 1, 80, 32, noSize, noSize, 0, -1, 1);


draw_set_valign(fa_bottom);
draw_set_halign(fa_middle);
draw_set_color(c_black);

draw_text_transformed(48, 69, text, 0.4, 0.4, 0);

draw_set_color(c_white);
draw_set_valign(fa_top);