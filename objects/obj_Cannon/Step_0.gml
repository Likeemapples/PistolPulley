/// @desc ??
if (not global.paused) {
	
	if (irandom_range(0, 500) == 29) {
		var _inst = instance_create_layer(96*0, irandom_range(-10, 10), "Clouds", obj_Cloud);
		_inst.image_index = irandom_range(0, 2);
	}
	
	if (y+8 < round(mouse_y) and y < 56) {
		y += 1;
		sprite_set_speed(spr_Wheel, 15, spritespeed_framespersecond);
	}
	else if (y+8 > round(mouse_y) and y > 11) {
		y -= 1;
		sprite_set_speed(spr_Wheel, -15, spritespeed_framespersecond);
	}
	else {
		sprite_set_speed(spr_Wheel, 0, spritespeed_framespersecond);
	}

	if (mouse_check_button_pressed(mb_any) and cooldowntimer >= room_speed and obj_Screens.currentScreen == screen.castle) {
		audio_play_sound(snd_Shoot,1,false);
		var _inst = instance_create_layer(x,y+8,"Instances", obj_Ball);

		with (_inst) {
			ball = new Build(other.ball);
			spd = ball.bSpd;
			dmg = ball.bDmg + 10; // This +10 is here because cannonballs add no additional damage
			pride = ball.bPride;
			ally = ball.bAlly;
			image_index = ball.bImg;
		}
		make_random_ball();
		cooldowntimer = 0;
	}
	else if (cooldowntimer < room_speed) {
		cooldowntimer++;
	}

	// Next Round

	if (global.enemyCRSpawned >= global.roundChallengeRating and instance_number(obj_Enemy) == 0) {
		audio_play_sound(snd_RoundEnd, 1, false);
		summonedEnemies = [];
		roundtimer = 0;
		global.roundNum++;
		global.enemyCRSpawned = 0;
		global.roundChallengeRating = round(global.roundChallengeRating * 1.2);
		
		with (obj_Npc) {
			initNpc(randomNpc());
			text = "";
			textIndex = 1;
			dialogueIndex = 0;
		}
		roundCheck = false;
	}
	
	
	// Check if round switched
	
	if (not roundCheck) {
		roundCheck = true;
		print(lastRound, global.roundNum, abs(lastRound - global.roundNum))
		for (var i = 0; i < abs(lastRound - global.roundNum); i++) {
			
			add_enemy(1, EnemyType.legs);
			add_enemy(2, EnemyType.wings);
			add_enemy(5, EnemyType.howl);
			add_enemy(10, EnemyType.buig);
		
			if (global.roundNum % 10 == 0 and lastRound > global.roundNum) {
				if (global.currentSeason < 3) {
					global.currentSeason += 1;
				}
				else {
					global.currentSeason = Season.wet;
				}
			}
		
			global.summonTimeMod[0] -= 0.1 * sign(lastRound - global.roundNum);
			global.summonTimeMod[1] -= 0.1 * sign(lastRound - global.roundNum);
		}
	}

	// Summon Enemies

	summontimer--;
	if (summontimer <= 0 and instance_number(obj_Enemy) < 10 and roundtimer >= room_speed*20) {
		if (global.enemyCRSpawned < global.roundChallengeRating) {
			var _inst = instance_create_layer(-96,64+5,"Instances",obj_Enemy);

			make_enemy(_inst);
		
			while (_inst.cr + global.enemyCRSpawned > global.roundChallengeRating) {
				make_enemy(_inst);
			}
			global.enemyCRSpawned += _inst.cr;
		}
		
		summontimer = room_speed*random_range(global.summonTimeMod[0],global.summonTimeMod[1])/2;
	}

	if (roundtimer < room_speed*20) {
		roundtimer++;
		if (keyboard_check_pressed(vk_space)) roundtimer = room_speed*20;
		//obj_Screens.currentScreen = 2;
	}
	//else obj_Screens.currentScreen = 1;

	if (roundtimer == room_speed*15) {
		audio_play_sound(snd_Warhorn,1,false);	
	}

}
else {
	sprite_set_speed(spr_Wheel, 0, spritespeed_framespersecond);
}

lastRound = global.roundNum;