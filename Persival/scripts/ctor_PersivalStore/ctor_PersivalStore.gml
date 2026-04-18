function PersivalStore(_datasource, _indexer) constructor {
    data_source = _datasource;
    indexer = _indexer;
    
    static list_locations = function() {
        return indexer.list_locations();
    }
    
    static get_default_location = function() {
        return indexer.get_default_location();
    }
    
    static load_data = function(_location = undefined) {
        _location ??= get_default_location();
        return data_source.load_data(_location);
    }
    
    static save_data = function(_data, _location = undefined) {
        _location ??= get_default_location();
        data_source.save_data(_location, _data);
    }
    
    static delete_data = function(_location = undefined) {
        _location ??= get_default_location();
        data_source.delete_data(_location);
    }
}

PersivalStore.build = function() {
    return new PersivalStoreBuilder();
}
