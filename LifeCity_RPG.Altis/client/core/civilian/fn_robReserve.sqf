/*
	File: fn_robReserve.sqf
	Author:
	Description:
*/
private["_vault","_funds","_timer","_toFar"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_funds = [_this,1,-1,[0]] call BIS_fnc_param;
_toFar = false;

if(isNull _vault OR _funds == -1) 	exitWith {};
if(player distance _vault > 10) 	exitWith {[[_vault,-1],"STS_fnc_robberyState",false,false] spawn life_fnc_MP; hint "You were to stay within 10m of the vault!"};
if(_funds < 50000) exitWith{[[_vault,-1],"STS_fnc_robberyState",false,false] spawn life_fnc_MP; hint "There wasn't enough funds in the reserve...";};
_timer 		= time + (30 * 60);

titleText["Cracking the safe...","PLAIN"];
[[], "life_fnc_braquage", nil, false] spawn life_fnc_MP;

while {true} do
{
	_countDown = if(round(_timer - time) > 60) then {format["%1 minute(s)",round(round(_timer - time) / 60)]} else {format["%1 second(s)",round(_timer - time)]};
	hintSilent format["You need to stay within 15m!\n\nTime Remaining:\n %1\n\nDistance: %2m",_countDown,round(player distance _vault)];

	if(player distance _vault > 15) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {};
};

switch(true) do
{
	case (_toFar):
	{
		hint "You went to far from the safe, the robbery has failed!";
		[[_vault,0],"STS_fnc_robberyState",false,false] spawn life_fnc_MP;
	};
	
	case (!alive player):
	{
		hint "Because you died the robbery failed.";
		[[_vault,0],"STS_fnc_robberyState",false,false] spawn life_fnc_MP;
	};
	
	case (life_istazed):
	{
		hint "You were tazed, the robbery has failed!";
		[[_vault,0],"STS_fnc_robberyState",false,false] spawn life_fnc_MP;
	};
	
	case ((round(_timer - time)) < 1):
	{
		hint format["You have successfully robbed $%1\n\nTo avoid the cops tracing you, your bank card will not work for 8 minutes",[_funds] call life_fnc_numberText];
		[] spawn
		{
			life_use_atm = false;
			sleep 480;
			life_use_atm = true;
		};
		dawwpqsa = dawwpqsa + _funds;
		[[_vault,1,_funds],"STS_fnc_robberyState",false,false] spawn life_fnc_MP;
	};
};