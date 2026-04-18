function PersivalFixedIndexer(_location) : PersivalIndexer() constructor {
    location = _location;
    
    static list_locations = function() {
        return [location];
    }
    
    static get_default_location = function() {
        return location;
    }
}
