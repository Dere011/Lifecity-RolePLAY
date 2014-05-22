/*
	File: fn_vehicleShop.sqf
	Author:
	Description:
*/
private["_display","_vehicles","_veh","_price","_pic","_name","_kill"];
disableSerialization;
_kill = "";
if(!dialog) then {
	createDialog "Life_vehicle_shop";
	life_veh_shop 	= _this select 3;
};

_display 			= findDisplay 2300;
_vehicles 			= _display displayCtrl 2302;
lbClear _vehicles;
ctrlShow[2303,false];

_found = [["civ"], life_veh_shop, true] call fn_findString;
if(_found != -1) then {
	if(playerSide == west) exitWith {_kill = "Vous n'etes pas un civil."};
	ctrlSetText[2301, "Concessionnaire Civil"];
};

_found = [["reb"], life_veh_shop, true] call fn_findString;
if(_found != -1) then {
	if(playerSide == west) exitWith {_kill =  "Vendeur de véhicule? Je ne vend RIEN, je regarde le paysage..."};
	if(!license_civ_rebel) exitWith {_kill =  "Barre toi de là! Tu n'es pas un rebel."};
	ctrlSetText[2301,"Concessionnaire rebel"];
};

_found = [["cop"], life_veh_shop, true] call fn_findString;
if(_found != -1) then {
	if(playerSide == civilian) exitWith {_kill =  "Mr, que fait vous ici?"; [[player,"AlarmCop"],"life_fnc_playSound",nil,false] spawn life_fnc_MP;};
	ctrlSetText[2301,"Concessionnaire Police"];
};

if(_kill != "") exitWith {
	hint _kill;
	closeDialog 0;
};

{
	_veh 	= _x select 0;
	_price 	= _x select 1;
	
	if(_veh == "C_Offroad_01_F" && _price == 15000) then
	{
		_name = "Service Truck";
	}else{
		_name = getText(configFile >> "CfgVehicles" >> _veh >> "displayName");
	};
	_pic = getText(configFile >> "CfgVehicles" >> _veh >> "picture");
	_vehicles lbAdd format["%1 - $%2 | $%3 ",_name, [_price] call life_fnc_numberText, [round(_price * 1.5)] call life_fnc_numberText];
	
	if(_name == "Service Truck") then {
		_vehicles lbSetData [(lbSize _vehicles)-1,"serv_truck"];
	}else{
		_vehicles lbSetData [(lbSize _vehicles)-1,_veh];
	};
	_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
	_vehicles lbSetValue [(lbSize _vehicles)-1,_price];
} foreach ([life_veh_shop] call life_fnc_vehicleListCfg);