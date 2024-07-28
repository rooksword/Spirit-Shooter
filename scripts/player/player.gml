function PlayerInput()
{
	key_right = input_check("right");
	key_left = -input_check("left");
	key_jump += buffer * input_check_pressed("up");
	if key_jump > 0 key_jump--;
	
	var _gun = guns[gun_index];
	
	if _gun.charge > 0
	{
		key_shoot = input_check_released("shoot");
	}
	else if _gun.fullauto
	{
		key_shoot = input_check("shoot");
	}
	else
	{
		key_shoot = input_check_pressed("shoot");
	}
}

function PlayerMovement()
{
	#region Calculate velocity
	
	move = key_right + key_left; // -1 = left, 0 = still, 1 = right
	if sign(mouse_x - x) != 0 dir = sign(mouse_x - x); // Set dir
	var _m = key_shoot and move == dir ? 0.8 : 1.2; // Speed multiplyer
	var _acc = (move != 0) ? acc : dec; // Effective acceleration
	vel.x = lerp(vel.x, move * (spd * _m), _acc);

	if vel.y < vel_max vel.y += grav; // Gravity
	vel.y -= (mouse_y > y) * key_shoot * 0.1; // Knockback into air
	
	// Variable jump height
	
	if !place_meeting(x, y + 1, obj_wall)
	{
		if vel.y < 0 and !input_check("up") and jtype == 0
		{
			vel.y *= 0.7;	
		}
	}
	
	#endregion
	
	#region Jumping
	
	function Jump(_type)
	{
		audio_play_sound(snd_jump, 10, false);
	    vel.y = -jspd;
	    key_jump = 0;
		onground = -1;
		jtype = _type;
	}

	if place_meeting(x, y, obj_enemy) and vel.y > 0
	{
		var _inst = instance_place(x, y, obj_enemy);
		if _inst.object_index != obj_enemySpike
		{
			if y < _inst.y - 2
			{
				with _inst
				{
					if knockback == 0
					{
						Hurt(1);
					}
				}
				Jump(1);
			}
		}
	}
	else if place_meeting(x, y + 1, obj_wall)
	{	
		if onground < onground_max
		{
			audio_play_sound(snd_land, 10, false);
		
			scale -= scale_h;
			onground = true;	
		}
	
		onground = onground_max;
	
	    if key_jump > 0 Jump(0);
	}
	else
	{
		onground--;
		if onground >= 0
		{
			if key_jump > 0
			{
				audio_play_sound(snd_jump, 10, false);
		
		        vel.y = -jspd;
		
				onground = -1;	
			}
		}
	}
	
	#endregion
}

function Shoot(_gun)
{
	var _p = 0.2;
	audio_play_sound(_gun.sound, 10, false, 1, 0, 1 + random_range(-_p, _p));
	
	var _len = sprite_get_width(_gun.sprite_index) - sprite_get_xoffset(_gun.sprite_index);
	for (var i = 0; i < _gun.number; i++;)
	{
		var _dir = direction // Mouse direction
		+ (_gun.direction * i) // Angle between bullets
		- ((_gun.number - 1) * (_gun.direction / 2)) // Offset back to middle
		+ _gun.dir_offset;
			
		var _inst = instance_create_layer(x + lengthdir_x(_len, _dir), y + lengthdir_y(_len, _dir), "Instances", obj_bullet);
			
		_inst.sprite_index = _gun.ammo.sprite_index;
			
		_inst.image_angle =
		_dir
		+ random_range(-_gun.spread, _gun.spread); // Add random spread
			
		_inst.image_blend = _gun.image_blend;
			
		_inst.spd = _gun.ammo.spd;
		_inst.damage = _gun.ammo.damage;
		_inst.penetrates = _gun.ammo.penetrates;
		_inst.homing = _gun.ammo.homing;
	}
}

function PlayerCombat()
{
	var _gun = guns[gun_index];
	
	direction = point_direction(x, y, mouse_x, mouse_y);

	gun.Lerp(new Vec2(x, y), gun_acc);
	gun_dir = sign(mouse_y - y);

	if can_shoot > 0 can_shoot--;
	else if key_shoot
	{
		if _gun.charge == 0 or charge > _gun.charge
		{
			obj_camera.shake = 5;
		
			Shoot(_gun);
			var _shoot = function()
			{
				Shoot(guns[gun_index]);	
			}
			
			if _gun.burst.number > 0
			{
				var _ts = time_source_create(time_source_game, _gun.burst.delay, time_source_units_frames, _shoot, [], _gun.burst.number);
				time_source_start(_ts);
			}
			
			vel.x -= lengthdir_x(_gun.firerate / 4, direction); // Knockback
		}
		
		charge = 0;
		can_shoot = _gun.firerate;
	}
	
	if input_check("shoot")
	{
		charge++;
	}
}

function PlayerDeath()
{
	if place_meeting(x, y, obj_enemy)
	{
		var _inst = instance_place(x, y, obj_enemy);
		if (y >= _inst.y - 2 or _inst.object_index == obj_enemySpike) and _inst.hp > 0
		{
			audio_play_sound(snd_explosion, 10, false);
			
			knockback = 10;
			Sleep(0.5);
			obj_control.callback = true;
		}
	}	
}

function PlayerCorpse()
{
	var _inst = instance_place(x, y, obj_enemy);
	var _corpse = instance_create_layer(x, y, "Corpse", obj_playerCorpse);
	_corpse.vel.x = dir * 12;
	_corpse.vel.y = -4;
	_corpse.dir = dir;
	_corpse.bounce = true;
	
	instance_destroy();	
}

function PlayerStep()
{
	PlayerInput();
	PlayerMovement();

	event_inherited(); // Collision and animation reset

	x = clamp(x, sprite_width / 2, room_width - sprite_width / 2);
	y = clamp(y, sprite_height / 2, room_height - sprite_height  / 2);

	// Animation

	if abs(vel.x) > 0.3 sprite_index = spr_playerRun;
	else sprite_index = spr_playerIdle;

	PlayerCombat();

	PlayerDeath();	
}