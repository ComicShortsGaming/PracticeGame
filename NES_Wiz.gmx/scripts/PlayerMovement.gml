argument0 = 2  //Walk Speed. Higher number, faster movement.
argument1 = 270  //Gravity direction angle. 270 is straight down, 90 straight up.
argument2 = .8  //Gravity exerted on the player. Higher number, shorter jump
argument3 = 12  //Fall Speed
argument4 = 0
//BREAK//

if (vspeed>argument3)   //If the fall speed exceeds the number set by "argument3" it sets it back to it immediately.
{
  vspeed=argument3;
}

//BREAK//
if (place_free(x,y+1))                          //Checks if the player is colliding with a solid object by determining whether there is free space directly below the sprite.
{
    if (sprite_index=WizLeft)
     {
        sprite_index=WizJump_Left;                 //Change player to the correct falling pose, based on original sprite orientation.
     }
    if (sprite_index=WizRight)
     {
        sprite_index=WizJump_Right;
     }
    if (keyboard_check_released(ord("Z")))   //Prevents player from constantly jumping by holding "jump" button.
    {
        global.Jumped=0;
    }
gravity_direction=argument1;                //Sets direction and strength of gravity to pull player down if not colliding.
gravity=argument2;

}
else                                                //If the player IS colliding, then...
{
    if (sprite_index=WizJump_Left)                 //These lines make sure the sprite lands facing the same way as when it jumped or fell.
    {
        sprite_index=WizLeft;
    }
    if (sprite_index=WizJump_Right)
    {
        sprite_index=WizRight;
    }
        if (keyboard_check_released(ord("Z")))
    {
        global.Jumped=0;
    }
gravity_direction=argument1;                     //Still sets the direction as "down" but zeroes out the gravity.
gravity=0;
 
}

//BREAK//

if (keyboard_check(ord("Z")) && not place_free(x,y+1)) && (global.Jumped=0)     //Press Z. If player is standing on solid ground, jumps.
{ 
    audio_play_sound(sound_jump,1,false)
    motion_set(270,-10)
    global.Jumped=1;
}


if (keyboard_check(vk_left) && place_free(x-argument0,y) && place_free(x-argument0,y-argument0))
{
    x-=argument0;               //Press left, if no collision, player moves left.
       
    if(place_free(x,y+3))
    {
     sprite_index=WizJump_Left;
    } 
    else
    {
     sprite_index=WizWalk_Left;
    }
    if(not place_free(x-argument0,y))
    {
     sprite_index=WizLeft  
    }
}



//BREAK//                                                                   //Experimenting with ladder climbing.

if collision_point(x,y, ClimbMe, false, false)  

{
    
    
    if keyboard_check(vk_up)
    {
        vspeed = 0;
        argument2 = 0;
        y-=argument0;                                                     
    }
}




//BREAK//
if (keyboard_check(vk_right) && place_free(x+argument0,y) && place_free(x+argument0,y-argument0))
{
    x+=argument0;    
                                                                       //Same, but right.
    if(place_free(x,y+3))
    {
     sprite_index=WizJump_Right;
    } 
    else
    {
     sprite_index=WizWalk_Right;
    }
    if(not place_free(x+argument0,y))
    {
     sprite_index=WizRight    
    }
    
}
//BREAK//
if (keyboard_check_released(vk_right))      
{
    if (place_free(x,y+3))
    {
        sprite_index=WizJump_Right;
    }
    else
    {
        sprite_index=WizRight;
    }
}
//BREAK//
if (keyboard_check_released(vk_left))
{
    if (place_free(x,y+3))
    {
        sprite_index=WizJump_Left;
    }
    else
    {
        sprite_index=WizLeft;
    }    
}
//BREAK//                                                                   Prevents glitching. If player presses both LEFT and RIGHT at once, defaults to RIGHT orientation.
if keyboard_check(vk_left) && keyboard_check(vk_right)
    {
         sprite_index=WizRight
    }
if keyboard_check(vk_left) && keyboard_check(vk_right)
{
    if(place_free (x,y+1))
        {
         sprite_index=WizJump_Right
        }
}
//BREAK//                                                               

