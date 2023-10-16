/// @desc ??

if (not global.paused) {
	
	for (var i = 0; i < array_length(ball.args); i++) {
		ball.args[i].update(self);	
	}
	
}

if (x <= 96) instance_destroy(self);

var _enemy = instance_place(x,y,obj_Enemy);
if (_enemy != noone) {
	var _touched = false;
	if (find_in_array(touched, _enemy) != -1) { 
		_touched = true;
	}
	if (not _touched) {
		
		array_push(touched, self);
		
		with (_enemy) {
			var _hp = hp;
			hp -= other.dmg;
			other.dmg -= _hp;
			if (hp <= 0) {
				instance_destroy(self);
				audio_play_sound(snd_EnemyDie,1,false);
				global.enemiesKilled ++;
				global.money += array_length(other.touched);
				array_push(obj_Screens.draw_tasks,[other.x,other.y,array_length(other.touched),room_speed/2])
			}
			if (other.dmg <= 0) {
				instance_destroy(other);
			}
		}
	}
}
