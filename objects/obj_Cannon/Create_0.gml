 
slotCount = 5;
ball = [];
image = [];

cooldowntimer = room_speed;
summontimer = room_speed/2;
roundtimer = room_speed*20;



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