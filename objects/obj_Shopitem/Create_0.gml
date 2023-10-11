itemDescriptions = [
	" Falls down and fights for you \n Fighting for a princess that doesn't exist ", // Querri
	" Very big \n Only second to you mother ", // Big
	" Rains fire on your enemies \n Non-OSHA compliant ", // Fire
	" Its a boomerang! \n Dont forget to duck! ", // Boomerang
	" Explodes. Pierce -> Radius \n Shouldn't it explode when we fire it? ", // Bomb
	" Major speed increase \n Not for use with felines ", // Laser
	" Slows down anything it touches \n League player ", // Slime
	" Occasional high damage rain \n Only an ally ", // Rainball 
	"  \n  ", // Pinball
	"  \n  ", // Necroball
	"  \n  ", // Wombo Comball
	"  \n  " // Ice Trail
]

image_index = array_length(itemDescriptions) - 1;
description = itemDescriptions[image_index];

shopitems = [inst_6E22E29, inst_6D875815, inst_1AFB15E5];

function roll_shop() {
	// Shopitems

	for (var i = 0; i < array_length(shopitems); i++) {
		shopitems[i].image_index = irandom_range(0,8);
	}
}