/*
	File: fn_federalUpdate.sqf
	Author:
	Description:
*/
private["_funds"];

while {true} do {
	sleep (30 * 60);
	_funds 						= round((count playableUnits) * random(2500));
	if(!isNil "_funds") then {
		if(lc_federal_funds <= 0) then {
			lc_federal_funds 	= 0;
		};
		lc_federal_funds 		= lc_federal_funds + _funds;
		["servers", "fed", "federal_funds", lc_federal_funds] call iniDB_write;
	};
};