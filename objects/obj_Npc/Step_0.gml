/// @desc ??

image_index = currentNpc;

dialogue = allDialogue[currentNpc][0];

cost = allCosts[currentNpc][0];

reward = allRewards[currentNpc][0];

print(dialogue, reward, cost)
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




