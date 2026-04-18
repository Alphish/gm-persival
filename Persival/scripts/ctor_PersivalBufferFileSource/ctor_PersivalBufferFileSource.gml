function PersivalBufferFileSource() : PersivalDataSource() constructor {
    static load_data = function(_location) {
        var _buffer = buffer_load(_location);
        return buffer_exists(_buffer) ? _buffer : undefined;
    }
    
    static save_data = function(_location, _data) {
        buffer_save(_data, _location);
    }
    
    static delete_data = function(_location) {
        file_delete(_location);
    }
}
