/// @desc ??

viewx = 96;

enum screen {
	generator = 0,
	castle = 1,
	shop = 2
}

currentScreen = screen.castle;

draw_tasks = []; // [x, y, value, timer]


surf = surface_create(480, 360);
global.text = surface_create(480, 360);
