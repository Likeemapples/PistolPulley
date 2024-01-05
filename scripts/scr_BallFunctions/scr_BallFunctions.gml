enum BallType {
	normal = 0,
	querri = 1,
	fire = 2,
	lightning = 3,
	bomb = 4,
	boomerang = 5,
	necroball = 6,
	pinball = 7,
	big = 8,
	slime = 9,
	rainball = 10
}

global.balls = [ // These are all the balls that have been made
	BallType.querri, BallType.fire, 
	BallType.bomb, BallType.boomerang, 
	BallType.big, BallType.rainball
]

global.unlockedBalls = []; // These are all the balls the player has unlocked

enum flag {
	inclusive = 0,
	trans = 1,
	nonbinary = 2,
	bi = 3,
	lesbian = 4,
	hetero = 5,
	omni = 6,
	genderfaunet = 7,
	aroace = 8
}

global.prideFlags = [
	[
	c_red, 
	make_color_rgb(255,153,51), 
	make_color_rgb(255,237,0),
	make_color_rgb(0,153,51),
	make_color_rgb(0,51,153),
	make_color_rgb(91,25,123)
	], // Default Pride Flag, 0
	[
	make_color_rgb(91,206,250),
	make_color_rgb(253,190,255),
	c_white,
	make_color_rgb(253,190,255),
	make_color_rgb(91,206,250)
	], // Trans, 1
	[
	make_color_rgb(255,245,41),
	c_white,
	make_color_rgb(134,62,196),
	make_color_rgb(34,34,34)
	], // Non-binary, 2
	[
	make_color_rgb(202,0,95),
	make_color_rgb(202,0,95),
	make_color_rgb(92,60,134),
	make_color_rgb(5,35,151),
	make_color_rgb(5,35,151)
	], // Bi, 3
	[
	make_color_rgb(213,45,0),
	make_color_rgb(255,154,84),
	make_color_rgb(254,255,249),
	make_color_rgb(210,98,160),
	make_color_rgb(163,2,96)
	], // Lesbian, 4
	[
	c_black,
	make_color_rgb(51,51,51),
	make_color_rgb(102,102,102),
	make_color_rgb(153,153,153),
	make_color_rgb(187,187,187),
	c_white
	], // Hetero, 5
	[
	make_color_rgb(255,155,205),
	make_color_rgb(255,83,190),
	make_color_rgb(37,0,70),
	make_color_rgb(103,95,255),
	make_color_rgb(140,165,255)
	], // Omni, 6
	[
	make_color_rgb(253,138,121),
	make_color_rgb(249,190,147),
	make_color_rgb(245,248,177),
	c_white,
	make_color_rgb(141,224,217),
	make_color_rgb(151,157,232),
	make_color_rgb(155,108,232)
	], // Genderfaunet, 7 Chosen by Sal - Slime
	[
	make_color_rgb(239,144,7),
	make_color_rgb(246,211,23),
	c_white,
	make_color_rgb(69,188,238),
	make_color_rgb(30,63,84)
	], //Aroace, 8
	[]
]

function make_random_ball() {
	// This is used in the cannon, it makes a random ball for the slots
	ball = [];
	image = [];
	
	array_push(ball, new Ball());
	
	for (var i = 0; i < slotCount; i++) {
		var _repeat = true;
		while (_repeat) {
			var _rand = irandom_range(0,10+(array_length(global.unlockedBalls)-1)); // One more in the hat
			if (_rand < 10) {
				array_push(ball, new Ball());
				array_push(image, BallType.normal+1); // Dont ask.
				_repeat = false;
			}
			else {
				if (find_in_array(image, global.unlockedBalls[_rand-10]+1) == -1) {
					array_push(image, global.unlockedBalls[_rand-10]+1);
					switch (global.unlockedBalls[_rand-10]) {
						case BallType.querri:
							array_push(ball, new Querri());
							break;
						case BallType.fire:
							array_push(ball, new Fire());
							break;
						case BallType.boomerang:
							array_push(ball, new Boomerang());
							break;
						case BallType.big:
							array_push(ball, new Big());
							break;
						case BallType.bomb:
							array_push(ball, new Bomb());
							break;
						case BallType.rainball:
							array_push(ball, new Rainball());
							break;
					}
					
					_repeat = false;
				}
			}
		}
	}
}