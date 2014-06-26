argument0 = 2  //Walk Speed. Higher number, faster movement.
argument1 = 270  //Gravity direction angle. 270 is straight down, 90 straight up.
argument2 = .8  //Gravity exerted on the NPC. Higher number, shorter jump
argument3 = 12  //Fall Speed
argument4 = 0

//All of this is copied over from the player control scripts.
//BREAK//
if (vspeed>argument3)   //If the fall speed exceeds the number set by "argument3" it sets it back to it immediately.
{
  vspeed=argument3;
}
//BREAK//
if (place_free(x,y+1))                          //Checks if the NPC is colliding with a solid object by determining whether there is free space directly below the sprite.
{
    if (sprite_index=Goblin_Idle_Left)
     {
        sprite_index=GoblinFall_Left;                 //Change NPC to the correct falling pose, based on original sprite orientation.
     }
    if (sprite_index=Goblin_Idle_Right)
     {
        sprite_index=GoblinFall_Right;
     }
        gravity_direction=argument1;                //Sets direction and strength of gravity to pull NPC down if not colliding.
        gravity=argument2;
}
else                                                //If the NPC IS colliding, then...
{
    if (sprite_index=GoblinFall_Left)                 //These lines make sure the sprite lands facing the same way as when it jumped or fell.
    {
        sprite_index=Goblin_Idle_Left;
    }
    if (sprite_index=GoblinFall_Right)
    {
        sprite_index=Goblin_Idle_Right;
    }
        gravity_direction=argument1;                     //Still sets the direction as "down" but zeroes out the gravity.
        gravity=0;
}

