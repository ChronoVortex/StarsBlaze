/// @description Explosion
event_inherited();

audio_play_sound(snd_explode_turret, 10, false);
instance_create_anim_part(x, y, "Instances", explosion);
