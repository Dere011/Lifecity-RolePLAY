/*
	File: fn_gatherOil.sqf
	Author:
	Description:
*/
private["_sum"];
_random					= 1;
_sum 					= ["oilu", _random, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then {
	life_action_in_use 	= true;
	titleText["Extraction du pétrole...","PLAIN"];
	sleep 5;
	if(([true, "oilu", _sum] call life_fnc_handleInv)) then {
		titleText["Vous avez extraits du pétrole brut.","PLAIN"];
	};
}else{
	hint "Votre inventaire est plein.";
};
life_action_in_use 	= false;