[] spawn  {
	while{true} do
	{
		sleep 160;
		if(life_hunger < 1) then {
			player setDamage 1; hint "You have starved to death.";
		}else{
			life_hunger = life_hunger - 1;
			[] call life_fnc_hudUpdate;
			if(life_hunger < 1) then {player setDamage 1; hint "You have starved to death.";};
			switch(life_hunger) do {
				case 30: {hint "You haven't eaten anything in awhile, You should find something to eat soon!";};
				case 20: {hint "You are starting to starve, you need to find something to eat otherwise you will die.";};
				case 10: {hint "You are now starving to death, you will die very soon if you don't eat something";player setFatigue 1;};
			};
		};
	};
};

[] spawn  {
	while{true} do
	{
		sleep 120;
		if(life_thirst < 1) then {
			player setDamage 1; hint "You have died from dehydration.";
		}else{
			life_thirst = life_thirst - 1;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 1) then {
				player setDamage 1; hint "You have died from dehydration.";
			};
			switch(life_thirst) do 
			{
				case 30: {hint"You haven't drank anything in awhile, You should find something to drink soon.";};
				case 20: {hint "You haven't drank anything in along time, you should find someting to drink soon or you'll start to die from dehydration"; player setFatigue 1;};
				case 10: {hint "You are now suffering from severe dehydration find something to drink quickly!"; player setFatigue 1;};
			};
		};
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp 		= backpack player;
		_cfg 		= getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load 		= round(_cfg / 8);
		if((backpack player) == "B_Kitbag_mcamo") then {
			_load = 16;
		};
		if((backpack player) == "B_FieldPack_ocamo") then {
			_load = 26;
		};
		if((backpack player) == "B_Bergen_sgg") then {
			_load = 36;
		};
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then  {
			life_maxWeight = life_maxWeightT;
		};
	};
};

fn_Weight = {
	if(life_carryWeight > life_maxWeight) then {
		player forceWalk true;
		player setFatigue 1;
	}else{
		player forceWalk false;
	};
};
LIFE_ID_MonitorWeight = ["LIFE_WeightMonitor","onEachFrame","fn_Weight"] call BIS_fnc_addStackedEventHandler;

[] spawn  {
	private["_walkDis","_myLastPos","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	while{true} do {
		sleep 1;
		if(!alive player) then {
			_walkDis = 0;
		}else{
			_CurPos 				= (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then {
				_walkDis 			= _walkDis + 1;
				if(_walkDis == 1200) then {
					_walkDis		= 0;
					life_thirst 	= life_thirst - 5;
					life_hunger 	= life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos 				= (getPos player select 0) + (getPos player select 1);
		};
	};
};