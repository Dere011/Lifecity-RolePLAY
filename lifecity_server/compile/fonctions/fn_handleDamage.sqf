/*
	File: fn_handleDamage.sqf
	Author:
	Description:
*/
private["_unit","_damage","_source","_projectile","_sel","_curWep", "_distance_max"];

_unit 			= _this select 0;
_sel 			= _this select 1;
_damage 		= _this select 2;
_source 		= _this select 3;
_projectile 	= _this select 4;
_curWep 		= "";
_distance_max   = 0;

if(_unit == _source) then {
	_damage = (_damage / 3);
};
if((typeOf _source) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then {
	_damage = 0;
};

if(isPlayer _source && _source isKindOf "Man") then {_curWep = currentWeapon _source;};
if(_source != _unit && isPlayer _source && side _source == west && _curWep in ["hgun_P07_snds_F", "arifle_SDAR_F"]) then {
	_damage 					 = 0;
	if(side _unit != west) then {
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"]) then {
			if(_curwep == "arifle_SDAR_F") then {
				_distance_max 	= 50;
			}else{
				_distance_max 	= 15;
			};
			if(!life_istazed && !(player getVariable["restrained", false]) && player distance _source < _distance_max) then {
				if(typeOf (vehicle player) == "B_Quadbike_01_F") then {
					player allowDamage false;
					player action ["Eject",vehicle player];
					player allowDamage true;
				};
				if(vehicle player == player) then {
					[_unit,_source] spawn life_fnc_tazed;
				};
			};
		};
	};
};

[] call life_fnc_hudUpdate;

_damage;