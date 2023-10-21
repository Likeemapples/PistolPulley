itemDescriptions = [
	" Falls down and fights for you ", // Querri
	" Very big ", // Big
	" Rains fire on your enemies ", // Fire
	" Its a boomerang! ", // Boomerang
	" Explodes. Pierce -> Radius ", // Bomb
	" Major speed increase ", // Laser
	" Slows down anything it touches ", // Slime
	" Turns enemies to your side ", // Necroball
	" Bounces between enemies ", // Pinball
	" Occasional high damage rain ", // Rainball 
	"  ", // Wombo Comball
	"  " // Snowball
]

flavorText = [
	" Following his dreams ", // Querri
	" Only second to your mother ", // Big
	" Non-OSHA compliant ", // Fire
	" Main cause of operator deaths ", // Boomerang
	" Not your average IED ", // Bomb
	" Not for use with felines ", // Laser
	" League player ", // Slime
	"  ", // Necroball
	"  ", // Pinball
	" Only an ally ", // Rainball 
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
	var _rand = irandom_range(0,3);
	images = [];
	for (var i = 0; i < array_length(shopitems); i++) {
		shopitems[i].image_index =  _rand;
		while (find_in_array(images, shopitems[i].image_index) != -1) {
			var _rand = irandom_range(0,4);
			shopitems[i].image_index = _rand;
		}
		array_push(images, shopitems[i].image_index);
	}
}

roll_shop();