/// @description Insert description here
// You can write your code in this editor
cam = view_camera[0];
follow = obj_player;
halfWidth = camera_get_view_width(cam) *.5;
halfHeight = camera_get_view_height(cam) *.5;

xDest = xstart;
yDest = ystart;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;