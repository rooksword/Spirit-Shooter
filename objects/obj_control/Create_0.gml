/// @desc Initialize

#macro PROMO false
#macro Promo:PROMO true

#region Saving

sav = new SaveFile();
sav.load("");
sav.set_protection(SSAVE_PROTECTION.ENCRYPT);

//sav.set("level", array_length(obj_player.roster));

with obj_player
{
	array_push(guns, roster[0]);
	for (var i = 0; i < other.sav.get("level") - 1; i++;)
	{
		if i < array_length(roster) - 1 array_push(guns, roster[i + 1]);
	}
}

#endregion

audio_play_sound(mus_sewer, 10, true);

randomize();

alrm = 80;
coinspawn = -1;

black = 1;

pause = false;
callback = false;

score_lerp = 0;

display = false;