function PersivalStoreBuilder() constructor {
    data_source = undefined;
    indexer = undefined;
    
    static with_buffer_file_source = function() {
        data_source = new PersivalBufferFileSource();
        return self;
    }
    
    static with_text_file_source = function() {
        data_source = new PersivalTextFileSource();
        return self;
    }
    
    static with_json_file_source = function() {
        data_source = new PersivalJsonFileSource();
        return self;
    }
    
    static with_fixed_location = function(_location) {
        indexer = new PersivalFixedIndexer(_location);
        return self;
    }
    
    static create = function() {
        return new PersivalStore(data_source, indexer);
    }
}
