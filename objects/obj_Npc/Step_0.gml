/// @desc ??

image_index = npc.image;

if (obj_Screens.viewx == obj_Screens.currentScreen) {
	if (textIndex <= string_length(dialogue[dialogueIndex])) {
		text += string_char_at(dialogue[dialogueIndex], textIndex);
		textIndex++;
	}
	
	var _flag1 = false;
	var _flag2 = false;
	
	if (point_in_rectangle(
		mouse_x,mouse_y,
		16-(16/2),32-(11/2),
		16+sprite_get_width(spr_Buttons)/2,
		32+sprite_get_width(spr_Buttons)/2
	)) {
		
		_flag1 = true;
		if (yesSize < 2) yesSize += 0.1;
	
		if (mouse_check_button_pressed(mb_left)) {
		
		}
	
	}
	else {
		if (yesSize > 1) yesSize -= 0.1;
	}


	if (point_in_rectangle(
			mouse_x,mouse_y,
			80-(16/2),32-(11/2),
			80+sprite_get_width(spr_Buttons)/2,
			32+sprite_get_width(spr_Buttons)/2
		)) {
			
		_flag2 = true;
		if (noSize < 2) noSize += 0.1;
	}
	else {
		if (noSize > 1) noSize -= 0.1;
	}
	
	if (not _flag1 and not _flag2 and not mouse_check_button_pressed(mb_any) and not dialogueIndex == array_length(dialogue)-1) {
		text = "";
		textIndex = 1;
		dialogueIndex ++;
	}
}




