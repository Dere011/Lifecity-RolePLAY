/*
	File: fn_stopEscorting.sqf
	
	Description:
	ASFSDFHAGFASF
*/
private["_unit"];
_unit = (player getVariable "isEscorting");
if(isNull _unit) exitWith {};
if(!(_unit getVariable "Escorting")) exitWith {};
if(isNull _unit) exitWith {};
detach _unit;
_unit setVariable["Escorting", false,true];
player setVariable["isEscorting", objNull, true];