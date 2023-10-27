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
        if (keyboard_check(ord("W")) || keyboard_check(vk_up))
            return true;
        if (G.gpad_slot != -1 && (G.gpad_joy[_input] || gamepad_button_check(G.gpad_slot, gp_padu)))
            return true;
        return false;
    case INPUT.LEFT:
        if keyboard_check(ord("A")) || keyboard_check(vk_left)
            return true;
        if (G.gpad_slot != -1 && (G.gpad_joy[_input] || gamepad_button_check(G.gpad_slot, gp_padl)))
            return true;
        return false;
    case INPUT.DOWN:
        if keyboard_check(ord("S")) || keyboard_check(vk_down)
            return true;
        if (G.gpad_slot != -1 && (G.gpad_joy[_input] || gamepad_button_check(G.gpad_slot, gp_padd)))
            return true;
        return false;
    case INPUT.RIGHT:
        if keyboard_check(ord("D")) || keyboard_check(vk_right)
            return true;
        if (G.gpad_slot != -1 && (G.gpad_joy[_input] || gamepad_button_check(G.gpad_slot, gp_padr)))
            return true;
        return false;
    case INPUT.PRIMARY:
        if keyboard_check(vk_space)
            return true;
        if (G.gpad_slot != -1 && (gamepad_button_check(G.gpad_slot, gp_face1) || gamepad_button_check(G.gpad_slot, gp_face2)))
            return true;
        return false;
    case INPUT.SECONDARY:
        if keyboard_check(vk_shift)
            return true;
        if (G.gpad_slot != -1 && (gamepad_button_check(G.gpad_slot, gp_face3) || gamepad_button_check(G.gpad_slot, gp_face4) || gamepad_button_check(G.gpad_slot, gp_shoulderl) || gamepad_button_check(G.gpad_slot, gp_shoulderlb) || gamepad_button_check(G.gpad_slot, gp_shoulderr) || gamepad_button_check(G.gpad_slot, gp_shoulderrb)))
            return true;
        return false;
    default:
        show_error(string(_input) + " is not a valid input", false);

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
        if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up))
            return true;
        if (G.gpad_slot != -1 && ((G.gpad_joy[_input] && (G.gpad_joy[_input] != G.gpad_joy_prev[_input])) || gamepad_button_check_pressed(G.gpad_slot, gp_padu)))
            return true;
        return false;
    case INPUT.LEFT:
        if keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)
            return true;
        if (G.gpad_slot != -1 && ((G.gpad_joy[_input] && (G.gpad_joy[_input] != G.gpad_joy_prev[_input])) || gamepad_button_check_pressed(G.gpad_slot, gp_padl)))
            return true;
        return false;
    case INPUT.DOWN:
        if keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)
            return true;
        if (G.gpad_slot != -1 && ((G.gpad_joy[_input] && (G.gpad_joy[_input] != G.gpad_joy_prev[_input])) || gamepad_button_check_pressed(G.gpad_slot, gp_padd)))
            return true;
        return false;
    case INPUT.RIGHT:
        if keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)
            return true;
        if (G.gpad_slot != -1 && ((G.gpad_joy[_input] && (G.gpad_joy[_input] != G.gpad_joy_prev[_input])) || gamepad_button_check_pressed(G.gpad_slot, gp_padr)))
            return true;
        return false;
    case INPUT.PRIMARY:
        if keyboard_check_pressed(vk_space)
            return true;
        if (G.gpad_slot != -1 && (gamepad_button_check_pressed(G.gpad_slot, gp_face1) || gamepad_button_check_pressed(G.gpad_slot, gp_face2)))
            return true;
        return false;
    case INPUT.SECONDARY:
        if keyboard_check_pressed(vk_shift)
            return true;
        if (G.gpad_slot != -1 && (gamepad_button_check_pressed(G.gpad_slot, gp_face3) || gamepad_button_check_pressed(G.gpad_slot, gp_face4) || gamepad_button_check_pressed(G.gpad_slot, gp_shoulderl) || gamepad_button_check_pressed(G.gpad_slot, gp_shoulderlb) || gamepad_button_check_pressed(G.gpad_slot, gp_shoulderr) || gamepad_button_check_pressed(G.gpad_slot, gp_shoulderrb)))
            return true;
        return false;
    default:
        show_error(string(_input) + " is not a valid input", false);

    }
}
