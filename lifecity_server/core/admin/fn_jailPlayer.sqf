private["_id","_ret"];
_player 	= _this select 0;
_admin 		= _this select 1;
_id 		= owner _player;

_ret 		= [_player] call life_fnc_wantedPerson;
[[_ret, _player], "life_fnc_jailMe", _player, false] spawn life_fnc_MP;