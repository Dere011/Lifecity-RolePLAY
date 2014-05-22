/*
	File: fn_spawnMenu.sqf
	Author: 
	Description:
*/
private["_spCfg","_sp"];
disableSerialization;
if(!(createDialog "life_spawn_selection")) exitWith {[] call life_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

_spCfg = [playerSide] call life_fnc_spawnPointCfg;

ctrlShow[38510,false];
ctrlShow[38511,false];
ctrlShow[38512,false];
ctrlShow[38513,false];
ctrlShow[38514,false];
ctrlShow[38515,false];
ctrlShow[38516,false];
ctrlShow[38517,false];
ctrlShow[38518,false];

for "_i" from 0 to (count _spCfg)-1 do {
	_ctrl = ((findDisplay 38500) displayCtrl ((call compile format["3851%1",_i])));
	_ctrl ctrlSetText ((_spCfg select _i) select 1);
	ctrlShow[(call compile format["3851%1",_i]),true];
};

_sp = _spCfg select 0;
[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format["Choix actuel: %1",_sp select 1]];