/// @description

if (!global.pause) exit;

input_up_p	  = keyboard_check_pressed(global.control_up);
input_down_p  = keyboard_check_pressed(global.control_down);
input_enter_p = keyboard_check_pressed(global.control_enter);

var _grid = menu_pages[page];
var _gh = ds_grid_height(_grid);
var _oc = input_down_p - input_up_p;

if (_oc != 0) {
	menu_option[page] += _oc;	
	
	if (menu_option[page] > _gh - 1) menu_option[page] = 0;
	if (menu_option[page] < 0)		 menu_option[page] = _gh - 1;
	
	// TODO: Add audio sound when changing options
}

if (input_enter_p) {
	switch (_grid[# 1, menu_option[page]]) {
		case menu_element_type.page_transfer:
			page = _grid[# 2, menu_option[page]];
			break;
	}
	
	// TODO: Add audio sound when make selection
}