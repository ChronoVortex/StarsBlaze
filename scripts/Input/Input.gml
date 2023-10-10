enum INPUT {
    UP,
    LEFT,
    DOWN,
    RIGHT,
    PRIMARY,
    SECONDARY
}

G.input_enabled = true;

/// @desc        Check if a given input is held down.
/// @arg {Real}  input             The input to check the state of.
/// @arg {Bool}  [ignore_enabled]  Whether to check this input regardless of whether input is enabled.
/// @return {Bool}
function input_check(_input, _ignore_enabled = false) {
    if (!(G.input_enabled || _ignore_enabled)) return false;
    switch (_input) {

    case INPUT.UP:
        return keyboard_check(ord("W")) || keyboard_check(vk_up);
    case INPUT.LEFT:
        return keyboard_check(ord("A")) || keyboard_check(vk_left);
    case INPUT.DOWN:
        return keyboard_check(ord("S")) || keyboard_check(vk_down);
    case INPUT.RIGHT:
        return keyboard_check(ord("D")) || keyboard_check(vk_right);
    case INPUT.PRIMARY:
        return keyboard_check(vk_space);
    case INPUT.SECONDARY:
        return keyboard_check(vk_shift);
    default:
        show_error(string(_input) + " is not a valid _input", false);

    }
}

/// @desc        Check if a given input has been pressed.
/// @arg {Real}  input             The input to check the state of.
/// @arg {Bool}  [ignore_enabled]  Whether to check this input regardless of whether input is enabled.
/// @return {Bool}
function input_check_pressed(_input, _ignore_enabled = false) {
    if (!(G.input_enabled || _ignore_enabled)) return false;
    switch (_input) {

    case INPUT.UP:
        return keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
    case INPUT.LEFT:
        return keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
    case INPUT.DOWN:
        return keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
    case INPUT.RIGHT:
        return keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
    case INPUT.PRIMARY:
        return keyboard_check_pressed(vk_space);
    case INPUT.SECONDARY:
        return keyboard_check_pressed(vk_shift);
    default:
        show_error(string(_input) + " is not a valid _input", false);

    }
}
