text = "";
textIndex = 1;

function initNpc(_npc) {
	npc = _npc;
	if (_npc.image != 0) {
		
		reward = npc.rewards[irandom(array_length(npc.rewards)-1)];
		cost = npc.costs[irandom(array_length(npc.costs)-1)];

		thanks = npc.yesText;
		noThanks = npc.noText;
		notEnoughThanks = npc.poorText;
		stringCost = string(cost[1]);

		yesSize = 0;
		noSize = 2;

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
	}
}

function randomNpc() {
	switch global.availableNpcs[irandom_range(0, array_length(global.availableNpcs)-1)] {
		case NpcType.AmanStir:
			return new AmanStir(self);
			break;
		case NpcType.Cisco:
			return new Cisco(self);
			break;
		case NpcType.Quobert:
			return new Quobert(self);
			break;
	}
}

initNpc(randomNpc());

function exchange() {
	
	var _exchanged = false;
	
	// Costs
	switch (cost[0]) {
		case Currency.Gold:
			if (global.money >= cost[1]) {
				_exchanged = true;
				global.money -= cost[1];
			}
			break;
		case Currency.Hp:
			if (global.hp >= cost[1]) {
				_exchanged = true;
				global.hp -= cost[1];
				for (var i = 0; i < cost[1]; i++) {
					instance_destroy(instance_find(obj_Quimothy, irandom(instance_number(obj_Quimothy) - 1)));
				}
			}
			break;
		case Currency.Rounds:
			global.roundNum += cost[1];
			obj_Cannon.roundCheck = false;
			break;
	}
				
				
	// Rewards
	if (_exchanged) {
		switch (reward[0]) {
			case Currency.Gold:
				global.money += reward[1];
				break;
			case Currency.Hp:
				global.hp += reward[1];
				for (var i = 0; i < reward[1]; i++) {
					instance_create_layer(112, 16, "Instances", obj_Quimothy);
				}
				break;
			case Currency.Rounds:
				if (global.roundNum >= reward[1]) {
					global.roundNum -= reward[1];
					obj_Cannon.roundCheck = false;
				}
				else {
					global.roundNum = 0;
					obj_Cannon.roundCheck = false;
				}
				break;
		}
		dialogue = [thanks];
		text = "";
		textIndex = 1;
		dialogueIndex = 0;
					
		initNpc(new None(self));
	}
	else {
		dialogue = [notEnoughThanks];
		text = "";
		textIndex = 1;
		dialogueIndex = 0;
				
	}
}
