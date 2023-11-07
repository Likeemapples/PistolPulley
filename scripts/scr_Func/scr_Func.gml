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
	big = 8,
	rainball = 9
	
}
global.unlockedBalls = [ballnum.rainball];

enum enemytypes {
	normal = 0,
	wings = 1,
	legs = 2,
	buig = 3,
	howl = 4
}
global.summonableEnemies = [enemytypes.normal];
global.summonTimeMod = [2,3];

global.enemyCRSpawned = 0;
global.roundChallengeRating = 10;
global.roundNum = 0;


global.paused = false;

global.prideFlags = [
	[
	c_red, 
	make_color_rgb(255,153,51), 
	make_color_rgb(255,237,0),
	make_color_rgb(0,153,51),
	make_color_rgb(0,51,153),
	make_color_rgb(91,25,123)
	], // Default Pride Flag
	[
	make_color_rgb(19,191,25),
	make_color_rgb(253,190,255),
	c_white,
	make_color_rgb(253,190,255),
	make_color_rgb(19,191,25)
	], // Trans
	[
	make_color_rgb(255,245,41),
	c_white,
	make_color_rgb(134,62,196),
	make_color_rgb(34,34,34)
	], // Non-binary
	[
	make_color_rgb(202,0,95),
	make_color_rgb(202,0,95),
	make_color_rgb(92,60,134),
	make_color_rgb(5,35,151),
	make_color_rgb(5,35,151)
	], // Bi
	[
	make_color_rgb(213,45,0),
	make_color_rgb(255,154,84),
	make_color_rgb(254,255,249),
	make_color_rgb(210,98,160),
	make_color_rgb(163,2,96)
	],
	[]
]

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
					
					if (enemyId == enemytypes.buig) {
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