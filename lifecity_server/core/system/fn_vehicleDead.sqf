/*
	File: fn_vehicleDead.sqf
	
	Description:
	Tells the database that this vehicle has died and can't be recovered.
*/
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo"];
_vehicle 	= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_dbInfo 	= _vehicle getVariable["dbInfo",[]];
if(count _dbInfo == 0) exitWith {};
_uid 		= _dbInfo select 0;
_plate 		= _dbInfo select 1;
_query 		= format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'", _uid, _plate];
_sql 		= "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", _query];
_fire 		= "test_EmptyObjectForFireBig" createVehicle (position _vehicle);

[[1,"[CanBUS] Un de vos vehicules est detruit."], "life_fnc_broadcast", _uid, false] spawn life_fnc_MP;

sleep (30);

deleteVehicle _fire;

sleep (20);

deleteVehicle _vehicle;

