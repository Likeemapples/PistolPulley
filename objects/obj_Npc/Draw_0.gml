/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_sprite(spr_Textbox, 0, 48, 72);



if (point_in_rectangle(
		mouse_x,mouse_y,
		16-(16/2),32-(11/2),
		16+sprite_get_width(spr_Buttons)/2,
		32+sprite_get_width(spr_Buttons)/2
	)) {
		
	if (yesSize < 2) yesSize += 0.1;
	
	if (mouse_check_button_pressed(mb_left)) {
		
	}
	
}
else {
	if (yesSize > 1) yesSize -= 0.1;
}

draw_sprite_ext(spr_Buttons, 0, 16, 32, yesSize, yesSize, 0, -1, 1);

if (point_in_rectangle(
		mouse_x,mouse_y,
		80-(16/2),32-(11/2),
		80+sprite_get_width(spr_Buttons)/2,
		32+sprite_get_width(spr_Buttons)/2
	)) {
	if (noSize < 2) noSize += 0.1;
}
else {
	if (noSize > 1) noSize -= 0.1;
}


draw_sprite_ext(spr_Buttons, 1, 80, 32, noSize, noSize, 0, -1, 1);


draw_set_valign(fa_bottom);
draw_set_halign(fa_middle);
draw_set_color(c_black);

draw_text_transformed(48, 69, text, 0.4, 0.4, 0);

draw_set_color(c_white);
draw_set_valign(fa_top);