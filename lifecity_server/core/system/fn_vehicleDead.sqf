/*
	File:
	Description:
*/
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo"];
_vehicle 	= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_dbInfo 	= _vehicle getVariable["dbInfo",[]];
_vehicle setVariable["isDestroyed", time, false];

if(count _dbInfo == 0) exitWith {};
_uid 		= _dbInfo select 0;
_plate 		= _dbInfo select 1;
_query 		= format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'", _uid, _plate];
_sql 		= "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", _query];

_nearestTargets 		= (getPos _vehicle) nearEntities ["Man", 50];  
{
	if (alive _x && isPlayer _x) then {
		_meters			= _vehicle distance _x;
		if(_meters <= 20) then {
			_x spawn {
				_this allowDamage false;
				[[_this, "AinjPfalMstpSnonWnonDf_carried_fallwc"], "life_fnc_animSync", nil, false] spawn life_fnc_MP;
				_this lock 1;
				sleep 6;
				detach _this;
				[[_this,"amovppnemstpsraswrfldnon"], "life_fnc_animSync", nil, false] spawn life_fnc_MP;
				_this allowDamage true;
				_this lock 0;
			};
		};
		[[_meters],"life_fnc_tremble", _x, false] spawn life_fnc_MP;
	};
} foreach _nearestTargets;

sleep (60*15);

if(!(isNull _vehicle)) then {
	deleteVehicle _vehicle;
};