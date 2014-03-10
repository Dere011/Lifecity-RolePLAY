private["_player","_admin"];

_admin 		= _this select 0;
_player 	= _this select 1;

[{endMission "loser";}, "BIS_fnc_spawn", _player, true] spawn BIS_fnc_MP;
[[0, format["Le joueur %1 a ete ejecte de la session par %2.", name _player, name _admin]], "life_fnc_broadcast", nil, false] spawn life_fnc_MP;