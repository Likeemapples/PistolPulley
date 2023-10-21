/// @desc ??

dmg = 10;
touched = [];

setup = false;


for (_rand = irandom_range(20,40); _rand > 0; _rand--) {
	var _inst = instance_create_layer(x+random_range(-2,2), y+random_range(-2,2), "Instances", obj_Smoke);
	with (_inst) {
		direction = point_direction(x,y,other.x,other.y);
		speed = -random_range(1,2);
	}
}

scale = 1;






