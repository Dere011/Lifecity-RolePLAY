/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_sessionUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends the update request to the server to save information in the database.
*/
private["_packet"];

_packet 	= [player, playerSide, lc_c, lc_ac, getPlayerUID player];

switch (playerSide) do
{
	case west:
	{
		_array = [];
		{
			if(_x select 1 == "cop") then
			{
				_array set[count _array,[_x select 0,(missionNamespace getVariable (_x select 0))]];
			};
		} foreach life_licenses;
		_packet set[count _packet,_array];
		_gear = lc_cg;
		_packet set[count _packet,_gear];
	};
	
	case civilian:
	{
		_array = [];
		{
			if(_x select 1 == "civ") then
			{
				_array set[count _array,[_x select 0,(missionNamespace getVariable (_x select 0))]];
			};
		} foreach life_licenses;
		[] call life_fnc_civFetchGear;
		_packet set[count _packet,_array];
		_packet set[count _packet, lc_a];
		_packet set[count _packet, lc_cvg];
	};
};

[_packet, "STS_fnc_update", false, false] spawn life_fnc_MP;