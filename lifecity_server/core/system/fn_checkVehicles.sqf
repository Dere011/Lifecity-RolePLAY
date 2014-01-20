/*
	File: fn_checkVehicles.sqf
	Author:
	Description:
*/
private["_pid","_unit","_vuid", "_dbInfo", "_veh"];
_pid 	= [_this,0,"",[""]] call BIS_fnc_param;
_unit 	= [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;

{
	_veh 			= _x;
	_vehicleClass 	= getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");
	if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then {
		_dbInfo 	= _veh getVariable["dbInfo", []];
		if(count _dbInfo > 0) then {
			_vuid = _dbInfo select 0;
			if(_vuid == _pid) then {
				[[_veh],"STS_fnc_addVehicle2Chain", _unit, false] spawn life_fnc_MP;
			};
		};
	};
} foreach vehicles;