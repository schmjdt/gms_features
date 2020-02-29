/// @desc change_volume
/// @arg name
/// @arg value

var _name  = argument[0];
var _value = argument[1];

show_debug_message("change for " + string(_name) + " volume to " + string(_value));

switch (_name) {
	case "MASTER":
		audio_master_gain(_value);
		break;
	case "MUSIC":
		audio_group_set_gain(agMusic, _value, 0);
		break;
	case "SOUNDS":
		audio_group_set_gain(agSfx, _value, 0);
		break;
}
