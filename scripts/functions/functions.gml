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
	room_restart();
	
	score = 0;
	audio_stop_all();
}

function NewCoin()
{
	var _inst = instance_find(obj_spawn, irandom(instance_number(obj_spawn) - 1));
	while coinspawn == _inst _inst = instance_find(obj_spawn, irandom(instance_number(obj_spawn) - 1));
	coinspawn = _inst;
	instance_create_layer(_inst.x, _inst.y, "Guns", obj_gun);
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