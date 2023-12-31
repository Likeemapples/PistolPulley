function EBuild(array) constructor {
	args = [];
	eHp = array[0].hp;
	eCr = array[0].cr;
	eId = array[0].enemyId;
	for (var i = 0; i < array_length(array); i++) {
		var arg = array[i];
		array_push(args,arg);
	}
}

function Enemy() constructor {
	spd = 5;
	hp = 15;
	legs = true;
	cr = 1;
	enemyId = EnemyType.normal;
	
	update = function() {}
	draw = function() {}
}

function Normal() : Enemy() constructor {
	spd = 0.125+random(0.125);
	hp = 2.5;
	legs = false;
	cr = 1;
	enemyId = EnemyType.normal;
	
	startclimb = false;
	destx = irandom_range(96+17,96+77)
	setup = false;
	update = function(me) {
		if (not setup) {
			me.x = irandom_range(96+17,96+77);
			me.y = 80;
		}
		setup = true;
		
		
		if (me.y > 69) me.y -= spd;
		else {
			if (me.x != destx) {
				me.x += -sign(me.x - destx);
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
	spd = 0.0625+random(0.0625);
	hp = 1.25;
	legs = false
	cr = 1;
	enemyId = EnemyType.wings;
	
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
	hp = 5;
	cr = 1;
	enemyId = EnemyType.legs;
	
	dir = 1;
	setup = false;
	update = function(me) {
		if (not setup) {	
			me.image_index = irandom(16)
			me.sprite_index = spr_Legs;
			me.y = 69;
			me.x = 96
		}
		setup = true;
		
		// Rise and Shine loser, its time to run
		if (global.enemyCRSpawned < global.roundChallengeRating) {
			if (me.x < 96+77) {
				if (me.image_index > 2 and me.image_index < 8) me.image_index = 9;
			} 
			// stand still 1/2, switch direction 1/2
			if (me.x <= 96+17) dir = 1;
			else if (me.x >= 96+77) dir = -1;
			
			me.image_xscale = -dir;
			if (me.image_index == 1) {
				if (irandom_range(0,1) == 1) me.x += spd * dir;
				else if (irandom_range(0,1) == 1) dir = -dir;
			}
			else if (me.image_index < 1 or me.image_index > 8) me.x += spd * dir;
		
			// Throw enemies
			with (me) {
				var _inst = instance_place(x,y,obj_Enemy);
				if (_inst != noone) {
					if (_inst.enemyId != EnemyType.legs and _inst.enemyId != EnemyType.buig) {
						_inst.y -= 1;
					}
				}
			}
		}
		else {
			// HOOF IT MAN! HOOF IT
			
			if (me.x > 96+47) dir = 1;
			else dir = -1;
			
			me.image_xscale = -dir;
			me.x += spd * dir;
			
			if (me.image_index > 1 and me.image_index < 8) me.image_index = 8;
			
			if (me.x < 96 or me.x > 96*2) instance_destroy(me);
		}
	}
}

function Buig() : Enemy() constructor {
	spd = 0.25;
	hp = 25;
	cr = 2;
	enemyId = EnemyType.buig;
	
	dir = 1;
	setup = false;
	update = function(me) {
		if (not setup) {			
			me.sprite_index = spr_Buig;
			me.image_xscale = -1;
			me.image_yscale = 1;
			me.y = 69-8;
			me.x = 96;
		}
		setup = true;

		if (me.x < 171) {
			me.x += spd;
		}
		else if (me.image_angle != 90) {
			me.image_angle += 1;
		}
		else {
			if (obj_Cannon.y > me.y-8) me.y += spd;
			else if (obj_Cannon.y < me.y-8) me.y -= spd;
		}
	}
}

function Howl() : Enemy() constructor {
	spd = 0.5;
	hp = 0.5;
	legs = false;
	cr = 2;
	enemyId = EnemyType.howl;
	
	startclimb = false;
	destx = irandom_range(96+17,96+77)
	setup = false;
	springTimer = room_speed/2;
	update = function(me) {
		if (not setup) {
			me.sprite_index = spr_Howl;
			me.image_xscale = 1;
			me.image_yscale = 1;
			me.x = irandom_range(96+17,96+77);
			me.y = 80;
		}
		setup = true;
		
		
		if (me.y > 69) me.y -= spd;
		else {
			if (me.x != destx) {
				me.x += -sign(me.x - destx);
				me.image_speed = 1;
				if (me.image_index > 1.9) {
					me.image_index = 0;
				}
			}
			else startclimb = true;

			if (startclimb) {
				if (springTimer > 0) {
					springTimer --;
					me.image_index = 2;
				}
				else {
					me.y -= spd;
					me.sprite_index = spr_HowlShoot;
					me.image_speed = 0;
				}
			}
		}
	}
}