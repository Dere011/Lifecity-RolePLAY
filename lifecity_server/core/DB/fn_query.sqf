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

_uid 		= [_this,0, "", [""]] 			call BIS_fnc_param;
_unit 		= [_this,1, ObjNull, [Objnull]] call BIS_fnc_param;
_dbName 	= ["Player_", _uid] 			call PDB_databaseNameCompiler;
_check 		= (_dbName) call iniDB_exists;
_updated	= false;

if(_uid == "") exitWith {['Invalide UID']};

_query 			= format["SELECT playerid, name, cash, bankacc, coplevel, cop_licenses, adminlevel, blacklist, cop_gear, civ_licenses, arrested, donatorlvl, civ_gear FROM players WHERE playerid='%1'",_uid];

if(!_check) then {
	_sql 		= "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_players', '%1']", _query];
	_sql		= call compile format["%1", _sql];

	if(isNil {((_sql select 0) select 0)}) exitWith {['NEW_PLAYER']};
	_ret 		= ((_sql select 0) select 0);
	if(count _ret == 0) exitWith {[]};
	
	cop_licenses	=	[(_ret select 5)] call DB_fnc_mresToArray;
	cop_gear		=	[];
	civ_licenses	=	[(_ret select 9)] call DB_fnc_mresToArray;
	civ_gear		=	[];
	
	[_dbName, _uid, "playerid", _uid] call iniDB_write;
	[_dbName, _uid, "name", (_ret select 1)] call iniDB_write;
	[_dbName, _uid, "cash", (_ret select 2)] call iniDB_write;
	[_dbName, _uid, "bankacc", (_ret select 3)] call iniDB_write;
	[_dbName, _uid, "coplevel", (_ret select 4)] call iniDB_write;
	[_dbName, _uid, "cop_licenses", [cop_licenses] call DB_fnc_mresArrayLC] call iniDB_write;
	[_dbName, _uid, "adminlevel", (_ret select 6)] call iniDB_write;
	[_dbName, _uid, "blacklist", (_ret select 7)] call iniDB_write;
	[_dbName, _uid, "cop_gear", [cop_gear] call DB_fnc_mresArrayLC] call iniDB_write;
	[_dbName, _uid, "civ_licenses", [civ_licenses] call DB_fnc_mresArrayLC] call iniDB_write;
	[_dbName, _uid, "arrested", (_ret select 10)] call iniDB_write;
	[_dbName, _uid, "donatorlvl", (_ret select 11)] call iniDB_write;
	[_dbName, _uid, "civ_gear", [civ_gear] call DB_fnc_mresArrayLC] call iniDB_write;
	[_dbName, _uid, "has_insurance", false] call iniDB_write;
	[_dbName, _uid, "is_banned", false] call iniDB_write;
	_updated		= true;
};

__player_is_banned		= [[_dbName, _uid, "is_banned", "NUMBER"] call iniDB_read, 1] call DB_fnc_bool;
__player_has_insurance	= [[_dbName, _uid, "has_insurance", "NUMBER"] call iniDB_read, 1] call DB_fnc_bool;
__player_uuid			= [_dbName, _uid, "playerid", "NUMBER"] call iniDB_read;
__player_name			= [_dbName, _uid, "name", "STRING"] call iniDB_read;
__player_cash			= [_dbName, _uid, "cash", "NUMBER"] call iniDB_read;
__player_bankacc		= [_dbName, _uid, "bankacc", "NUMBER"] call iniDB_read;
if(_updated) then {
	__player_bankacc	= __player_bankacc + 100000;
};
__player_coplevel		= [_dbName, _uid, "coplevel", "NUMBER"] call iniDB_read;
__player_serveruuid		= [_dbName, _uid, "serv_uuid", "NUMBER"] call iniDB_read;

__player_cop_licenses	= [_dbName, _uid, "cop_licenses", "ARRAY"] 		call iniDB_read;
if(typeName __player_cop_licenses == "ARRAY") then {
	if(count __player_cop_licenses > 0) then {
		for "_i" from 0 to (count __player_cop_licenses)-1 do {
			_data 				= __player_cop_licenses select _i;
			__player_cop_licenses set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
		};
	};
}else{
	__player_cop_licenses	= [];
};

__player_adminlevel		= [_dbName, _uid, "adminlevel", "NUMBER"] call iniDB_read;
__player_blacklist		= [[_dbName, _uid, "blacklist", "NUMBER"] call iniDB_read, 1] call DB_fnc_bool;

__player_cop_gear		= [_dbName, _uid, "cop_gear", "ARRAY"] 	call iniDB_read;
if(typeName __player_cop_gear != "ARRAY") then {
	__player_cop_gear	= [];
};

__player_civ_licenses	= [_dbName, _uid, "civ_licenses", "ARRAY"] 	call iniDB_read;
if(typeName __player_civ_licenses == "ARRAY") then {
	if(count __player_civ_licenses > 0) then {
		for "_i" from 0 to (count __player_civ_licenses)-1 do
		{
			_data 				= __player_civ_licenses select _i;
			__player_civ_licenses set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
		};
	};
}else{
	__player_civ_licenses = [];
};

__player_arrested		= [[_dbName, _uid, "arrested", "NUMBER"] 		call iniDB_read, 1] call DB_fnc_bool;
__player_donatorlvl		= [_dbName, _uid, "donatorlvl", "NUMBER"] 		call iniDB_read;

__player_civ_gear		= [_dbName, _uid, "civ_gear", "ARRAY"]			call iniDB_read;
if(typeName __player_civ_gear != "ARRAY") then {
	__player_civ_gear	= [];
};

if(__player_serveruuid == serv_uuid) then {
	{
		_veh 			= _x;
		_vehicleClass 	= getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");
		if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then {
			_dbInfo 	= _veh getVariable["dbInfo", []];
			if(count _dbInfo > 0) then {
				_vuid = _dbInfo select 0;
				if(_vuid == _uid) then {
					[[_veh],"STS_fnc_addVehicle2Chain", _unit, false] spawn life_fnc_MP;
				};
			};
		};
	} foreach vehicles;
};

_result_final			= [__player_uuid, __player_name, __player_cash, __player_bankacc, __player_coplevel, __player_cop_licenses, __player_adminlevel, __player_blacklist, __player_cop_gear, __player_civ_licenses, __player_arrested, __player_donatorlvl, __player_civ_gear, __player_has_insurance, __player_is_banned, _updated];
_result_final;