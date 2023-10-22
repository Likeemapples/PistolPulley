/// @desc ??

image_xscale = scale;
image_yscale = scale;

draw_self();

image_alpha -= 0.025;

if (image_alpha <= 0) instance_destroy(self);






