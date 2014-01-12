private["_player","_admin"];
_player 	= _this select 0;
_admin 		= _this select 1;
_id 		= owner _player;

[[], "life_fnc_eject", _id, false] spawn life_fnc_MP;
[[0, format["Le joueur a ete ejecte de la session par %1.", name _admin]], "life_fnc_broadcast", nil, false] spawn life_fnc_MP;