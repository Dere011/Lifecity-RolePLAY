[] call compile PreprocessFileLineNumbers "lifecity_server\fn_inidb_custom.sqf";

server_query_running 	= false;
life_DB_queue 			= [];
serv_sv_use 			= [];
serv_uuid				= round(random(1000000));

fed_bank_1 setVariable["fed_rob_ip",false,true];
fed_bank_1 setVariable["fed_locked",false,true];

publicVariable "life_fnc_vehStoreItem";
publicVariable "life_fnc_vehTakeItem";
publicVariable "life_fnc_vehInventory";

[] execVM "lifecity_server\vars.sqf";
[] execVM "lifecity_server\functions.sqf";
[] execVM "lifecity_server\eventhandlers.sqf";
[] execVM "lifecity_server\core\protection\init.sqf";
[] execFSM "lifecity_server\cleanup.fsm";

"Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", "UPDATE vehicles SET `active`= 0;"];
"Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life_vehicles', '%1']", "DELETE FROM `vehicles` WHERE `alive` = 0;"];

life_fnc_surrender			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\actions\fn_surrender.sqf";
life_fnc_unrestrainCiv		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\actions\fn_unrestrainCiv.sqf";
life_fnc_unrestrain			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\actions\fn_unrestrain.sqf";
life_fnc_restrainActionCiv	= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\actions\fn_restrainActionCiv.sqf";
life_fnc_restrainAction		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\actions\fn_restrainAction.sqf";
life_fnc_arrestAction 		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\actions\fn_arrestAction.sqf";
life_fnc_rebActions			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\actions\fn_rebActions.sqf";
life_fnc_MPexec 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\network\fn_MPexec.sqf";
life_fnc_MP 				= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\network\fn_MP.sqf";
life_fnc_loadGear 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\gear\fn_loadGear.sqf";
life_fnc_saveGear 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\gear\fn_saveGear.sqf";
life_fnc_playSound 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_playSound.sqf";
fn_filterString				= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_filterString.sqf";
fn_findString				= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_findString.sqf";
life_fnc_keyHandler			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_keyHandler.sqf";
life_fnc_onDeath			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_onDeath.sqf";
life_fnc_onRespawn			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_onRespawn.sqf";
life_fnc_handleDamage		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_handleDamage.sqf";
life_fnc_pushFunction		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_pushFunction.sqf";
life_fnc_braquage			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_braquage.sqf";
life_fnc_copVeh				= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\cop\fn_copVeh.sqf";
life_fnc_copLights 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\cop\fn_copLights.sqf";
life_fnc_restrain 			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\cop\fn_restrain.sqf";
life_fnc_adminMarkers 		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\admin\fn_adminMarkers.sqf";
life_fnc_clothing_reb		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\config\fn_clothing_reb.sqf";
life_fnc_vehicleListCfg		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\config\fn_vehicleListCfg.sqf";
life_fnc_vehicleColorStr	= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\config\fn_vehicleColorStr.sqf";
life_fnc_vehicleColorCfg	= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\config\fn_vehicleColorCfg.sqf";
life_fnc_vehShopLicenses	= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\config\fn_vehShopLicenses.sqf";
life_fnc_keyRsync			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\vehicle\fn_keyRsync.sqf";
life_fnc_playerTags			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\client\fn_playerTags.sqf";
life_fnc_restrainCiv		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\client\fn_restrainCiv.sqf";
life_fnc_civMarkers			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\client\fn_civMarkers.sqf";
life_fnc_tremble			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\effects\fn_tremble.sqf";
life_fnc_initCop			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_initCop.sqf";
life_fnc_initCiv			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_initCiv.sqf";
life_fnc_setupEVH			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_setupEVH.sqf";
life_fnc_setupSession		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_setupSession.sqf";
life_fnc_init_syncro		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_init_syncro.sqf";
life_jip					= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\jip.sqf";
life_fnc_init_survival		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\init_survival.sqf";
life_fnc_intro				= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_intro.sqf";
life_fnc_setupActions		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fn_setupActions.sqf";
life_fnc_vehicleShopBuy		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\shop\fn_vehicleShopBuy.sqf";
life_fnc_configuration		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\configuration.sqf";		
life_fnc_impoundMenu		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\dfonctions\fn_impoundMenu.sqf";
life_fnc_sessionSetup		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\session\fn_sessionSetup.sqf";
life_fnc_sessionReceive		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\session\fn_sessionReceive.sqf";
life_fnc_sessionUpdate		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\session\fn_sessionUpdate.sqf";
life_fnc_syncData			= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\session\fn_syncData.sqf";
life_fnc_sessionHandle		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\session\fn_sessionHandle.sqf";
life_fnc_sessionCreate		= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\session\fn_sessionCreate.sqf";
life_fnc_weed				= compileFinal PreprocessFileLineNumbers "lifecity_server\compile\fonctions\fn_weed.sqf";

