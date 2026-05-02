function PersivalStoreBuilder() constructor {
    data_source = undefined;
    indexer = undefined;
    index_data_source = undefined;
    
    data_mapping = undefined;
    index_mapping = undefined;
    
    // ------------
    // Data sources
    // ------------
    
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
    
    // ------------
    // Index source
    // ------------
    
    static with_buffer_index_source = function() {
        index_data_source = new PersivalBufferFileSource();
        return self;
    }
    
    static with_text_index_source = function() {
        index_data_source = new PersivalTextFileSource();
        return self;
    }
    
    static with_json_index_source = function() {
        index_data_source = new PersivalJsonFileSource();
        return self;
    }
    
    // --------
    // Indexers
    // --------
    
    static with_fixed_location = function(_location) {
        indexer = new PersivalFixedIndexer(_location);
        return self;
    }
    
    static with_slots = function(_ixlocation, _locations) {
        indexer = new PersivalSlotIndexer(_ixlocation, _locations);
        return self;
    }
    
    // -------
    // Mapping
    // -------
    
    static mapping_data = function(_mapper) {
        data_mapping = _mapper;
        return self;
    }
    
    static mapping_index = function(_mapper) {
        index_mapping = _mapper;
        return self;
    }
    
    // --------
    // Building
    // --------
    
    static create = function() {
        return new PersivalStore(data_source, indexer, index_data_source, data_mapping, index_mapping);
    }
}
