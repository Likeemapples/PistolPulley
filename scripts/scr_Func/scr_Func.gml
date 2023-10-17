global.hp = 3;
global.money = 50;

enum ballnum {
	
	normal = 1,
	querri = 2,
	fire = 3,
	boomerang = 4,
	lightning = 5,
	bomb = 6,
	slime = 7,
	big = 8
	
}
global.unlockedBalls = [];

enum enemytypes {
	normal = 0,
	wings = 1,
	legs = 2,
	buig = 3
}
global.summonableEnemies = [enemytypes.normal];
global.summonTimeMod = 2;

global.enemyCRSpawned = 0;
global.roundChallengeRating = 10;
global.roundNum = 0;


global.paused = false;

function print() {
    var _str = "";

    for (var i = 0; i < argument_count; i ++)
    {
        _str += string(argument[i]) + ", ";
    }

    show_debug_message(_str);
}

function animate_range(min,max) {
	if (image_index < min) {image_index = min};
	if (image_index > max + 0.99) {image_index = min};
}

function find_in_array(array,id) {
	for (var i = 0; i < array_length(array); i++) {
		if (array[i] == id) {
			return i;
		}
	}
	return -1;
}

