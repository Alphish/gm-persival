json_store = global.position_store;

load_position = function() {
    var _data = json_store.load_data(global.slot_key);
    obj_PositionWalker.apply_data(_data);
}

save_position = function() {
    var _data = obj_PositionWalker.get_data();
    json_store.save_entry(_data, global.slot_key);
}

delete_position = function() {
    json_store.delete_entry(global.slot_key);
}

load_position();
