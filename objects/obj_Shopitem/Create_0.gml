itemDescriptions = [
	" Falls down and fights for you ", // Querri
	" Very big ", // Big
	" Rains fire on your enemies ", // Fire
	" Its a boomerang! ", // Boomerang
	" Explodes. Pierce -> Radius ", // Bomb
	" Major speed increase ", // Laser
	" Slows down anything it touches ", // Slime
	" Turns enemies to your side ", // Necroball
	" Bouces between enemies ", // Pinball
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
	200, // Fire
	100, // Boomerang
	1000, // Bomb
	1000, // Laser
	1000, // Slime
	1000, // Necroball
	1000, // Pinball
	1000, // Rainball 
	1000, // Wombo Comball
	1000 // Snowball
]

shopitems = [inst_6E22E29, inst_6D875815, inst_1AFB15E5];

function roll_shop() {
	// Shopitems
	images = [];
	for (var i = 0; i < array_length(shopitems); i++) {
		shopitems[i].image_index = irandom_range(0,8);
		while (find_in_array(images, shopitems[i].image_index) != -1) {
			shopitems[i].image_index = irandom_range(0,8);
		}
		array_push(images, shopitems[i].image_index);
	}
}

roll_shop();