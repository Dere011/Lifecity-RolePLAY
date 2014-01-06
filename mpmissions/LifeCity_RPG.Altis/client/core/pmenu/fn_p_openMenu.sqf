/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2011,false];
	};
	
	case civilian:
	{
		ctrlShow[2012,false];
	};
};

if(lc_al < 1) then
{
	ctrlShow[2021,false];
};

if(lc_al != 666) then
{
	ctrlShow[2020,false];
};

[] call life_fnc_p_updateMenu;

if(lc_al < 1) then
{
	ctrlShow[2021,false];
};

if(lc_al != 666) then
{
	ctrlShow[2020,false];
};