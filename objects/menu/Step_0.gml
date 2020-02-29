/// @description

if (!global.pause) exit;

#region inputs

input_up_p	  = keyboard_check_pressed(global.control_up);
input_down_p  = keyboard_check_pressed(global.control_down);
input_enter_p = keyboard_check_pressed(global.control_enter);
input_right_p = keyboard_check_pressed(global.control_right);
input_left_p  = keyboard_check_pressed(global.control_left);
input_right_h = keyboard_check(global.control_right);
input_left_h  = keyboard_check(global.control_left);

#endregion

#region Setup Vars

var _grid = menu_pages[page];
var _gh = ds_grid_height(_grid);

#endregion

if (inputting) {
	#region updating selected option on right side
	
	var _selected = menu_option[page]
	
	switch (_grid[# 1, _selected]) {
		case menu_element_type.toggle:	
		case menu_element_type.shift:
			var _input_h = input_right_p - input_left_p;
			var _range = _grid[# 4, _selected]
			
			if (_input_h != 0) {
				_grid[# 3, _selected] += _input_h;
				_grid[# 3, _selected] = clamp(_grid[# 3, _selected], 0, array_length_1d(_range) - 1);
				
				// TODO: Add audio sound when changing options
				audio_play_sound(sChanging, 1, false);
			}
			
			break;	
		case menu_element_type.slider:	
			var _input_h = input_right_h - input_left_h;			
			var _range = _grid[# 4, _selected]
			
			if (_input_h != 0) {
				_grid[# 3, _selected] += _input_h * 0.01;
				_grid[# 3, _selected] = clamp(_grid[# 3, _selected], _range[0], _range[1]);
				
				script_execute(_grid[# 2, _selected], _grid[# 0, _selected], _grid[# 3, _selected]);
				
				// TODO: Add /intermittent/ audio sound when changing options
				if (!audio_is_playing(sChanging)) audio_play_sound(sChanging, 1, false);
			}
			
			break;	
		case menu_element_type.input:
			var _lk = keyboard_lastkey;
			
			// TODO: Can add other invalid keys
			if (_lk != vk_enter) {
				if (_lk != _grid[# 3, _selected]) {
					_grid[# 3, _selected] = _lk;
					variable_global_set(_grid[# 2, _selected], _lk);
					
					// TODO: Add audio sound when picked new key
					audio_play_sound(sChanging, 1, false);
				}
			} else {
				// TODO: Add audio sound when picked invalid key
			}
		
			break;	
	}
	
	#endregion
} else {
	#region changing which option on left side
	
	var _oc = input_down_p - input_up_p;
	if (_oc != 0) {
		menu_option[page] += _oc;	
	
		if (menu_option[page] > _gh - 1) menu_option[page] = 0;
		if (menu_option[page] < 0)		 menu_option[page] = _gh - 1;
	
		// TODO: Add audio sound when changing options
		audio_play_sound(sNavigation, 1, false);
	}
	
	#endregion
}

if (input_enter_p) {
	#region selecting option on left side
	
	var _selected = menu_option[page]
	
	switch (_grid[# 1, _selected]) {
		case menu_element_type.script_runner:
			script_execute(_grid[# 2, _selected]);
			break;
		case menu_element_type.page_transfer:
			page = _grid[# 2, _selected];
			break;
		case menu_element_type.slider:
		case menu_element_type.shift:
		case menu_element_type.toggle:
			if (inputting) {
				script_execute(_grid[# 2, _selected], _grid[# 0, _selected], _grid[# 3, _selected]);
			}
		case menu_element_type.input:
			inputting = !inputting;
			break;	
	}
	
	// TODO: Add audio sound when make selection
	audio_play_sound(sSelection, 1, false);
	
	#endregion
}