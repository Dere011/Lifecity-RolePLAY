/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = cursorTarget;

if(isNull _unit || !(_unit getVariable "restrainedCiv")) exitWith {};

_unit setVariable["restrainedCiv",false,true];
_unit setVariable["restrained",false,true];
_unit setVariable["playerSurrender",false,true];

[[_unit, "Menote"], "life_fnc_playSound", nil, false] spawn life_fnc_MP;