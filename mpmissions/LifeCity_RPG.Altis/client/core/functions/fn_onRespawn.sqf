/*
	File:
	Author:
	Description:
*/
private["_unit","_corpse","_handle","_spawn"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_corpse = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

if(!life_session_completed) then {
	endMission "loser";
};

if(!isNull _corpse) then {
	[[_corpse,"jX2Rn8VXcs8G4Rr"], "life_fnc_playSound", nil, false] spawn life_fnc_MP;
	hideBody _corpse;
	deleteVehicle _corpse;
};

removeAllContainers _unit;
removeAllItemsWithMagazines _unit;
removeAllWeapons _unit;

_handle = [] spawn life_fnc_setupActions;
waitUntil {scriptDone _handle};

_unit setVariable["restrainedCiv",false,true];
_unit setVariable["restrained",false,true];
_unit setVariable["Escorting",false,true];
_unit setVariable["transporting",false,true];

if(rvudxsiq) then {
	hint "Vous avez essaye de vous suicider en prison, vous serez emprisonne a nouveau avec un temps plus long.";
	rvudxsiq = false;
	[_unit,true] spawn life_fnc_jail;
}else{
	titleText["","BLACK FADED"];
	titleFadeOut 9999999999;
	[] call life_fnc_spawnMenu;
	waitUntil{isNull (findDisplay 38500)};
};

[] call life_fnc_hudUpdate;

cutText ["","BLACK IN"];

[] spawn life_fnc_loadGear;
[1, true, true] call life_fnc_sessionHandle;