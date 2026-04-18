json_store = PersivalStore.build()
    .with_json_file_source()
    .with_fixed_location("position.sav")
    .create();

load_position = function() {
    var _data = json_store.load_data();
    obj_PositionWalker.apply_data(_data);
}

save_position = function() {
    var _data = obj_PositionWalker.get_data();
    json_store.save_data(_data);
}

delete_position = function() {
    json_store.delete_data();
}

load_position();
