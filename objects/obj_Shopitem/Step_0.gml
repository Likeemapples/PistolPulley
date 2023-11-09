
price = prices[image_index]*multiplier;
// Hovering
if (position_meeting(mouse_x, mouse_y, self) and not global.paused) {
	// Clicked on
	if (mouse_check_button_pressed(mb_any) and global.money >= price) {

		array_push(global.unlockedBalls,image_index);

		global.money -= price;
		roll_shop()
	}
	
}

