/// @description Damage enemy on contact

audio_play_sound(snd_hit_enemy, 10, false, 1, 0, random_range(0.9, 1.1));
instance_destroy();
other.hp -= 1;
