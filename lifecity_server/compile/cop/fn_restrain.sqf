/*
	File: fn_restrain.sqf
	Author:
	Description:
*/
private["_cop"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

player switchMove "AmovPercMstpSnonWnonDnon";
player playMoveNow "AmovPercMstpSnonWnonDnon";

titleText[format["Vous avez ete menotte par %1" ,name _cop], "PLAIN"];
				
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