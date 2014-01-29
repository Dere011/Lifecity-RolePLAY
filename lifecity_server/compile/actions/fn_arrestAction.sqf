/*
	File: fn_arrestAction.sqf
	Description:
*/
private["_unit","_id"];
_unit 		= cursorTarget;
_minutes 	= [_this,3,5,[[],0]] call BIS_fnc_param;

if(isNull _unit) exitWith {};
if(isNil "_unit") exitwith {};
if(!(_unit isKindOf "Man")) exitWith {};
if(!isPlayer _unit) exitWith {};
if(!(_unit getVariable "restrained")) exitWith {};
if(side _unit != civilian) exitWith {};
if(isNull _unit) exitWith {};

[[_unit,player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
if(isNull _unit) exitWith {};
detach _unit;
[[_unit,false,_minutes],"life_fnc_jail",_unit,false] spawn life_fnc_MP;
[[0,format["%1 est mis en prison par %2 pour %3 minutes.", name _unit, name player, _minutes]], "life_fnc_broadcast", true, false] spawn life_fnc_MP;