/*
	File: fn_vehicleColorStr.sqf
	Author:
	Description:
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge";};
			case 1: {_color = "Jaune";};
			case 2: {_color = "Blanc";};
			case 3: {_color = "Bleu";};
			case 4: {_color = "Noir / Rouge";};
			case 5: {_color = "Bleu / Blanc"};
			case 6: {_color = "Noir"};
			case 7: {_color = "Noir"};
			case 8: {_color = "Taxi"};
			case 9: {_color = "Police (HRF)"};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Vert";};
			case 2: {_color = "Bleu";};
			case 3: {_color = "Bleu fonce";};
			case 4: {_color = "Jaune";};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Gris"};
			case 7: {_color = "Noir"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rouge"};
			case 1: {_color = "Bleu fonce"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Noir / Blanc"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Vert"};
			case 6: {_color = "Police (Noir)"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge Fonce";};
			case 1: {_color = "Noir";};
			case 2: {_color = "Gris metal";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Police";};
			case 5: {_color = "Police (HRF)";};
			case 5: {_color = "Police (Noir)";};
			case 6: {_color = "Rose Bonbon"};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Brown"};
			case 1: {_color = "Digi Desert"};
			case 2: {_color = "Noir"};
			case 3: {_color = "Bleu"};
			case 4: {_color = "Rouge"};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Digi Vert"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Sheriff"};
			case 1: {_color = "Police"};
			case 2: {_color = "Noir"};
			case 3: {_color = "Civ Bleu"};
			case 4: {_color = "Civ Rouge"};
			case 5: {_color = "Digi Vert"};
			case 6: {_color = "Bleuline"};
			case 7: {_color = "Elliptical"};
			case 8: {_color = "Furious"};
			case 9: {_color = "Jeans Bleu"};
			case 10: {_color = "Speedy Rougeline"};
			case 11: {_color = "Sunset"};
			case 12: {_color = "Vrana"};
			case 13: {_color = "Waves Bleu"};
			case 14: {_color = "Rebel Digital"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
			case 1: {_color = "Blanc / Bleu"};
			case 2: {_color = "Digi Vert"};
			case 3: {_color = "Desert Digi"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Vert"};
			case 1: {_color = "Police (HRF)"};
			case 2: {_color = "Noir"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Noir"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Noir"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
	
	case "B_Truck_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Jaune Pikachu"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Camo"};
			case 3: {_color = "Rose Bonbon"};
		};
	};
	
};

_color;