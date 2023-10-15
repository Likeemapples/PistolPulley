/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_text_transformed(viewx,0,global.money,0.4,0.4,0);
draw_text_transformed(viewx,5,string(global.enemiesKilled) + " / " + string(global.roundRequirement),0.4,0.4,0);

if (global.paused) {
	draw_sprite(spr_Paused,0,viewx,0);
}

for (var i = 0; i < array_length(draw_tasks); i++) {
	var _draw = draw_tasks[i]
	draw_set_color(c_yellow);
	draw_text_transformed(_draw[0],_draw[1],"+" + string(_draw[2]),0.4,0.4,0);
	draw_set_color(c_white);
	
	if (_draw[3] <= 0) array_delete(draw_tasks,i,1);
	else _draw[3] --;
}