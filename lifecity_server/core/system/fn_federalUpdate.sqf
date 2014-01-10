/*
	File: fn_federalUpdate.sqf
	Author:
	Description:
*/
private["_funds"];

while {true} do {
	sleep (15 * 60);
	_funds 						= round((count playableUnits) * random(5000));
	if(!isNil "_funds") then {
		if(lc_federal_funds <= 0) then {
			lc_federal_funds 	= 0;
		};
		lc_federal_funds 		= lc_federal_funds + _funds;
	};
};