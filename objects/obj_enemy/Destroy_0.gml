/// @description Points, explosion

if (instance_exists(G.game)) G.game.score_player += points;
audio_play_sound(snd_explode_enemy, 10, false);
instance_create_anim_part(x, y, layer, explosion);
