private ["_pos"];

player setVariable ["playerSurrender", true, true];

while { player getVariable ["playerSurrender", false] }  do {
	player playMove "AmovPercMstpSnonWnonDnon_Ease";
	
	if (!alive player) then {
		player setVariable ["playerSurrender", false, true];
	};
	sleep 0.1; // @VOIR
};

player playMoveNow "AmovPercMstpSnonWnonDnon_EaseOut";
