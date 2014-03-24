/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onDeath}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this spawn life_fnc_onRespawn}];

"lifecity_fnc_MP_packet_30120" 		addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
"lifecity_fnc_MP_packet_30121" 		addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
"lifecity_fnc_MP_packet_30122" 		addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
"lifecity_fnc_MP_packet_30123" 		addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
"lifecity_fnc_MP_packet_30120_1" 	addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
"lifecity_fnc_MP_packet_30120_2" 	addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
"lifecity_fnc_MP_packet_30120_3" 	addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
"lifecity_fnc_MP_packet_30120_4" 	addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
"lifecity_fnc_MP_packet_30120_5" 	addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};