/// @description Insert description here
// You can write your code in this editor

//var _val = 5

//if (!surface_exists(surf)) {
//	surf = surface_create(480/_val, 360/_val);
//}

//surface_set_target(surf);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text_transformed(viewx+1,3,global.money,0.4,0.4,0);
draw_text_transformed(viewx+1,8,string(global.roundNum),0.4,0.4,0);

if (global.paused) {
	depth = -1000;
	draw_sprite(spr_Paused,0,viewx,0);
	if (keyboard_check_pressed(ord("1"))) {
		global.money += 25;
	}
}
else { depth = 0; }

for (var i = 0; i < array_length(draw_tasks); i++) {
	var _draw = draw_tasks[i]
	draw_set_color(c_yellow);
	draw_text_transformed(_draw[0],_draw[1],"+" + string(_draw[2]),0.4,0.4,0);
	draw_set_color(c_white);
	
	if (_draw[3] <= 0) array_delete(draw_tasks,i,1);
	else _draw[3] --;
}

//surface_reset_target();