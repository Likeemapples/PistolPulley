/// @description Insert description here
// You can write your code in this editor

if (speed != 0) {
	speed += -(sign(speed))/10;
	//if (speed < 1 and speed > -1) speed = 0; // this makes floaties
}

if (not global.paused) {
	y += 0.25;
	if (changex >= 5 or changex <= -5) xdir = -xdir;
	changex += xdir;
	x = originx + changex;

	if (irandom_range(0,4) == 0) {
		var _rand = irandom_range(0,array_length(colors)-1) 
		image_blend = colors[_rand];
	}
	if ((y - originy) > 10) {
		if (irandom_range(0,10) == 0) instance_destroy(self);
	}

	damage(self);
	
	if (place_meeting(x,y,obj_Floor)) {
		instance_destroy();
	}
	
}