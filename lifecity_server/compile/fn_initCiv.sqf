/*
	File: fn_initCiv.sqf
	Author:
	Description:
*/
private["_spawnPos"];

if(hnvecjxd) exitWith {
	endMission "Loser";
};

civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"], 500];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"], 500];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"], 500];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"], 500];
civ_spawn_5 = nearestObjects[getMarkerPos  "civ_spawn_5", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"], 500];
civ_spawn_6 = nearestObjects[getMarkerPos  "civ_spawn_6", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"], 500];

waitUntil {!(isNull (findDisplay 46))};

if(rvudxsiq) then {
	rvudxsiq 				= false;
	[player, true] spawn life_fnc_jail;
}else{
	show_spawn_menu			= true;
};