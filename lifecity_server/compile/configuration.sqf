life_forced_query_time = time;
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 30;
life_clothing_purchase = [-1,-1,-1,-1,-1];

life_siren_active 		= false;
life_lock_active  		= false;
life_klaxcop_active  	= false;
life_restrain_active	= false;
life_surrender_active	= false;

life_maxWeight 			= 24;
life_maxWeightT 		= 24;
life_carryWeight 		= 0;

life_eat_Salema 		= 40;
life_eat_Ornate 		= 20;
life_eat_Mackerel 		= 20;
life_eat_Tuna 			= 100;
life_eat_Mullet 		= 30;
life_eat_CatShark 		= 60;
life_eat_Rabbit 		= 20;
life_eat_Apple 			= 5;
life_eat_turtlesoup 	= 62;
life_eat_donuts 		= 30;

texceuve					= 0;
dawwpqsa 					= 0;
rvudxsiq 					= false;
lc_has_insurance			= false;
lc_has_lifeinsurance		= false;
lc_is_banned				= false;
life_net_dropped 			= false;
life_hit_explosive 			= false;
life_siren_active 			= false;
life_bank_fail 				= false;
life_use_atm				= true;
life_delivery_in_progress 	= false;
life_action_in_use 			= false;
life_thirst 				= 100;
life_hunger 				= 100;
life_paycheck_period 		= 10;
life_impound_car 			= 350;
life_impound_boat 			= 250;
life_impound_air 			= 850;
life_istazed 				= false;
life_my_gang 				= ObjNull;
life_vehicles 				= [];
bank_robber 				= [];
loub_admin_mode				= false;
is_ingame					= false;
tcywxnhh					= 0;
lc_res						= false;
lc_dontremoveitems			= false;

switch (playerSide) do {
	case west: {
		srwapffq 			= 10000;
		life_paycheck 		= 10000;
	};
	case civilian: {
		srwapffq 			= 10000;
		life_paycheck 		= 1500;
	};
};

life_inv_items = [
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement"
];

{missionNamespace setVariable[_x,0];} foreach life_inv_items;

life_licenses = [
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_medmarijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"]
];

{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points 		= ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
life_illegal_items 	= [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["marijuana",2000],["turtle",3000]];

life_config_loaded  = true;