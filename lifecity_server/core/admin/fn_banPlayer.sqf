private["_id","_ret"];
_player 	= _this select 0;
_admin 		= _this select 1;

_dbName 	= ["Player_", _player] call PDB_databaseNameCompiler;
_check 		= (_dbName) call iniDB_exists;
if(_check) 							exitWith {};

[_dbName, _player, "is_banned", false] call iniDB_write;

[[0, format["Le joueur a ete banni du serveur par %1.", name _admin]], "life_fnc_broadcast", nil, false] spawn life_fnc_MP;