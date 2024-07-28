/// @desc Spawn enemy

var _inst = instance_find(obj_spawnEnemy, irandom(instance_number(obj_spawnEnemy)));
with _inst
{
	var _enemy;
	if score < 10
	{
		_enemy = obj_enemyNormal;
	}
	else if score < 20
	{
		_enemy = choose(obj_enemyNormal, obj_enemyLarge);
	}
	else if score < 20
	{
		_enemy = choose(obj_enemyNormal, obj_enemyLarge, obj_enemyFloat);
	}
	else
	{
		_enemy = choose(obj_enemyNormal, obj_enemyLarge, obj_enemySpike);
	}
	
	instance_create_layer(x, y, "Instances", _enemy);	
}

alrm *= 0.999;
alarm[0] = alrm;