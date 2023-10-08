/// @desc ??
depth += 10;
draw_self();
draw_healthbar(x+4,y-7,x+16,y-5,cooldowntimer,c_white,c_white,c_white,0,false,true);
depth -= 10;
for (var i = 0; i < array_length(image); i++) {
	draw_sprite(spr_Slot,0,96+1.5,15+(i*9));
	draw_sprite(spr_Slot,image[i],96+1.5,15+(i*9));
}
