 
slotCount = 5;
ball = [];
image = [];

cooldowntimer = room_speed;
summontimer = room_speed*random_range(global.summonTimeMod[0],global.summonTimeMod[1]);
roundtimer = 0;

summonedEnemies = [];



function make_random_ball() {
	ball = [];
	image = [];
	
	for (var i = 0; i < slotCount; i++) {
		var _repeat = true;
		while (_repeat) {
			var _rand = irandom_range(0,9+array_length(global.unlockedBalls)); // One more in the hat
			if (_rand < 10) {
				array_push(ball, new Ball());
				array_push(image, ballnum.normal);
				_repeat = false;
			}
			else {
				if (find_in_array(image, global.unlockedBalls[_rand-10]) == -1) {
					array_push(image, global.unlockedBalls[_rand-10]);
					switch (global.unlockedBalls[_rand-10]) {
						case ballnum.querri:
							array_push(ball, new Querri());
							break;
						case ballnum.fire:
							array_push(ball, new Fire());
							break;
						case ballnum.boomerang:
							array_push(ball, new Boomerang());
							break;
						case ballnum.big:
							array_push(ball, new Big());
							break;
					}
					
					_repeat = false;
				}
			}
		}
	}
}

make_random_ball();

function make_enemy(_inst) {
	var _rand = irandom_range(0, array_length(global.summonableEnemies) - 1)
	switch (global.summonableEnemies[_rand]) {
		case enemytypes.normal:
			_inst.enemy = new EBuild([new Normal()]);
		break;
		case enemytypes.wings:
			_inst.enemy = new EBuild([new Wings()]);
		break;
		case enemytypes.legs:
			_inst.enemy = new EBuild([new Legs()]);
		break;
		case enemytypes.buig:
			if (find_in_array(summonedEnemies, enemytypes.buig) == -1) {
				_inst.enemy = new EBuild([new Buig()]);
				array_push(summonedEnemies, enemytypes.buig);
			}
			else {
				_inst.enemy = new EBuild([new Normal()]);
				array_push(summonedEnemies, enemytypes.normal);
			}
		break;
	}
	_inst.hp = _inst.enemy.eHp;
	_inst.enemyId = _inst.enemy.eId;
	_inst.cr = _inst.enemy.eCr;
}