function PersivalTextFileSource() : PersivalDataSource() constructor {
    static load_data = function(_location) {
        var _buffer = buffer_load(_location);
        if (!buffer_exists(_buffer))
            return undefined;
    
        var _result = buffer_get_size(_buffer) > 0 ? buffer_read(_buffer, buffer_text) : "";
        buffer_delete(_buffer);
        return _result;
    }
    
    static save_data = function(_location, _data) {
        var _buffer = buffer_create(string_byte_length(_data), buffer_grow, 1);
        buffer_write(_buffer, buffer_text, _data);
        buffer_save(_buffer, _location);
        buffer_delete(_buffer);
    }
    
    static delete_data = function(_location) {
        file_delete(_location);
    }
}
