/*
	@file Version: 1.Bf
*/
private["_veh","_ret"];
_veh 	= _this select 0;
_ret 	= false;

switch (life_veh_shop) do {
	case "civ_car_1": {_ret = license_civ_driver;};
	case "civ_car_2": {_ret = license_civ_driver;};
	case "civ_car_3": {_ret = license_civ_driver;};
	case "civ_car_4": {_ret = license_civ_driver;};
	case "civ_ship_1": {_ret = license_civ_boat;};
	case "civ_ship_2": {_ret = license_civ_boat;};
	case "civ_ship_3": {_ret = license_civ_boat;};
	case "civ_air_1": {_ret = license_civ_air;};
	case "civ_air_2": {_ret = license_civ_air;};
	case "cop_air_1": {_ret = license_cop_air;};
	case "cop_air_2": {_ret = license_cop_air;};
	case "cop_air_3": {_ret = license_cop_air;};
	case "civ_truck_1":	{_ret = license_civ_truck;};
	case "civ_truck_2":	{_ret = license_civ_truck;};
	case "civ_servt_1": {_ret = license_civ_driver;};
	case "reb_v_1": {_ret = license_civ_rebel;};
	case "reb_v_2": {_ret = license_civ_rebel;};
	case "reb_v_3": {_ret = license_civ_rebel;};
	case "cop_car_1": {_ret = true;};
	case "cop_car_2": {_ret = true;};
	case "cop_car_3": {_ret = true;};
	case "cop_car_5": {_ret = true;};
	case "cop_car_6": {_ret = true;};
	case "cop_car_7": {_ret = true;};
	case "cop_ship_1": {_ret = true;};
};

_ret;