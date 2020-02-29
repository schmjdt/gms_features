/// @desc change_difficulty
/// @arg name
/// @arg value

var _name  = argument[0];
var _value = argument[1];

/* Examples:
	- Changing Variables: health, difficulty, detection radius
	- Including/discluding particular AI abilities
*/

switch (_name) {
	case "ENEMIES":
		switch (_value) {
			case 0:
				show_debug_message("Setting Enemies to Easy");
				break;
			case 1:
				show_debug_message("Setting Enemies to Medium");
				break;
			case 2:
				show_debug_message("Setting Enemies to Hard");
				break;				
		}
		break;
	case "ALLIES":
		switch (_value) {
			case 0:
				show_debug_message("Setting Allies to Easy");
				break;
			case 1:
				show_debug_message("Setting Allies to Medium");
				break;
			case 2:
				show_debug_message("Setting Allies to Hard");
				break;				
		}
		break;
}