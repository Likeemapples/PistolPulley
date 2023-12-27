text = "";
textIndex = 1;

function initNpc(_npc) {
	npc = _npc;
	if (_npc.image != 0) {
		
		reward = npc.rewards[irandom(array_length(npc.rewards)-1)];
		cost = npc.costs[irandom(array_length(npc.costs)-1)];

		thanks = npc.yesText;
		noThanks = npc.noText;
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

initNpc(new Cisco(self));

function exchange() {
	// Costs
	switch (cost[0]) {
		case Currency.Gold:
			global.money -= cost[1];
			break;
		case Currency.Hp:
			global.hp -= cost[1];
			for (var i = 0; i < cost[1]; i++) {
				instance_destroy(instance_find(obj_Quimothy, irandom(instance_number(obj_Quimothy) - 1)));
			}
			break;
		case Currency.Rounds:
			for (var i = 0; i < cost[1]; i++) {
				global.roundNum ++;
				global.enemyCRSpawned = 0;
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
						break;
					case 10:
						array_push(global.summonableEnemies, enemytypes.buig);
						break;
				
				}
		
				global.summonTimeMod[0] -= 0.1;
				global.summonTimeMod[1] -= 0.1;
			}
			break;
	}
				
				
	// Rewards
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
			for (var i = 0; i < reward[1]; i++) {
				if (global.roundNum > 0) {
					global.roundNum --;
					global.enemyCRSpawned = 0;
					global.roundChallengeRating = round(global.roundChallengeRating / 1.2);
	
					switch (global.roundNum) {
						case 0:
							array_delete(global.summonableEnemies, find_in_array(global.summonableEnemies, enemytypes.legs), 1);
							break;
						case 1:
							array_delete(global.summonableEnemies, find_in_array(global.summonableEnemies, enemytypes.wings), 1);
							break;
						case 4:
							array_delete(global.summonableEnemies, find_in_array(global.summonableEnemies, enemytypes.howl), 1);
							break;
						case 9:
							array_delete(global.summonableEnemies, find_in_array(global.summonableEnemies, enemytypes.buig), 1);
							break;
				
					}
		
					global.summonTimeMod[0] += 0.1;
					global.summonTimeMod[1] += 0.1;
				}
			}
			break;
	}
}