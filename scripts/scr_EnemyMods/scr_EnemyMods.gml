function EBuild(array) constructor {
	args = [];
	eHp = array[0].hp;
	eLegs = array[0].legs;
	for (var i = 0; i < array_length(array); i++) {
		var arg = array[i];
		array_push(args,arg);
	}
}

function Enemy() constructor {
	spd = 5;
	hp = 15;
	legs = false;
	
	update = function() {}
	draw = function() {}
}

function Normal() : Enemy() constructor {
	spd = 0.25;
	hp = 5;
	legs = false;
	
	startclimb = false;
	destx = irandom_range(96+17,96+77)
	setup = false;
	update = function(me) {
		if (not setup) {
			me.x = irandom_range(96+17,96+77);
			me.y = 80;
		}
		setup = true;
		
		
		if (me.y > 69) me.y --;
		else {
			if (me.x < destx) {
				me.x += 1;
				me.image_index = 0;
				me.image_speed = 0;
			}
			else startclimb = true;

			if (startclimb) {
				me.y -= spd;
				me.image_speed = 1;
				with (me) {
					animate_range(1,2);
				}
			}
		}
	}
}

function Wings() : Enemy() constructor {
	spd = 0.125;
	hp = 2.5;
	legs = false
	
	// Go left and right while slowly climbing up
	dir = 1;
	setup = false;
	update = function(me) {
		if (not setup) {
			me.sprite_index = spr_Wings;
			me.y = 55+random_range(0,-5);
			me.x = 96;
		}
		setup = true;
		me.x += 0.4 * dir;
		me.y -= spd;
		
		if (me.x <= 96+17) dir = 1;
		else if (me.x >= 96+77) dir = -1;
		
		if (irandom_range(1,100) == 1) {
			dir = dir*-1;
		}
		
	}
	
}

function Legs() : Enemy() constructor {
	spd = 0.125;
	hp = 10;
	legs = true;
	
	dir = 1;
	setup = false;
	update = function(me) {
		if (not setup) {			
			me.sprite_index = spr_Legs;
			me.y = 80;
			me.x = irandom_range(96+17,96+77);
		}
		setup = true;
		
		// Rise and Shine loser, its time to run
		if (me.y > 69) me.y --;
		else {
			// stand still 1/2, switch direction 1/2
			if (me.x <= 96+17) dir = 1;
			else if (me.x >= 96+77) dir = -1;
			
			me.image_xscale = -dir;
			if (me.image_index == 1) {
				if (irandom_range(0,1) == 1) me.x += spd * dir;
				else if (irandom_range(0,1) == 1) dir = -dir;
			}
			else if (me.image_index < 1 or me.image_index > 10) me.x += spd * dir;
		}
		
		// Throw enemies
		with (me) {
			var _inst = instance_place(x,y,obj_Enemy);
			if (_inst != noone) {
				if (_inst.legs == false) {
					_inst.y -= 1;
				}
			}
		}
	}
}