function PersivalIndexer() constructor {
    static list_locations = function() {
        throw PersivalException.not_implemented(self, nameof(list_locations));
    }
    
    static get_default_location = function() {
        throw PersivalException.not_implemented(self, nameof(get_default_location));
    }
}
