/// @desc ??

image_index = npc.image;



if (obj_Screens.viewx == obj_Screens.currentScreen) {
	if (textIndex <= string_length(dialogue[dialogueIndex])) {
		text += string_char_at(dialogue[dialogueIndex], textIndex);
		textIndex++;
	}
	
	if (mouse_check_button_pressed(mb_any) and not dialogueIndex == array_length(dialogue)-1) {
		text = "";
		textIndex = 1;
		dialogueIndex ++;
	}
}




