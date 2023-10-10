/// @desc                         Create a temporary particle animation.
/// @arg {Real}                   x         The x coordinate of the animation.
/// @arg {Real}                   y         The y coordinate of the animation.
/// @arg {String,Id.Layer}        layer     The layer of the animation.
/// @arg {Asset.GMParticleSystem} part_sys  The sprite or particle system to use for the animation.
/// @arg {Real}                   [repeat]  The number of times to repeat the animation.
/// @return {Id.Instance}
function instance_create_anim_part(_x, _y, _layer, _part_sys, _repeat = 1) {
    var _anim = instance_create_layer(_x, _y, _layer, sys_anim);
    with (_anim) {
        part_sys = part_system_create(_part_sys);
        part_system_position(part_sys, _x, _y);
    }
    return _anim;
}
