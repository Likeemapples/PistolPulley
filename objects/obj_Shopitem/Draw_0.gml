
draw_self();

draw_set_halign(fa_middle)
draw_set_font(fnt_PerfectDos);

if (position_meeting(mouse_x, mouse_y, self) and not global.paused) {
	
	draw_set_color(c_white)
	draw_text_transformed(96*2.5,1,itemDescriptions[image_index],0.4,0.4,0);
	draw_set_color(c_gray);
	draw_text_transformed(96*2.5,string_height(itemDescriptions[image_index])/2,flavorText[image_index],0.4,0.4,0);
	draw_set_color(c_white)
}

if (global.money >= price) draw_set_color(c_green);
else draw_set_color(c_red);

draw_text_transformed(x,y+2,price,0.4,0.4,0);

draw_set_color(c_white);





