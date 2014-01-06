/*
	File: fn_sessionReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Received information from the server and sorts information and
	initializes the player, if no data is found it starts the session
	creation process.
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

lc_c 					= (_session select 2);
lc_ac 					= (_session select 3);
lc_cl 					= (_session select 4);
lc_b 					= (_session select 7);
lc_cg 					= (_session select 8);
lc_al 					= (_session select 6);
lc_d					= (_session select 11);
lc_cvg 					= (_session select 12);
lc_a 					= (_session select 10);

switch (playerSide) do {
	case west:
	{
		if(count (_session select 5) > 0) then {
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_session select 5);
		};
		[] spawn life_fnc_loadGear;
	};
	case civilian:
	{		
		if(count (_session select 9) > 0) then
		{
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_session select 9);
		};
		[] spawn life_fnc_civLoadGear;
	};
};

life_session_completed 		= true;