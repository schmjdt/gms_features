/// @description 

#region Setup Vars

global.pause = true;
global.view_width  = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

display_set_gui_size(global.view_width, global.view_height);

inputting = false;

#endregion

#region Keybinds

global.control_revert = ord("X");
global.control_enter  = vk_enter;
global.control_left	  = vk_left;
global.control_right  = vk_right;
global.control_up	  = vk_up;
global.control_down   = vk_down;
 
#endregion

#region Menu Enums

enum menu_page {
	main,
	settings,
	audio,
	difficulty,
	graphics,
	controls,
	_size
}

enum menu_element_type {
	script_runner,
	page_transfer,
	shift,
	slider,
	toggle,
	input
}

#endregion

#region Create Menu Pages

ds_menu_main = create_menu_page(
	["RESUME",		menu_element_type.script_runner, resume_game],
	["SETTINGS",	menu_element_type.page_transfer, menu_page.settings],
	["EXIT",		menu_element_type.script_runner, exit_game]
);

ds_menu_settings = create_menu_page(
	["AUDIO",		menu_element_type.page_transfer, menu_page.audio],
	["DIFFICULTY",	menu_element_type.page_transfer, menu_page.difficulty],
	["GRAPHICS",	menu_element_type.page_transfer, menu_page.graphics],
	["CONTROLS",	menu_element_type.page_transfer, menu_page.controls],
	["BACK",		menu_element_type.page_transfer, menu_page.main]
);

ds_menu_audio = create_menu_page(
	["MASTER",	menu_element_type.slider,		  change_volume,	.5,	[0,1]],
	["SOUNDS",	menu_element_type.slider,		  change_volume,	1,	[0,1]],
	["MUSIC",	menu_element_type.slider,		  change_volume,	.2,	[0,1]],
	["BACK",	menu_element_type.page_transfer,  menu_page.main]
);

ds_menu_difficulty = create_menu_page(
	["ENEMIES",	menu_element_type.shift,		  change_difficulty,	1, ["HARMLESS", "NORMAL", "TERRIBLE"]],
	["ALLIES",	menu_element_type.shift,		  change_difficulty,	1, ["DIM-WITTED", "NORMAL", "HELPFUL"]],
	["BACK",	menu_element_type.page_transfer,  menu_page.main]
);

ds_menu_graphics = create_menu_page(
	["RESOLUTION",	menu_element_type.shift,		  change_resolution,	0, ["384 x 216", "768 x 432", "1152 x 648", "1536 x 874", "1920 x 1080"]],
	["WINDOW MODE",	menu_element_type.toggle,		  change_window_mode,	1, ["FULLSCREEN", "WINDOWED"]],
	["BACK",		menu_element_type.page_transfer,  menu_page.main]
);

ds_menu_controls = create_menu_page(
	["UP",		menu_element_type.input,		  "control_up",		vk_up],
	["LEFT",	menu_element_type.input,		  "control_left",	vk_left],
	["RIGHT",	menu_element_type.input,		  "control_right",	vk_right],
	["DOWN",	menu_element_type.input,		  "control_down",	vk_down],
	["BACK",	menu_element_type.page_transfer,  menu_page.main]
);

#endregion

#region Pages

page = 0;

// NOTE: Must be the same order as the enum menu_page
menu_pages = [
	ds_menu_main, 
	ds_menu_settings, 
	ds_menu_audio, 
	ds_menu_difficulty, 
	ds_menu_graphics, 
	ds_menu_controls
];

var _i = 0;
var _len = array_length_1d(menu_pages);
repeat (_len) {
	menu_option[_i] = 0;
	_i += 1;
}

#endregion