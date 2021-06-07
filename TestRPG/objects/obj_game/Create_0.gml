/// @description Insert description here
// You can write your code in this editor

randomize();

global.textSpeed = .75;
global.GamePaused = false;
global.iCamera = instance_create_layer(0, 0, layer, obj_camera);

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

room_goto(ROOM_START);