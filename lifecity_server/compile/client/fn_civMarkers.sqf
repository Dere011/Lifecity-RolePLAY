/*
	File: fn_civMarkers.sqf
	Author:
	Description:
*/
private["_markers","_players"];
_markers 	= [];
_players 	= [];

while {true} do {
	waitUntil {visibleMap};
	
	{_players 	set[count _players,_x];} 	foreach playableUnits;
	{
		if(group player == group _x && !(_x getVariable "lc_res")) then {
			_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", name _x];
			_markers set[count _markers,[_marker,_x]];
		};
	} foreach _players;
			
	while {visibleMap} do {
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit 	= _x select 1;
			if(!isNil "_unit") then {
				if(!isNull _unit) then {
					_marker setMarkerPosLocal (getPos _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.05;
	};
	
	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers 		= [];
	_players 		= [];
};