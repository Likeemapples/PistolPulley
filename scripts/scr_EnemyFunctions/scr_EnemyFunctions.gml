enum EnemyType {
	normal = 0,
	wings = 1,
	legs = 2,
	buig = 3,
	howl = 4
}

global.summonableEnemies = [EnemyType.normal];

function add_enemy(rnd, enemy) {
	if (global.roundNum == rnd) {
		array_push(global.summonableEnemies, enemy);
	}
	else if (global.roundNum < rnd) {
		var _id = find_in_array(global.summonableEnemies, enemy);
		if (_id != -1) {
			array_delete(global.summonableEnemies, _id, 1);
		}
	}
}

function make_enemy(_inst) {
	// Used in cannon, makes an enemy
	var _rand = irandom_range(0, array_length(global.summonableEnemies) - 1)
	switch (global.summonableEnemies[_rand]) {
		
		case EnemyType.normal:
			_inst.enemy = new EBuild([new Normal()]);
		break;
		
		case EnemyType.wings:
			_inst.enemy = new EBuild([new Wings()]);
		break;
		
		case EnemyType.legs:
			_inst.enemy = new EBuild([new Legs()]);
		break;
		
		case EnemyType.buig:
			// What the hell?
			if (find_in_array(summonedEnemies, EnemyType.buig) == -1) {
				_inst.enemy = new EBuild([new Buig()]);
				array_push(summonedEnemies, EnemyType.buig);
			}
			else {
				_inst.enemy = new EBuild([new Normal()]);
				array_push(summonedEnemies, EnemyType.normal);
			}
		break;
		
		case EnemyType.howl:
			_inst.enemy = new EBuild([new Howl()]);
		break;
	}
	_inst.hp = _inst.enemy.eHp;
	_inst.enemyId = _inst.enemy.eId;
	_inst.cr = _inst.enemy.eCr;
}