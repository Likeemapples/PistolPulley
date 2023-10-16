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
				
				audio_play_sound(snd_EnemyDie,1,false);
				global.enemiesKilled ++;
				global.money += array_length(other.touched);
				array_push(obj_Screens.draw_tasks,[other.x,other.y,array_length(other.touched),room_speed/2])
				
				var _ball = other;
				var _enemy = self;
				for (_rand = irandom_range(10,30); _rand > 0; _rand--) {
					var _inst = instance_create_layer(_ball.x+random_range(-2,2), _ball.y+random_range(-2,2), "Instances", obj_Bits);
					with (_inst) {
						direction = point_direction(x,y,_ball.x,_ball.y);
						speed = -random_range(1,2);
					}
				}
				instance_destroy(self);
			}
			if (other.dmg <= 0) {
				instance_destroy(other);
			}
		}
	}
}
