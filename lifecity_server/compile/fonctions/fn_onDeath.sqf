/*
	File: fn_onDeath.sqf
	Author:
	Description:
*/
private["_unit","_killer","_weapons","_handle"];

_unit 				= [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_source 			= [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

if(!life_session_completed) exitWith {
	endMission "loser";
};

[_unit] spawn {
	private["_unit", "_pos", "_obj"];
	_unit 	= _this select 0;
	_pos 	= _unit modelToWorld[0,3,0];
	_pos 	= [_pos select 0, _pos select 1, 0];
	_obj 	= "Sign_Pointer_F" createVehicle _pos;
	_obj setPos _pos;
	[[_obj, "I4jo8wc5419p72L"], "life_fnc_playSound", nil, false] spawn life_fnc_MP;
	[{playSound "jX2Rn8VXcs8G4Rr";}, "BIS_fnc_spawn", nil, false] spawn life_fnc_MP;
	sleep 2;
	deleteVehicle _obj;
};

0 fadeMusic 1;
playMusic "KP261hc8yY8a21k";
5 fadeMusic 0;

gear_is_save 			= false;
[] call life_fnc_saveGear;
waitUntil {gear_is_save};

if(!lc_has_lifeinsurance) then {
	["<t align='center'><t shadow='0'shadowColor='#000000''color='#01D00D'size='1.8'>TU ES MORT</t><br />Vous n'avez pas d'assurance vie.<br />vous avez perdu vos affaires.</t>", nil, nil, 30] call bis_fnc_dynamictext;
	if(playerSide == civilian) then {
		dawwpqsavg		= [];
	}else{
		dawwpqsag		= [];
	};
	lc_dontremoveitems	= false;
}else{
	["<t align='center'><t shadow='0'shadowColor='#000000''color='#01D00D'size='1.8'>TU ES MORT</t><br />Vous avez une assurance vie.<br />Vous n'avez rien perdu (Sauf l'assurance).</t>", nil, nil, 30] call bis_fnc_dynamictext;
	lc_dontremoveitems	= true;
};
lc_has_lifeinsurance	= false;

sleep 0.5;

0 cutFadeOut 9999999;
hideBody _unit;
deleteVehicle _unit;

if(side _source != west && alive _source) then
{
	if(vehicle _source isKindOf "LandVehicle") then
	{
		if(alive _source) then
		{
			serv_killed 	= [_source,"187V"];
			publicVariableServer "serv_killed";
		};
	}
		else
	{
		serv_killed 		= [_source,"187"];
		publicVariableServer "serv_killed";
	};
};

if(side _source == west && !life_use_atm) then {
	if(dawwpqsa != 0) then {
		[format["Le voleur de la banque est mort, les forces fédérales on retrouvé $%1 sur lui.", [dawwpqsa] call life_fnc_numberText], "life_fnc_broadcast", true, false] spawn life_fnc_MP;
		dawwpqsa = 0;
	};
};

if(side _source == west && vehicle _source == _source && playerSide == civilian) then {
	[[player,_source,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	[[player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
}else{
	if(playerSide == civilian) then {
		[[player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	};
};

{ _unit removeAction _x; } foreach life_actions;

_handle 			= [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_carryWeight 	= 0;
life_thirst 		= 100;
life_hunger 		= 100;
life_use_atm 		= true;

if(lc_has_insurance) then {
	hint "Vous avez perdu votre assurance bancaire suite à votre mort.";
};

lc_has_insurance	= false;
lc_lastposition     = [];

[1, true, true] call life_fnc_sessionHandle;