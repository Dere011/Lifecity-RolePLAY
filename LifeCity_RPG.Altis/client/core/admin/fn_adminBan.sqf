private["_unit"];

_unit 	= lbData[2902, lbCurSel(2902)];
_unit 	= call compile format["%1", _unit];
if(isNil "_unit") exitwith {};

[[_unit, player], "life_fnc_banPlayer", nil, false] spawn life_fnc_MP;