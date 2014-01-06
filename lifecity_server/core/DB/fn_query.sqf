/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_query.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Queries the MySQL data for the player information, if entry is not found
	the result will return an empty array.
*/
private["_uid","_side","_sql","_query","_old","_dbName","_check"];

_uid 	= [_this,0,"",[""]] call BIS_fnc_param;
_side 	= [_this,1,civilian,[civilian]] call BIS_fnc_param;
_dbName = ["Player_", _uid] call PDB_databaseNameCompiler;

if(_uid == "") exitWith {['Invalide UID']};

_query 			= format["SELECT playerid, name, cash, bankacc, coplevel, cop_licenses, adminlevel, blacklist, cop_gear, civ_licenses, arrested, donatorlvl, civ_gear FROM players WHERE playerid='%1'",_uid];
_check 			= (_dbName) call iniDB_exists;

if(!_check) then {
	_sql 		= "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_players', '%1']", _query];
	_sql		= call compile format["%1", _sql];
	
	if(isNil {((_sql select 0) select 0)}) exitWith {['NEW_PLAYER']};
	_ret 		= ((_sql select 0) select 0);
	if(count _ret == 0) exitWith {[]};
	
	[_dbName, _uid, "playerid", _uid] call iniDB_write;
	[_dbName, _uid, "name", (_ret select 1)] call iniDB_write;
	[_dbName, _uid, "cash", (_ret select 2)] call iniDB_write;
	[_dbName, _uid, "bankacc", (_ret select 3)] call iniDB_write;
	[_dbName, _uid, "coplevel", (_ret select 4)] call iniDB_write;
	[_dbName, _uid, "cop_licenses",  call compile format["%1", (_ret select 5) call DB_fnc_mresToArray]] call iniDB_write;
	[_dbName, _uid, "adminlevel", (_ret select 6)] call iniDB_write;
	[_dbName, _uid, "blacklist", (_ret select 7)] call iniDB_write;
	[_dbName, _uid, "cop_gear", call compile format["%1", (_ret select 8) call DB_fnc_mresToArray]] call iniDB_write;
	[_dbName, _uid, "civ_licenses", call compile format["%1", (_ret select 9) call DB_fnc_mresToArray]] call iniDB_write;
	[_dbName, _uid, "arrested", (_ret select 10)] call iniDB_write;
	[_dbName, _uid, "donatorlvl", (_ret select 11)] call iniDB_write;
	[_dbName, _uid, "civ_gear", call compile format["%1", (_ret select 12) call DB_fnc_mresToArray]] call iniDB_write;
};

__player_uuid			= [_dbName, _uid, "playerid", "NUMBER"] call iniDB_read;
__player_name			= [_dbName, _uid, "name", "STRING"] call iniDB_read;
__player_cash			= [_dbName, _uid, "cash", "NUMBER"] call iniDB_read;
__player_bankacc		= [_dbName, _uid, "bankacc", "NUMBER"] call iniDB_read;
__player_coplevel		= [_dbName, _uid, "coplevel", "NUMBER"] call iniDB_read;
__player_cop_licenses	= [_dbName, _uid, "cop_licenses", "ARRAY"] call iniDB_read;
__player_adminlevel		= [_dbName, _uid, "adminlevel", "NUMBER"] call iniDB_read;
__player_blacklist		= [[_dbName, _uid, "blacklist", "NUMBER"] call iniDB_read, 1] call DB_fnc_bool;
__player_cop_gear		= [_dbName, _uid, "cop_gear", "ARRAY"] call iniDB_read;
__player_civ_licenses	= [_dbName, _uid, "civ_licenses", "ARRAY"] call iniDB_read;
__player_arrested		= [[_dbName, _uid, "arrested", "NUMBER"] call iniDB_read, 1] call DB_fnc_bool;
__player_donatorlvl		= [_dbName, _uid, "donatorlvl", "NUMBER"] call iniDB_read;
__player_civ_gear		= [_dbName, _uid, "civ_gear", "ARRAY"] call iniDB_read;

_result_final			= [__player_uuid, __player_name, __player_cash, __player_bankacc, __player_coplevel, __player_cop_licenses, __player_adminlevel, __player_blacklist, __player_cop_gear, __player_civ_licenses, __player_arrested, __player_donatorlvl, __player_civ_gear];
_result_final;