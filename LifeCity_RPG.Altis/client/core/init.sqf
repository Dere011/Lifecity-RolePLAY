private["_handle","_timeStamp"];

MISSION_ROOT 	= call { private "_arr"; _arr = toArray str missionConfigFile; _arr resize (count _arr - 15); toString _arr };
_timeStamp 		= diag_tickTime;

waitUntil {!isNull player && player == player};

[] call life_fnc_configuration;
waitUntil {life_config_loaded};

_handle = [] spawn life_fnc_setupEVH;
waitUntil {scriptDone _handle};

_handle = [] spawn life_fnc_setupActions;
waitUntil {scriptDone _handle};
waitUntil {(!isNil {clientGangLeader})};

[] call life_fnc_sessionSetup;
waitUntil {life_session_completed};

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

player setVariable["restrained",false, true];
player setVariable["restrainedCiv",false, true];
player setVariable["Escorting",false, true];
player setVariable["transporting",false, true];
player setVariable["playerSurrender",false, true];
player setVariable["isEscorting", objNull, true];
player setVariable["lc_RebSac", 0, true];

[] execFSM "client\core\fsm\client.fsm";

waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];

_handle = [] spawn life_fnc_setupSession;
waitUntil {scriptDone _handle};

[] call life_fnc_hudSetup;
[] call life_fnc_settingsInit;
[] call life_fnc_init_syncro;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;

setPlayerRespawnTime life_respawn_timer;

is_client_loaded = true;