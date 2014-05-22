[] spawn {
	private ["_hasRadio"];
	lc_res = false;
	while {true} do {
		if((player getVariable "restrained") || (player getVariable "restrainedCiv") || (player getVariable "playerSurrender") || (player getVariable "transporting")) then {
			lc_res 		= true;
			showMap false;
		}else{
			lc_res 		= false;
			showMap true;
		};
		player setVariable["lc_res", lc_res, true];
		if((player getVariable ["lc_RebSac", 0]) == 2) then {
			cutText["Impossible de voir, vous avez un sac sur la tête.", "BLACK"];
			player setVariable["lc_RebSac", 1, true];
		};
		if((player getVariable ["lc_RebSac", 0]) == 3) then {
			cutText["", "BLACK IN"];
			player setVariable["lc_RebSac", 0, true];
		};
		_hasRadio = false;
		{
			if (getText(configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemRadio") then {
				_hasRadio = true 
			};
		} forEach (assigneditems player);
		player setVariable["lc_hasRadio", _hasRadio, true];
		sleep 2;
		[] call life_fnc_hudUpdate;
	};
};

[] spawn
{
	lc_blackmesanoise = false;
	while {true} do {
		if(lc_blackmesanoise) then {
			_nearestTargets 		= nearestObjects [getPos player, ["Man", "Land_LampAirport_F", "Land_powerpolewooden_l_F","Land_lampdecor_f","Land_LampHalogen_F","Land_LampStreet_Small_F","Land_LampHarbour_F","Land_LampStreet_F","Land_LampShabby_F"], 300];
			{
				if (alive _x && isPlayer _x && _x != player && player == vehicle player) then {
					[{[] spawn {playSound "D5yVW65K4gz1ZW1"; "chromAberration" ppEffectEnable true; "chromAberration" ppEffectAdjust [random 0.25, random 0.25, true]; "chromAberration" ppEffectCommit 1; sleep 5; "chromAberration" ppEffectEnable false;};}, "BIS_fnc_spawn", _x, false] spawn life_fnc_MP;
				};
				if (alive _x && isPlayer _x && _x != player && player != vehicle player) then {
					[{[] spawn {playSound "D5yVW65K4gz1ZW1"; (vehicle player) setVelocity [0,0,0]; "chromAberration" ppEffectEnable true; "chromAberration" ppEffectAdjust [random 0.25, random 0.25, true]; "chromAberration" ppEffectCommit 1; sleep 5; "chromAberration" ppEffectEnable false;};}, "BIS_fnc_spawn", _x, false] spawn life_fnc_MP;
				};
				if (!(isPlayer _x)) then {
					_x setHit ["light_1_hitpoint",1];
					_x setHit ["light_2_hitpoint",1];
					_x setHit ["light_3_hitpoint",1];
					_x setHit ["light_4_hitpoint",1];
					[_x] spawn {
						sleep 2;
						_x = (_this select 0);
						_x setHit ["light_1_hitpoint",0];
						_x setHit ["light_2_hitpoint",0];
						_x setHit ["light_3_hitpoint",0];
						_x setHit ["light_4_hitpoint",0];
					};
				};
			} foreach _nearestTargets;
		};
		sleep 5;
	};
};

[] spawn
{
	while {true} do {
		if(!isNull (player getVariable "isEscorting")) then {
			if(lc_res || player distance (player getVariable "isEscorting") > 10) then { 
				detach (player getVariable "isEscorting");
				(player getVariable "isEscorting") setVariable["Escorting", false, true];
				player setVariable["isEscorting", objNull, true];
			};
		};
		player setVariable["adminlevel", zhaypitt, true];
		player setVariable["coplevel", texceuve, true];
		sleep 5;
	};
};

[] spawn
{
	while {true} do {
		if (alive player && is_ingame) then {
			lc_lastposition     = (getPos player);
		};
		if(["zoneNV", player] call bis_fnc_intrigger || ["zoneUN", player] call bis_fnc_intrigger || (vehicle player getVariable["blackmesa", false])) then {
			player addRating -20000;
		}else{
			player addRating 99999999;
		};
		[] call life_fnc_sessionHandle;
		currentcop = 0;
		{
			if(alive _x && _x != player) then {
				if(side _x == west) then {
					currentcop = currentcop + 1;
				};
			};
		} foreach playableUnits; 
		sleep 10;
	};
};

[] spawn
{
	while {true} do {
		private ["_date", "_minsDiff"];
		if(["zoneNV", player] call bis_fnc_intrigger) then {
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 0, 0, 0], [0.3, 0.3, 0.3, 0.3], [1, 1, 1, 0]];
			"colorCorrections" ppEffectCommit 0;
		};
		0 setFog 0;
		sleep 1;
	};
};

[] spawn
{
	while {true} do {
		if (alive player) then {
			if(["zoneNV", player] call bis_fnc_intrigger) then {
				if(!(isForcedWalk player) && !(player getVariable["isBM", false])) then {
					player forceWalk true;
					player setVariable["isBM", true, true];
					playSound "viu871u2q78W113";
					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 0, 0, 0], [0.3, 0.3, 0.3, 0.3], [1, 1, 1, 0]]; 
					"colorCorrections" ppEffectCommit 0;
				};
				if((vehicle player) != player && !(isPlayer (vehicle player))) then {
					if(fuel (vehicle player) != 0 && (player getVariable["adminlevel", 0]) != 666) then {
						(vehicle player) setFuel 0;
						[[(vehicle player), "cKsk1x8t377c53a"], "life_fnc_playSound", nil, false] spawn life_fnc_MP;
						sleep 2;
						("test_EmptyObjectForFireBig" createVehicle position (vehicle player)) attachTo [vehicle player,[0,0,-3]];
					};
				};
			}else{
				if((isForcedWalk player) || (player getVariable["isBM", false])) then {
					player forceWalk false;
					player setVariable["isBM", false, true];
					0 setFog [0, 0.01, 0];
					"colorCorrections" ppEffectEnable false;
				};
			};
		};
		sleep 1;
	};
};