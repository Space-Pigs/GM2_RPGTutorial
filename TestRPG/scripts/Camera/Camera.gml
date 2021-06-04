
function ScreenShake(magnitude, frames)
{
	with(global.iCamera)
	{
		if(shakeRemain < magnitude)
		{
			shakeLength = frames;
			shakeMagnitude = magnitude;
			shakeRemain = magnitude;
		}
	}
}