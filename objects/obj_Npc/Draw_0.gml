/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_sprite(spr_Textbox, 0, 48, 72);

if (npc.image != 0) {
	draw_sprite_ext(spr_Buttons, yesSize, 18, 32, 1, 1, 0, -1, 1);
	draw_sprite_ext(spr_Buttons, noSize, 76, 32, 1, 1, 0, -1, 1);
}


draw_set_valign(fa_bottom);
draw_set_halign(fa_middle);
draw_set_color(c_black);

draw_text_transformed(48, 69, text, 0.4, 0.4, 0);

draw_set_color(c_white);
draw_set_valign(fa_top);