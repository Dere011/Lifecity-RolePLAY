/*
	File: fn_loadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for loading cop saved gear loadout.
*/
private["_loadout","_primary","_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_handle"];

switch (playerSide) do {
	case west: {
		_loadout = dawwpqsag;
	};
	case civilian: {
		_loadout = dawwpqsavg;
	};
};
	
waitUntil {!(isNull (findDisplay 46))};

if(isNil "_loadout") exitWith {
	if(playerSide == west) then {
		[] call life_fnc_copDefault;
	}else{
		[] call life_fnc_civDefault;
	};
};

if(count _loadout == 0) exitWith {
	if(playerSide == west) then {
		[] call life_fnc_copDefault;
	}else{
		[] call life_fnc_civDefault;
	};
};

_primary 			= _loadout select 0;
_launcher 			= _loadout select 1;
_handgun 			= _loadout select 2;
_magazines 			= _loadout select 3;
_uniform 			= _loadout select 4;
_vest 				= _loadout select 5;
_backpack 			= _loadout select 6;
_items 				= _loadout select 7;
_primitems 			= _loadout select 8;
_secitems 			= _loadout select 9;
_handgunitems 		= _loadout select 10;
_uitems 			= _loadout select 11;
_vitems 			= _loadout select 12;
_bitems 			= _loadout select 13;
_headgear 			= _loadout select 14;
_goggles 			= _loadout select 15;
_liveitems 			= _loadout select 16;

if(_primary == "" AND _uniform == "" AND _vest == "" AND _backpack == "") exitWith {
	if(playerSide == west) then {
		[] call life_fnc_copDefault;
	}else{
		[] call life_fnc_civDefault;
	};
};

RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;

{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

if(_uniform != "") then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_vest != "") then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

{
	_handle = [_x,true,false,false,false] spawn life_fnc_handleItem;
	waitUntil {scriptDone _handle};
} foreach _magazines;

if(_primary != "") then {[_primary,true,false,false,false] spawn life_fnc_handleItem;};
if(_launcher != "") then {[_launcher,true,false,false,false] spawn life_fnc_handleItem;};
if(_handgun != "") then {[_handgun,true,false,false,false] spawn life_fnc_handleItem;};
if(_goggles != "") then {[_goggles,true,false,false,false] spawn life_fnc_handleItem;};
if(_headgear != "") then {[_headgear,true,false,false,false] spawn life_fnc_handleItem;};

{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;
{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_uitems);
{[_x,true,false,false,true] call life_fnc_handleItem;} foreach (_vitems);
{[_x,true,true,false,false] call life_fnc_handleItem;} foreach (_bitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_primitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_secitems);
{[_x,true,false,true,false] call life_fnc_handleItem;} foreach (_handgunitems);  

if(primaryWeapon player != "") then {
	player selectWeapon (primaryWeapon player);
};

{
	_item 		= [(_x select 0), 1] call life_fnc_varHandle;
	_value 		= (_x select 1);
	([true, _item, _value] call life_fnc_handleInv)
} foreach (_liveitems);