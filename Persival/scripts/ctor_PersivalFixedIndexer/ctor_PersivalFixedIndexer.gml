function PersivalFixedIndexer(_location) : PersivalIndexer() constructor {
    location = _location;
    
    static list_keys = function() {
        return undefined;
    }
    
    static get_default_key = function() {
        return undefined;
    }
    
    static get_location = function(_key) {
        return location;
    }
    
    static get_index_location = function(_key) {
        return undefined;
    }
    
    static apply_save = function(_index, _key, _data) {}
    
    static apply_delete = function(_index, _key) {}
}
