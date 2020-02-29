/// @desc change_window_mode
/// @arg name
/// @arg value

var _name  = argument[0];
var _value = argument[1];

switch (_value) {
	case 0:
		window_set_fullscreen(true);
		break;
	case 1:
		window_set_fullscreen(false);
		break;	
}