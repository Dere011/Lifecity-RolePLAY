/*
	File: fn_update.sqf
	Author:
	Description:
*/
private["_unit","_side","_uid","_money","_bank","_uid","_misc","_licenses"];

_unit 			= [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_side 			= [_this,1,civilian,[sideUnknown]] call BIS_fnc_param;
_money 			= [_this,2,0,[0]] call BIS_fnc_param;
_bank 			= [_this,3,2500,[0]] call BIS_fnc_param;
_uid 			= [_this,4,"",[""]] call BIS_fnc_param;
_licenses 		= [_this,5,[],[[]]] call BIS_fnc_param;
_gear 			= [_this,6,[],[[]]] call BIS_fnc_param;
_has_insurance 	= [_this,7,false,[false]] call BIS_fnc_param;
_has_arrested 	= [_this,8,false,[false]] call BIS_fnc_param;
_money 			= [_money] call DB_fnc_numberSafe;
_bank 			= [_bank] call DB_fnc_numberSafe;

if(isNull _unit OR _uid == "") exitWith {
	if(_uid == "" && !isNull _unit) then {
		[[0, format["%1 had a invalid UID.", name _unit]] ,"life_fnc_broadcast", _unit, false] spawn life_fnc_MP;
	};
};

[_uid, name _unit, _side, _money, _bank, _licenses, _gear, _unit, _has_insurance, _has_arrested] call DB_fnc_update;
