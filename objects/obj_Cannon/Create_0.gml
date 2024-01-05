 
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

