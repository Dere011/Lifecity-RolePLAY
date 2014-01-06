/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
private["_cop"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (10 * 60)};	
		if(player getVariable "restrained" && !(player getVariable "Escorting") && !(player getVariable "transporting")) exitWith {
			disableUserInput false;
			player setVariable["restrained",false,true];
			titleText ["You have been released automatically for excessive restrainment time","PLAIN"];
		};
		sleep 1;
	};
};

titleText[format["Vous avez ete menotte par %1" ,name _cop], "PLAIN"];
				
while {player getVariable "restrained"} do {
	player playMove "AmovPercMstpSnonWnonDnon_Ease";
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained")};
			
	if(!alive player) then {
		player setVariable ["restrained", false, true];
	};
};
		
if(alive player) then {
	player playMove "AMOVPERCMSTPSNONWNONDNON_EASEOUT";
	//titleText["You have been released, press V to get out of restrainment.","PLAIN"];
};