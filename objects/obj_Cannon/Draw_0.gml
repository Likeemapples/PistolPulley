/// @desc ??
depth += 10;
draw_self();
draw_healthbar(x+4,y-7,x+16,y-5,cooldowntimer,c_white,c_white,c_white,0,false,true);
depth -= 10;
for (var i = 0; i < array_length(image); i++) {
	draw_sprite(spr_Slot,0,96+1.5,15+(i*9));
	draw_sprite(spr_Slot,image[i],96+1.5,15+(i*9));
	//print(image, array_length(image))
}

if (roundtimer < room_speed * 20) {
	draw_set_color(c_white)
	draw_text_transformed(96*1.5,1,string(21-ceil(((roundtimer/room_speed*20)/2)/10)),0.4,0.4,0);
}