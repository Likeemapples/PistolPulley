/// @description Insert description here
// You can write your code in this editor
if (not global.paused) image_alpha -= 0.0125;
dmg = image_alpha/3;
//image_alpha = 0.1;
//y += irandom_range(-1,1)/20
if (image_alpha <= 0) instance_destroy(self);
damage(self);