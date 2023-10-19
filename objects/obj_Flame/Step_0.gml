/// @description Insert description here
// You can write your code in this editor

if (not global.paused) {
	y += 0.25;
	if (changex >= 5 or changex <= -5) xdir = -xdir;
	changex += xdir;
	x = originx + changex;

	if (irandom_range(0,4) == 0) {
		switch (irandom_range(0,2)) {
			case 0:
				image_blend = make_color_rgb(221,100,36);
			break;
			case 1:
				image_blend = make_color_rgb(250,70,22);
			break;
			case 2:
				image_blend = make_color_rgb(221,60,36);
			break;
		}
	}
	if ((y - originy) > 10) {
		if (irandom_range(0,10) == 0) instance_destroy(self);
	}

	damage(self);
	
	if (place_meeting(x,y,obj_Floor)) {
		instance_destroy();
	}
	
}