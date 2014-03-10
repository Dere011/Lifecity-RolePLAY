[] spawn
{
	lc_res = false;
	while {true} do {
		if((player getVariable "restrained") || (player getVariable "restrainedCiv") || (player getVariable "playerSurrender") || (player getVariable "transporting")) then {
			lc_res 		= true;
		}else{
			lc_res 		= false;
		};
		if(!isNull (player getVariable "isEscorting")) then {
			if(lc_res || player distance (player getVariable "isEscorting") > 5) { then
				player setVariable["isEscorting", objNull, true];
			};
		};
		sleep 1;
	};
};

[] spawn
{
	while {true} do {
		//if(!life_session_completed) exitWith {
		//	endMission "loser";
		//};
		if (alive player && is_ingame) then {
			lc_lastposition     = (getPos player);
		};
		if(["zoneNV", player] call bis_fnc_intrigger || ["zoneUN", player] call bis_fnc_intrigger) then {
			player addRating -20000;
		}else{
			player addRating 99999999;
		};
		[] call life_fnc_sessionHandle;
		sleep 10;
	};
};

[] spawn
{
	while {true} do {
		_nearestTargets 		= (getPos player) nearEntities ["Man", 20];  
		{
			private ["_x"];
			if (alive _x) then {
				_x hideObject false;
			};
		} foreach _nearestTargets;
		sleep 5;
	};
};

[] spawn
{
	while {true} do {
		private ["_date", "_minsDiff"];
		_date 			= date;
		_minsDiff 		= abs (((TheServerDate select 3) * 60 + (TheServerDate select 4)) - ((_date select 3) * 60 + (_date select 4)));
		if(["zoneNV", player] call bis_fnc_intrigger) then {
			setDate [3000, 1, 1, 0, 0];
		}else{
			if (TheServerDate select 0 != _date select 0 || {TheServerDate select 1 != _date select 1} || {TheServerDate select 2 != _date select 2} || {_minsDiff >= 10}) then {
				setDate TheServerDate;
			};
		};
		sleep 5;
	};
};

[] spawn
{
	while {true} do {
		if (alive player && vehicle player != player) then {
			if(["zoneNV", player] call bis_fnc_intrigger) then {
				if(fuel (vehicle player) != 0) then {
					(vehicle player) setFuel 0;
					(vehicle player) setDamage 0.85;
					("test_EmptyObjectForFireBig" createVehicle position (vehicle player)) attachTo [vehicle player,[0,0,-3]];
					[[(vehicle player), "cKsk1x8t377c53a"], "life_fnc_playSound", nil, false] spawn life_fnc_MP;
				};
			};
		};
		sleep 1;
	};
};