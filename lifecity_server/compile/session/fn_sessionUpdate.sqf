/*
	File: fn_sessionUpdate.sqf
	Author:
	Description:
*/
private["_packet"];

_packet 	= [player, playerSide, dawwpqsa, srwapffq, getPlayerUID player];

[] call life_fnc_saveGear;

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
		_packet set[count _packet, dawwpqsag];
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
		_packet set[count _packet,_array];
		_packet set[count _packet, dawwpqsavg];
	};
};

_packet set[count _packet, lc_has_insurance];
_packet set[count _packet, rvudxsiq];
_packet set[count _packet, lc_lastposition];

if(life_session_completed) then {
	[_packet, "STS_fnc_update", false, false, false, "lifecity_fnc_MP_packet_30122"] spawn life_fnc_MP;
};