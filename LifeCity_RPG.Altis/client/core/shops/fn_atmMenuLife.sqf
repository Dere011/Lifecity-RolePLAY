/*
	File: fn_atmMenu.sqf
	Author:
	Description:
*/
private["_display","_text","_units","_type"];

if(!life_use_atm) exitWith {
	hint "Because you robbed the bank you can't use the ATM for 5 minutes.";
};

if(vehicle player != player) exitwith {
	hint "Vous ne pouvez pas acceder au distributeur depuis votre vehicule !";
};

if(!dialog) then {
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;

_display	= findDisplay 2700;
_text 		= _display displayCtrl 2701;
_units 		= _display displayCtrl 2703;

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='client\icons\bank.paa'/> $%1<br/><img size='1.6' image='client\icons\money.paa'/> $%2", [srwapffq] call life_fnc_numberText,[dawwpqsa] call life_fnc_numberText];

{
	if(alive _x && _x != player) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
		};
		_units lbAdd format["%1 (%2)",name _x,_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];