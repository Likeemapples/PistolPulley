itemDescriptions = [
	" Falls down and fights for you ", // Querri
	" Rains fire on your enemies ", // Fire
	"  ", // Lightning
	" Explodes. Damage -> Radius ", // Bomb
	" Its a boomerang! ", // Boomerang
	" Turns enemies to your side ", // Necroball
	" Bounces between enemies ", // Pinball
	" Very big ", // Big
	" Slows down anything it touches ", // Slime
	" Occasional high damage rain ", // Rainball 
	// The void
	" Major speed increase ", // Laser
	"  ", // Wombo Comball
	"  " // Snowball
]

flavorText = [
	" Following his dreams ", // Querri
	" Non-OSHA compliant ", // Fire
	"  ", // Lightning
	" Not your average IED ", // Bomb
	" Main cause of operator deaths ", // Boomerang
	"  ", // Necroball
	"  ", // Pinball
	" Only second to your mother ", // Big
	" League player ", // Slime
	" Only an ally ", // Rainball 
	// The void
	" Not for use with felines ", // Laser
	" Happy feet ", // Wombo Comball
	"  " // Snowball
]

prices = [
	100, // Querri
	100, // Big
	100, // Fire
	100, // Boomerang
	100, // Bomb
	100, // Laser
	100, // Slime
	100, // Necroball
	100, // Pinball
	100, // Rainball 
	100, // Wombo Comball
	100 // Snowball
]


multiplier = 1;
price = 0;

shopitems = [inst_6E22E29, inst_6D875815, inst_1AFB15E5];

function roll_shop() {
	// Shopitems
	// No seriously how the heck does this work
	var _randomBallChoice = global.balls[irandom(array_length(global.balls)-1)];
	images = [];
	for (var i = 0; i < array_length(shopitems); i++) {
		shopitems[i].image_index =  _randomBallChoice;
		while (find_in_array(images, shopitems[i].image_index) != -1) {
			var _randomBallChoice = global.balls[irandom(array_length(global.balls)-1)];
			shopitems[i].image_index = _randomBallChoice;
		}
		array_push(images, shopitems[i].image_index);
	}
}

roll_shop();