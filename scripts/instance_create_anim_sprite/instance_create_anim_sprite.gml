/// @desc                  Create a temporary sprite animation.
/// @arg {Real}            x         The x coordinate of the animation.
/// @arg {Real}            y         The y coordinate of the animation.
/// @arg {String,Id.Layer} layer     The layer of the animation.
/// @arg {Asset.GMSprite}  sprite    The sprite of the animation.
/// @arg {Real}            [repeat]  The number of times to repeat the animation.
/// @return {Id.Instance}
function instance_create_anim_sprite(_x, _y, _layer, _sprite, _repeat = 1) {
    var _anim = instance_create_layer(_x, _y, _layer, sys_anim);
    with (_anim) {
        sprite_index = _sprite;
        image_speed = 0;
        repetitions = _repeat;
        anim_speed = sprite_get_speed(_sprite);
        if (sprite_get_speed_type(_sprite) == spritespeed_framespersecond)
            anim_speed /= game_get_speed(gamespeed_fps);
    }
    return _anim;
}
