/// @desc Spawn enemy

var _inst = instance_find(obj_spawnEnemy, irandom(instance_number(obj_spawnEnemy)));
with _inst
{
	instance_create_layer(x, y, "Instances",
	choose(obj_enemyNormal, obj_enemyNormal, obj_enemyLarge, obj_enemySpike, obj_enemyFloat));	
}

alrm *= 0.999;
alarm[0] = alrm;