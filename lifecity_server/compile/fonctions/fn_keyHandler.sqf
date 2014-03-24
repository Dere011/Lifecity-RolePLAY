/*
	File: fn_keyHandler.sqf
	Author:
	Description:
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked"];
_ctrl 		= _this select 0;
_code 		= _this select 1;
_shift 		= _this select 2;
_ctrlKey 	= _this select 3;
_alt 		= _this select 4;
_speed 		= speed cursorTarget;
_handled 	= false;

if(life_action_inUse) 	exitWith {_handled};
if(!(alive player)) 	exitWith {_handled};

switch (_code) do
{
	case 20: {
		if(!lc_res && !_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles || loub_admin_mode) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	case 38: {
		if(!lc_res && !_alt && !_ctrlKey) then { 
			[] call life_fnc_radar; 
		};
	};
	case 21: {
		if(!lc_res && !_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};
	case 47: {
		if(playerSide != west && (player getVariable "restrained") OR (player getVariable "transporting")) then {_handled = true;};
	};
	case 33: {
		if(!lc_res && playerSide == west && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn {
				life_siren_active = true;
				sleep 1.0;
				life_siren_active = false;
			};
			_veh = vehicle player;
			_playername = name player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then {
				titleText ["Sirene OFF","PLAIN DOWN"];
				_veh setVariable["siren",false,true];
			}else{
				titleText ["Sirene ON","PLAIN DOWN"];
				_veh setVariable["siren",true,true];
				[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
			};
		};
	};
	case 34: {
		if(!lc_res && playerSide == west && vehicle player != player && !life_klaxcop_active && ((driver vehicle player) == player)) then
		{
			[] spawn {
				life_klaxcop_active = true;
				sleep 1.0;
				life_klaxcop_active = false;
			};
			[[vehicle player,"klaxoncop"],"life_fnc_playSound",nil,false] spawn life_fnc_MP;
		};
	};
	case 15:
	{
		if(!_alt && !_ctrlKey && !life_surrender_active) then {
			if (vehicle player == player && !(player getVariable ["restrained", false]) && !(player getVariable ["Escorting", false]) ) then {
				[] spawn {
					life_surrender_active = true;
					sleep 2.0;
					life_surrender_active = false;
				};
				if (player getVariable ["playerSurrender", false]) then {
					player setVariable ["playerSurrender", false, true];
				} else {
					[] spawn life_fnc_surrender;
					titleText["Tu te rends", "PLAIN DOWN"];
				};
			};
			_handled = true;
		};
	};
	case 46: {
		if(!lc_res && !life_restrain_active && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && cursorTarget distance player < 2.0  && !(cursorTarget getVariable "Escorting")) then {
			[] spawn {
				life_restrain_active = true;
				sleep 3.0;
				life_restrain_active = false;
			};
			if(playerSide == west) then {
				if((cursorTarget getVariable "restrained")) then {
					[cursorTarget] call life_fnc_unrestrain;
				}else{
					[cursorTarget] call life_fnc_restrainAction;
				};
			}else{
				if (player getVariable ["playerSurrender", false]) then {
					if((cursorTarget getVariable "restrained")) then {
						[cursorTarget] call life_fnc_unrestrainCiv;
					}else{
						[cursorTarget] call life_fnc_restrainActionCiv;
					};
				};
			};
		};
	};
	case 22: {
		if(!lc_res && !_alt && !_ctrlKey && !life_lock_active) then {
			[] spawn {
				life_lock_active = true;
				sleep 1.0;
				life_lock_active = false;
			};
			if(vehicle player == player) then {
				_veh = cursorTarget;
			}else{
				_veh = vehicle player;
			};
			_locked  = locked _veh;
			if(_veh in life_vehicles && player distance _veh < 10) then {
				if(_locked != 0) then {
					_veh lock 0;
					[[_veh, 0], "life_fnc_lockVehicle", _veh, false] spawn life_fnc_MP;
					[[_veh,"UnLockVeh"],"life_fnc_playSound",nil,false] spawn life_fnc_MP;
					titleText["Vous avez deverrouille votre vehicule.", "PLAIN DOWN"];
				}else{
					_veh lock 2;
					[[_veh, 2], "life_fnc_lockVehicle", _veh, false] spawn life_fnc_MP;
					[[_veh,"LockVeh"],"life_fnc_playSound",nil,false] spawn life_fnc_MP;
					titleText["Vous avez verrouille votre vehicule.", "PLAIN DOWN"];
				};
			};
		};
	};
};

_handled;