/*
	File: fn_colorVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reskins the vehicle
*/
private["_vehicle","_index","_texture","_texture2","_texture3"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _vehicle OR !alive _vehicle OR _index == -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.
switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F": {waitUntil {!isNil {_vehicle getVariable "BIS_randomSeed1"}};};
	case "C_Hatchback_01_F": {waitUntil {!isNil {_vehicle getVariable "BIS_randomSeed1"}};};
	case "C_Hatchback_01_sport_F": {waitUntil {!isNil {_vehicle getVariable "BIS_randomSeed1"}};};
	case "C_SUV_01_F": {waitUntil {!isNil {_vehicle getVariable "BIS_randomSeed1"}};};
	case "C_Van_01_box_F": {waitUntil {!isNil {_vehicle getVariable "BIS_randomSeed1"}};};
	case "C_Van_01_transport_F": {waitUntil {!isNil {_vehicle getVariable "BIS_randomSeed1"}};};
};

//Fetch texture from our present array.
_texture = [(typeOf _vehicle)] call life_fnc_vehicleColorCfg;
if(isNil "_texture") exitWith {};
if(count _texture == 0) exitWith {};
if(count (_texture select _index) > 2) then {_texture2 = (_texture select _index) select 2;};
if(count (_texture select _index) > 3) then {_texture3 = (_texture select _index) select 3;};
_texture = _texture select _index;
if(typeName _texture == "ARRAY") then { _texture = _texture select 0;};

if(local _vehicle) then {
	_vehicle setVariable["Life_VEH_color",_index,true];
};

_vehicle setObjectTexture[0,_texture];
if(!isNil "_texture2") then
{
	_vehicle setObjectTexture[1,_texture2];
};
if(!isNil "_texture3") then
{
	_vehicle setObjectTexture[2,_texture3];
};

if(typeOf _vehicle == "C_Offroad_01_F") then
{
	if(_index < 5) then
	{
		_vehicle setObjectTexture[1,_texture];
	};
};