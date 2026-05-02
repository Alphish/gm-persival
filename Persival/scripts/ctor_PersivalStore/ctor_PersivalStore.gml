function PersivalStore(_datasource, _indexer, _ixsource, _datamap = undefined, _ixmap = undefined) constructor {
    data_source = _datasource;
    indexer = _indexer;
    index_data_source = _ixsource;
    
    data_mapping = _datamap;
    index_mapping = _ixmap;
    
    static list_keys = function() {
        return indexer.list_keys();
    }
    
    // -------
    // Loading
    // -------
    
    static load_data = function(_key = undefined) {
        _key ??= indexer.get_default_key();
        var _location = indexer.get_location(_key);
        return data_source.load_data(_location);
    }
    
    static load_index = function(_key = undefined) {
        _key ??= indexer.get_default_key();
        var _location = indexer.get_index_location(_key);
        if (is_undefined(_location))
            return undefined; // if no location was resolved, it means no index data is stored 
        
        return index_data_source.load_data(_location);
    }
    
    // ------
    // Saving
    // ------
    
    static save_entry = function(_data, _key = undefined) {
        _key ??= indexer.get_default_key();
        save_data(_data, _key);
        save_index(_data, _key);
    }
    
    static save_data = function(_data, _key) {
        var _maindata = !is_undefined(data_mapping) ? data_mapping(_data) : _data;
        var _location = indexer.get_location(_key);
        data_source.save_data(_location, _maindata);
    }
    
    static save_index = function(_data, _key) {
        var _ixlocation = indexer.get_index_location(_key);
        if (is_undefined(_ixlocation))
            return;
        
        var _blurbdata = !is_undefined(index_mapping) ? index_mapping(_data) : _data;
        var _ixdata = index_data_source.load_data(_ixlocation);
        _ixdata = indexer.apply_save(_ixdata, _key, _blurbdata);
        index_data_source.save_data(_ixlocation, _ixdata);
    }
    
    // --------
    // Deleting
    // --------
    
    static delete_entry = function(_key = undefined) {
        _key ??= indexer.get_default_key();
        delete_data(_key);
        delete_index(_key);
    }
    
    static delete_data = function(_key) {
        _key ??= indexer.get_default_key();
        var _location = indexer.get_location(_key);
        data_source.delete_data(_location);
    }
    
    static delete_index = function(_key) {
        var _ixlocation = indexer.get_index_location(_key);
        if (is_undefined(_ixlocation))
            return;
        
        var _ixdata = index_data_source.load_data(_ixlocation);
        _ixdata = indexer.apply_delete(_ixdata, _key);
        
        if (!is_undefined(_ixdata))
            index_data_source.save_data(_ixlocation, _ixdata);
        else
            index_data_source.delete_data(_ixlocation);
    }
    
    static wipe_index = function(_key = undefined) {
        _key ??= indexer.get_default_key();
        var _ixlocation = indexer.get_index_location(_key);
        if (is_undefined(_ixlocation))
            return;
        
        index_data_source.delete_data(_ixlocation);
    }
}

PersivalStore.build = function() {
    return new PersivalStoreBuilder();
}
