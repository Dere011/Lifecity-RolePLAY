/*
	File: fn_cleanup.sqf
	Author:
	
	Description:
*/
while {true} do
{
	private["_veh","_units"];
	sleep (15 * 60);
	
	{
		_veh = _x;
		_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");
		
		if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then
		{
			_dbInfo = _veh getVariable["dbInfo",[]];
			_units = {(_x distance _veh < 300)} count playableUnits;
			if(count crew _x == 0) then
			{
				switch (true) do
				{
					case ((_x getHitPointDamage "HitEngine") > 0.7 && _units == 0) : {deleteVehicle _x};
					case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units == 0) : {deleteVehicle _x};
					case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x};
					case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units == 0) : {deleteVehicle _x};
					case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x};
					case (_units == 0): {deleteVehicle _x};
				};
			};
			
			if(isNull _veh) then
			{
				if(count _dbInfo > 0) then
				{
					_uid = _dbInfo select 0;
					_plate = _dbInfo select 1;

					_query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
					_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", _query];
				};
			};
		};
	} foreach vehicles;
	
	{
		if((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then
		{
			_units = {(_x distance _veh < 300)} count playableUnits;
			if(_units == 0) then {
				deleteVehicle _x;
			}
		};
	} foreach (allMissionObjects "Thing");
	
	{
		deleteVehicle _x;
	} foreach (allMissionObjects "GroundWeaponHolder");
	
	{
		if (count units _x == 0) then
		{
			deleteGroup _x;
		};
	} forEach allGroups;
};