 
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
		while _repeat {
			
			var _rand = irandom_range(1,20);
			
			if (_rand == 1 and find_in_array(image, 2) == -1) {
				array_push(ball, new Ball());
				array_push(ball, new Querri());
			
				array_push(image, 2);
				_repeat = false;
			}
			else if (_rand == 2 and find_in_array(image, 3) == -1) {
				array_push(ball, new Ball());
				array_push(ball, new Fire());
			
				array_push(image, 3);
				_repeat = false;
			}
			else if (_rand == 3 and find_in_array(image, 8) == -1) {
				array_push(ball, new Ball());
				array_push(ball, new Big());
			
				array_push(image, 8);
				_repeat = false;
			}
			else if (_rand == 4 and find_in_array(image, 4) == -1) {
				array_push(ball, new Ball());
				array_push(ball, new Boomerang());
			
				array_push(image, 4);
				_repeat = false;
			}
			else {
				array_push(ball, new Ball());
				
				array_push(image, 1);
				_repeat = false;
			}
			
		}
	}
}

make_random_ball();