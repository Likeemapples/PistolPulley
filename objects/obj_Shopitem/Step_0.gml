
price = prices[image_index]*multiplier;
// Hovering
if (position_meeting(mouse_x, mouse_y, self) and not global.paused) {
	// Clicked on
	if (mouse_check_button_pressed(mb_any) and global.money >= price) {
		switch (image_index) {
			case 0:
				array_push(global.unlockedBalls,ballnum.querri);
				break;
			case 1:
				array_push(global.unlockedBalls,ballnum.big);
				break;
			case 2:
				array_push(global.unlockedBalls,ballnum.fire);
				break;
			case 3:
				array_push(global.unlockedBalls,ballnum.boomerang);
				break;				
		}
		global.money -= price;
		roll_shop()
	}
	
}

