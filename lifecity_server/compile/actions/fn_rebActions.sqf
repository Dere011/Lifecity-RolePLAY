/*


*/
_unit 				= [_this, 0, Objnull, [Objnull]] call BIS_fnc_param;
_action 			= [_this, 1, "", [""]] call BIS_fnc_param;

if(_unit getVariable "lc_res") then {
	if(_action == "sa") then {
		_unit setVariable["lc_RebSac", 2, true];
	};
	if(_action == "sr") then {
		_unit setVariable["lc_RebSac", 3, true];
	};
};