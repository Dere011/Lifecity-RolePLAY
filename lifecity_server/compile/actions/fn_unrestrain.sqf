/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = cursorTarget;

if(isNull _unit || !(_unit getVariable "restrained")) exitWith {};

_unit setVariable["restrained",false,true];
_unit setVariable["playerSurrender",false,true];
_unit setVariable["restrainedCiv",false,true];

[[0,format["%2 enleve les ménottes de %1", name _unit, name player]], "life_fnc_broadcast", west, false] spawn life_fnc_MP;
[[_unit,"Menote"], "life_fnc_playSound", nil, false] spawn life_fnc_MP;