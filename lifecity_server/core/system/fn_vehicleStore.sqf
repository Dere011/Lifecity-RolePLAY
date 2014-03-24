/*
	File: fn_vehicleStore.sqf
	Author:
	Description:
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit"];
_vehicle 	= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound 	= [_this,1,false,[true]] call BIS_fnc_param;
_unit 		= [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

[_unit] spawn {
	sleep 15;
	life_garage_store = false;
	life_impound_inuse = false;
	(owner (_this select 0)) publicVariableClient "life_garage_store";
	(owner (_this select 0)) publicVariableClient "life_impound_inuse";
};

if(isNull _vehicle OR isNull _unit) exitWith {
	life_impound_inuse = false; 
	(owner _unit) publicVariableClient "life_impound_inuse";
	life_garage_store = false;
	(owner _unit) publicVariableClient "life_garage_store";
};

_vInfo 		= _vehicle getVariable["dbInfo",[]];
if(count _vInfo > 0) then {
	_plate 	= _vInfo select 1;
	_uid 	= _vInfo select 0;
};

if(_impound) then {
	if(count _vInfo == 0) then {
		deleteVehicle _vehicle;
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
	}else{
		_query 				= format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
		_result 			= "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", _query];
		deleteVehicle _vehicle;
		life_impound_inuse 	= false;
		(owner _unit) publicVariableClient "life_impound_inuse";
	};
}else{
	if(count _vInfo == 0) exitWith {
		life_garage_store = false;
		(owner _unit) publicVariableClient "life_garage_store";
		[[2,"Le véhicule est une location."], "life_fnc_broadcast", (owner _unit), false] spawn life_fnc_MP;
		playSound "dy3k89kScIoPx63";
	};
	
	if(_uid != getPlayerUID _unit) exitWith {
		life_garage_store = false;
		(owner _unit) publicVariableClient "life_garage_store";
		
		[[2, "Le véhicule appartient à une autre personne."],"life_fnc_broadcast",(owner _unit),false] spawn life_fnc_MP;
		playSound "dy3k89kScIoPx63";
	};

	_query 					= format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
	_result 				= "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", _query];
	
	deleteVehicle _vehicle;
	
	life_garage_store 		= false;
	(owner _unit) publicVariableClient "life_garage_store";
	
	[[(owner _unit), "854Jsx97969StRz"], "life_fnc_playSound", nil, false] spawn life_fnc_MP;
	[[1,"Votre véhicule est maintenant au garage."], "life_fnc_broadcast", (owner _unit), false] spawn life_fnc_MP;
};