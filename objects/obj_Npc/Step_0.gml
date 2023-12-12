/// @desc ??

image_index = npc.image;

if (obj_Screens.viewx == obj_Screens.currentScreen) {
	if (textIndex <= string_length(dialogue[dialogueIndex])) {
		text += string_char_at(dialogue[dialogueIndex], textIndex);
		textIndex++;
	}
	
	var _flag1 = false;
	var _flag2 = false;
	
	// Yes button
	if (point_in_rectangle(
		mouse_x,mouse_y,
		16-(16/2),32-(11/2),
		16+sprite_get_width(spr_Buttons)/2,
		32+sprite_get_width(spr_Buttons)/2
	)) {
		
		_flag1 = true;
		if (yesSize < 1.5) yesSize += 0.1;
	
		if (mouse_check_button_pressed(mb_left)) {
			switch (cost[0]) {
				case 0:
					if (global.money >= cost[1]) {
						global.money -= cost[1]
						bought = true;
					}
					break;
				case 1:
					if (global.hp+1 >= cost[1]) {
						global.hp -= cost[1]
						bought = true;
					}
					break;
				case 2:
					stringCost += " Random Ball";
					break;
				case 3:
					stringCost += " Cursed Ball";
					break;
				case 4:
					for (var _i = 0; _i < cost[1]; _i++) {
						
						global.roundNum ++;
						global.roundChallengeRating = round(global.roundChallengeRating * 1.2);
						
						switch (global.roundNum) {
							case 1:
								array_push(global.summonableEnemies, enemytypes.legs);
								break;
							case 2:
								array_push(global.summonableEnemies, enemytypes.wings);
								break;
							case 5:
								array_push(global.summonableEnemies, enemytypes.howl);
							case 10:
								array_push(global.summonableEnemies, enemytypes.buig);
								break;
						}
						
						global.summonTimeMod[0] -= 0.1;
						global.summonTimeMod[1] -= 0.1;
						
					}
					
					bought = true;
					
					break;		
			}
			
			if (bought) {
				switch (reward[0]) {
					case 0:
						stringReward += " Gold";
						break;
					case 1:
						stringReward += " Life";
						break;
					case 2:
						stringReward += " Random Ball";
						break;
					case 3:
						stringReward += " Cursed Ball";
						break;
					case 4:
						stringReward += " Rounds";
						break;		
				}
			}
			
		}
	
	}
	else {
		if (yesSize > 1) yesSize -= 0.1;
	}

	// No button
	if (point_in_rectangle(
			mouse_x,mouse_y,
			80-(16/2),32-(11/2),
			80+sprite_get_width(spr_Buttons)/2,
			32+sprite_get_width(spr_Buttons)/2
		)) {
			
		_flag2 = true;
		if (noSize < 2) noSize += 0.1;
		
		if (mouse_check_button_pressed(mb_left)) {
			
		}
	}
	else {

		if (noSize > 1) noSize -= 0.1;
	}
	
	if (not _flag1 and not _flag2 and mouse_check_button_pressed(mb_any) and not dialogueIndex == array_length(dialogue)-1) {
		text = "";
		textIndex = 1;
		dialogueIndex ++;
	}
}




