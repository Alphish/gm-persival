function PersivalJsonFileSource() : PersivalDataSource() constructor {
    static load_data = function(_location) {
        var _buffer = buffer_load(_location);
        if (!buffer_exists(_buffer) || buffer_get_size(_buffer) == 0)
            return undefined;
        
        var _content = buffer_read(_buffer, buffer_text);
        buffer_delete(_buffer);
        
        try {
            return json_parse(_content);
        } catch (_) {
            // if the file content isn't a valid JSON, prevent crash and return undefined instead
            return undefined;
        }
    }
    
    static save_data = function(_location, _data) {
        var _content = json_stringify(_data, /* prettify */ false);
        var _buffer = buffer_create(string_byte_length(_content), buffer_grow, 1);
        buffer_write(_buffer, buffer_text, _content);
        buffer_save(_buffer, _location);
        buffer_delete(_buffer);
    }
    
    static delete_data = function(_location) {
        file_delete(_location);
    }
}
