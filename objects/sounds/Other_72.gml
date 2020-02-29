/// @description play music

if (audio_group_is_loaded(agMusic)) {
	audio_play_sound(mMenu, 1, true);
	audio_group_set_gain(agMusic, .2, 0);
}