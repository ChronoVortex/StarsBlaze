event_inherited();

text = "START";
selected = true;
action = function() {
    selected = false;
    instance_create_layer(0, 0, layer, sys_intro_sequence);
};
