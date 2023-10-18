/// @desc ??

if (not global.paused) {
	
	for (var i = 0; i < array_length(ball.args); i++) {
		ball.args[i].update(self);	
	}
	
}

if (x <= 96 or x >= 96*2) instance_destroy(self);

damage(self);
