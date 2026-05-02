function PersivalIndexer() constructor {
    static list_keys = function() {
        throw PersivalException.not_implemented(self, nameof(list_keys));
    }
    
    static get_default_key = function() {
        throw PersivalException.not_implemented(self, nameof(get_default_key));
    }
    
    static get_location = function(_key) {
        throw PersivalException.not_implemented(self, nameof(get_location));
    }
    
    static get_index_location = function(_key) {
        throw PersivalException.not_implemented(self, nameof(get_index_location));
    }
    
    static apply_save = function(_index, _key, _data) {
        throw PersivalException.not_implemented(self, nameof(apply_save));
    }
    
    static apply_delete = function(_index, _key) {
        throw PersivalException.not_implemented(self, nameof(apply_delete));
    }
}
