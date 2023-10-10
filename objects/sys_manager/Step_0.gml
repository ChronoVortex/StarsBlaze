// Opening fade in from black
if (start_timer > 0) start_timer--;
else if (darkness_timer > 0) darkness_timer--;

// Star background particles
part_emitter_burst(star_sys, star_emitter, array_choose(star_parts), 1);
