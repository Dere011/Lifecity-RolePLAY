/*
	File: fn_gatherApples.sqf
	Author:
	Description:
*/
private["_sum"];
_sum = ["apple",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_in_use = true;
	titleText["Gathering Apple(s)...","PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	if(([true,"apple",_sum] call life_fnc_handleInv)) then
	{
		titleText[format["You have picked %1 Apple(s)",_sum],"PLAIN"];
	};
}
	else
{
	hint "Your inventory space is full.";
};

life_action_in_use = false;