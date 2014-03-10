/*
	File: fn_spawnConfirm.sqf
	Author:
	Description:
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
if(count life_spawn_point == 0) then
{
	_spCfg = [playerSide] call life_fnc_spawnPointCfg;
	_sp = _spCfg select 0;
	if(playerSide == civilian) then {
		_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
		_spawnPos = _spawnPos buildingPos 0;
		player setPos _spawnPos;
	}else{
		player setPos (getMarkerPos (_sp select 0));
	};
	titleText[format["Vous avez spawn a %1",_sp select 1],"BLACK IN"];
}else{
	if(playerSide == civilian) then {
		_spawnPos 	= (call compile format["%1", (life_spawn_point select 0)]) call BIS_fnc_selectRandom;
		_spawnPos 	= _spawnPos buildingPos 0;
		player setPos _spawnPos;
	}else{
		player setPos (getMarkerPos (life_spawn_point select 0));
	};
	titleText[format["Vous avez spawn a %1",life_spawn_point select 1],"BLACK IN"];
};

is_ingame	= 	true;
[] call life_fnc_hudSetup;
[] spawn life_fnc_loadGear;