enum NpcType {
	None = 0,
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
	WindowYouSpellMarius,
	Squid
}

global.availableNpcs = [NpcType.AmanStir, NpcType.Cisco]

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

function None(me) : Npc() constructor {
	image = NpcType.None;
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
			["Hello there fellow human", me.stringReward + " for " + me.stringCost]
		]
	});
	
	yesText = "\"Lol\" said the scorpion, \"Lmao\"";
	noText = "196.182.301.7";
}

function Cisco(me) : Npc() constructor {
	image = NpcType.Cisco;
	
	rewards = [
	[Currency.Rounds, 2],
	[Currency.Rounds, 1]
	];
	
	costs = [
	[Currency.Gold, 50]
	];
	
	dialogueSetup = method({me: me}, function() {
		return [
			["Cat", me.stringCost + ", bye bye " + me.stringReward]
		]
	});
	
	yesText = "k thanks";
	noText = "Krill issue";
}