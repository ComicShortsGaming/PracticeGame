
//Player Input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_reset = keyboard_check_pressed(vk_shift);

//React to Input
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;
//Ledge Grab
var was_free = !position_meeting(x+(9*moving_right), yprevious-8, par_wall);
var is_not_free = position_meeting(x+(9*moving_right), y-8, par_wall);
var moving_down = yprevious < y;

if (was_free && is_not_free && moving_down) {
    hsp = 0
    vsp = 0
    state = scr_ledgegrab_state;
}

//Simple Spike Death
if (place_meeting(x,y+vsp,par_death))
{
    while(!place_meeting(x,y+sign(vsp),par_death))
    {
        y += sign(vsp);
    }
    room_restart();
}

//Shift Reset

if (key_reset)
{
    room_restart();
}
