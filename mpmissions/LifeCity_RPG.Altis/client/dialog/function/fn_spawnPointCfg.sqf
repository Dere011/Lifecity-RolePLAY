/*
	File: fn_spawnPointCfg.sqf
	Author:
	Description:
*/
private["_side"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

switch (_side) do
{
	case west:
	{
		[["cop_spawn_1","#1 Kavala HQ"],["cop_spawn_2","#2 Pyrgos HQ"],["cop_spawn_3","#3 Athira HQ"],["cop_spawn_4","#4 Air HQ"],["cop_spawn_5","#5 Avant-poste HW"],["cop_spawn_6","#6 Avant-Poste AB"],["cop_spawn_7","#7 CheckPoint"]];
	};
	case civilian:
	{
		[["civ_spawn_1","Kavala"],["civ_spawn_2","Pyrgos"],["civ_spawn_3","Athira"],["civ_spawn_4","Sofia"],["civ_spawn_5","Frini (Rebel)"],["civ_spawn_6","Feres (Rebel)"]];
	};
};