/// @desc event_fire
/// @arg event

with (event_manager) {
	var _ev = argument[0];
	var _listeners, _info;
	
	// Check if there is an event entry
	if (ds_map_exists(event_map, _ev)) {
		// Get listeners
		_listeners = event_map[? _ev];
		
		var _len = ds_list_size(_listeners);
		var _listener, _script, _args;
		
		var _i = 0;
		repeat (_len) {
			// Get variables for current listener
			_info = _listeners[| _i];
			_listener = _info[0];
			_script = _info[1];
			
			var _len_args = array_length_1d(_info) - 2;
			
			if (_len_args <= 0) {
				with (_listener) {
					script_execute(_script);
				}
			} else {
				_args = array_create(_len_args, 0);	
				array_copy(_args, 0, _info, 2, _len_args);
				with (_listener) {
					script_execute_alt(_script, _args);
				}
			}
			
			_i += 1;
		}
		
	}

}