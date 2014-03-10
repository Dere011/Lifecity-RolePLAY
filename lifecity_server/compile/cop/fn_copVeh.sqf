/*
        File: fn_copVeh.sqf
        Author:
        Description:
*/
if(playerSide != west) exitWith {};
private ["_position","_veh"];
_position = _this select 3;

switch (_position) do {
	case 1: {
			cursorTarget lock 0;
			player action ["getInDriver", cursorTarget];
			cursorTarget lock 2;
	};
	case 2: {
			cursorTarget lock 0;
			player action ["getInCargo", cursorTarget];
			cursorTarget lock 2;
	};
	case 3: {
			_veh = vehicle player;
			_veh lock 0;
			player action ["getOut", _veh];
			_veh lock 2;
	};
};