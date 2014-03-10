private["_ret","_admin","_player"];
_admin 	= _this select 0;
_player = _this select 1;

[[_player, _admin, false], "life_fnc_wantedBounty", false, false] spawn life_fnc_MP;
[[_player, false, 60], "life_fnc_jail", _player, false] spawn life_fnc_MP;