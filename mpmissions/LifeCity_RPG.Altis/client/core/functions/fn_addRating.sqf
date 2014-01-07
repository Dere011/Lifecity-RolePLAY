/*
	File: fn_addRating.sqf
	Author: Dere011
	
	Description:
*/
switch (playerSide) do {
	case west: {
		player addRating 99999999;
	};
	case civilian: {
		player addRating -20000;
	};
};
 