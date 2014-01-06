enableSaving [false, false];
X_Server 			= false;
X_Client 			= false;
X_JIP 				= false;
StartProgress 		= false;
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
		[] spawn (compile PreprocessFileLineNumbers "client\core\jip.sqf");
	};
	X_JIP = true;
};

enableSaving [false, false];

if(X_Client) then {
	waitUntil {player == player};
	cutText["Bienvenue sur LifeCity ALPHA (Altis)\n\nChargement de votre session de jeu, merci de patienter.", "BLACK", 0, false];
	sleep 2;
	[] execVM "client\core\init.sqf";
	waitUntil {is_client_loaded};
};

[] execVM "common\briefing.sqf";
[] execVM "common\KRON_Strings.sqf";

if(X_Client) then {
	cutText["Fin du chargement de votre session.\n\nBon jeu sur LifeCity!", "BLACK", 0, false];
	sleep 1;
	if(loub_admin_mode) then {
		[] call life_fnc_copDefault;
	};
	if(loub_admin_mode) then {
		[] execVM "addons\proving_ground\init.sqf";
		[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
	};
};

if(isServer) then {
	[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
};

if(show_spawn_menu) then {
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull 	(findDisplay 38500)};
	waitUntil{isNull 	(findDisplay 38500)};
	cutText["Ce serveur est actuellement sous la version ALPHA de LifeCity.\nCette version est en cours de developpement et sujette aux bugs!\nMerci de votre comprehension.", "PLAIN DOWN", 0, false];
};

if(!StartProgress) then {
	[8,true,false] execFSM "client\core\fsm\core_time.fsm";
};

StartProgress 		= true;