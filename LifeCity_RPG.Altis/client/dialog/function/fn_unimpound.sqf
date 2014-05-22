/*
	File: fn_unimpound.sqf
	Author:
	Description:
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2801 == -1) exitWith {hint "Merci de selectionner un véhicule."; playSound "dy3k89kScIoPx63";};

_vehicle 	= lbData[2801,(lbCurSel 2801)];
_vid 		= lbValue[2801,(lbCurSel 2801)];
_pid 		= getPlayerUID player;
_sync		= time;

if(isNil "_vehicle") exitWith {
	hint "Impossible, une erreur est survenue.";
	playSound "dy3k89kScIoPx63";
};

_price 		= [_vehicle, life_garage_prices] call fnc_index;
if(_price == -1) then {
	_price 	= 1000; 
}else{ 
	_price 	= (life_garage_prices select _price) select 1;
};

if(srwapffq < _price) exitWith {
	hint format["Impossible, vous n'avez pas $%1 sur votre compte en banque.", [_price] call life_fnc_numberText];
	playSound "dy3k89kScIoPx63";
};

if(_vehicle == "C_Van_01_transport_F" || _vehicle == "C_Van_01_box_F" || _vehicle == "I_Truck_02_transport_F"  || _vehicle == "I_Truck_02_covered_F"  || _vehicle == "B_Truck_01_transport_F"  || _vehicle == "B_Truck_01_box_F"  || _vehicle == "B_Truck_01_covered_F") then {
	if(getMarkerColor format["%1_1", life_garage_sp] != "") then {
		life_garage_sp		= format["%1_1", life_garage_sp];
	};
};

[[_vid, _pid, (getMarkerPos life_garage_sp), (markerDir life_garage_sp), player], "STS_fnc_spawnVehicle", false, false] spawn life_fnc_MP;

hint "Le véhicule va sortir du garage...";

srwapffq 		= srwapffq - _price;