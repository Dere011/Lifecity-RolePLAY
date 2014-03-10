with missionnamespace do {
	private ["_params","_functionName","_target","_isPersistent","_isCall","_callInstance","_packet"];
	_params 		= 	[_this,0,[]] call bis_fnc_param;
	_functionName 	=	[_this,1,"",[""]] call bis_fnc_param;
	_target 		=	[_this,2,true,[objnull,true,0,[],sideUnknown,grpnull]] call bis_fnc_param;
	_isPersistent 	=	[_this,3,false,[false]] call bis_fnc_param;
	_isCall 		=	[_this,4,false,[false]] call bis_fnc_param;
	_callInstance 	=	[_this,5,"lifecity_fnc_MP_packet_30120",[""]] call bis_fnc_param;
	_packet 		= 	[0,_params,_functionName,_target,_isPersistent,_isCall];
	if (isServer || !isMultiplayer) then {
		[_callInstance, _packet] spawn life_fnc_MPexec;
	}else{
		//if(_callInstance == "lifecity_fnc_MP_packet_30120") then {
		//	_callInstance = format["lifecity_fnc_MP_packet_30120_%1", round(random(5))];
		//};
		missionNamespace setVariable [_callInstance, _packet];
		publicVariableServer _callInstance;
	};
};