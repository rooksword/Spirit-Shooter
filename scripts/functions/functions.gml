global.gun_unlock = -1;

function Vec2(_x = 0, _y = 0) constructor
{
	x = _x;
	y = _y;
	
	function Lerp(_v, _acc)
	{
		x = lerp(x, _v.x, _acc);
		y = lerp(y, _v.y, _acc);
	}
	
	function Div(_t)
	{
		return new Vec2(x / _t, y / _t);	
	}
}

function Restart()
{
	if score > sav.get("score")
	{
		sav.set("score", score);
	}
		
	var _level = sav.get("level");
	with obj_player if _level < array_length(roster) global.gun_unlock = roster[_level].sprite_index;
		
	var _level = sav.get("level");
	if score / 2 >= _level and _level < array_length(obj_player.roster)
	{
		sav.set("level", _level + 1);
		room_goto(rm_unlock);
	}
	else room_restart();
		
	sav.save("");
	
	score = 0;
	audio_stop_all();
}

function NewCoin()
{
	var _inst = instance_find(obj_spawnCoin, irandom(instance_number(obj_spawnCoin) - 1));
	while coinspawn == _inst _inst = instance_find(obj_spawnCoin, irandom(instance_number(obj_spawnCoin) - 1));
	coinspawn = _inst;
	instance_create_layer(_inst.x, _inst.y, "Guns", obj_coin);
}

function Sleep(_time)
{
	with obj_control Pause();
	var _unpause = function()
	{
		with obj_control Pause();
	}
	call_later(_time, time_source_units_seconds, _unpause);
}

function Wrap(_val, _min, _max)
{
	_val = floor(_val);
	_min = floor(min(_min, _max));
	_max = floor(max(_min, _max));
	var range = _max - _min;

	return (((_val - _min) % range) + range) % range + _min;
}