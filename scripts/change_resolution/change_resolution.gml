/// @desc change_volume
/// @arg name
/// @arg value

var _name  = argument[0];
var _value = argument[1];

var _resolutions = [[384, 216], [768, 432], [1152, 648], [1536, 874], [1920, 1080]];
var _curr = _resolutions[_value];
var _x = _curr[0];
var _y = _curr[1];

window_set_size(_x, _y);
