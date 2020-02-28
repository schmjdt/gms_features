/// @desc create_menu_page
/// @arg ["Name1", type1, entries1...]
/// @arg ["Name1", type1, entries1...]

var _arg;

var _i = 0;
repeat (argument_count) {
	_arg[i] = argument[i];	
	_i += 1;	
}

// Just creates a possibly oversized grid
var _ds_grid_id = ds_grid_create(5, argument_count);

_i = 0;
repeat (argument_count) {
	var _arr = _arg[i];
	var _len = array_length_1d(_arr);
	
	var _j = 0;
	
	repeat (_len) {
		_ds_grid_id[# _j, _i] = _arr[_j];
		
		_j += 1;	
	}
	_i += 1;	
}

return _ds_grid_id;