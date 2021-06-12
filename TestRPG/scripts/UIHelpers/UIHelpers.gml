function NineSliceBoxStretched(sprite, x1, y1, x2, y2, spriteIndex)
{
	var _size = sprite_get_width(sprite) / 3;
	var _w = x2 - x1;
	var _h = y2 - y1;
	
	draw_sprite_part_ext(sprite, spriteIndex, _size, _size, 1, 1, x1+_size, y1+_size, _w-(_size*2), _h-(_size*2), c_white, 1);
	
	draw_sprite_part(sprite, spriteIndex, 0, 0, _size, _size, x1, y1);
	
	draw_sprite_part(sprite, spriteIndex, _size*2, 0, _size, _size, x1+_w-_size, y1);
	
	draw_sprite_part(sprite, spriteIndex, 0, _size*2, _size, _size, x1, y1+_h-_size);
	
	draw_sprite_part(sprite, spriteIndex, _size*2, _size*2, _size, _size, x1+_w-_size, y1+_h-_size);
	
	draw_sprite_part_ext(sprite, spriteIndex, 0, _size, _size, 1, x1, y1+_size, 1, _h-(_size*2), c_white, 1);
	draw_sprite_part_ext(sprite, spriteIndex, _size*2, _size, _size, 1, x1+_w-_size, y1+_size, 1, _h-(_size*2), c_white, 1);
	draw_sprite_part_ext(sprite, spriteIndex, _size, 0, 1, _size, x1+_size, y1, _w-(_size*2), 1, c_white, 1);
	draw_sprite_part_ext(sprite, spriteIndex, _size, _size*2, 1, _size, x1+_size, y1+_h-(_size), _w-(_size*2), 1, c_white, 1);
}


function NewTextBox()
{
	var _obj;
	if(instance_exists(obj_text))
	{
		_obj = obj_textQueued;
	}
	else
	{
		_obj = obj_text;
	}
	with(instance_create_layer(0,0,"Instances", _obj))
	{
		textContent = argument[0];
		if(instance_exists(other))
		{
			originInstance = other.id;
		}
		else
		{
			originInstance = noone;
		}
		if(argument_count > 1)
		{
			textBoxSpriteIndex = argument[1];
		}
		else
		{
			textBoxSpriteIndex = 1;
		}
	}
	with(obj_player)
	{
		if(state != PlayerStateLocked)
		{
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}