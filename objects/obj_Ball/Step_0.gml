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
		audio_play_sound(snd_EnemyDie,1,false);
		global.enemiesKilled ++;
		with (_enemy) {
			if (array_length(other.touched) > 0) {
				global.money += 1;
			}
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
