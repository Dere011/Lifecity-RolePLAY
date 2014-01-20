private["_source"];

_source 		= [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_soundname 		= [_this,1,"",[""]] call BIS_fnc_param;

if(isNull _source) exitWith {};
if(isNil "_soundname")  exitWith {};

_source say3D _soundname;