[] spawn
{
	while {true} do {
		player addRating 99999999;
		[] call life_fnc_sessionHandle;
		sleep 5;
	};
};