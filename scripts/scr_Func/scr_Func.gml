global.hp = 3;
global.money = 50;

enum ballnum {
	
	normal = 1,
	querri = 2,
	fire = 3,
	boomerang = 4,
	lightning = 5,
	bomb = 6,
	slime = 7,
	big = 8
	
}
global.unlockedBalls = [];

enum enemytypes {
	normal = 0,
	wings = 1,
	legs = 2,
	buig = 3
}
global.summonableEnemies = [enemytypes.normal];
global.summonTimeMod = [2,3];

global.enemyCRSpawned = 0;
global.roundChallengeRating = 10;
global.roundNum = 0;


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

function find_in_array(array,id) {
	for (var i = 0; i < array_length(array); i++) {
		if (array[i] == id) {
			return i;
		}
	}
	return -1;
}

function damage(me) {
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