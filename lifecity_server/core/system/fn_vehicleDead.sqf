/*
	File:
	Description:
*/
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_fire","_smoke"];
_vehicle 	= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_dbInfo 	= _vehicle getVariable["dbInfo",[]];
if(count _dbInfo == 0) exitWith {};
_uid 		= _dbInfo select 0;
_plate 		= _dbInfo select 1;
_query 		= format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'", _uid, _plate];
_sql 		= "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", _query];

/*
	_smoke 		= "SmokeShell" createvehicle [getpos _vehicle select 0, getpos _vehicle select 1, getpos _vehicle select 2];
	_smoke attachto [_vehicle,[-0.0,-0.00,0.44]];
	_nearestTargets 		= (getPos _vehicle) nearEntities ["Man", 50];  
	{
		if (alive _x) then {
			_meters			= _vehicle distance _x;
			if(_meters < 5) then {
				[[_x, "AinjPfalMstpSnonWnonDf_carried_fallwc"], "life_fnc_animSync", true, false] spawn life_fnc_MP;
			};
			[[_meters],"life_fnc_tremble", _x, false] spawn life_fnc_MP;
		};
	} foreach _nearestTargets;
*/

sleep (120);

deleteVehicle _vehicle;