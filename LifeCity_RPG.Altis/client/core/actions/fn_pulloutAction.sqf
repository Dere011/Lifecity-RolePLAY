/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];

if((cursorTarget getVariable["blackmesa", false])) exitWith {
	hint "Arg, celà ne fonctionne pas. Mais pourquoi ?";
};

_crew 	= crew cursorTarget;
{
	if(side _x != west) then {
		_x setVariable ["transporting",false,true]; 
		_x setVariable ["Escorting",false,true];
		[[_x],"life_fnc_pulloutVeh",_x,false] spawn life_fnc_MP;
		
		_x setVariable["restrained",true,true];
		[[player], "life_fnc_restrain", _x, false] spawn life_fnc_MP;
	};
} foreach _crew;