/* 
	@file Version: 1a
	@file name: bank_timer.sqf
	@file Author: Alan
	@file edit: 6/17/2013
	Copyright © 2013 STS Alan, All rights reserved
*/

private["_outcome","_robber"];
_outcome 	= _this select 0;
_robber 	= _this select 1;

switch (_outcome) do
{
	case "success" : 
	{
		bank_robber 		= [];
		publicVariable "bank_robber";
		robbery_success 	= 1;
		publicVariable "robbery_success";
		sleep (60 * 60);
		bank_obj setVariable["rob_in_sess",false,true];
		if(!(bank_obj getVariable "rob_in_sess")) then {
			robbery_success = 0;
			publicVariable "robbery_success";
		};
	};
	case "failed" :
	{
		bank_robber 		= [];
		publicVariable "bank_robber";
		robbery_success		= 2;
		publicVariable "robbery_success";
		sleep (30 * 60);
		bank_obj setVariable["rob_in_sess",false,true];
		if(!(bank_obj getVariable "rob_in_sess")) then {
			robbery_success = 0;
			publicVariable "robbery_success";
		};
	};
	case "inprog" :
	{
		private["_counter"];
		_counter 		= 0;
		robbery_success = 0;
		publicVariable "robbery_success";
		while {robbery_success == 0} do {
			_counter 	= _counter + 1;
			[{[] spawn {["<t align='center'><t shadow='0'shadowColor='#000000''color='#01D00D'size='0.5'>BRAQUAGE DE LA BANQUE FEDERAL EN COURS!</t></t>", 0, 0, 10, 0] call bis_fnc_dynamictext;};}, "BIS_fnc_spawn", nil, false] spawn life_fnc_MP;
			sleep 1;
			if(_counter > 191 && robbery_success == 0) then {
				hint "The bank robbery has failed!";
				["failed"] spawn bank_timer;
			};
		};
	};
};