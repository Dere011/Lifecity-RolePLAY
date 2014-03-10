/*
	File: fn_civDefault.sqf
	Author:
	Description:
*/

RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

player addUniform "U_C_Commoner1_1";
player addHeadgear "H_Cap_blu";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";

[] call life_fnc_saveGear;