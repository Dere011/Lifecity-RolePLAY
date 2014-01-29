/*
	File:
	Author:
	Description:
*/
private["_shop","_return","_civ_car","_civ_truck","_civ_air", "_civ_ship", "_reb_veh", "_reb_air", "_cop_veh", "_cop_air", "_cop_ship"];

_shop 		= [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return 	= [];

_civ_car 	= 
[
	["B_Quadbike_01_F",2500],
	["C_Hatchback_01_F",9500],
	["C_Offroad_01_F",12500],
	["C_SUV_01_F",35000],
	["C_Van_01_transport_F",40000],
	["C_Hatchback_01_sport_F",80000]
];

_civ_truck = 
[
	["C_Van_01_box_F",60000],
	["I_Truck_02_transport_F",75000],
	["I_Truck_02_covered_F",100000],
	["B_Truck_01_transport_F",200000],
	["B_Truck_01_box_F",275000]
];

_civ_air =
[
	["B_Heli_Light_01_F",175000],
	["O_Heli_Light_02_unarmed_F",375000]
];

_civ_ship =
[
	["C_Rubberboat",5000],
	["C_Boat_Civil_01_F",22000]
];

_reb_veh = 
[
	["B_Quadbike_01_F",2500],
	["B_G_Offroad_01_F",15000],
	["B_Heli_Light_01_F",275000]
];

if(license_civ_rebel) then {
	_reb_veh set[count _reb_veh, ["O_MRAP_02_F", 150000]];
};

_reb_air = 
[
	["B_Heli_Light_01_F",275000],
	["O_Heli_Light_02_unarmed_F",350000]
];

_cop_veh = 
[
	["C_Offroad_01_F", 5000],
	["C_Hatchback_01_sport_F", 80000],
	["C_SUV_01_F", 20000]
];

if(lc_cl >= 3) then {
	_cop_veh set[count _cop_veh, ["B_MRAP_01_F",30000]];
};

_cop_air = [
	["B_Heli_Light_01_F", 75000]
];

if(lc_cl >= 3) then {
	_cop_air set[count _cop_air, ["B_Heli_Transport_01_F",200000]];
};

_cop_ship =
[
	["B_Boat_Transport_01_F",3000],
	["C_Boat_Civil_01_police_F",20000],
	["B_SDV_01_F",100000]
];

switch (_shop) do
{
	case "civ_car_1":
	{
		_return = _civ_car;
	}; 
	
	case "civ_car_2":
	{
		_return = _civ_car;
	};
	
	case "civ_car_3":
	{
		_return = _civ_car;
	}; 
	
	case "civ_car_4":
	{
		_return = _civ_car;
	};
			
	case "civ_truck_1":
	{
		_return = _civ_truck;
	};
	
	case "civ_truck_2":
	{
		_return = _civ_truck;	
	};
	
	case "civ_servt_1":
	{
		_return = _civ_truck;
	};
	
	case "reb_v_1":
	{
		_return = _reb_veh;
	};
	
	case "reb_v_2":
	{
		_return = _reb_veh;
	};
	
	case "reb_v_3":
	{
		_return = _reb_veh;
	};
			
	case "reb_car":
	{
		_return = _reb_veh;
	};
	
	case "reb_car2":
	{
		_return = _reb_veh;
	};
	
	case "reb_air":
	{
		_return = _reb_air;
	};
	
	case "cop_car_1":
	{
		_return = _cop_veh;
	};
	
	case "cop_car_2":
	{
		_return = _cop_veh;
	};
	
	case "cop_car_3":
	{
		_return = _cop_veh;
	};
	
	case "cop_car_5":
	{
		_return = _cop_veh;
	};
	
	case "cop_car_6":
	{
		_return = _cop_veh;
	};

	case "civ_air_1":
	{
		_return = _civ_air;
	};
	
	case "civ_air_2":
	{
		_return = _civ_air;
	};
	
	case "cop_air_1":
	{
		_return = _cop_air;
	};
	
	case "cop_air_2":
	{
		_return = _cop_air;
	}; 
	
	case "cop_air_3":
	{
		_return = _cop_air;
	};
	
	case "civ_ship_1":
	{
		_return = _civ_ship;
	};
	
	case "civ_ship2":
	{
		_return = _civ_ship;
	};
	
	case "civ_ship3":
	{
		_return = _civ_ship;
	};
	
	case "cop_ship_1":
	{
		_return = _cop_ship;
	};
};

_return;