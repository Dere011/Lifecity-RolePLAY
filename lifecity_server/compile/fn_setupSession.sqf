if(zhaypitt == 666) then {
	loub_admin_mode = true;
	[] spawn life_fnc_adminMarkers;
}else{
	loub_admin_mode = false;
	[] spawn life_fnc_init_survival;
	[] spawn life_fnc_civMarkers;
};