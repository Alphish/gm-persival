var _index = global.position_store.load_index();

if (is_undefined(_index))
    return;

with (ui_RoomButton) {
    if (is_undefined(slot_key))
        return;
    
    if (is_string(_index[slot_key]))
        text += "\n" + _index[slot_key];
}
