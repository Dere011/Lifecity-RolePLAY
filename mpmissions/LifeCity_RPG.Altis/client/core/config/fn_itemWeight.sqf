/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {4};
	case "oilp": {3};
	case "heroinu": {3};
	case "heroinp": {2};
	case "cannabis": {2};
	case "marijuana": {1};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {1};
	case "ornate": {1};
	case "mackerel": {2};
	case "tuna": {2};
	case "mullet": {1};
	case "catshark": {2};
	case "turtle": {2};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {3};
	case "ironore": {4};
	case "copper_r": {2};
	case "iron_r": {2};
	case "sand": {2};
	case "salt": {4};
	case "salt_r": {2};
	case "glass": {1};
	case "diamond": {2};
	case "diamondc": {1};
	case "cocaine": {4};
	case "cocainep": {2};
	case "spikeStrip": {15};
	case "rock": {5};
	case "cement": {4};
	default {1};
};