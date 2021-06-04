/// @description Insert description here
// You can write your code in this editor

randomize();

global.GamePaused = false;
global.iCamera = instance_create_layer(0, 0, layer, obj_camera);

room_goto(ROOM_START);