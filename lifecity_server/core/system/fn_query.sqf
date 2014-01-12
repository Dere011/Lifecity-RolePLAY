/*
	File: fn_query.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	This is a gateway to the SQF->MySQL Query function.
*/
private["_uid","_unit","_ret","_ownerID"];
_unit 				= [_this,0, ObjNull, [Objnull]] call BIS_fnc_param;
_uid 				= [_this,1, "",      [""]] 		call BIS_fnc_param;

if(isNull _unit OR _uid == "") exitWith {
	if(!isNull _unit) then {
		_ownerID 	= owner _unit;
		["(100) Erreur lors de la recuperation des informations de votre compte. Veuillez-vous reconnecter.", "life_fnc_sessionReceive", _ownerID, false] spawn life_fnc_MP;
	};
};

_ownerID 	= owner _unit;
_ret 		= [_uid,_unit] call DB_fnc_query;

waitUntil {typeName _ret == "ARRAY" OR typeName _ret == "STRING" OR isNil "_ret"};

if(!isNil "_ret") then {
	if(typeName _ret == "STRING") then {
		if(_ret == "NEW_PLAYER") then {
			[nil,	"life_fnc_sessionReceive",	_ownerID,	false] spawn life_fnc_MP;
		}else{
			[_ret,	"life_fnc_sessionReceive",	_ownerID,	false] spawn life_fnc_MP;
		};
	} else {
		[_ret,	"life_fnc_sessionReceive",	_ownerID,	false] spawn life_fnc_MP;
	};
}else{
	["(101) Erreur lors de la recuperation des informations de votre compte. Veuillez-vous reconnecter.", "life_fnc_sessionReceive", _ownerID, false] spawn life_fnc_MP;
};