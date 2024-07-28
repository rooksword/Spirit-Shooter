/// @desc Movement

if obj_control.pause exit;

#region Movement

if instance_exists(obj_player)
{
	if knockback == 0 vel.x = lerp(vel.x, sign(obj_player.x - x) * spd, acc);
	else
	{
		vel.x = lerp(vel.x, 0, dec);
		knockback--;	
	}
	
	vel.y = sign(obj_player.y - y);
}

event_inherited();

function Hurt(_dmg)
{
	Sleep(0.05 * _dmg);
	
	knockback = knockback_max;
	hp -= _dmg;
	
	if hp <= 0 audio_play_sound(snd_death, 10, false);
	else audio_play_sound(snd_hit, 10, false);
}

if knockback == 0
{
	if hp <= 0
	{
		if random(1) > 0.8
		{
			audio_play_sound(snd_explosion, 10, false);
			
			obj_camera.shake = 10;
			instance_create_layer(x, y, "Instances", obj_explosion);
			with obj_smoke Smoke(other.x, other.y);
			
			Sleep(0.1);
		}
		
		var _inst = instance_create_layer(x, y, "Corpse", obj_enemyCorpse);
		_inst.vel.x = -dir * 8;
		_inst.dir = dir;
		_inst.bounce = true;
		_inst.sprite_index = spr_enemyFloatCorpse;
		instance_destroy();
	}
	
	if place_meeting(x, y, obj_bullet)
	{
		var _inst = instance_place(x, y, obj_bullet);
		if ds_list_find_index(_inst.hit, id) == -1
		{
			with obj_blood DrawBlood(other.x, other.y);
		
		    vel.y = -jspd;
			vel.x = knockback_force * sign(x - _inst.x);
			Hurt(_inst.damage);
			
			with _inst
			{
				ds_list_add(hit, other.id);
				if penetrates != -1 and ds_list_size(hit) > penetrates BulletDestroy()
			}
		}
	}
	
	if place_meeting(x, y, obj_explosion)
	{
		vel.y = -jspd;
		vel.x = knockback_force * dir;
		Hurt(2);
	}
}