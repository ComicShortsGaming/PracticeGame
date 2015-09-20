///Inputs

//Player Input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

//React to Input
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;

if (place_meeting(x,y+1,par_wall))
{
    vsp = key_jump * -jumpspeed
}

var moving_right = sign(hsp);

//Ladder
if (key_up || key_down)
{
    if place_meeting(x,y,par_ladder) ladder = true;
}

if (ladder)
{
    vsp = 0;
    //hsp = 0;
    if (key_up) vsp = -2;
    if (key_down) vsp = 2;
    if !place_meeting(x,y,par_ladder) ladder = false;
    if (key_jump) ladder = false;
}

//Horizontal Collision

if (place_meeting(x+hsp,y,par_wall))
{
    while(!place_meeting(x+sign(hsp),y,par_wall))
    {
        x += sign(hsp);
    }
    hsp = 0;
}

x += hsp;

//Vertical Collision

if (place_meeting(x,y+vsp,par_wall))
{
    while(!place_meeting(x,y+sign(vsp),par_wall))
    {
        y += sign(vsp);
    }
    vsp = 0;
}

y += vsp;

//Animate
if (move!=0) image_xscale = move;
if (place_meeting(x,y+1,par_wall))
{
    if (hsp!=0) sprite_index = WizWalk; else sprite_index = WizRight;
}
else
{
    if (vsp < 0) sprite_index = WizJump; else sprite_index = WizFall;
}

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
if (place_meeting(x,y+vsp,obj_spikes))
{
    while(!place_meeting(x,y+sign(vsp),obj_spikes))
    {
        y += sign(vsp);
    }
    room_restart();
}

