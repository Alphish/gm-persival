function PersivalSlotIndexer(_ixlocation, _locations) : PersivalIndexer() constructor {
    index_location = _ixlocation;
    locations = _locations;
    keys = array_create_ext(array_length(locations), function(i) { return i; });
    
    static list_keys = function() {
        return keys;
    }
    
    static get_default_key = function() {
        return 0;
    }
    
    static get_location = function(_key) {
        return locations[_key];
    }
    
    static get_index_location = function(_key) {
        return index_location;
    }
    
    static apply_save = function(_index, _key, _data) {
        _index ??= array_create(array_length(keys), undefined);
        _index[_key] = _data;
        return _index;
    }
    
    static apply_delete = function(_index, _key) {
        _index ??= array_create(array_length(keys), undefined);
        _index[_key] = undefined;
        return _index;
    }
}
