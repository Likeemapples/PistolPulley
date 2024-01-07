 
slotCount = 5;
ball = [];
image = [];

cooldowntimer = room_speed;
summontimer = room_speed*random_range(global.summonTimeMod[0],global.summonTimeMod[1]);
roundtimer = room_speed*20;

lastRound = 0;
roundCheck = false;

summonedEnemies = [];

make_random_ball();

var lay_id = layer_get_id("Assets_1");
var spr_id = layer_sprite_get_id(lay_id, "graphic_23624226");
layer_sprite_index(spr_id, 0);

var _lay_id = layer_get_id("Background");
var _back_id = layer_background_get_id(_lay_id);
layer_background_blend(_back_id, make_color_rgb(113, 198, 232));