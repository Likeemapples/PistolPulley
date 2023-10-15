/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_text_transformed(viewx,0,global.money,0.4,0.4,0);
draw_text_transformed(viewx,5,string(global.enemiesKilled) + " / " + string(global.roundRequirement),0.4,0.4,0);

if (global.paused) {
	draw_sprite(spr_Paused,0,viewx,0);
}