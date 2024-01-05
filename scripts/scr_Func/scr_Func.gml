global.hp = 3;
global.money = 50;

enum Season {
	wet = 0,
	hot = 1,
	wind = 2,
	cold = 3,
	none = 4
}

global.summonTimeMod = [2,3];
global.enemyCRSpawned = 0;
global.roundChallengeRating = 10;
global.roundNum = 0;
global.currentSeason = Season.hot;

global.paused = false;

function print() {
    var _str = "";

    for (var i = 0; i < argument_count; i ++)
    {
        _str += string(argument[i]) + ", ";
    }

    show_debug_message(_str);
}

function animate_range(min,max) {
	if (image_index < min) {image_index = min};
	if (image_index > max + 0.99) {image_index = min};
}

function find_in_array(array, _id) {
	for (var i = 0; i < array_length(array); i++) {
		if (array[i] == _id) {
			return i;
		}
	}
	return -1;
}

function damage(me) {
	// Its better to give each individual object its own damage function
	// Fix this
	with (me) {
	var _enemy = instance_place(x,y,obj_Enemy);
	if (_enemy != noone) {
		var _touched = false;
		if (find_in_array(touched, _enemy) != -1) { 
			_touched = true;
		}
		if (not _touched) {
			
			if (object_index == obj_Ball) {
				array_push(touched, _enemy);
				for (var i = 0; i < array_length(ball.args); i++) {
					ball.args[i].onDamage(self);	
				}
			}
			else if (object_index == obj_Querri) {
				touched = [_enemy];
				
			}
			else {
				touched = [_enemy];
			}
			
			
		
			with (_enemy) {
				var _hp = hp;
				hp -= other.dmg;
				other.dmg -= _hp;
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
				if (other.dmg <= 0 or other.object_index == obj_Flame) {
					instance_destroy(other);
				}
			}
		}
	}
	}
}