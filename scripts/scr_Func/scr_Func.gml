global.hp = 3;
global.money = 0;

global.enemiesKilled = 0;
global.roundRequirement = 10;

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

