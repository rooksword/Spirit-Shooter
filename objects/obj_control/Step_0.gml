/// @desc Pause

function Pause(_display = false)
{
	display = _display;
	if !pause
	{
		pause = true;
		
		if instance_exists(obj_player) with obj_player fsm.change("pause");
		if instance_exists(obj_move)
		{
			with obj_move
			{
				imagespeed = image_speed;
				image_speed = 0;
			}
		}
	}
	else
	{
		pause = false;	
		
		if instance_exists(obj_player)
		{
			with obj_player fsm.change(fsm.get_previous_state());
			if callback with obj_player PlayerCorpse();
		}
		
		if instance_exists(obj_move)
		{
			with obj_move
			{
				image_speed = imagespeed;
			}
		}
	}	
}

if input_check_released("pause") and instance_exists(obj_player) and obj_player.fsm.get_current_state() != "start"
{
	Pause(true);
}

var _fx_struct = layer_get_fx("Smoke");
var _params = fx_get_parameters(_fx_struct);
var _green = make_color_rgb(29, 51, 20);
var _purple = make_color_rgb(49, 8, 81);
score_lerp = lerp(score_lerp, score, 0.05);
var _col = merge_color(_green, _purple, sin(score_lerp / 40));
_params.g_FractalNoiseTintColour = [color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255, 1];
fx_set_parameters(_fx_struct, _params);