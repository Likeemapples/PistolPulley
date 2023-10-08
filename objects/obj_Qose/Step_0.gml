/// @description Insert description here
// You can write your code in this editor

if (not global.paused) {
	for (var i = 0; i < array_length(ball.args); i++) {
		ball.args[i].qose(self);	
	}
}

if (not place_meeting(x,y+1,obj_Floor)) {
	y += 1;
}
if (place_meeting(x,y,obj_Floor)) {
	y -= 1;
}

var _enemy = instance_place(x,y,obj_Enemy);
if (_enemy != noone) {
	var _touched = false;
	if (find_in_array(touched, _enemy) != -1) { 
		_touched = true;
	}
	if (not _touched) {
		audio_play_sound(snd_EnemyDie,1,false);
		global.enemiesKilled++;
		array_push(touched, self);
		with (_enemy) {
			var _hp = hp;
			hp -= other.dmg;
			other.dmg -= _hp;
			if (hp <= 0) {
				instance_destroy(self);
			}
			if (other.dmg <= 0) {
				instance_destroy(other);
			}
		}
	}
}