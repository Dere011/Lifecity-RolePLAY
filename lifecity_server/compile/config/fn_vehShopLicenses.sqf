/*
	@file Version: 1.Bf
*/
private["_veh","_ret"];
_veh 	= _this select 0;
_ret 	= false;

_found = [["civ_car", "civ_servt"], life_veh_shop, true] call fn_findString;
if(_found != -1) then {
	_ret = license_civ_driver;
};

_found = [["civ_ship"], life_veh_shop, true] call fn_findString;
if(_found != -1) then {
	_ret = license_civ_boat;
};

_found = [["civ_air"], life_veh_shop, true] call fn_findString;
if(_found != -1) then {
	_ret = license_civ_air;
};

_found = [["cop_air"], life_veh_shop, true] call fn_findString;
if(_found != -1) then {
	_ret = license_cop_air;
};

_found = [["civ_truck"], life_veh_shop, true] call fn_findString;
if(_found != -1) then {
	_ret = license_civ_truck;
};

_found = [["reb_v"], life_veh_shop, true] call fn_findString;
if(_found != -1) then {
	_ret = license_civ_rebel;
};

_found = [["cop_car", "cop_ship"], life_veh_shop, true] call fn_findString;
if(_found != -1) then {
	_ret = true;
};

_ret;