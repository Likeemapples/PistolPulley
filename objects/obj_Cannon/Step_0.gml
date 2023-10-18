/// @desc ??
if (not global.paused) {

	if (y+8 < round(mouse_y) and y < 56) {
		y += 1;
	}
	else if (y+8 > round(mouse_y) and y > 11) {
		y -= 1;
	}

	if (mouse_check_button_pressed(mb_any) and cooldowntimer >= room_speed and obj_Screens.currentScreen == screen.castle) {
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

	if (global.enemyCRSpawned >= global.roundChallengeRating) {
		summonedEnemies = [];
		roundtimer = 0;
		global.roundNum++;
		global.enemyCRSpawned = 0;
		global.roundChallengeRating = round(global.roundChallengeRating * 1.2);
	
		switch (global.roundNum) {
			case 1:
				array_push(global.summonableEnemies, enemytypes.legs);
				break;
			case 2:
				array_push(global.summonableEnemies, enemytypes.wings);
				break;
			case 10:
				array_push(global.summonableEnemies, enemytypes.buig);
				break;
				
		}
		
		global.summonTimeMod[0] -= 0.1;
		global.summonTimeMod[1] -= 0.1;
	}

	summontimer--;
	if (summontimer <= 0 and instance_number(obj_Enemy) < 10 and roundtimer >= room_speed*20) {
		if (global.enemyCRSpawned < global.roundChallengeRating) {
			var _inst = instance_create_layer(-96,64+5,"Instances",obj_Enemy);

			make_enemy(_inst);
		
			while (_inst.cr + global.enemyCRSpawned > global.roundChallengeRating) {
				make_enemy(_inst);
				print(global.roundChallengeRating, global.enemyCRSpawned, _inst.cr)
			}
			global.enemyCRSpawned += _inst.cr;
		}
		
		summontimer = room_speed*random_range(global.summonTimeMod[0],global.summonTimeMod[1]);
	}

	if (roundtimer < room_speed*20) roundtimer++;

	if (roundtimer == room_speed*15) audio_play_sound(snd_Warhorn,1,false);

}

