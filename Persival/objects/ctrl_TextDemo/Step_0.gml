if (keyboard_string != "") {
    text += string_lettersdigits(keyboard_string);
    text = string_copy(text, 1, 10);
    keyboard_string = "";
} else if (keyboard_check_pressed(vk_backspace)) {
    text = string_copy(text, 1, string_length(text) - 1);
}
