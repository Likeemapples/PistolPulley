randomize();

enum Season {
	wet,
	hot,
	wind,
	cold,
	none
}

function Build(array) constructor {
	args = [];
	bDmg = 0;
	bImg = 0;
	bSpd = 0;
	bPride = -1;
	bAlly = false;
	qSpd = 5;
	
	specialCount = 0;
	for (var i = 0; i < array_length(array); i++) {
		var arg = array[i];
		
		bSpd += arg.spd;
		if (arg.qSpd < qSpd) qSpd = arg.qSpd;
		bDmg += arg.dmg;
		if (arg.spd != 0) specialCount ++;
		if (arg.img == 1) { bImg = 1; }
		if (arg.pride != -1) bPride = arg.pride;
		if (arg.ally = true) bAlly = true;
		array_push(args,arg);
	}
	bSpd += 50;
	if (bSpd < 20) {
		bSpd = 20;
	}
}
//hi future isaac!
function Base() constructor {
	season = [Season.hot];
	pride = -1; // Passthrough
	ally = false;
	
	spd = 5;
	dmg = 0;
	img = 0;
	
	update = function() {}
	draw = function() {}
	onDamage = function() {}
	
	onQuerriDeath = function() {}
	
	qSpd = 5;
	qose = function() {}
}

function Ball() : Base() constructor {
	season = [Season.none];
	
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
	season = [Season.none];
	pride = global.prideFlags[flag.trans];
	
	spd = -5;
	dmg = 10;
	img = 1;
	
	grav = 0;
	falling = false;
	update = function(me) {
		if (array_length(me.touched) != 0 and not falling) {
			me.spd = 0;
			falling = true;
		}
		
		
		if (position_meeting(me.x,me.y+grav,obj_Floor)) {
			//falling = false;
			var _inst = instance_create_layer(me.x,me.y,"Instances",obj_Querri);
			_inst.ball = me.ball;
			_inst.dmg = me.dmg;
			_inst.walkspd = me.ball.qSpd;
			_inst.pride = me.pride;
			_inst.ally = me.ally;
			_inst.functions = [];
			for (var i = 0; i < array_length(me.ball.args); i++) {
				array_push(_inst.functions, me.ball.args[i]);
			}
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
		me.image_xscale = -sign(me.dir)*me.scale;//*-1; Do the thing
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
	season = [Season.hot];
	pride = global.prideFlags[flag.lesbian]; // Chosen by Oli
	
	spd = 10;
	dmg = -5;
	img = 0;
	
	update = function(me) {
		var _rand = irandom_range(1,1);
		if (_rand == 1) {
			var _inst = instance_create_layer(me.x,me.y,"Instances",obj_Flame);
			if (me.ally) {
				_inst.colors = me.pride;
				_inst.image_blend = me.pride[0];
			}
		}
	}
	
	draw = function(me) {
		me.image_blend = c_red;
	}
	
	flame = 0;
	qose = function(me) {
		me.image_blend = c_red;
		if (flame % 3 == 0) {
			_inst = instance_create_layer(me.x,me.y-(3*me.scale),"Instances",obj_Flame);
			if (me.ally) {
				_inst.colors = me.pride;
				_inst.image_blend = me.pride[0];
			}
		}
		flame ++;
	}
}

function Big() : Base() constructor {
	season = [Season.wind, Season.none];
	pride = global.prideFlags[flag.aroace]; // Chosen by mustard
	
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
	season = [Season.wind, Season.hot];
	pride = global.prideFlags[flag.bi]; // Chosen by Mattias
	
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

function Bomb() : Base() constructor {
	season = [Season.hot, Season.none];
	pride = global.prideFlags[flag.omni]; // Chosen by Ketchup (Rose)
	
	spd = 0;
	dmg = 1;
	img = 0;
	
	onDamage = function(me) {
		var _me = me;
		var _inst = instance_create_layer(me.x,me.y,"Instances",obj_Explosion);
		with (_inst) {
			scale = _me.dmg/20;
			dmg = _me.dmg;
			object = (_me.image_blend == c_red) ? obj_Flame : obj_Smoke;
		}
	}
	
	onQuerriDeath = function(me) {
		var _me = me;
		var _inst = instance_create_layer(me.x,me.y,"Instances",obj_Explosion);
		with (_inst) {
			scale = _me.dmg/20;
			dmg = _me.dmg
			object = (_me.image_blend == c_red) ? obj_Flame : obj_Smoke;
		}
	}
}

function Rainball() : Base() constructor {
	// Set ball season
	season = [Season.wet];
	
	// Pass through flag colors
	ally = true;
	
	// Ball stats
	spd = 0;
	dmg = 10;
	img = 0;
	
	xprev = 0;
	update = function(me) {
		//if (me.pride == -1) me.pride = global.prideFlags[flag.inclusive];
		me.pride = global.prideFlags[irandom(8)];
		for (var i = 0; i < array_length(me.pride); i++) {
			var _inst = instance_create_layer(me.x, me.y-(array_length(me.pride)/2)+i,"Instances",obj_Flag);
			_inst.image_blend = me.pride[i];
			if (abs(xprev-me.x)+0.25 < 100)	_inst.image_xscale = abs(xprev-me.x)+0.25;
			else _inst.image_xscale = abs(me.x-obj_Cannon.x)+0.25;
		}
		xprev = me.x;
	}
	
	qose = function(me) {
		for (var i = 0; i < array_length(me.pride); i++) {
			var _inst = instance_create_layer(me.x, me.y-(array_length(me.pride)/2)+i,"Instances",obj_Flag);
			_inst.image_blend = me.pride[i];
			_inst.image_xscale = abs(xprev-me.x)+0.25;
		}
		xprev = me.x;
	}
}