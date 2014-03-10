/*
	File: fn_sessionReceive.sqf
	Author:
	Description:
*/
private["_session"];
_session 														= _this;
life_session_tries 												= life_session_tries + 1;
if(life_session_tries > 3) 										exitWith {cutText["Can't setup your session with the server. You have reached the maximum tries of 3. Please reconnect.","BLACK FADED"];0 cutFadeOut 9999999;};
if(isNil "_session") 											exitWith {cutText["Can't setup your session with the server. You have reached the maximum tries of 3. Please reconnect.","BLACK FADED"];0 cutFadeOut 9999999;};
if(typeName _session == "STRING") 								exitWith {cutText[format["%1",_session],"BLACK FADED"];0 cutFadeOut 9999999;};
if(count _session == 0) 										exitWith {[] spawn life_fnc_sessionCreate;};
if(_session select 0 == 0) 										exitWith {[] spawn life_fnc_sessionCreate;};
if(parseNumber(getPlayerUID player) != (_session select 0)) 	exitWith {cutText["ERROR","BLACK FADED"];0 cutFadeOut 9999999;}; 

dawwpqsa 					= (_session select 2);
srwapffq 					= (_session select 3);
texceuve 					= (_session select 4);
zhaypitt 					= (_session select 6);
hnvecjxd 					= (_session select 7);
dawwpqsag 					= (_session select 8);
rvudxsiq 					= (_session select 10);
vbbqasgp					= (_session select 11);
dawwpqsavg 					= (_session select 12);
lc_has_insurance			= (_session select 13);
lc_is_banned				= (_session select 14);
lc_lastposition				= (_session select 15);
tcywxnhh					= (_session select 16);

switch (playerSide) do {
	case west:
	{
		if(count (_session select 5) > 0) then {
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_session select 5);
		};
	};
	case civilian:
	{		
		if(count (_session select 9) > 0) then
		{
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_session select 9);
		};
	};
};

life_session_completed 		= true;