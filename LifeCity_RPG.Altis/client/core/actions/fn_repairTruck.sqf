/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh"];
_veh = cursorTarget;
if(isNull _veh) exitwith {};

if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then {
	if("ToolKit" in (items player)) then {
		titleText["Reparation en cours... (20%)", "PLAIN"];
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 3.5;
		titleText["Reparation en cours... (40%)", "PLAIN"];
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 3.5;
		titleText["Reparation en cours... (80%)", "PLAIN"];
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 3.5;
		titleText["Reparation en cours... (100%)", "PLAIN"];
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 3.5;
		if(player != vehicle player) exitWith {titleText["Vous devez etre a l'exterieur du vehicule a reparer.","PLAIN"];};
		player removeItem "ToolKit";
		_veh setDamage 0;
		_veh setFuel 1;
		titleText["Le véhicule est maintenant repare.","PLAIN"];
	};
};