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
   
gravity_direction=argument1;                //Sets direction and strength of gravity to pull player down if not colliding.
gravity=argument2;

}
else                                                //If the player IS colliding, then...
{

gravity_direction=argument1;                     //Still sets the direction as "down" but zeroes out the gravity.
gravity=0;
 
}

