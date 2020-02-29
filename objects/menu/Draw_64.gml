/// @description menu

if (!global.pause) exit;

var _c;
var _vw = global.view_width;
var _vh = global.view_height;

var _grid = menu_pages[page];
var _gh = ds_grid_height(_grid);

var _yb = 32;
var _xb = 16;

var _ys = (_vh / 2) - ((((_gh - 1) / 2) * _yb));
var _xs = (_vw / 2);

var _yy, _ltx, _lty, _xo;

#region Draw Pause Menu "Back"

_c = c_black;

draw_rectangle_color(0, 0, _vw, _vh, _c, _c, _c, _c, 0);

#endregion

#region Draw Elements on Left Side

draw_set_valign(fa_middle);
draw_set_halign(fa_right);

_ltx = _xs - _xb;
_yy = 0;

repeat (_gh) {
	_lty = _ys + (_yy * _yb);
	_c = c_white;
	_xo = 0;
	
	if (_yy == menu_option[page]) {
		_c = c_orange;
		_xo = -(_xb / 2);
	}
	
	draw_text_color(_ltx + _xo, _lty, _grid[# 0, _yy], _c, _c, _c, _c, 1);
	
	_yy += 1;
}

#endregion

#region Draw Dividing Line

draw_line(_xs, _ys - _yb, _xs, _lty + _yb);

#endregion

#region Draw Elements on Right Side

#endregion
