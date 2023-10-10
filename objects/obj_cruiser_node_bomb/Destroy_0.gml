/// @description Create explosion bullet
event_inherited();

audio_play_sound(snd_explode_big, 10, false);
instance_create_layer(x, y, "Instances", obj_bullet_explosion);
