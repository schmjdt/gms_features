/// @description

if (!global.pause) exit;

input_up_p	  = keyboard_check_pressed(global.control_up);
input_down_p  = keyboard_check_pressed(global.control_down);
input_enter_p = keyboard_check_pressed(global.control_enter);
input_right_p = keyboard_check_pressed(global.control_right);
input_left_p  = keyboard_check_pressed(global.control_left);
input_right_h = keyboard_check(global.control_right);
input_left_h  = keyboard_check(global.control_left);

var _grid = menu_pages[page];
var _gh = ds_grid_height(_grid);

if (inputting) {
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
			}
			
			break;	
		case menu_element_type.slider:	
			var _input_h = input_right_h - input_left_h;			
			var _range = _grid[# 4, _selected]
			
			if (_input_h != 0) {
				_grid[# 3, _selected] += _input_h * 0.01;
				_grid[# 3, _selected] = clamp(_grid[# 3, _selected], _range[0], _range[1]);
				
				// TODO: Add /intermittent/ audio sound when changing options
			}
			
			break;	
		case menu_element_type.input:
			break;	
	}
} else {
	var _oc = input_down_p - input_up_p;
	if (_oc != 0) {
		menu_option[page] += _oc;	
	
		if (menu_option[page] > _gh - 1) menu_option[page] = 0;
		if (menu_option[page] < 0)		 menu_option[page] = _gh - 1;
	
		// TODO: Add audio sound when changing options
	}
}

if (input_enter_p) {
	switch (_grid[# 1, menu_option[page]]) {
		case menu_element_type.script_runner:
			break;
		case menu_element_type.page_transfer:
			page = _grid[# 2, menu_option[page]];
			break;
		case menu_element_type.slider:
		case menu_element_type.shift:
		case menu_element_type.toggle:
		case menu_element_type.input:
			inputting = !inputting;
			break;	
	}
	
	// TODO: Add audio sound when make selection
}