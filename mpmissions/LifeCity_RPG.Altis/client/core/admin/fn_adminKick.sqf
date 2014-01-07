private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {hint "NO";};
if(isNull _unit) exitWith {hint "NO";};

[[_unit,player],"STS_fnc_kickPlayer",false,false] spawn life_fnc_MP;