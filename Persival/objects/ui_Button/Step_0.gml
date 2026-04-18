is_hovered = position_meeting(mouse_x, mouse_y, id);

if (is_hovered && mouse_check_button_pressed(mb_left)) {
    if (!is_undefined(command))
        command();
}
