/*
	File: fn_add.sqf
	Author:
	Description:
*/
private["_unit","_side","_uid","_money","_bank","_uid","_ownerID","_misc","_handle"];

_unit 		= [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_side 		= [_this,1,civilian,[sideUnknown]] call BIS_fnc_param;
_money 		= [_this,2,0,[0]] call BIS_fnc_param;
_bank 		= [_this,3,2500,[0]] call BIS_fnc_param;
_uid 		= [_this,4,"",[""]] call BIS_fnc_param;
_money 		= [_money] call DB_fnc_numberSafe;
_bank 		= [_bank] call DB_fnc_numberSafe;

if(isNull _unit OR _uid == "") exitWith {if(_uid == "" && !isNull _unit) then {diag_log format["%1 had a invalid UID.",name _unit];};};

_ownerID 	= owner _unit;

switch (_side) do {
	case west: {_misc = [_this,5,[],[[]]] call BIS_fnc_param;};
	case civilian: {_misc = [_this,5,false,[false]] call BIS_fnc_param;};
};
_handle 	= [_uid, name _unit, _side, _money, _bank, _misc] spawn DB_fnc_insert;

waitUntil {scriptDone _handle};

_ret 		= [_uid, _unit] call DB_fnc_query;
[_ret, "life_fnc_sessionReceive", _ownerID, false] spawn life_fnc_MP;