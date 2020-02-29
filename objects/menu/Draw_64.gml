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

var _yy, _ltx, _lty, _xo, _rtx, _rty;

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

draw_set_halign(fa_left);

_rtx = _xs + _xb;
_yy = 0;

repeat (_gh) {
	_rty = _ys + (_yy * _yb);
	_c = c_white;
		
	switch (_grid[# 1, _yy]) {
		case menu_element_type.shift:
			var _cv = _grid[# 3, _yy];
			var _ca = _grid[# 4, _yy];
			var _ls = "<< ";
			var _rs = " >>";
			
			if (_cv == 0) _ls = "";
			if (_cv == array_length_1d(_ca) - 1) _rs = "";
			
			draw_text_color(_rtx, _rty, _ls + _ca[_cv] + _rs, _c, _c, _c, _c, 1);
				
			break;
		case menu_element_type.slider:
			var _len = 64;
			var _cv = _grid[# 3, _yy];
			var _ca = _grid[# 4, _yy];
			var _cp = ((_cv - _ca[0]) / (_ca[1] - _ca[0]));
			
			draw_line_width(_rtx, _rty, _rtx + _len, _rty, 2);
			draw_circle_color(_rtx + (_cp * _len), _rty, 4, _c, _c, false);
			draw_text_color(_rtx + (_len * 1.2), _rty, string(floor(_cp * 100)) + "%", _c, _c, _c, _c, 1);
			
			break;
		case menu_element_type.toggle:
			var _cv = _grid[# 3, _yy];
			var _ca = _grid[# 4, _yy];
			var _c1, _c2;
			
			if (_cv == 0) {
				_c1 = _c;
				_c2 = c_dkgray;
			} else {
				_c1 = c_dkgray;
				_c2 = _c;
			}
			
			draw_text_color(_rtx,      _rty, "ON",  _c1, _c1, _c1, _c1, 1);
			draw_text_color(_rtx + 32, _rty, "OFF", _c2, _c2, _c2, _c2, 1);
			
			break;
	}
	
	_yy += 1;
}

draw_set_valign(fa_top);

#endregion
