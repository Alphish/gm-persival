get_data = function() {
    return { x, y, angle: image_angle };
}

apply_data = function(_data) {
    if (!is_struct(_data))
        return;
    
    x = _data[$ "x"] ?? xstart;
    y = _data[$ "y"] ?? ystart;
    image_angle = _data[$ "angle"] ?? 0;
}

image_speed = 0;
image_index = 1;
