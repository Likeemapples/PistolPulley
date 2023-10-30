
if (not global.paused) {

	for (var i = 0; i < array_length(enemy.args); i++) {
		enemy.args[i].update(self);	
	}
}

if (y < 13 and not invincible) {
	global.hp --;
	audio_play_sound(snd_Hurt,1,false);
	var _inst = instance_nearest(x,y,obj_Quimothy);
	_inst.falling = true;
	instance_destroy(self);
}

if (global.hp <= 0) {
	room_goto(rm_death);
}