life_fnc_moveIn 		= compileFinal
"
	_vehicle 	= (_this select 0);
	_meters		= _vehicle distance player;
	if(_meters < 30) then {
		player moveInCargo _vehicle;
	};
";

life_fnc_damageS 		= compileFinal
"
	_vehicle 			= (_this select 0);
	_state				= (_this select 1);
	_vehicle allowDamage _state;
";

publicVariable "life_fnc_rebActions";
publicVariable "life_fnc_braquage";
publicVariable "life_fnc_weed";
publicVariable "life_fnc_pushfunction";
publicVariable "life_fnc_handleDamage";
publicVariable "life_fnc_onDeath";
publicVariable "life_fnc_onRespawn";
publicVariable "life_fnc_damageS";
publicVariable "life_fnc_sessionSetup";
publicVariable "life_fnc_sessionReceive";
publicVariable "life_fnc_sessionUpdate";
publicVariable "life_fnc_syncData";
publicVariable "life_fnc_sessionHandle";
publicVariable "life_fnc_sessionCreate";
publicVariable "life_fnc_impoundMenu";
publicVariable "life_fnc_setupActions";
publicVariable "life_fnc_clothing_reb";
publicVariable "life_fnc_unrestrainCiv";
publicVariable "life_fnc_unrestrain";
publicVariable "life_fnc_restrainActionCiv";
publicVariable "life_fnc_restrainAction";
publicVariable "life_fnc_restrainCiv";
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
publicVariable "life_fnc_setupSession";
publicVariable "life_fnc_keyRsync";
publicVariable "life_fnc_tremble";
publicVariable "life_fnc_keyHandler";
publicVariable "life_jip";
publicVariable "life_fnc_vehicleListCfg";
publicVariable "life_fnc_vehShopLicenses";
publicVariable "life_fnc_arrestAction";
publicVariable "life_fnc_vehicleColorCfg";
publicVariable "life_fnc_vehicleColorStr";
publicVariable "life_fnc_dynamicWeather";
publicVariable "life_fnc_init_survival";
publicVariable "life_fnc_intro";
publicVariable "life_fnc_playerTags";
publicVariable "life_fnc_surrender";
publicVariable "life_fnc_civMarkers";
publicVariable "life_fnc_moveIn";
publicVariable "STS_fnc_addVehicle2Chain";
publicVariable "life_fnc_fedSuccess";
publicVariable "life_fnc_configuration";
publicVariable "life_fnc_vehicleShopBuy";
publicVariable "life_fnc_copVeh";

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

[] spawn {
	private["_logic","_queue"];
	while {true} do {
		waitUntil {(count ((missionNamespace getVariable["bis_functions_mainscope", objnull]) getVariable "BIS_fnc_MP_queue")) > 5};
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "life_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue", [], true];
	};
};

[] spawn {
	private["_date","_heur"];
	while {true} do {
		_date = Date;
		_heur = (_date select 3);
		if(_heur >= 0 AND _heur <= 9) then {
			skiptime (0.01332);
			sleep (2.6);
		}else{
			skiptime (0.01332);
			sleep (7.2);
		};
	};
};

[] spawn {
	private["_date", "_heur"];
	while {true} do {
		sleep 72;
		_date = Date;
		_heur = (_date select 3);
		if(!(_heur >= 0 AND _heur <= 9)) then {
			[{if((getMarkerPos ("m0001") distance player) < 1000) then { (getMarkerPos ("m0001") nearestObject "Land_Offices_01_V1_F") say3D "UnF8SF3O68kJ64S"; }; }, "BIS_fnc_spawn", nil, false] spawn life_fnc_MP;
		};
	};
};

[] spawn {
	private["_date", "_heur"];
	while {true} do {
		sleep 147;
		_date = Date;
		_heur = (_date select 3);
		if(!(_heur >= 0 AND _heur <= 9)) then {
			[{if((getMarkerPos ("m0002") distance player) < 1000) then { (getMarkerPos ("m0002") nearestObject "Land_FMradio_F") say3D "qYE377yP4kU6p6h"; }; }, "BIS_fnc_spawn", nil, false] spawn life_fnc_MP;
		};
	};
};

[] spawn { 
	private["_music"];
	while {true} do {
		sleep 1800;
		[{[] spawn {playSound "D5yVW65K4gz1ZW1"; sleep 1; "chromAberration" ppEffectEnable true; "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true]; "chromAberration" ppEffectCommit 1; sleep 0.5; "chromAberration" ppEffectEnable false;};}, "BIS_fnc_spawn", nil, false] spawn life_fnc_MP;
	};
}; 

{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc, secondaryWeapon _npc, handgunWeapon _npc];
	};
} foreach allUnits;

[] spawn STS_fnc_federalUpdate;