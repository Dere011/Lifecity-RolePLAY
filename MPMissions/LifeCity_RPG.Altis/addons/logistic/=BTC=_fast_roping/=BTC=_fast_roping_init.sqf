waitUntil {!isNull player};
waitUntil {player == player};

#include "=BTC=_functions.sqf"
_rope = player addaction [("<t color=""#ED2744"">") + ("Deployer la Corde") + "</t>",BTC_dir_action,[[],BTC_deploy_rope],-10,true,false,"","typeOf (vehicle player) in BTC_roping_chopper && player == driver vehicle player && format [""%1"",(vehicle player) getVariable ""BTC_rope""] != ""1"" && ((getPos (vehicle player)) select 2) < BTC_fast_rope_h && ((getPos (vehicle player)) select 2) > BTC_fast_rope_h_min && speed (vehicle player) < 2"];
_rope = player addaction [("<t color=""#ED2744"">") + ("Couper la Corde") + "</t>",BTC_dir_action,[[],BTC_cut_rope],-10,true,false,"","typeOf (vehicle player) in BTC_roping_chopper && player == driver (vehicle player) && format [""%1"",(vehicle player) getVariable ""BTC_rope""] == ""1"""];
_out  = player addaction [("<t color=""#ED2744"">") + ("Descente Rapide") + "</t>",BTC_dir_action,[[player],BTC_fast_rope],-10,true,false,"","player in (assignedCargo (vehicle player)) && format [""%1"",(vehicle player) getVariable ""BTC_rope""] == ""1"""];

_eh = player addEventHandler ["respawn", 
{
	_actions = [] spawn 
	{
		waitUntil {Alive player};
		_rope = player addaction [("<t color=""#ED2744"">") + ("Deployer la Corde") + "</t>",BTC_dir_action,[[],BTC_deploy_rope],-10,true,false,"","typeOf (vehicle player) in BTC_roping_chopper && player == driver vehicle player && format [""%1"",(vehicle player) getVariable ""BTC_rope""] != ""1"" && ((getPos (vehicle player)) select 2) < BTC_fast_rope_h && ((getPos (vehicle player)) select 2) > BTC_fast_rope_h_min && speed (vehicle player) < 2"];
		_rope = player addaction [("<t color=""#ED2744"">") + ("Couper la Corde") + "</t>",BTC_dir_action,[[],BTC_cut_rope],-10,true,false,"","typeOf (vehicle player) in BTC_roping_chopper && player == driver (vehicle player) && format [""%1"",(vehicle player) getVariable ""BTC_rope""] == ""1"""];
		_out  = player addaction [("<t color=""#ED2744"">") + ("Descente Rapide") + "</t>",BTC_dir_action,[[player],BTC_fast_rope],-10,true,false,"","player in (assignedCargo (vehicle player)) && format [""%1"",(vehicle player) getVariable ""BTC_rope""] == ""1"""];
	};
}];