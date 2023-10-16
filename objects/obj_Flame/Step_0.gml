/// @description Insert description here
// You can write your code in this editor

if (not global.paused) {
	y += 0.25;
	if (changex >= 5 or changex <= -5) xdir = -xdir;
	changex += xdir;
	x = originx + changex;

	if (irandom_range(0,4) == 0) {
		switch (irandom_range(0,2)) {
			case 0:
				image_blend = make_color_rgb(221,100,36);
			break;
			case 1:
				image_blend = make_color_rgb(250,70,22);
			break;
			case 2:
				image_blend = make_color_rgb(221,60,36);
			break;
		}
	}
	if ((y - originy) > 10) {
		if (irandom_range(0,10) == 0) instance_destroy(self);
	}

	var _enemy = instance_place(x,y,obj_Enemy);
	if (_enemy != noone) {
	
	
		with (_enemy) {
			var _hp = hp;
			hp -= 5;
			if (hp <= 0) {
			
				audio_play_sound(snd_EnemyDie,1,false);
				global.enemiesKilled ++;
				global.money += 1;
				array_push(obj_Screens.draw_tasks,[other.x,other.y,1,room_speed/2])
			
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
			instance_destroy(other);
		}
	}
	
}