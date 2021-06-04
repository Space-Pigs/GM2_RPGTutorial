/// @description Insert description here
// You can write your code in this editor

if(instance_exists(follow))
{
	xDest = follow.x;
	yDest = follow.y;
}

var _camFollowSpeed = 1;

x += (xDest - x) / _camFollowSpeed;
y += (yDest - y) / _camFollowSpeed;

x = clamp(x, halfWidth, room_width - halfWidth);
y = clamp(y, halfHeight, room_height - halfHeight);

x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - (shakeMagnitude/shakeLength));

camera_set_view_pos(cam, x - halfWidth, y - halfHeight);