
function PlayerStateFree()
{
	xSpeed = lengthdir_x(hasMoveInput * speedWalk, inputDirection );
	ySpeed = lengthdir_y(hasMoveInput * speedWalk, inputDirection );

	PlayerCollision();

	var _oldSprite = sprite_index;
	if(hasMoveInput)
	{
		direction = inputDirection;
		sprite_index = spriteWalk;
	}
	else
	{
		sprite_index = spriteIdle;
	}

	if(_oldSprite != sprite_index)
	{
		localFrame = 0;
	}

	UpdatePlayerSprite();
	
	if(keyActivate)
	{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	}
}

function PlayerStateRoll()
{
	xSpeed = lengthdir_x(speedRoll, direction);
	ySpeed = lengthdir_y(speedRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	
	var _collided = PlayerCollision();
	
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceRoll)) * _totalFrames), _totalFrames - 1);
	
	if(moveDistanceRemaining <= 0)
	{
		state = PlayerStateFree;
	}
	
	if(_collided)
	{
		state = PlayerStateFree;
		ScreenShake(8, 20);
	}
}