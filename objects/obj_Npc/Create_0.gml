
enum Npc {
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

currentNpc = Npc.AmanStir;

cost = [];
allCosts = [
	[
	[Currency.Gold, 50],
	[Currency.Gold, 75]
	], // Aman Stir
	[
	[],
	[]
	], // Quobert
	[
	[],
	[]
	], // Qwest
	[
	[],
	[]
	] // Cisco
]

reward = [];
allRewards = [
	[
	[Currency.Hp, 1]
	], // Aman Stir
	[], // Quobert
	[], // Qwest
	[] // Cisco
]

text = "";
textIndex = 1;
dialogueIndex = 0;
dialogue = [];
allDialogue = [
	[
	["Hello there fellow human", string("Would you like {0} for {1}", reward, cost)],
	["Just a funky dude", "Totally a man, yep, uh huh"]
	], // Aman Stir
	["Mysterious", "Mm yess"], // Quobert
	["", ""], // Qwest
	["", ""], // Cisco
	["", ""] // Magic the clownening
]
