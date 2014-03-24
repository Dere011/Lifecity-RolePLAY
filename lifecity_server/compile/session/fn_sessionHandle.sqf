/*
	File: fn_sessionHandle.sqf
	Author:
	Description:
*/
private["_type","_void"];

_type 				= [_this,0,0,[0]] call BIS_fnc_param;
_void 				= [_this,1,false,[false]] call BIS_fnc_param;
_force_void 		= [_this,2,false,[false]] call BIS_fnc_param;

if(alive player) then {
	lc_lastposition = (getPos player);
};

if(_type == 0) exitWith {};

switch(_type) do {
	case 1: {
		if(_void) then {
			if(!_force_void && (time - life_forced_query_time) < 60) exitWith {};
			life_forced_query_time 		= time;
			[] call life_fnc_sessionUpdate;
		}else{
			if((time - life_query_time) < 120) exitWith {};
			life_query_time 			= time;
			[] call life_fnc_sessionUpdate;
		};
	};
};