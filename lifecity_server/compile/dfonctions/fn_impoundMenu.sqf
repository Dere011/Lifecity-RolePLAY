/*
	File: fn_impoundMenu.sqf
	Author:
	Description:
*/
private["_vehicles","_control"];

disableSerialization;

_vehicles 	= [_this,0,[],[[]]] call BIS_fnc_param;

waitUntil {!isNull (findDisplay 2800)};

if(count _vehicles == 0) exitWith {
	titleText ["Aucun vehicule dans votre garage.\n(Merci d'attendre 10 secondes entre chaque ouverture de garage)", "PLAIN DOWN"];
	ctrlSetText[2802,"Aucun vehicule"];
};
ctrlSetText[2802,"Connexion OK"];

_control = ((findDisplay 2800) displayCtrl 2801);
lbClear _control;
{
	_displayName 	= getText(configFile >> "CfgVehicles" >> (_x select 2) >> "displayName");
	_picture 		= getText(configFile >> "CfgVehicles" >> (_x select 2) >> "picture");
	_price 			= [_x select 2,life_garage_prices] call fnc_index;
	_sPrice 		= [_x select 2,life_garage_sell] call fnc_index;
	
	if(_price == -1) then 	{_price = 1000;} 	else 	{_price = (life_garage_prices select _price) select 1;};
	if(_sPrice == -1) then 	{_sPrice = 1500;} 	else 	{_sPrice = (life_garage_sell select _sPrice) select 1;};
	
	_control lbAdd format["%1 - Taxe: $%2 - Vente: $%3", _displayName,[_price] call life_fnc_numberText,[_sPrice] call life_fnc_numberText];
	_control lbSetData [(lbSize _control)-1,(_x select 2)];
	_control lbSetValue [(lbSize _control)-1,(call compile format["%1", _x select 0])];
	_control lbSetPicture [(lbSize _control)-1,_picture];
} foreach _vehicles;