/*
	File: fn_unimpound.sqf
	Author:
	Description:
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2801 == -1) exitWith {hint "Selectionner un véhicule."};

_vehicle 	= lbData[2801,(lbCurSel 2801)];
_vid 		= lbValue[2801,(lbCurSel 2801)];
_pid 		= getPlayerUID player;
_unit 		= player;
_sync		= time;

if(isNil "_vehicle") exitWith {
	hint "Impossible, une erreur est survenue."
};
_price 		= [_vehicle, life_garage_prices] call fnc_index;
if(_price == -1) then {
	_price 	= 1000; 
}else{ 
	_price 	= (life_garage_prices select _price) select 1; 
};
if(lc_ac < _price) exitWith {
	hint format["Impossible, vous n'avez pas $%1 sur votre compte en banque.", [_price] call life_fnc_numberText];
};

[[_vid, _pid,(getMarkerPos life_garage_sp), _unit], "STS_fnc_spawnVehicle", false, false] spawn life_fnc_MP;

hint "Le véhicule va sortir du garage...";

lc_ac 		= lc_ac - _price;