/*
	File: fn_restrainCiv.sqf
	Author:
	Description:
*/
private["_civ"];
_civ 	= [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _civ) exitWith {};

[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (20 * 60)};	
		if((player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")) exitWith {
			player setVariable["restrained", false, true];
			player setVariable["restrainedCiv", false, true];
			titleText ["Vous avez été libéré automatiquement suite à un ligottement excessive.","PLAIN"];
			player forceSpeed -1;
		};
		sleep 1;
	};
};

titleText[format["Vous avez ete ligotte par %1" ,name _civ], "PLAIN"];
				
while {player getVariable "restrained"} do {
	player playMove "AmovPercMstpSnonWnonDnon_Ease";
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained")};	
	if(!alive player) then {
		player setVariable ["restrained", false, true];
		player setVariable ["restrainedCiv", false, true];
	};
};
		
if(alive player) then {
	player playMoveNow "AmovPercMstpSnonWnonDnon_EaseOut";
};