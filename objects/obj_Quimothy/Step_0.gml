/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor
if (not global.paused) {

	if (not falling) {
		x += dir*walkspd;
		image_xscale = -sign(dir);

		if (x <= 96+17) {
			dir = 1;
		}
		else if (x >= 96+77) {
			dir = -1;
		}
	}
	else {
		image_yscale = -1;
		y += grav;
		grav += 0.1;
	}

}