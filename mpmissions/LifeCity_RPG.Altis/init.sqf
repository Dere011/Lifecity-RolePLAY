enableSaving [false, false];
X_Server 			= false;
X_Client 			= false;
X_JIP 				= false;
ClientSUUID			= false;
AntiCheat			= true;
show_spawn_menu 	= false;
is_client_loaded	= false;

if(isServer) then {
	if(!X_Server) then {
		[] call compile PreprocessFileLineNumbers "lifecity_server\init.sqf";
		master_group attachTo[bank_obj,[0,0,0]];
	};
	X_Server = true;
};

if(!isDedicated AND !isServer) then { 
	X_Client = true;
};

if(isNull player) then {
	if(!X_JIP && !isServer) then {
		[] call life_jip;
	};
	X_JIP = true;
};

enableSaving [false, false];

if(X_Client) then {
	playMusic "LifeCityIntro";
	waitUntil {player == player};
	player forceSpeed  0;
	cutText["Bienvenue sur LifeCity ALPHA (Altis)\n\nChargement de votre session de jeu, merci de patienter.", "BLACK", 0, false];
	sleep 1;
	[] execVM "client\core\init.sqf";
	waitUntil {is_client_loaded};
};

[] execVM "common\briefing.sqf";
[] execVM "common\KRON_Strings.sqf";

if(X_Client) then {
	cutText["Fin du chargement de votre session.\n\nBon jeu sur LifeCity!", "BLACK", 0, false];
	sleep 1;
	if(loub_admin_mode) then {
		[] execVM "addons\proving_ground\init.sqf";
	};
};

[] execVM "addons\logistic\=BTC=_Logistic_Init.sqf";
[] execVM "monitor_esc.sqf";

tawvd_foot 	= 100;
tawvd_car 	= 100;
tawvd_air 	= 100;
setViewDistance tawvd_foot;
setViewDistance tawvd_car;
setViewDistance tawvd_air;

if(show_spawn_menu) then {
	player forceSpeed -1;
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull 	(findDisplay 38500)};
	waitUntil{isNull 	(findDisplay 38500)};
	cutText["","BLACK IN"];
	[player] spawn life_fnc_intro;
	player setVariable["adminlevel", zhaypitt, true];
	player setVariable["coplevel", texceuve, true];
};