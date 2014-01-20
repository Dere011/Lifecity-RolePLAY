/*
	File: fn_initCop.sqf
	Author:
	Description:
*/
waitUntil {!(isNull (findDisplay 46))};

if(lc_b) exitWith {
	endMission "Loser";
};

if(lc_cl <= 0) exitWith { endMission "Loser"; };

switch (true) do {
	case (str(player) in ["Admin_1","cop_hint"]):
	{
		if(lc_al != 666) exitWith {
			endMission "Loser"; 
		};
	};

	case (str(player) in ["cop_chef"]):
	{
		if(lc_cl != 7) exitWith {
			endMission "Loser"; 
		};
	};
};

if(lc_cl == 2) then {
	player setRank "PRIVATE";
};
if(lc_cl == 3) then {
	player setRank "CORPORAL";
};
if(lc_cl == 4) then {
	player setRank "SERGEANT";
};
if(lc_cl == 5) then {
	player setRank "LIEUTENANT";
};
if(lc_cl == 6) then {
	player setRank "CAPTAIN";
};
if(lc_cl == 7) then {
	player setRank "COLONEL";
};

if(!loub_admin_mode) then {
	[] spawn life_fnc_copMarkers;
};

show_spawn_menu		= true;