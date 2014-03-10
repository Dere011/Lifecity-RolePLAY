/*
	File: fn_restrainAction.sqf
	Author:
	Description:
*/
private["_unit"];
_unit = cursorTarget;

if((_unit getVariable "restrained")) exitWith {};
if((_unit getVariable "restrainedCiv")) exitWith {};

if(isNull _unit) exitWith {};
if(player == _unit) exitWith {};

if (_unit getVariable ["playerSurrender", false]) then {
	_unit setVariable["restrained", true, true];
	_unit setVariable["restrainedCiv", true, true];
	[[player], "life_fnc_restrainCiv", _unit, false] spawn life_fnc_MP;
	[[_unit, "Menote"], "life_fnc_playSound", nil, false] spawn life_fnc_MP;
};