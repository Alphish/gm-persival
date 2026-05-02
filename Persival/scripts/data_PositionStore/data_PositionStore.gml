global.position_store = PersivalStore.build()
    .with_json_file_source()
    .with_slots("positions.ix", ["pos1.sav", "pos2.sav", "pos3.sav"])
    .with_json_index_source()
    .mapping_index(function(_data) {
        static dirtitles = ["East", "North-East", "North", "North-West", "West", "South-West", "South", "South-East"];
        
        var _dist = point_distance(0.5, 0.5, _data.x / room_width, _data.y / room_height);
        var _angle = point_direction(0.5, 0.5, _data.x / room_width, _data.y / room_height);
        
        if (_dist <= 0.2)
            return "Center";
        
        var _dirindex = round(_angle / 45) mod 8;
        return dirtitles[_dirindex];
    })
    .create();
 