/*
	File: fn_putInCar.sqf
	
	Description:
	GETTING SICK OF WRITING DESCRIPTIONS.
*/
private["_unit","_ nearest"];

_unit 		= cursorTarget;
_nearest 	= (player getVariable "isEscorting");
if(isNull _nearest) exitWith {}; //Not valid
if(side _nearest != civilian) exitWith {}; //Not a civ
if(isNull _nearest) exitWith {}; //Not valid
if(!(_nearest getVariable "restrained")) exitwith {};
detach _nearest;
[[_unit],"life_fnc_moveIn",_nearest,false] spawn life_fnc_MP;
_nearest setVariable["Escorting",false,true];
_nearest setVariable["transporting",true,true];
player setVariable["isEscorting", objNull, true];