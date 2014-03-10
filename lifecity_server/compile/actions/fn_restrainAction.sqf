/*
	File: fn_restrainAction.sqf
	Author:
	Description:
*/
private["_unit"];
_unit = cursorTarget;

if((_unit getVariable "restrained")) exitWith {};
if(isNull _unit) exitWith {}; //Not valid
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};

_unit setVariable["restrained",true,true];
_unit setVariable["restrainedCiv", false, true];

[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
[[0,format["%1 est menotté par %2", name _unit, name player]], "life_fnc_broadcast", west, false] spawn life_fnc_MP;
[[_unit,"Menote"],"life_fnc_playSound",nil, false] spawn life_fnc_MP;