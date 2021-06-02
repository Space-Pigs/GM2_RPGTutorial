state = PlayerStateFree;

collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));

image_speed = 0;
xSpeed = 0;
ySpeed = 0;
speedWalk = 2.0;
speedRoll = 3;
distanceRoll = 52;

spriteRoll = sPlayerRoll;
spriteWalk = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;

function UpdatePlayerSprite()
{
	var _totalFrames = sprite_get_number(sprite_index) / 4
	image_index = localFrame + (CARDINAL_DIR * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / TARGET_FPS;
	
	if(localFrame >= _totalFrames)
	{
		animationEnd = true;
		localFrame -= _totalFrames;
	}
	else
	{
		animationEnd = false;
	}
}

function PlayerCollision()
{
	var _collision = false;
	
	//Horizontal Tiles
	if(tilemap_get_at_pixel(collisionMap, x + xSpeed, y))
	{
		x -= x % TILE_SIZE;
		if(sign(xSpeed) == 1)
		{
			x += TILE_SIZE -1;
		}
		xSpeed = 0;
		_collision = true;
	}
	//Horizontal Move Commit
	x += xSpeed;
	
	if(tilemap_get_at_pixel(collisionMap, x, y + ySpeed))
	{
		y -= y % TILE_SIZE;
		if(sign(ySpeed) == 1)
		{
			y += TILE_SIZE - 1;
		}
		ySpeed = 0;
		_collision = true;
	}
	//Vertical Move Commit
	y += ySpeed;

	return _collision;
}