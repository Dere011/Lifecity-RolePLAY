/*
	File: fn_weaponShopCfg.sqf
	Author:
	Description:
	Return:
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") 					exitWith {closeDialog 0};

switch(_shop) do
{
	case "cop":
	{
		if(playerSide != west) 		exitWith {"Heu ?"};
		_cop_items = 
		[
			["arifle_sdar_F","Tazer Rifle",8000],
			["hgun_P07_snds_F","Pistolet Tazer",8000],
			["hgun_P07_F",nil,10000],
			["SMG_02_F",nil,15000],
			["Binocular",nil,150],
			["ItemGPS",nil,100],
			["ToolKit",nil,250],
			["FirstAidKit",nil,150],
			["Medikit",nil,1000],
			["optic_Holosight",nil,5000],
			["acc_pointer_IR",nil,5000],
			["optic_Hamr",nil,5000],
			["optic_Yorris",nil,5000],
			["optic_Arco",nil,5000],
			["optic_ACO",nil,5000],
			["optic_ACO_grn",nil,5000],
			["NVGoggles",nil,2000],
			["30Rnd_556x45_Stanag_Tracer_Yellow","Munition Tazer Rifle (30)",750],
			["30Rnd_9x21_Mag","Munition Pistolet Tazer (30)",200],
			["30Rnd_9x21_Mag","Munition P07 9 mm (30)",200],
			["30Rnd_9x21_Mag","Munition Sting 9 mm (30)",200]
		];
		
		if(texceuve >= 2) then {
			_cop_items set[count _cop_items, ["arifle_TRG21_F",nil,30000]];
			_cop_items set[count _cop_items, ["arifle_MXC_black_F",nil,30000]];
			_cop_items set[count _cop_items, ["hgun_ACPC2_snds_F",nil,10000]];
			_cop_items set[count _cop_items, ["30Rnd_556x45_Stanag_Tracer_Yellow","Munition TRG-21 5.56 mm (30)",300]];
			_cop_items set[count _cop_items, ["30Rnd_65x39_caseless_mag_Tracer","Munition MXC 6.5 mm (Black) (30)",300]];
			_cop_items set[count _cop_items, ["9Rnd_45ACP_Mag","Munition ACP-C2 .45 (9)",300]];
		};
		
		if(texceuve >= 3) then {
			_cop_items set[count _cop_items, ["LMG_Mk200_F",nil,50000]];
			_cop_items set[count _cop_items, ["arifle_SDAR_F",nil,30000]];
			_cop_items set[count _cop_items, ["hgun_Pistol_heavy_01_F",nil,10000]];
			_cop_items set[count _cop_items, ["200Rnd_65x39_cased_Box_Tracer","Munition Mk200 6.5 mm (200)",300]];
			_cop_items set[count _cop_items, ["30Rnd_556x45_Stanag_Tracer_Yellow","Munition SDAR 5.56 mm (30)",300]];
			_cop_items set[count _cop_items, ["11Rnd_45ACP_Mag","Munition 4-five .45 (11)",300]];
			_cop_items set[count _cop_items, ["SmokeShell",nil,150]];
			_cop_items set[count _cop_items, ["SmokeShellBlue",nil,150]];
		};
		
		if(texceuve >= 4) then {
			_cop_items set[count _cop_items, ["hgun_Pistol_heavy_02_F",nil,15000]];
			_cop_items set[count _cop_items, ["6Rnd_45ACP_Cylinder","Munition Zubr .45 (6)",300]];
		};
		
		if(texceuve >= 5) then {
			_cop_items set[count _cop_items, ["srifle_DMR_01_F",nil,60000]];
			_cop_items set[count _cop_items, ["10Rnd_762x51_Mag","Munition Rahim 7.62 mm (10)",300]];
			_cop_items set[count _cop_items, ["DemoCharge_Remote_Mag",nil,25000]];
		};
		
		if(texceuve >= 6) then {
			_cop_items set[count _cop_items, ["srifle_GM6_LRPS_F",nil,70000]];
			_cop_items set[count _cop_items, ["5Rnd_127x108_APDS_Mag","Munition GM6 Lynx 12.7 mm (5)",300]];
			_cop_items set[count _cop_items, ["HandGrenade",nil,10000]];
		};
		["Chuck Norris Shop", _cop_items];
	};

	case "rebel":
	{
		if(playerSide != civilian) 	exitWith {"Je ne vend pas des ARMES!"};
		if(!license_civ_rebel) 		exitWith {"Revient quand tu auras la license rebel..."};
		_rebel_items = 
		[
			["SMG_01_F",nil,15000],
			["arifle_TRG20_F",nil,15000],
			["arifle_SDAR_F",nil,15000],
			["hgun_Rook40_F",nil,15000],
			["optic_Holosight",nil,2500],
			["optic_Hamr",nil,2500],
			["optic_Yorris",nil,2500],
			["optic_Arco",nil,2500],
			["optic_ACO",nil,2500],
			["optic_ACO_grn",nil,2500],
			["acc_flashlight",nil,500],
			["acc_pointer_IR",nil,500],
			["NVGoggles",nil,5000],
			["30Rnd_45ACP_Mag_SMG_01_tracer_green","Munition Vermin SMG .45 ACP (30)",750],
			["30Rnd_556x45_Stanag_Tracer_Green","Munition TRG-20 5.56 mm (30)",200],
			["30Rnd_556x45_Stanag_Tracer_Green","Munition SDAR 5.56 mm (30)",200],
			["30Rnd_9x21_Mag","Munition Rook-40 9 mm (30)",200]
		];
		if(tcywxnhh >= 1) then {
			_rebel_items set[count _rebel_items, ["arifle_Mk20_F",nil,30000]];
			_rebel_items set[count _rebel_items, ["arifle_MXC_F",nil,30000]];
			_rebel_items set[count _rebel_items, ["arifle_Katiba_F",nil,30000]];
			_rebel_items set[count _rebel_items, ["srifle_EBR_F",nil,60000]];
			_rebel_items set[count _rebel_items, ["hgun_P07_snds_F",nil,10000]];
			_rebel_items set[count _rebel_items, ["30Rnd_556x45_Stanag_Tracer_Red","Munition Mk20 5.56 mm (30)",300]];
			_rebel_items set[count _rebel_items, ["30Rnd_65x39_caseless_mag_Tracer","Munition MXC 6.5 mm (30)",300]];
			_rebel_items set[count _rebel_items, ["20Rnd_762x51_Mag","Munition Mk18 ABR 7.62 mm (20)",300]];
			_rebel_items set[count _rebel_items, ["30Rnd_9x21_Mag","Munition P07 9 mm (20)",300]];
			_rebel_items set[count _rebel_items, ["MiniGrenade",nil,500]];
			_rebel_items set[count _rebel_items, ["SmokeShell",nil,500]];
		};
		if(tcywxnhh >= 2) then {
			_rebel_items set[count _rebel_items, ["LMG_Zafir_F",nil,40000]];
			_rebel_items set[count _rebel_items, ["srifle_LRR_LRPS_F",nil,80000]];
			_rebel_items set[count _rebel_items, ["hgun_Pistol_heavy_01_F",nil,10000]];
			_rebel_items set[count _rebel_items, ["150Rnd_762x51_Box_Tracer","Munition Zafir 7.62 mm (150)",400]];
			_rebel_items set[count _rebel_items, ["7Rnd_408_Mag","Munition M320 LRR .408 (7)",400]];
			_rebel_items set[count _rebel_items, ["11Rnd_45ACP_Mag","Munition 4-five .45 (11)",400]];
		};
		["KiketteShop", _rebel_items];
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Ce sont des armes civils!"};
			case (!license_civ_gun): {"Vous n'avez pas de permis d'armes à feu!"};
			default
			{
				["Magasin d'arme",
					[
						["arifle_SDAR_F",nil,20000],
						["hgun_Rook40_F",nil,2500],
						["hgun_PDW2000_F",nil,10000],
						["optic_ACO_grn_smg",nil,2500],
						["16Rnd_9x21_Mag",nil,150],
						["30Rnd_9x21_Mag",nil,300],
						["30Rnd_556x45_Stanag",nil,500]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["LifeCity Shop",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};