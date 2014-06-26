if keyboard_check(vk_up) && collision_point(x,y,Wiz,false,false)
{
    Wiz.x = global.target_x;
    Wiz.y = global.target_y;
    room_goto(global.target_r);
}

