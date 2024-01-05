/// @desc ??

if (npc.image == 0) { 
	if (image_alpha > 0) { 
		image_alpha -= 0.01; 
	}
}
else { 
	image_index = npc.image; 
	if (image_alpha < 1) {
		image_alpha += 0.01;
	}
}

if (not global.paused) {

	if (obj_Screens.viewx == obj_Screens.currentScreen) { // If on screen 3
		// Text
		if (textIndex <= string_length(dialogue[dialogueIndex])) {
			text += string_char_at(dialogue[dialogueIndex], textIndex);
			textIndex++;
		}
	
		var _touchingYes = false;
		var _touchingNo = false;
		
		if (npc.image != 0) {
			// Yes button
			if (point_in_rectangle(
				mouse_x,mouse_y,
				16-(16/2),32-(11/2),
				16+sprite_get_width(spr_Buttons)/2,
				32+sprite_get_width(spr_Buttons)/2
			)) {
		
				_touchingYes = true;
				yesSize = 1
	
				if (mouse_check_button_pressed(mb_left)) {
				
					exchange();
				
				}
	
			}
			else {
				yesSize = 0
			}

			// No button
			if (point_in_rectangle(
					mouse_x,mouse_y,
					80-(16/2),32-(11/2),
					80+sprite_get_width(spr_Buttons)/2,
					32+sprite_get_width(spr_Buttons)/2
				)) {
			
				_touchingNo = true;
				noSize = 3
		
				if (mouse_check_button_pressed(mb_left)) {
					
					dialogue = [noThanks];
					text = "";
					textIndex = 1;
					dialogueIndex = 0;
				
					initNpc(new None(self));
					
				}
			}
			else {

				noSize = 2
			}
		}
	
		// Next line of dialogue
		if (not _touchingYes and not _touchingNo 
			and mouse_check_button_pressed(mb_any) 
			and dialogueIndex != array_length(dialogue)-1) 
		{
			text = "";
			textIndex = 1;
			dialogueIndex ++;
		}
	}
}



