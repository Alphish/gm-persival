// Inherit the parent event
event_inherited();

inner_command = command;

command = function() {
    global.slot_key = slot_key;
    room_goto(target_room);
}
