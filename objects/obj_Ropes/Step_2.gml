/// @desc ??

if (original) y = obj_Cannon.y-4;
else if (place_meeting(x,y,obj_Cannon)) instance_destroy(self);

if (yprevious != y) instance_create_layer(x,y,"Instances", obj_Ropes);




