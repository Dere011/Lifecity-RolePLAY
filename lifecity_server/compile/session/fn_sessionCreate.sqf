/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_sessionCreate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Start the process and setup the players information on the server.
*/
private["_packet"];

_packet = [player,playerSide,dawwpqsa,srwapffq,getPlayerUID player];
switch (playerSide) do
{
	case west:
	{
		[] call life_fnc_copDefault;
		_gear = dawwpqsag;
		_packet set[count _packet, _gear];
	};
	
	case civilian:
	{
		_packet set[count _packet, rvudxsiq];
	};
};

[_packet,"STS_fnc_add",false,false, "lifecity_fnc_MP_packet_30121"] spawn life_fnc_MP;