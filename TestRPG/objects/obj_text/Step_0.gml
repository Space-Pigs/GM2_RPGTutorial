lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

if(keyboard_check_pressed(vk_space))
{
	var _msgLen = string_length(textContent);
	if(textProgress >= _msgLen)
	{
		instance_destroy();
		if(instance_exists(obj_textQueued))
		{
			with(obj_textQueued) ticket--;
		}
		else
		{
			with(obj_player)
			{
				state = lastState;
			}
		}
	}
	else if(textProgress > 2)
	{
		textProgress = _msgLen;
	}
}