/// @description Insert description here
// You can write your code in this editor

originy = y;
originx = x;

changex = 0;
xdir = random_range(-0.25,0.25);

dmg = 2;
touched = [];


colors = [
	make_color_rgb(221,100,36), 
	make_color_rgb(250,70,22), 
	make_color_rgb(221,60,36)
];
image_blend = colors[0];