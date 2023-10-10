if (scale < scale_vanish_threshold + (1 - scale_vanish_threshold)/2) {
    instance_destroy(other);
    if (instance_exists(G.game)) G.game.score_player += score_bonus;
    score_bonus += 50;
}
