itemDescriptions = [
	" +Fighting \n +Falling \n -Pierce ", // Querri
	" +Damage \n -BallSpeed ", // Big
	" +BallSpeed \n -Damage \n +Fire ", // Fire
	" +Rebound ", // Boomerang
	" +Explosion \n Pierce->Radius ", // Bomb
	" +BallSpeed \n +Damage \n -Predictability ", // Laser
	" +Sticky \n -Speed " // Slime
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