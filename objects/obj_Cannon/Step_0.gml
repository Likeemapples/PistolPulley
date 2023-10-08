/// @desc ??
if (not global.paused) {

	if (y+8 < round(mouse_y) and y < 56) {
		y += 1;
	}
	else if (y+8 > round(mouse_y) and y > 11) {
		y -= 1;
	}

	if (mouse_check_button_pressed(mb_any) and cooldowntimer >= room_speed) {
		audio_play_sound(snd_Shoot,1,false);
		var _inst = instance_create_layer(x,y+8,"Instances", obj_Ball);

		with (_inst) {
			ball = new Build(other.ball);
			spd = ball.bSpd;
			dmg = ball.bDmg + 10; // This +10 is here because cannonballs add no additional damage
			image_index = ball.bImg;
		}
		make_random_ball();
		cooldowntimer = 0;
	}
	else if (cooldowntimer < room_speed) {
		cooldowntimer++;
	}

	// Summon Enemies

	if (global.enemiesKilled >= global.roundRequirement) {
		roundtimer = 0;
		global.enemiesKilled = 0;
		global.roundRequirement = round(global.roundRequirement * 1.2);
	}
	print(global.enemiesKilled, global.roundRequirement)

	summontimer--;
	if (summontimer <= 0 and instance_number(obj_Enemy) < 10 and roundtimer >= room_speed*20) {
		var _inst = instance_create_layer(-96,64+5,"Instances",obj_Enemy);
	
		switch (irandom_range(1,3)) {
			case 1:
				_inst.enemy = new EBuild([new Wings()]);
			break;
			case 2:
				_inst.enemy = new EBuild([new Normal()]);
			break;
			case 3:
				_inst.enemy = new EBuild([new Legs()]);
			break;
		}
		_inst.hp = _inst.enemy.eHp;
		_inst.legs = _inst.enemy.eLegs;
		summontimer = room_speed/2;
	}

	if (roundtimer < room_speed*20) roundtimer++;

	if (roundtimer == room_speed*15) audio_play_sound(snd_Warhorn,1,false);

}