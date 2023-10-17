 
slotCount = 5;
ball = [];
image = [];

cooldowntimer = room_speed;
summontimer = room_speed/2;
roundtimer = room_speed*20;

enum enemyTypes {
	normal = 0,
	wings = 1,
	legs = 2,
	buig = 3
}

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
	
	switch (irandom_range(1,4)) {
		case 1:
			_inst.enemy = new EBuild([new Wings()]);
			array_push(summonedEnemies, enemyTypes.wings);
		break;
		case 2:
			_inst.enemy = new EBuild([new Normal()]);
			array_push(summonedEnemies, enemyTypes.normal);
		break;
		case 3:
			_inst.enemy = new EBuild([new Legs()]);
			array_push(summonedEnemies, enemyTypes.legs);
		break;
		case 4:
			if (find_in_array(summonedEnemies, enemyTypes.buig) == -1) {
				_inst.enemy = new EBuild([new Buig()]);
				array_push(summonedEnemies, enemyTypes.buig);
			}
			else {
				_inst.enemy = new EBuild([new Normal()]);
				array_push(summonedEnemies, enemyTypes.normal);
			}
		break;
	}
	_inst.hp = _inst.enemy.eHp;
	_inst.legs = _inst.enemy.eLegs;
	_inst.cr = _inst.enemy.eCr;
}