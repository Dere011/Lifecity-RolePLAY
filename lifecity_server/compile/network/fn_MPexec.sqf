private ["_params","_functionName","_target","_isPersistent","_isCall","_varName","_varValue","_function"];

_varName 		= _this select 0;
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
			
			_serverID = owner (missionnamespace getvariable ["bis_functions_mainscope",objnull]); //--- Server ID is not always 0

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
			missionNamespace setVariable ["lifecity_fnc_MP_packet_30120", [1,_params,_functionName,_target,_isPersistent,_isCall]];

			if (_ownerID < 0) then {
				publicvariable "lifecity_fnc_MP_packet_30120";
			} else {
				if (_ownerID != _serverID) then {
					_ownerID publicvariableclient "lifecity_fnc_MP_packet_30120";
				};
			};

			if (_ownerID < 0 || _ownerID == _serverID) then {
				["lifecity_fnc_MP_packet_30120", missionNamespace getVariable "lifecity_fnc_MP_packet_30120"] spawn life_fnc_MPexec;
			};

			if (_isPersistent) then {
				if (typename _target != typename 0) then {
					private ["_logic","_queue"];
					_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
					_queue = _logic getvariable ["BIS_fnc_MP_queue",[]];
					_queue set [
						count _queue,
						+(missionNamespace getVariable "lifecity_fnc_MP_packet_30120")
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
		private ["_allowedFunctions", "_blockedParams", "_blockedFunction", "_defineServerRules"];
		
		_allowedFunctions =
		[
			"STS_fnc_spawnVehicle",
			"STS_fnc_vehicleDelete",
			"STS_fnc_vehicleCreate",
			"life_fnc_colorVehicle",
			"STS_fnc_update",
			"STS_fnc_query",
			"STS_fnc_add",
			"life_fnc_wantedPardon",
			"life_fnc_wantedFetch",
			"clientGetKey",
			"life_fnc_receiveMoney",
			"life_fnc_receiveItem",
			"STS_fnc_spikeStrip",
			"life_fnc_playSound",
			"BIS_fnc_spawn",
			"clientGangLeader",
			"clientGangKick",
			"life_fnc_giveDiff",
			"life_fnc_wantedRemove",	
			"life_fnc_wantedBounty",
			"life_fnc_lockVehicle",
			"life_fnc_copSiren",
			"life_fnc_simDisable",
			"life_fnc_copLights",
			"life_fnc_broadcast",
			"life_fnc_wantedTicket",
			"life_fnc_ticketPrompt",
			"life_fnc_copSearch",
			"life_fnc_animSync",
			"STS_fnc_robberyState",
			"life_fnc_jailSys",
			"fnc_player_query",
			"life_fnc_kickPlayer",			
			"life_fnc_jailPlayer",
			"STS_fnc_getID",
			"life_fnc_banPlayer",
			"life_fnc_searchClient",
			"bank_robbery",
			"life_fnc_moveIn",	
			"life_fnc_pushFunction",	
			"life_fnc_restrain",	
			"life_fnc_pulloutVeh",	
			"STS_fnc_vehicleStore",	
			"life_fnc_jail",	
			"STS_fnc_vehicleCreate"	
		];
		
		_blockedParam = 
		[
			[
				"createMine",
				"createUnit",
				"createVehicle",
				"money",
				"toString",
				"publicVariableClient",
				"AAN",
				"3dCredits",
				"spawnCrew",
				"spawnEnemy",
				"spawnGroup",
				"spawnVehicle",
				"BIS_fnc_MP_packet",
				"vChecksum"
			],
			[str _params] call fn_filterString
		] call fn_findString;
		
		_blockedFunction 	= [["creat","spawning","AAN","3dCredits","spawnCrew","spawnEnemy","spawnGroup","spawnVehicle"], [_functionName] call fn_filterString] call fn_findString;

		if (_functionName in _allowedFunctions || {_blockedParam == -1 && _blockedFunction == -1}) then {
			_function = missionnamespace getvariable _functionName;
			if (!isnil "_function") then {
				_params spawn _function;
				true
			}else{
				["Function '%1' does not exist",_functionName] call bis_fnc_error;
				false
			};
		}else{
			if (isServer) then {
				diag_log format ["TPG_fnc_MPexec: An unknown player attempted to execute: function=%2 parameters=[%1]", _functionName, _params];
			};
		};
	};
};