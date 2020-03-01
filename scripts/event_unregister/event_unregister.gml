/// @desc event_unregister
/// @arg event
/// @arg id

with (event_manager) {
	var _ev = argument[0];
	var _id = argument[1];
	var _listeners, _info;
	
	if (ds_map_exists(event_map, _ev)) {
		_listeners = event_map[? _ev];
		var _len = ds_list_size(_listeners);

		var _i = 0;
		repeat (_len) {
			_info = _listeners[| _i];
			
			if (_info[0] == _id) {
				if (_len == 1) {
					ds_list_destroy(_listeners);
					ds_map_delete(event_map, _ev);
				} else {
					ds_list_delete(_listeners, _i);
				}
				
				break;
			}
			
			_i += 1;
		}
	}
}