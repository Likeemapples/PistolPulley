/// @description Insert description here
// You can write your code in this editor
if (not global.paused) image_alpha -= 0.025;
if (image_alpha <= 0) instance_destroy(self);
damage(self);