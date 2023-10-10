/// @description Vars dependent on p. zone

zone_player_center = bbox_center(zone_player);
respawn_start = new Point(zone_player_center.x, zone_player.bbox_bottom + 4);

// Set alpha script for instance layers
layer_script_begin("Instances", layer_alpha_draw_begin);
layer_script_end("Instances", layer_alpha_draw_end);
layer_script_begin("Cruisers", layer_alpha_draw_begin);
layer_script_end("Cruisers", layer_alpha_draw_end);
