private["_handle","_timeStamp"];

_timeStamp = diag_tickTime;
waitUntil {!isNull player && player == player};

_handle = [] spawn compile PreprocessFileLineNumbers "client\core\configuration.sqf";
waitUntil {scriptDone _handle};

_handle = [] spawn life_fnc_setupEVH;
waitUntil {scriptDone _handle};

_handle = [] spawn life_fnc_setupActions;
waitUntil {scriptDone _handle};
waitUntil {(!isNil {clientGangLeader})};

[] call life_fnc_sessionSetup;
waitUntil {life_session_completed};

_handle = [] spawn life_fnc_setupSession;
waitUntil {scriptDone _handle};

switch (playerSide) do
{
	case west: {
		_handle 	= [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	case civilian: {
		_handle 	= [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
};

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

[] execFSM "client\core\fsm\client.fsm";

waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];

[] call life_fnc_hudSetup;
[] call life_fnc_playerTags;
[] call life_fnc_settingsInit;
[] call life_fnc_init_syncro;

if(!loub_admin_mode) then {
	[] execVM "client\core\init_survival.sqf";
};

setPlayerRespawnTime life_respawn_timer;

is_client_loaded = true;