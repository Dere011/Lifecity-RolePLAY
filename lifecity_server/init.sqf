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
serv_uuid				= round(random(1000000));

fed_bank setVariable["fed_rob_ip",false,true];
fed_bank setVariable["fed_locked",false,true];

_sql 					= "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", "CALL resetLifeVehicles();"];

publicVariable "life_fnc_vehStoreItem";
publicVariable "life_fnc_vehTakeItem";
publicVariable "life_fnc_vehInventory";

[] execVM "lifecity_server\vars.sqf";
[] execVM "lifecity_server\functions.sqf";
[] execVM "lifecity_server\eventhandlers.sqf";
[] execVM "lifecity_server\core\protection\init.sqf";

life_fnc_MPexec 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\network\fn_MPexec.sqf";
life_fnc_MP 				= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\network\fn_MP.sqf";
life_fnc_loadGear 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\gear\fn_loadGear.sqf";
life_fnc_saveGear 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\gear\fn_saveGear.sqf";
life_fnc_playSound 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_playSound.sqf";
life_fnc_copLights 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\cop\fn_copLights.sqf";
life_fnc_restrain 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\cop\fn_restrain.sqf";
life_fnc_adminMarkers 		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\admin\fn_adminMarkers.sqf";
life_fnc_initCop			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_initCop.sqf";
life_fnc_initCiv			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_initCiv.sqf";
life_fnc_setupEVH			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_setupEVH.sqf";
fn_filterString				= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_filterString.sqf";
fn_findString				= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_findString.sqf";
life_fnc_setupSession		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_setupSession.sqf";
life_fnc_keyRsync			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\vehicle\fn_keyRsync.sqf";
life_fnc_sessionSetup		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\session\fn_sessionSetup.sqf";
life_fnc_init_syncro		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_init_syncro.sqf";
life_fnc_tremble			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\effects\fn_tremble.sqf";
life_fnc_keyHandler			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_keyHandler.sqf";
life_jip					= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\jip.sqf";
life_fnc_vehicleListCfg 	= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\config\fn_vehicleListCfg.sqf";
life_fnc_vehShopLicenses 	= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\config\fn_vehShopLicenses.sqf";
life_fnc_arrestAction 		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\actions\fn_arrestAction.sqf";
life_fnc_vehicleColorCfg	= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\config\fn_vehicleColorCfg.sqf";
life_fnc_vehicleColorStr	= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\config\fn_vehicleColorStr.sqf";
life_fnc_dynamicWeather		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\addons\DynamicWeatherEffects.sqf";
life_fnc_init_survival		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\init_survival.sqf";

life_fnc_moveIn 		= compileFinal
"
	_vehicle 	= (_this select 0);
	_meters		= _vehicle distance player;
	if(_meters < 10) then {
		player moveInCargo [_vehicle];
	};
";

publicVariable "life_fnc_init_syncro";
publicVariable "life_fnc_MPexec";
publicVariable "life_fnc_MP";
publicVariable "life_fnc_setupEVH";
publicVariable "life_fnc_playSound";
publicVariable "life_fnc_loadGear";	
publicVariable "life_fnc_saveGear";	
publicVariable "life_fnc_copLights";	
publicVariable "life_fnc_restrain";
publicVariable "life_fnc_adminMarkers";
publicVariable "life_fnc_initCop";
publicVariable "life_fnc_initCiv";
publicVariable "fn_filterString";
publicVariable "fn_findString";
publicVariable "life_fnc_moveIn";
publicVariable "life_fnc_setupSession";
publicVariable "life_fnc_keyRsync";
publicVariable "life_fnc_sessionSetup";
publicVariable "life_fnc_tremble";
publicVariable "life_fnc_keyHandler";
publicVariable "STS_fnc_addVehicle2Chain";
publicVariable "life_fnc_fedSuccess";
publicVariable "life_jip";
publicVariable "life_fnc_vehicleListCfg";
publicVariable "life_fnc_vehShopLicenses";
publicVariable "life_fnc_arrestAction";
publicVariable "life_fnc_vehicleColorCfg";
publicVariable "life_fnc_vehicleColorStr";
publicVariable "life_fnc_dynamicWeather";
publicVariable "life_fnc_init_survival";

[] spawn STS_fnc_cleanup;

life_fnc_wantedAdd 		= compileFinal PreprocessFileLineNumbers "lifecity_server\core\wantedsys\wanted_add.sqf";
life_fnc_wantedRemove 	= compileFinal PreprocessFileLineNumbers "lifecity_server\core\wantedsys\wanted_remove.sqf";
generateKey 			= compileFinal PreprocessFileLineNumbers "lifecity_server\core\protection\generateKey.sqf";

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

[] spawn {
	while {true} do
	{
		TheServerDate = date;
		publicVariable "TheServerDate";
		sleep(3);
	};
};

[] spawn STS_fnc_federalUpdate;