/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
ctrlSetText[3103,"Altis Police Department Shop"];
_ret 	= [];
switch (_filter) do
{
	case 0:
	{
		_ret set[count _ret,["U_Rangemaster","Cop Uniform",25]];
		if(texceuve > 1) then
		{
			_ret set[count _ret,["U_B_CombatUniform_mcam_tshirt",nil,350]];
		};
		if(texceuve > 2) then
		{
			_ret set[count _ret,["U_B_CombatUniform_mcam_worn",nil,550]];
		};
	};
	case 1:
	{
		if(texceuve > 1) then
		{
			_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,75]];
			_ret set[count _ret,["H_Booniehat_mcamo",nil,120]];
			_ret set[count _ret,["H_Beret_blk",nil,120]];
		};
		
		if(texceuve > 2) then
		{
			_ret set[count _ret,["H_MilCap_mcamo",nil,100]];
			_ret set[count _ret,["H_Watchcap_camo",nil,100]];
			_ret set[count _ret,["H_Booniehat_khk_hs",nil,100]];
			
		};
	};
	case 2:
	{
		_ret = 
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
		_ret set[count _ret,["V_Rangemaster_belt",nil,800]];
		_ret set[count _ret,["V_TacVest_blk",nil,800]];
		if(texceuve > 1) then
		{
			_ret set[count _ret,["V_PlateCarrier2_rgr",nil,1500]];
			_ret set[count _ret,["V_PlateCarrier1_blk",nil,1500]];
		};
	};
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500]
		];
	};
};

_ret;