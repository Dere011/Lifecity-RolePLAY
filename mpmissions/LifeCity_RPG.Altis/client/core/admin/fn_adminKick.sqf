private["_unit"];

_unit 	= lbData[2902, lbCurSel(2902)];
_unit 	= format["%1", _unit];
if(isNil "_unit") exitwith {};

[[player, _unit], "life_fnc_kickPlayer", false, false] spawn life_fnc_MP;