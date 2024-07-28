function Ammo(_sprite, _speed, _damage, _penetrates, _homing) constructor
{
	sprite_index = _sprite; // Bullet sprite
	spd = _speed; // Speed of bullet
	damage = _damage; // Damage of bullet
	penetrates = _penetrates; // How many enemies to penetrate through
	homing = _homing; // How much to lerp direction towards enemy
}

function Gun(_ammo, _firerate, _fullauto, _sprite, _number, _direction, _dir_offset, _spread, _burst_number, _burst_delay, _charge, _colour, _sound) constructor
{
	ammo = _ammo; // Ammo type
	firerate = _firerate; // Weapon fire rate
	fullauto = _fullauto; // Shoot automatically
	sprite_index = _sprite; // Weapon sprite
	number = _number; // How many bullets to create
	direction = _direction; // If number > 0, direction = angle between bullets
	dir_offset = _dir_offset; // Direction offset
	spread = _spread; // Random spread on each bullet
	burst = {
		number: _burst_number, // How many bullets to create
		delay: _burst_delay // How long between bullets
	}
	charge = _charge; // How long to charge shot for
	image_blend = _colour;
	sound = _sound;
}