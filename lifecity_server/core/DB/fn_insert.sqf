/*
	File:
	Author:
	Description:
*/
private["_uid","_name","_side","_money","_bank","_misc","_query","_result","_array"];

_uid 		= [_this,0,"",[""]] call BIS_fnc_param;
_name 		= [_this,1,"",[""]] call BIS_fnc_param;
_side 		= [_this,2,civilian,[sideUnknown]] call BIS_fnc_param;
_money 		= [_this,3,"0",[""]] call BIS_fnc_param;
_bank 		= [_this,4,"2500",[""]] call BIS_fnc_param;
_misc 		= [_this,5,[],[[],false]] call BIS_fnc_param;
_dbName 	= ["Player_", _uid] call PDB_databaseNameCompiler;
_check 		= (_dbName) call iniDB_exists;

if((_uid == "") OR (_name == "")) 	exitWith {};
if(_check) 							exitWith {};

[_dbName, _uid, "playerid", _uid] call iniDB_write;
[_dbName, _uid, "name", _name] call iniDB_write;
[_dbName, _uid, "cash", _money] call iniDB_write;
[_dbName, _uid, "bankacc", _bank] call iniDB_write;
[_dbName, _uid, "coplevel", 0] call iniDB_write;
[_dbName, _uid, "reblevel", 0] call iniDB_write;
[_dbName, _uid, "cop_licenses", []] call iniDB_write;
[_dbName, _uid, "adminlevel", 0] call iniDB_write;
[_dbName, _uid, "blacklist", false] call iniDB_write;
[_dbName, _uid, "civ_gear", []] call iniDB_write;
[_dbName, _uid, "civ_licenses", []] call iniDB_write;
[_dbName, _uid, "arrested", false] call iniDB_write;
[_dbName, _uid, "donatorlvl", 0] call iniDB_write;
[_dbName, _uid, "cop_gear", []] call iniDB_write;
[_dbName, _uid, "has_insurance", false] call iniDB_write;
[_dbName, _uid, "is_banned", false] call iniDB_write;
[_dbName, _uid, "last_position", []] call iniDB_write;