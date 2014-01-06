/*
	File: fn_onRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Execute various actions when the _unit respawns.
*/
private["_unit","_corpse","_handle","_spawn"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_corpse = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

if(!isNull _corpse) then {
	hideBody _corpse;
	deleteVehicle _corpse;
};

removeAllContainers _unit;
removeAllItemsWithMagazines _unit;
removeAllWeapons _unit;

_handle = [] spawn life_fnc_setupActions;
waitUntil {scriptDone _handle};

_unit setVariable["restrained",false,true];
_unit setVariable["Escorting",false,true];
_unit setVariable["transporting",false,true];

if(playerSide == west) then {
	[] spawn life_fnc_loadGear;
};

if(lc_a) then {
	hint "Vous avez essaye de vous suicider en prison, vous serez emprisonne a nouveau avec un temps plus long.";
	lc_a = false;
	[_unit,true] spawn life_fnc_jail;
}else{
	titleText["","BLACK FADED"];
	titleFadeOut 9999999999;
	[] call life_fnc_spawnMenu;
	waitUntil{isNull (findDisplay 38500)};
};

[_unit] call life_fnc_setRating;
[[_unit,life_sidechat,playerSide],"STS_fnc_managesc",false,false] spawn life_fnc_MP;
[] call life_fnc_hudUpdate;

cutText ["","BLACK IN"];

if(playerSide == civilian) then {
	[] call life_fnc_civFetchGear;
};

[1,true] call life_fnc_sessionHandle;