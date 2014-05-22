/*
	File: fn_jail.sqf
	Author:
	Description:
*/
private["_bad","_unit"];

_unit 		= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_bad 		= [_this,1,false,[false]] call BIS_fnc_param;
_minutes 	= [_this,2,8,[]] call BIS_fnc_param;

if(isNull _unit) 	exitWith {};
if(_unit != player) exitWith {};
if(rvudxsiq) 			exitWith {};

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText["You have been arrested, wait your time out. If you attempt to respawn or reconnect your time will increase!","PLAIN"];
hint "For being arrested you have lost the following licenses if you own them\n\nFirearms License\nRebel License";

player setPos (getMarkerPos "jail_marker");

if(_bad) then {
	waitUntil {alive player};
	sleep 1;
};

if(player distance (getMarkerPos "jail_marker") > 40) then {
	player setPos (getMarkerPos "jail_marker");
};

license_civ_gun 		= false;
license_civ_rebel 		= false;
rvudxsiq 					= true;

if(life_inv_heroinu > 0) 	then {[false,"heroinu",		life_inv_heroinu] 		call life_fnc_handleInv;};
if(life_inv_heroinp > 0) 	then {[false,"heroinp",		life_inv_heroinp] 		call life_fnc_handleInv;};
if(life_inv_coke > 0) 		then {[false,"cocaine",		life_inv_coke] 			call life_fnc_handleInv;};
if(life_inv_cokep > 0) 		then {[false,"cocainep",	life_inv_cokep] 		call life_fnc_handleInv;};
if(life_inv_turtle > 0) 	then {[false,"turtle",		life_inv_turtle] 		call life_fnc_handleInv;};
if(life_inv_cannabis > 0) 	then {[false,"cannabis",	life_inv_cannabis] 		call life_fnc_handleInv;};
if(life_inv_marijuana > 0) 	then {[false,"marijuana",	life_inv_marijuana] 	call life_fnc_handleInv;};

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[[player, _bad, _minutes], "life_fnc_jailSys",false,false] spawn life_fnc_MP;
[1, true] call life_fnc_sessionHandle;