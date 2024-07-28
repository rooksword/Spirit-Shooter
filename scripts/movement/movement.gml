function MoveCollision()
{
	collision = false;
	if place_meeting(x + vel.x, y, obj_wall)
	{
	    var _yplus = 0;
	    while place_meeting(x + vel.x, y - _yplus, obj_wall) and _yplus <= abs(2 * vel.x) _yplus++;
		
	    if place_meeting(x + vel.x, y -_yplus, obj_wall)
	    {
	        while !place_meeting(x + sign(vel.x), y, obj_wall) x += sign(vel.x);
			collision = true;
	        if !bounce or (bounce and vel.x < 0.01) vel.x = 0;
			else vel.x *= -0.8;
	    }
	    else y -= _yplus;
	}
	x += vel.x;
 
	if !place_meeting(x, y, obj_wall) and vel.y >= 0 and place_meeting(x, y + 2 + abs(vel.x), obj_wall)
	{
		while !place_meeting(x, y + 1,obj_wall) y++;
	}
 
	if place_meeting(x, y + vel.y, obj_wall)
	{
	    while !place_meeting(x, y + sign(vel.y), obj_wall)
	    {
	        y += sign(vel.y);
	    }
	    if !bounce or (bounce and vel.y < 0.01) vel.y = 0;
		else vel.y *= -0.4;
	}
	y += vel.y;
}