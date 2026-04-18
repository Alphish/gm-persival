number = 0;

text_store = PersivalStore.build()
    .with_text_file_source()
    .with_fixed_location("text.sav")
    .create();

load_text = function() {
    text = text_store.load_data() ?? "";
}

save_text = function() {
    text_store.save_data(text);
}

delete_text = function() {
    text_store.delete_data();
}

load_text();
