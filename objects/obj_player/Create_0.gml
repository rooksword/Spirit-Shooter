/// @desc Variables

#region States

fsm = new SnowState("start");
fsm
	.add("start", {
		leave: function() {
			audio_play_sound(mus, 10, true);
			with obj_control
			{
				alarm[0] = alrm;
				
				NewCoin();
			}
		}
	})
	.add("pause", {
	})
	.add("movement", {
	    step: function() {
	        PlayerStep();
	    }
	});

#endregion

spd = 3.5;
jspd = 7;
jtype = 0; // 0 for player, 1 for enemy
grav = 0.33;

event_inherited(); // Inherit movement and animation variables

instance_create_layer(x, y, "Instances", obj_camera);

#region Inputs

key_right = 0;
key_left = 0;
key_jump = 0;
key_shoot = 0;

buffer = 10;

#endregion

#region Gun Animation

gun = new Vec2(x, y);
gun_acc = 0.1;
gun_dir = 1;
kick = 0;

#endregion

#region Combat variables

can_shoot = 0;
charge = 0;

bullet = new Ammo(spr_bullet, 12, 1, 0, 0);
bullet2 = new Ammo(spr_bullet, 12, 2, 0, 0);
bullet_rifle = new Ammo(spr_bullet, 10, 0.75, 0, 0);
bullet_smg = new Ammo(spr_bullet, 15, 0.75, 0, 0);
bullet_sniper = new Ammo(spr_bullet, 20, 2, -1, 0);
bullet_shotgun = new Ammo(spr_bullet, 8, 1, 0, 0);
plasma = new Ammo(spr_bulletPlasma, 10, 1, 0, 0.3);
chargeshot = new Ammo(spr_bulletCharge, 4, 3, -1, 0);

guns = [
	new Gun(bullet, 16, false, spr_pistol, 1, 0, 0, 5, 0, 0, 0, c_red, snd_pistol), // Pistol
	new Gun(bullet_rifle, 8, true, spr_rifle, 1, 0, 0, 7, 0, 0, 0, c_red, snd_rifle), // Rifle
	new Gun(bullet_smg, 4, true, spr_smg, 1, 0, 0, 12, 0, 0, 0, c_red, snd_smg), // SMG
	new Gun(bullet_sniper, 30, false, spr_sniper, 1, 0, 0, 0, 0, 0, 0, c_yellow, snd_sniper), // Sniper
	new Gun(bullet_shotgun, 25, true, spr_shotgun, 3, 15, 0, 5, 0, 0, 0, c_purple, snd_shotgun), // Shotgun
	new Gun(bullet2, 16, false, spr_pistol, 2, 180, 90, 5, 0, 0, 0, c_red, snd_pistol), // Dual pistols
	new Gun(plasma, 15, true, spr_plasma, 1, 0, 0, 5, 1, 10, 0, c_white, snd_plasma), // Plasma gun
	new Gun(bullet, 40, true, spr_rifleBurst, 1, 0, 0, 0, 2, 5, 0, c_blue, snd_burst), // Burst AR
	new Gun(chargeshot, 16, false, spr_rifleCharge, 1, 0, 0, 10, 2, 5, 30, c_orange, snd_charge), // Charge shot
	new Gun(bullet, 6, true, spr_machineGun, 3, 15, 0, 0, 0, 0, 0, c_green, snd_ultra) // Super machine gun
];

gun_index = 0;

#endregion