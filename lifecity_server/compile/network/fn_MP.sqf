with missionnamespace do {
	private ["_params","_functionName","_target","_isPersistent","_isCall","_packet"];

	_params 		= 	[_this,0,[]] call bis_fnc_param;
	_functionName 	=	[_this,1,"",[""]] call bis_fnc_param;
	_target 		=	[_this,2,true,[objnull,true,0,[],sideUnknown,grpnull]] call bis_fnc_param;
	_isPersistent 	=	[_this,3,false,[false]] call bis_fnc_param;
	_isCall 		=	[_this,4,false,[false]] call bis_fnc_param;
	_packet 		= [0,_params,_functionName,_target,_isPersistent,_isCall];

	if (isServer || !isMultiplayer) then {
		["lifecity_fnc_MP_packet_30120", _packet] spawn life_fnc_MPexec;
	}else{
		missionNamespace setVariable ["lifecity_fnc_MP_packet_30120", _packet];
		publicVariableServer "lifecity_fnc_MP_packet_30120";
	}
};
