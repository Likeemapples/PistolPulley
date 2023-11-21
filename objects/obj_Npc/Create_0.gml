text = "";
textIndex = 1;

npc = new AmanStir(self);

reward = npc.rewards[irandom(array_length(npc.rewards)-1)];
cost = npc.costs[irandom(array_length(npc.costs)-1)];

stringCost = string(cost[1]);

yesSize = 1;
noSize = 1;

switch (cost[0]) {
	case 0:
		stringCost += " Gold";
		break;
	case 1:
		stringCost += " Lives";
		break;
	case 2:
		stringCost += " Random Ball";
		break;
	case 3:
		stringCost += " Cursed Ball";
		break;
	case 4:
		stringCost += " Rounds";
		break;		
}

stringReward = string(reward[1]);

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

npc.dialogues = npc.dialogueSetup();

dialogue = npc.dialogues[irandom(array_length(npc.dialogues)-1)];
dialogueIndex = 0;