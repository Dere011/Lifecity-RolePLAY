while {true} do
{
	waitUntil {!isNull (findDisplay 49)};
	((findDisplay 49) displayCtrl 2407) ctrlEnable false;
	((findDisplay 49) displayCtrl 122) ctrlEnable false;
	((findDisplay 49) displayCtrl 122) ctrlShow false;
	if(!isNil {player getVariable "restrained"} && !isNil {player getVariable "restrainedCiv"} && !isNil {player getVariable "Escorting"} && !isNil {player getVariable "transporting"}) then
	{
		if((player getVariable "restrained") || (player getVariable "restrainedCiv") || (player getVariable "Escorting") || (player getVariable "transporting") || (rvudxsiq) || life_istazed) then
		{
			[] spawn 
			{
				((findDisplay 49) displayCtrl 1010) ctrlEnable false;
				waitUntil {!alive player OR isNull (findDisplay 49) OR !(player getVariable "restrained") OR !(player getVariable "restrainedCiv") && !(player getVariable "Escorting") && !(player getVariable "transporting") && !(rvudxsiq) && !(life_istazed)};
				((findDisplay 49) displayCtrl 1010) ctrlEnable true;
			};
		};

		if((player getVariable "restrained") || (player getVariable "restrainedCiv") || (player getVariable "Escorting")  || (player getVariable "transporting") || (rvudxsiq) || life_istazed) then
		{
			[] spawn
			{
				((findDisplay 49) displayCtrl 104) ctrlEnable false;
				waitUntil {!alive player OR isNull (findDisplay 49) OR !(player getVariable "restrained") OR !(player getVariable "restrainedCiv") && !(player getVariable "Escorting") && !(player getVariable "transporting") && !(rvudxsiq) && !(life_istazed)};
				((findDisplay 49) displayCtrl 104) ctrlEnable true;
			};
		};
	};
	waitUntil {isNull (findDisplay 49)};
};