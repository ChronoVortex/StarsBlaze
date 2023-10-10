/// @description Draw self and reticle

draw_self();
if (G.game.state = GAME_STATE.PLAYING)
    draw_sprite(spr_reticle, 0, x, y - bomb_dist);
