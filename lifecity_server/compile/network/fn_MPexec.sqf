private ["_params","_functionName","_target","_isPersistent","_isCall","_varName","_varValue","_function"];
_varName 		= [_this,0,"lifecity_fnc_MP_packet_30120",[""]] call bis_fnc_param;
_varValue 		= _this select 1;
_mode 			= [_varValue,0,[0]] call bis_fnc_param;
_params 		= [_varValue,1,[]] call bis_fnc_param;
_functionName 	= [_varValue,2,"",[""]] call bis_fnc_param;
_target 		= [_varValue,3,true,[objnull,true,0,[],sideUnknown,grpnull]] call bis_fnc_param;
_isPersistent 	= [_varValue,4,false,[false]] call bis_fnc_param;
_isCall 		= [_varValue,5,false,[false]] call bis_fnc_param;
if (ismultiplayer && _mode == 0) then {
	if (isserver) then {
		if (typename _target == typename []) then {
			{
				[_varName,[_mode,_params,_functionName,_x]] call life_fnc_MPexec;
			} foreach _target;
		} else {
			private ["_ownerID","_serverID"];
			_serverID = owner (missionnamespace getvariable ["bis_functions_mainscope",objnull]);
			switch (typename _target) do {
				case (typename objnull): {
					_ownerID = owner _target;
				};
				case (typename true): {
					_ownerID = [_serverID,-1] select _target;
				};
				case (typename 0): {
					_ownerID = _target;
				};
				case (typename grpnull);
				case (typename sideUnknown): {
					_ownerID = -1;
				};
			};
			missionNamespace setVariable [_varName, [1,_params,_functionName,_target,_isPersistent,_isCall]];
			if (_ownerID < 0) then {
				publicvariable _varName;
			} else {
				if (_ownerID != _serverID) then {
					_ownerID publicvariableclient _varName;
				};
			};
			if (_ownerID < 0 || _ownerID == _serverID) then {
				[_varName, missionNamespace getVariable _varName] spawn life_fnc_MPexec;
			};
			if (_isPersistent) then {
				if (typename _target != typename 0) then {
					private ["_logic","_queue"];
					_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
					_queue = _logic getvariable ["BIS_fnc_MP_queue",[]];
					_queue set [
						count _queue,
						+(missionNamespace getVariable _varName)
					];
					_logic setvariable ["BIS_fnc_MP_queue",_queue,true];
				} else {
					["Persistent execution is not allowed when target is %1. Use %2 or %3 instead.",typename 0,typename objnull,typename false] call bis_fnc_error;
				};
			};
		};
	};
} else {
	private ["_canExecute"];
	_canExecute = switch (typename _target) do {
		case (typename grpnull): {player in units _target};
		case (typename sideUnknown): {playerside == _target;};
		default {true};
	};
	if (_canExecute) then {
		_function = missionnamespace getvariable _functionName;
		if (!isnil "_function") then {
			_params spawn _function;
			true
		}else{
			["Function '%1' does not exist",_functionName] call bis_fnc_error;
			false
		};
	};
};