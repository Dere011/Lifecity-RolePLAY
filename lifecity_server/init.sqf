/*
	@file Version: 
	@file name: init.sqf
	@file Author: 
	@file edit: 
*/

[] call compile PreprocessFileLineNumbers "lifecity_server\fn_inidb_custom.sqf";

life_radio_west_1 		= radioChannelCreate [[0, 0.95, 1, 0.8], "Radio Sécurisée", "%UNIT_NAME", []];
life_radio_west_2 		= radioChannelCreate [[0, 0.95, 1, 0.8], "Radio D'urgence", "%UNIT_NAME", []];

server_query_running 	= false;
life_DB_queue 			= [];
serv_sv_use 			= [];
serv_uuid				= false;
AntiCheat				= false;

fed_bank setVariable["fed_rob_ip",false,true];
fed_bank setVariable["fed_locked",false,true];

//_sql 					= "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", "CALL resetLifeVehicles();"];

publicVariable "life_fnc_vehStoreItem";
publicVariable "life_fnc_vehTakeItem";
publicVariable "life_fnc_vehInventory";

[] execVM "lifecity_server\vars.sqf";
[] execVM "lifecity_server\functions.sqf";
[] execVM "lifecity_server\eventhandlers.sqf";

if(AntiCheat) then {
	[] execVM "lifecity_server\anticheat_server.sqf";
};
[] spawn STS_fnc_cleanup;

life_fnc_wantedAdd 		= compileFinal PreprocessFileLineNumbers "lifecity_server\wanted_add.sqf";
life_fnc_wantedRemove 	= compileFinal PreprocessFileLineNumbers "lifecity_server\wanted_remove.sqf";
life_gang_list 			= [];
publicVariable "life_gang_list";
life_wanted_list 		= [];
client_session_list 	= [];

bank_obj setVariable["rob_in_sess",false,true];
robbery_success 		= 0;
publicVariable "robbery_success";

if (isDedicated) then {
	[] execFSM "lifecity_server\cleanup.fsm";
};

[] spawn {
	private["_logic","_queue"];
	while {true} do
	{
		waitUntil {(count ((missionNamespace getVariable["bis_functions_mainscope",objnull]) getVariable "BIS_fnc_MP_queue")) > 5};
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "life_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],true];
	};
};

fnc_serv_kick 			= {endMission "loser";};

publicVariable "fnc_serv_kick";

publicVariable "STS_fnc_addVehicle2Chain";
publicVariable "life_fnc_fedSuccess";

[] spawn STS_fnc_federalUpdate;