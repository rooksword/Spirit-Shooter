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

score_lerp = lerp(score_lerp, score, 0.05);

var _colours = [c_aqua, c_lime, c_orange, c_red, c_purple, c_fuchsia, c_blue];

var _v = (score_lerp / 25) mod 1;
var _i = _v * array_length(_colours);

var _col = merge_colour(_colours[_i], _colours[(_i < array_length(_colours) - 1) ? _i + 1 : 0], frac(_i));

_params.g_FractalNoiseTintColour = [color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255, 1];
_params.g_FractalNoiseOffset = [-obj_camera.cam.x, -obj_camera.cam.y];
fx_set_parameters(_fx_struct, _params);