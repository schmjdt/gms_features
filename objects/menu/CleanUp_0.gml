/// @description destroy ds

var _i = 0;
var _len = array_length_1d(menu_pages);
repeat (_len) {
	ds_grid_destroy(menu_pages[_i])
	_i += 1;
}