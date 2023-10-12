itemDescriptions = [
	" Falls down and fights for you ", // Querri
	" Very big ", // Big
	" Rains fire on your enemies ", // Fire
	" Its a boomerang! ", // Boomerang
	" Explodes. Pierce -> Radius ", // Bomb
	" Major speed increase ", // Laser
	" Slows down anything it touches ", // Slime
	" Turns enemies to your side ", // Necroball
	"  ", // Pinball
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

image_index = irandom_range(0, array_length(itemDescriptions) - 1);

shopitems = [inst_6E22E29, inst_6D875815, inst_1AFB15E5];

function roll_shop() {
	// Shopitems

	for (var i = 0; i < array_length(shopitems); i++) {
		shopitems[i].image_index = irandom_range(0,8);
	}
}