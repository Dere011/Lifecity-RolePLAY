/*
	File:
	Author:
	Description:
*/
private["_shop","_return","_civ_car","_civ_truck","_civ_air", "_civ_ship", "_reb_veh", "_reb_air", "_cop_veh", "_cop_air", "_cop_ship"];

_shop 		= [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return 	= [];

_civ_car     =
[
    ["B_Quadbike_01_F",2500],
    ["C_Hatchback_01_F",9500],
    ["C_Offroad_01_F",12500],
    ["C_SUV_01_F",35000],
    ["C_Hatchback_01_sport_F",50000]
];

_civ_truck =
[
    ["C_Van_01_transport_F",40000],
    ["C_Van_01_box_F",60000],
    ["I_Truck_02_transport_F",75000],
    ["I_Truck_02_covered_F",100000],
    ["B_Truck_01_transport_F",200000],
    ["B_Truck_01_box_F",400000],
	["B_Truck_01_covered_F",300000]
];

_civ_air =
[
    ["B_Heli_Light_01_F",700000],
    ["O_Heli_Light_02_unarmed_F",1600000]
];

_civ_ship =
[
    ["C_Rubberboat",5000],
    ["C_Boat_Civil_01_F",25000],
    ["O_G_Boat_Transport_01_F",10000]
];

_reb_veh =
[
    ["B_Quadbike_01_F",2500],
    ["B_G_Offroad_01_F",15000],
    ["I_Truck_02_covered_F",80000],
    ["I_Truck_02_transport_F",70000],
    ["B_G_Offroad_01_armed_F",300000],
    ["C_SUV_01_F",35000]
];

if(license_civ_rebel) then {
    _reb_veh set[count _reb_veh, ["O_MRAP_02_F", 150000]];
};

_reb_air =
[
    ["B_Heli_Light_01_F",600000]
];

if(license_civ_rebel) then {
    _reb_air set[count _reb_veh, ["O_Heli_Light_02_unarmed_F", 1000000]];
    _reb_air set[count _reb_veh, ["I_heli_light_03_unarmed_F", 1000000]];
    _reb_air set[count _reb_veh, ["B_Heli_Transport_01_F", 1000000]];
};

_cop_veh =
[
    ["C_Offroad_01_F", 5000],
    ["C_Hatchback_01_sport_F", 50000],
    ["C_SUV_01_F", 20000]
];

if(texceuve >= 3) then {
    _cop_veh set[count _cop_veh, ["B_MRAP_01_F",30000]];
};

_cop_air = [
    ["B_Heli_Light_01_F", 300000]
];

if(texceuve >= 3) then {
    _cop_air set[count _cop_air, ["B_Heli_Transport_01_F",400000]];
};

_cop_ship =
[
    ["B_Boat_Transport_01_F",3000],
    ["C_Boat_Civil_01_police_F",20000],
    ["B_SDV_01_F",100000]
];

_found = [["civ_car"], _shop, true] call fn_findString;
if(_found != -1) then {
	_return = _civ_car;
};

_found = [["civ_truck"], _shop, true] call fn_findString;
if(_found != -1) then {
	_return = _civ_truck;
};

_found = [["reb_car"], _shop, true] call fn_findString;
if(_found != -1) then {
	_return = _reb_veh;
};

_found = [["reb_air"], _shop, true] call fn_findString;
if(_found != -1) then {
	_return = _reb_air;
};

_found = [["cop_car"], _shop, true] call fn_findString;
if(_found != -1) then {
	_return = _cop_veh;
};

_found = [["civ_air"], _shop, true] call fn_findString;
if(_found != -1) then {
	_return = _civ_air;
};

_found = [["cop_air"], _shop, true] call fn_findString;
if(_found != -1) then {
	_return = _cop_air;
};

_found = [["civ_ship"], _shop, true] call fn_findString;
if(_found != -1) then {
	_return = _civ_ship;
};

_found = [["cop_ship"], _shop, true] call fn_findString;
if(_found != -1) then {
	_return = _cop_ship;
};

_return;