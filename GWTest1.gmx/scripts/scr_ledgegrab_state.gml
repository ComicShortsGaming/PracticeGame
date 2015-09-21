//Ledge Grab Code
var key_jump = keyboard_check_pressed(vk_space);
var key_down = keyboard_check(vk_down);

if (key_jump) {
    vsp = -jumpspeed;
    state = scr_move_state;
}

if (key_down) {
    state = scr_move_state;
}