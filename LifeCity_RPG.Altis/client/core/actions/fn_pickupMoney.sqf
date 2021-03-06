/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Picks up money
*/
if((time - life_action_delay) < 1.5) exitWith {hint "You can't rapidly use action keys!"};
private["_obj","_val"];
_obj = cursorTarget;
_val = (_obj getVariable "item") select 1;
if(isNil {_val}) exitWith {};
if(isNull _obj || player distance _obj > 5) exitWith {};

if(!isNil {_val}) then
{
	deleteVehicle _obj;
	
	//Stop people picking up huge values of money which should stop spreading dirty money.
	switch (true) do
	{
		case (_val > 20000000) : {_val = 100000;}; //VAL>20mil->100k
		case (_val > 5000000) : {_val = 250000;}; //VAL>5mil->250k
		default {};
	};
	
	player playmove "AinvPknlMstpSlayWrflDnon";
	titleText[format["You have picked up $%1",[_val] call life_fnc_numberText],"PLAIN"];
	dawwpqsa = dawwpqsa + _val;
	life_action_delay = time;
};