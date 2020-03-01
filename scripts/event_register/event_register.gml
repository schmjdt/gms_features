/// @desc event_register
/// @arg event
/// @arg id
/// @arg script
/// @arg args...

with (event_manager) {
	var _ev = argument[0];
	var _id = argument[1];
	var _listeners, _info;
	
	if (!ds_map_exists(event_map, _ev)) {
		// Add event to event map
		_listeners = ds_list_create();
		
		// Add listerner info to map
		ds_map_add_list(event_map, _ev, _listeners);
	} else {
		_listeners = event_map[? _ev];
	}
	
	// Add listeners id
	_info[0] = _id;
	
	// Add script and arguments
	var _skip_args = 2;
	var _len = argument_count - _skip_args; 
	var _i = 0;
	repeat (_len) {
		_info[_i + 1] = argument[i + _skip_args]
		
		_i += 1;
	}
	
	// Add listener info to the listener list
	ds_list_add(_listeners, _info);
	// So that it will be added as list and cleaned up
	ds_list_mark_as_list(_listeners, _i + 1);
}