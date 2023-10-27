enum NpcType {
	AmanStir, // (Not legless)
	Quobert, // Sacrifice Hp for a ball
	Qwest, // Dungeons
	Cisco, // Cat
	MagicTheClownening, // Random effect
	Refugee, // Pay money to gain 1 life
	Enchanter, // Enchant
	BusinessMan, // Not a cop - buy a random out of season ball
	Banker, // Invest
	Twizard, // Jump ahead rounds for a ball
	MonsterKid,
	TheBallSlicer,
	TrouterWilds,
	Hamilton,
	WindowYouSpellMarius
}

enum Currency {
	Gold,
	Hp,
	RandomBall,
	CursedBall,
	Rounds
}

function Npc() constructor {
	image = 0;
	
	rewards = [];
	costs = [];
	dialogues = [];
}

function AmanStir(me) : Npc() constructor {
	image = NpcType.AmanStir;
	
	rewards = [
	[Currency.Gold, 50],
	[Currency.Gold, 75]
	];
	
	costs = [
	[Currency.Hp, 1]
	];
	
	dialogueSetup = method({me: me}, function() {
		return [
			["Hello there fellow human", me.stringReward + " for " + me.stringCost],
			["Just a funky dude", "Totally a man, yep, uh huh"]
		]
	});
}