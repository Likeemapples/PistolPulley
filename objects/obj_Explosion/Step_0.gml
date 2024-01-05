/// @desc ??

if (not setup) {
	
	for (_rand = irandom_range(20,40); _rand > 0; _rand--) {
		var _inst = instance_create_layer(x+random_range(-2,2), y+random_range(-2,2), "Instances", object);
		with (_inst) {
			direction = point_direction(x,y,other.x,other.y);
			speed = -random_range(1,2);
		}
	}
	
	var _enemy = instance_place(x,y,obj_Enemy);
	if (_enemy != noone) {
		var _touched = false;
		if (find_in_array(touched, _enemy) != -1) { 
			_touched = true;
		}
		if (not _touched) {
		
			touched = [_enemy];
			
			with (_enemy) {
				hp -= other.dmg;
				if (hp <= 0) {
				
					audio_play_sound(snd_EnemyDie,1,false);
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
				
					if (enemyId == EnemyType.buig) {
						array_delete(obj_Cannon.summonedEnemies, 0, 1);
					}
				
					instance_destroy(self);
				}
			}
		}
	}
}
setup = true;