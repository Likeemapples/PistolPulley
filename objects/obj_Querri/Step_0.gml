/// @description Insert description here
// You can write your code in this editor

if (not global.paused) {
	for (var i = 0; i < array_length(ball.args); i++) {
		ball.args[i].qose(self);	
	}
	deathtimer--;
	if (deathtimer <= 0) instance_destroy(self);
}

if (not place_meeting(x,y+1,obj_Floor)) {
	y += 1;
}
if (place_meeting(x,y,obj_Floor)) {
	y -= 1;
}

damage(self);

