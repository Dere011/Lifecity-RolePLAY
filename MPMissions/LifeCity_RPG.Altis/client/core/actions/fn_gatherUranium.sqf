/*
	File: fn_gatherUranium.sqf
	Author:
	Description:
*/
private["_sum"];
_random					= 1;
_sum 					= ["uranium", _random, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then {
	life_action_in_use 	= true;
	titleText["Extraction de l'uranium...","PLAIN"];
	sleep 15;
	if(([true, "uranium", _sum] call life_fnc_handleInv)) then {
		titleText["Vous avez extraits de l'uranium.","PLAIN"];
	};
}else{
	hint "Votre inventaire est plein.";
};
life_action_in_use 	= false;