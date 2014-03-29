/*
	File: fn_query.sqf
	Author:
	Description:
*/
private["_uid","_side","_sql","_query","_old","_dbName","_check"];

_uid 		= [_this,0, "", [""]] 			call BIS_fnc_param;
_unit 		= [_this,1, ObjNull, [Objnull]] call BIS_fnc_param;
_dbName 	= ["Player_", _uid] 			call PDB_databaseNameCompiler;
_check 		= (_dbName) 					call iniDB_exists;

if(_uid == "") exitWith {'Invalide UID'};
if(!_check)    exitWith {[]};

__player_is_banned			= [[_dbName, _uid, "is_banned", "NUMBER"] call iniDB_read, 1] call DB_fnc_bool;
__player_has_insurance		= [[_dbName, _uid, "has_insurance", "NUMBER"] call iniDB_read, 1] call DB_fnc_bool;
__player_uuid				= [_dbName, _uid, "playerid", "NUMBER"] call iniDB_read;
__player_name				= [_dbName, _uid, "name", "STRING"] call iniDB_read;
__player_cash				= [_dbName, _uid, "cash", "NUMBER"] call iniDB_read;
__player_bankacc			= [_dbName, _uid, "bankacc", "NUMBER"] call iniDB_read;
__player_coplevel			= [_dbName, _uid, "coplevel", "NUMBER"] call iniDB_read;
__player_reblevel			= [_dbName, _uid, "reblevel", "NUMBER"] call iniDB_read;
__player_serveruuid			= [_dbName, _uid, "serv_uuid", "NUMBER"] call iniDB_read;
__player_has_lifeinsurance  = [[_dbName, _uid, "has_lifeinsurance", "NUMBER"] call iniDB_read, 1] call DB_fnc_bool;

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

__player_lastposition   = [_dbName, _uid, "last_position", "ARRAY"]			call iniDB_read;

_result_final			= [__player_uuid, __player_name, __player_cash, __player_bankacc, __player_coplevel, __player_cop_licenses, __player_adminlevel, __player_blacklist, __player_cop_gear, __player_civ_licenses, __player_arrested, __player_donatorlvl, __player_civ_gear, __player_has_insurance, __player_is_banned, __player_lastposition, __player_reblevel, __player_has_lifeinsurance];
_result_final;