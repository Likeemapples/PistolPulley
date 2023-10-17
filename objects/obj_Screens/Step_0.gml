/// @desc ??

if (keyboard_check_pressed(vk_escape)) {
	global.paused = !global.paused;
}

var _pauseAnimationList = [obj_Enemy, obj_Querri, obj_Quimothy];
if (not global.paused) {
	
	
	for (var i = 0; i < array_length(_pauseAnimationList); i++) {
		with (_pauseAnimationList[i]) {
			image_speed = 1;
		}
	}
	
	if (keyboard_check_pressed(ord("A"))) {
		if (currentScreen > 0) {
			currentScreen -= 1;
		}
		audio_play_sound(snd_ScreenSlide,1,false);
	}
	else if (keyboard_check_pressed(ord("D"))) {
		if (currentScreen < 2) {
			currentScreen += 1;
		}
		audio_play_sound(snd_ScreenSlide,1,false);
	}
}
else {
	for (var i = 0; i < array_length(_pauseAnimationList); i++) {
		with (_pauseAnimationList[i]) {
			image_speed = 0;
		}
	}
}

if (viewx != currentScreen*96) {
	
	viewx += sign(currentScreen*96-viewx) * 2;
	
}

camera_set_view_pos(view_camera[0], viewx, 0);





