/*
	File: fn_virt_menu.sqf
	Author:
	Description:
*/
private["_shop"];
_shop 				= _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type 		= _shop;
if(_shop == "cop" && playerSide != west) exitWith {hint "You are not a cop."};

createDialog "shops_menu";

[] call life_fnc_virt_update;