/*
	File: fn_vehicleShopBuy.sqf
	Author:
	Description:
*/
private["_index","_veh","_color","_price","_sp","_kill","_dir","_name","_sv","_fed","_double","_isGood", "_save"];

_kill 				= false;
_double 			= false;
_isGood 			= false;
_save				= (_this select 0);

switch(life_veh_shop) do {
	case "civ_car_1": {
		_sp 		= getMarkerPos "civ_car_kavala_01";
		_dir 		= markerDir "civ_car_kavala_01";
		if(count(nearestObjects[_sp,["Car","Ship","Air"],5]) > 0) then {
			_sp 	= getMarkerPos "civ_car_kavala_02";
			_dir 	= markerDir "civ_car_kavala_02";
		};
		if(count(nearestObjects[_sp,["Car","Ship","Air"],5]) > 0) then {
			_sp 	= getMarkerPos "civ_car_kavala_03";
			_dir 	= markerDir "civ_car_kavala_03";
		};
		_isGood 	= true;
	};
	
	case "civ_air_1":
	{
		_sp = getMarkerPos "civ_air_1";
		_dir = markerDir "civ_air_1";
		if(count(nearestObjects[_sp,["Car","Ship","Air"],2]) > 0) then 
		{
			_sp = getMarkerPos "civ_air_1_2";
			_dir = markerDir "civ_air_1_2";
		};
		_isGood 	= true;
	};
	
	case "civ_air_2":
	{
		_sp = getMarkerPos "civ_air_2";
		_dir = markerDir "civ_air_2";
		if(count(nearestObjects[_sp,["Car","Ship","Air"],2]) > 0) then 
		{
			_sp = getMarkerPos "civ_car_2_2";
			_dir = markerDir "civ_car_2_2";
		};
		_isGood 	= true;
	};
	
	case "civ_truck_2":
	{
		_sp = getMarkerPos "civ_truck_2";
		_dir = markerDir "civ_truck_2";
		if(count(nearestObjects[_sp,["Car","Ship","Air"],3]) > 0) then 
		{
			_sp = getMarkerPos "civ_truck_2_1";
			_dir = markerDir "civ_truck_2_1";
		};
		_isGood 	= true;
	};
};

if(!_isGood) then {
	_sp 		= getMarkerPos life_veh_shop;
	_dir 		= markerDir life_veh_shop;
};

_index 			= lbCurSel 2302;
_veh 			= lbData[2302,_index];
_color 			= lbValue[2303,(lbCurSel 2303)];
_price 			= lbValue[2302,(lbCurSel 2302)];

if(!([_veh] call life_fnc_vehShopLicenses)) 				exitWith {
	hint "Vous n'avez pas la licence requise!";
	playSound "dy3k89kScIoPx63";
};

if(_price < 0) 												exitWith {};

if(_save) then {
	_price = _price * 1.5;
}else{
	_price = _price;
};

if(dawwpqsa < _price) exitWith {
	hint "Vous n'avez pas assez d'argent.";
	playSound "dy3k89kScIoPx63";
};

if(count(nearestObjects[_sp,["Car","Ship","Air"], 5]) > 0) 	exitWith {
	hint "Il ya est un véhicule sur le point de spawn."; 
	playSound "dy3k89kScIoPx63";
};

_sv 			= false;
if(_veh == "serv_truck") then {
	_name 		= "Service Truck";
	_veh 		= "C_Offroad_01_F";
	_sv 		= true;
}else{
	_name = getText(configFile >> "CfgVehicles" >> _veh >> "displayName");
};

_vehicle 		= _veh createVehicle _sp;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setPos _sp;
_vehicle setDir _dir;
_vehicle allowDamage false;
_vehicle addEventHandler["handleDamage",{false}];
[_vehicle] spawn
{
	private["_v"];
	_v = _this select 0;
	sleep 30;
	_v allowDamage true;
	_v removeallEventHandlers "handleDamage";
	_v addEventHandler["handleDamage",{_damage = ((_this select 2)/5); _damage;}];
};

_vehicle setVariable["trunk_in_use",false,true];
[_vehicle] call life_fnc_clearVehicleAmmo;

if(_sv) then {
	[_vehicle,"service_truck",true] call life_fnc_vehicleAnimate;
	_color 	= 4;
};

_vehicle setVariable["vehicle_info_owners", [[getPlayerUID player,name player]], true];

life_vehicles set[count life_vehicles,_vehicle];
dawwpqsa 		= dawwpqsa - _price;

if(playerSide == west) then {
	if(_veh == "C_Offroad_01_F") then {
		[_vehicle,"cop_offroad",true] call life_fnc_vehicleAnimate;
	};
};

[[_vehicle,_color],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;

if(_save) then {
	[[(getPlayerUID player), playerSide, _vehicle, _color],"STS_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
	hint format["Vous avez achete un %1 pour $%2",_name,[_price] call life_fnc_numberText];
}else{
	hint format["Vous avez loue un %1 pour $%2", _name, [_price] call life_fnc_numberText];
};

_vehicle lock 2;
if((life_veh_shop == "civ_air_1" OR life_veh_shop == "civ_air_2") && (typeOf _vehicle == "B_Heli_Light_01_F")) then {
	[_vehicle,"civ_littlebird",true] call life_fnc_vehicleAnimate;
};

[[_vehicle,"T5zrlTg5DCo0876"], "life_fnc_playSound", nil, false] spawn life_fnc_MP;
[1, true] call life_fnc_sessionHandle;