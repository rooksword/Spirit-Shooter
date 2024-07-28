/// @desc Collect

scale.Lerp(new Vec2(1, 1), 0.1);
image_xscale = scale.x;
image_yscale = scale.y;

if place_meeting(x, y, obj_player) and flash < 0
{
	obj_player.gun_index = gun;
	
	audio_play_sound(snd_coin, 10, false);
	
	with obj_control
	{
		NewCoin();
	}
	
	score++;
	flash = 10;
}

if (flash-- == 0) instance_destroy();