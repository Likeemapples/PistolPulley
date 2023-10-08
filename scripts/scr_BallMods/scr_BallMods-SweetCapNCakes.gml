randomize();

function Build(me) constructor {
	args = [];
	bDmg = 0;
	bImg = 0;
	bSpd = argument[1].spd;
	for (var i = 1; i < argument_count; i++) {
		var arg = argument[i];
		if (arg.spd < bSpd) bSpd = arg.spd;
		bDmg += arg.dmg;
		if (arg.img == 1) { bImg = 1; print("querri"); }
		array_push(args,arg);
	}
	me.image_index = bImg;
}

function Base() constructor {
	spd = 5;
	dmg = 0;
	img = 0;
	update = function() {}
	draw = function() {}
}

function Ball(me) : Base() constructor {
	spd = 5;
	dmg = 10;
	img = 0;
	
	update = method({me: me, spd: spd}, function() {
		me.x -= me.spd;
	});
	
	draw = method({me: me}, function() {
		me.draw_self();
	});
}

function Querri() : Base() constructor {
	spd = 2;
	dmg = 20;
	img = 1;
}