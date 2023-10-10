// Shorthand
#macro DEBUG_MODE true
#macro G global
#macro print show_debug_message
#macro VIEW_INDEX 0
#macro VIEW view_camera[VIEW_INDEX]
#macro CANVAS_SIZE 55
#macro tau 6.28318530717958623199592693708837032318115234375
#macro DATAFILE "GameData.ini"

// Place at the beginning of an object's creation code to prevent duplicates
#macro SINGLETON \
if (instance_number(object_index) > 1) { \
    print("Attempt to create a second instance of singleton object " + object_get_name(object_index)); \
    instance_destroy(id, false); \
    exit; \
}
