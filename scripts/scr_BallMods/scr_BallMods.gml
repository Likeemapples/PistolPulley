randomize();

function Build(array) constructor {
	args = [];
	bDmg = 0;
	bImg = 0;
	bSpd = 0;
	qSpd = 5;
	
	specialCount = 0;
	for (var i = 0; i < array_length(array); i++) {
		var arg = array[i];
		
		bSpd += arg.spd;
		print(bSpd, "Modifier")
		if (arg.qSpd < qSpd) qSpd = arg.qSpd;
		bDmg += arg.dmg;
		if (arg.spd != 0) specialCount ++;
		if (arg.img == 1) { bImg = 1; }
		array_push(args,arg);
	}
	print(bSpd, "Final Modifier")
	bSpd += 50;
	print(bSpd, "Base")
	if (bSpd < 20) bSpd = 20;
	//bSpd = bSpd / (specialCount + 1);
	//print(bSpd, "Averaged")
}
//hi future isaac!
function Base() constructor {
	spd = 5;
	dmg = 0;
	img = 0;
	
	update = function() {}
	draw = function() {}
	
	qSpd = 5;
	qose = function() {}
}

function Ball() : Base() constructor {
	spd = 0;
	dmg = 0;
	img = 0;
	
	dir = 1;
	update = function(me) {
		var _dt = delta_time / 1000000;
		me.x -= (me.spd*_dt) * dir;		
	}	
}

function Querri() : Base() constructor {
	spd = -5;
	dmg = 10;
	img = 1;
	
	grav = 0;
	falling = false;
	update = function(me) {
		if (array_length(me.touched) != 0) {
			me.spd = 0;
			falling = true;
		}
		
		if (position_meeting(me.x,me.y+grav,obj_Floor)) {
			falling = false;
			var _inst = instance_create_layer(me.x,me.y,"Instances",obj_Querri);
			_inst.ball = me.ball;
			_inst.dmg = me.dmg;
			_inst.walkspd = me.ball.qSpd;
			instance_destroy(me);
		}
		if (falling) {
			grav += 0.1;
			me.y += grav;
		}
	}
	

	qSpd = 1;
	qose = function(me) {
		me.x += me.dir;
		me.image_xscale = -sign(me.dir)*me.scale;
		me.image_yscale = me.scale;
		
		if (me.x <= 96+16) {
			me.dir = abs(me.walkspd);
		}
		else if (me.x >= 96+80) {
			me.dir = -abs(me.walkspd);
		}
	}
}

function Fire() : Base() constructor {
	spd = 10;
	dmg = -5;
	img = 0;
	
	update = function(me) {
		var _rand = irandom_range(1,1);
		if (_rand == 1) {
			instance_create_layer(me.x,me.y,"Instances",obj_Flame);
		}
	}
	
	draw = function(me) {
		me.image_blend = c_red;
	}
	
	flame = 0;
	qose = function(me) {
		me.image_blend = c_red;
		if (flame % 3 == 0) {
			instance_create_layer(me.x,me.y-(3*me.scale),"Instances",obj_Flame);
		}
		flame ++;
	}
}

function Big() : Base() constructor {
	spd = -30;
	dmg = 20;
	img = 0;
	
	draw = function(me) {
		me.image_xscale = 3;
		me.image_yscale = 3;
	}
	
	qSpd = 0.5;
	setup = false;
	qose = function(me) {
		if (not setup) {
			me.scale *= 3;
			setup = true;
		}
	}
	
}
	
function Boomerang() : Base() constructor {
	spd = -20;
	dmg = 2.5;
	img = 0;
	
	maxSpd = 0;
	setup = false;
	update = function(me) {
		if (not setup) {
			maxSpd = me.spd;
			setup = true;
		}
		me.image_angle += 10;
		if (me.x < 96+30) {
			if (me.spd != -maxSpd) me.spd -= maxSpd/16;
		}
	}
}
