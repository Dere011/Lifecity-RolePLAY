/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price 		= [_type] call life_fnc_licensePrice;
_license 	= [_type,0] call life_fnc_licenseType;

if(dawwpqsa < _price) exitWith {titleText[format["Vous n'avez l'argent pour la license %1 à $%2", _license select 1, [_price] call life_fnc_numberText], "PLAIN"]; playSound "dy3k89kScIoPx63";};

dawwpqsa = dawwpqsa - _price;
titleText[format["Vous avez acheté la license %1 pour $%2", _license select 1, [_price] call life_fnc_numberText], "PLAIN"];
missionNamespace setVariable[(_license select 0),true];
playSound "notifok";