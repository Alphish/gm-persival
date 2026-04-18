number = 0;

number_store = PersivalStore.build()
    .with_buffer_file_source()
    .with_fixed_location("number.sav")
    .create();

load_number = function() {
    var _buffer = number_store.load_data();
    if (is_undefined(_buffer))
        return;
    
    if (buffer_get_size(_buffer) >= 4)
        number = buffer_read(_buffer, buffer_s32);
    
    buffer_delete(_buffer);
}

save_number = function() {
    var _buffer = buffer_create(4, buffer_fixed, 1);
    buffer_write(_buffer, buffer_s32, number);
    number_store.save_data(_buffer);
    buffer_delete(_buffer);
}

delete_number = function() {
    number_store.delete_data();
}

load_number();
