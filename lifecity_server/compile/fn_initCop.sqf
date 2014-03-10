/*
	File: fn_initCop.sqf
	Author:
	Description:
*/
waitUntil {!(isNull (findDisplay 46))};

if(hnvecjxd) exitWith {
	endMission "Loser";
};

if(texceuve <= 0) exitWith { endMission "Loser"; };

switch (true) do {
	case (str(player) in ["Admin_1","cop_hint"]):
	{
		if(zhaypitt != 666) exitWith {
			endMission "Loser"; 
		};
	};

	case (str(player) in ["cop_chef"]):
	{
		if(texceuve != 7) exitWith {
			endMission "Loser"; 
		};
	};
};

if(texceuve == 2) then {
	player setRank "PRIVATE";
};
if(texceuve == 3) then {
	player setRank "CORPORAL";
};
if(texceuve == 4) then {
	player setRank "SERGEANT";
};
if(texceuve == 5) then {
	player setRank "LIEUTENANT";
};
if(texceuve == 6) then {
	player setRank "CAPTAIN";
};
if(texceuve == 7) then {
	player setRank "COLONEL";
};
if(!loub_admin_mode) then {
	[] spawn life_fnc_copMarkers;
};

show_spawn_menu		= true;
