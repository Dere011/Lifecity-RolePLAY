/*
	File:
	Author:
	Description:
*/
private["_uid","_unit","_ret","_ownerID"];
_unit 				= [_this,0, ObjNull, [Objnull]] call BIS_fnc_param;
_uid 				= [_this,1, "",      [""]] 		call BIS_fnc_param;

if(isNull _unit OR _uid == "") exitWith {};

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

[[0, "[KEY RESYNC] La resynchronisation des clées est OK."], "life_fnc_broadcast", _unit, false] spawn life_fnc_MP;