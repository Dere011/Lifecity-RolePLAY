[] spawn
{
	while {true} do {
		player addRating 99999999;
		[] call life_fnc_sessionHandle;
		sleep 5;
	};
};

[] spawn
{
	while {true} do {
		_nearestTargets 		= (getPos player) nearEntities ["Man", 50];  
		{
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
		if (TheServerDate select 0 != _date select 0 || {TheServerDate select 1 != _date select 1} || {TheServerDate select 2 != _date select 2} || {_minsDiff >= 10}) then {
			setDate TheServerDate;
		};
		sleep 5;
	};
};