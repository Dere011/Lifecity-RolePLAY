/*
	File: fn_vehicleShop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the vehicle shop.
	CAN"T WAIT TO SCRAP THIS!
*/
private["_display","_vehicles","_veh","_price","_pic","_name","_kill"];
disableSerialization;
_kill = "";
if(!dialog) then
{
	createDialog "Life_vehicle_shop";
	life_veh_shop = _this select 3;
};

_display = findDisplay 2300;
_vehicles = _display displayCtrl 2302;
lbClear _vehicles;
ctrlShow[2303,false];

switch (life_veh_shop) do
{
	case "civ_car_1":
	{
		if(playerSide == west) exitWith {_kill = "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_car_2":
	{
		if(playerSide == west) exitWith {_kill = "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_car_3":
	{
		if(playerSide == west) exitWith {_kill = "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_car_4":
	{
		if(playerSide == west) exitWith {_kill = "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Civilian Car Shop"];
	};
	
	case "civ_servt_1":
	{
		if(playerSide == west) exitWith {_kill = "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Service Truck Shop"];
	};
	
	case "donator_1":
	{
		if(playerSide == west) exitWith {_kill = "Vous n'etes pas un civil."};
		if(lc_d == 0) exitWith {_kill = "Vous n'etes pas un donateur!"};
		ctrlSetText[2301,"Service Truck Shop"];
	};
	
	case "donator_2":
	{
		if(playerSide == west) exitWith {_kill = "Vous n'etes pas un civil."};
		if(lc_d == 0) exitWith {_kill = "Vous n'etes pas un donateur!"};
		ctrlSetText[2301,"Service Truck Shop"];
	};
	
	case "reb_v_1":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Rebel Car Shop"];
	};
	
	case "reb_v_1":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Rebel Car Shop"];
	};
	
	case "reb_air":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Rebel Air Shop"];
	};
	
	case "reb_ship1":
		{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Rebel Boat Shop"];
	};
	
	case "cop_car_1":
	{
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "cop_car_2":
	{
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "cop_car_3":
	{
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "cop_car_5":
	{
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "cop_car_101":
	{
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		ctrlSetText[2301,"Cop Car Shop"];
	};
	
	case "fed_car":
	{
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		if(lc_al < 1) exitWith {_kill = "Vous n'etes pas un agent federal!"};
		ctrlSetText[2301,"Secret Service Car Shop"];
		
	};
	
	case "civ_air_1":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Civilian Air Shop"];
	};
	
	case "civ_air_2":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Civilian Air Shop"];
	};
	
	case "cop_air_1":
	{
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		ctrlSetText[2301,"Cop Air Shop"];
	};
	
	case "cop_air_2":
	{
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		ctrlSetText[2301,"Cop Air Shop"];
	};
	
	case "cop_air_101":
	{
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		ctrlSetText[2301,"Cop Air Shop"];
	};
	
	case "fed_air":
	{
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		if(lc_al < 1) exitWith {_kill = "Vous n'etes pas un agent federal!"};
		ctrlSetText[2301,"Secret Service Air Shop"];
	};
	
	case "civ_ship_1":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Altis Boat Shop"];
	};
	
	case "civ_ship_2":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Altis Boat Shop"];
	};
	
	case "civ_ship_2":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Altis Boat Shop"];
	};
	
	case "civ_truck_1":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Truck Shop"];
	};
	
	case "civ_truck_2":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Truck Shop"];
	};
	
	case "civ_ship_3":
	{
		if(playerSide == west) exitWith {_kill =  "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Girna Boat Shop"];
	};
	
	case "cop_ship_1":
	{	
		if(playerSide == civilian) exitWith {_kill =  "Vous n'etes pas un flic."};
		ctrlSetText[2301,"Cop Boat Shop"];
	};
	
	case "donator_heli":
	{
		if(lc_d < 1) exitWith {_kill = "Vous n'etes pas un donateur."};
		if(playerSide == west) exitWith {_kill = "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Donator Air Shop"];
	};
	
	case "donator_car":
	{
		if(lc_d < 1) exitWith {_kill = "Vous n'etes pas un donateur."};
		if(playerSide == west) exitWith {_kill = "Vous n'etes pas un civil."};
		ctrlSetText[2301,"Donator Car Shop"];
	};

};

if(_kill != "") exitWith {
	hint _kill;
	closeDialog 0;
};

{
	_veh = _x select 0;
	_price = _x select 1;
	
	if(_veh == "C_Offroad_01_F" && _price == 15000) then
	{
		_name = "Service Truck";
	}else{
		_name = getText(configFile >> "CfgVehicles" >> _veh >> "displayName");
	};
	_pic = getText(configFile >> "CfgVehicles" >> _veh >> "picture");
	_vehicles lbAdd format["%1 - Location: $%2 Achat: $%3 ",_name, [_price] call life_fnc_numberText, [round(_price * 1.5)] call life_fnc_numberText];
	
	if(_name == "Service Truck") then {
		_vehicles lbSetData [(lbSize _vehicles)-1,"serv_truck"];
	}else{
		_vehicles lbSetData [(lbSize _vehicles)-1,_veh];
	};
	_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
	_vehicles lbSetValue [(lbSize _vehicles)-1,_price];
} foreach ([life_veh_shop] call life_fnc_vehicleListCfg);