/*
	File: fn_clothing_reb.sqf
	Author:
	Description:
*/
private["_filter"];
_filter 	= [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103, "KiketteStar Jihadi Shop"];
switch (_filter) do
{
	case 0:
	{
		[
			["U_O_GhillieSuit",nil,50000],
			["U_O_SpecopsUniform_ocamo",nil,17500],
			["U_O_PilotCoveralls",nil,15610],
			["U_IG_leader","Guerilla Leader",15340],
			["U_IG_Guerilla1_1",nil,5000],
			["U_I_OfficerUniform",nil,5000],
			["U_I_G_Story_Protagonist_F",nil,5000],
			["U_O_CombatUniform_oucamo",nil,5000]
		];
	};
	case 1:
	{
		[
			["H_HelmetO_ocamo",nil,2500],
			["H_MilCap_oucamo",nil,1200],
			["H_ShemagOpen_tan",nil,850],
			["H_Shemag_olive",nil,850],
			["H_ShemagOpen_khk",nil,800],
			["H_Bandanna_camo",nil,650],
			["H_HelmetB_camo",nil,650]
		];
	};
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	case 3:
	{
		[
			["V_TacVest_camo",nil,15000],
			["V_TacVest_khk",nil,12500],
			["V_PlateCarrier1_blk",nil,10000],
			["V_BandollierB_cbr",nil,4500],
			["V_HarnessO_brn",nil,7500]
		];
	};
	case 4:
	{
		[
			["B_Bergen_sgg",nil,5000],
			["B_Kitbag_mcamo",nil,1250],
			["B_FieldPack_ocamo",nil,3000]
		];
	};
};