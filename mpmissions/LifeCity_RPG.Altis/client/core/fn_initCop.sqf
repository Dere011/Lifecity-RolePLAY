/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};

if(life_blacklisted) exitWith {
	endMission "Loser";
};

if(life_coplevel <= 0) exitWith { endMission "Loser"; };

switch (true) do
{
	case (str(player) in ["Admin_1","cop_hint"]):
	{
		if(life_adminlevel != 666) exitWith {
			endMission "Loser"; 
		};
		loub_admin_mode = true;
	};

	case (str(player) in ["cop_chef"]):
	{
		if(life_coplevel != 7) exitWith {
			endMission "Loser"; 
		};
	};
};

if(life_coplevel == 2) then {
	player setRank "PRIVATE";
};
if(life_coplevel == 3) then {
	player setRank "CORPORAL";
};
if(life_coplevel == 4) then {
	player setRank "SERGEANT";
};
if(life_coplevel == 5) then {
	player setRank "LIEUTENANT";
};
if(life_coplevel == 6) then {
	player setRank "CAPTAIN";
};
if(life_coplevel == 7) then {
	player setRank "COLONEL";
};

[] spawn life_fnc_copMarkers;

show_spawn_menu		= true;