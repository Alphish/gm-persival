function PersivalDataSource() constructor {
    static load_data = function(_location) {
        throw PersivalException.not_implemented(self, nameof(load_data));
    }
    
    static save_data = function(_location, _data) {
        throw PersivalException.not_implemented(self, nameof(save_data));
    }
    
    static delete_data = function(_location) {
        throw PersivalException.not_implemented(self, nameof(delete_data));
    }
}
