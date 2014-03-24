/*
	File: fn_spawnVehicle.sqf
	Author:
	Description:
*/
private["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name"];
_vid 	= [_this,0,-1,[0]] call BIS_fnc_param;
_pid 	= [_this,1,"",[""]] call BIS_fnc_param;
_sp 	= [_this,2,[],[[]]] call BIS_fnc_param;
_dir 	= [_this,3,0,[0]] call BIS_fnc_param;
_unit 	= [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param;

_name 	= name _unit;
_unit 	= owner _unit;

if(_vid == -1 OR _pid == "" OR count _sp == 0) exitWith {};

if(_vid in serv_sv_use) exitWith {};
serv_sv_use set[count serv_sv_use, _vid];

_vInfo 	= [_vid,_pid] call DB_fnc_queryVehicle;
if(isNil "_vInfo") 		exitWith {serv_sv_use = serv_sv_use - [_vid];};
if(count _vInfo == 0) 	exitWith {serv_sv_use = serv_sv_use - [_vid];};

if((_vInfo select 5) == "False") exitWith {
	serv_sv_use 	= serv_sv_use - [_vid];
	[[2,format["Le véhicule %1 est détruit pour le serveur, impossible de le sortir.", _vInfo select 2]], "life_fnc_broadcast", _unit,false] spawn life_fnc_MP;
	[[_unit,"dy3k89kScIoPx63"], "life_fnc_playSound", _unit, false] spawn life_fnc_MP;
};

if((_vInfo select 6) == "True") exitWith {
	serv_sv_use 	= serv_sv_use - [_vid];
	[[2,format["Le véhicule %1 est déjà sur la carte.", _vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
	[[_unit,"dy3k89kScIoPx63"], "life_fnc_playSound", _unit, false] spawn life_fnc_MP;
};

_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"], 10];
if(count _nearVehicles > 0) exitWith {
	serv_sv_use 	= serv_sv_use - [_vid];
	[[2,"Un véhicule est sur la zone de spawn, action impossible."], "life_fnc_broadcast", _unit, false] spawn life_fnc_MP;
	[[_unit,"dy3k89kScIoPx63"], "life_fnc_playSound", _unit, false] spawn life_fnc_MP;
};

_query 		= format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid];
_sql 		= "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", _query];
_vehicle 	= createVehicle [(_vInfo select 2), _sp, [], _dir, "CAN_COLLIDE"];
_vehicle setPos _sp;
_vehicle setDir _dir;

[[_vehicle, {
	_vehicle = _this select 0;
	_vehicle allowDamage false;
	_vehicle addEventHandler["handleDamage",{false}];
	[_vehicle] spawn
	{
		private["_v"];
		_v = _this select 0;
		sleep 30;
		_v allowDamage true;
		_v removeallEventHandlers "handleDamage";
		_v addEventHandler["handleDamage",{_damage = ((_this select 2)/5); 0;}];
	};
}], "BIS_fnc_spawn", _unit, false] spawn life_fnc_MP;

_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable["dbInfo",[(_vInfo select 4),(call compile format["%1", _vInfo select 7])]];
_vehicle addEventHandler["Killed","_this spawn STS_fnc_vehicleDead"];

[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle lock 2;
[[_vehicle], "STS_fnc_addVehicle2Chain", _unit, false] spawn life_fnc_MP;
[[_vehicle,(call compile format["%1",_vInfo select 8])], "life_fnc_colorVehicle", true, false] spawn life_fnc_MP;

if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F") then {
	[_vehicle, "civ_littlebird", true] call life_fnc_vehicleAnimate;
};
if((_vInfo select 1) == "cop" && (_vInfo select 2) == "C_Offroad_01_F") then {
	[_vehicle, "cop_offroad", true] call life_fnc_vehicleAnimate;
};

serv_sv_use  = serv_sv_use - [_vid];

[[2,"Le vehicule est maintenant sur la zone de spawn."], "life_fnc_broadcast", _unit, false] spawn life_fnc_MP;
[[_vehicle,"T5zrlTg5DCo0876"], "life_fnc_playSound", nil, false] spawn life_fnc_MP;