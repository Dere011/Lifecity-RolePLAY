/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {250000}; //Pilot/air license cost
	case "gun": {25000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {10000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {500000}; //Heroin processing license cost
	case "marijuana": {250000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {0}; //Gang license cost
	case "rebel": {300000}; //Rebel license cost
	case "truck": {50000}; //Truck license cost
	case "diamond": {35000};
	case "salt": {12000};
	case "cocaine": {750000};
	case "sand": {14500};
	case "iron": {19500};
	case "copper": {18000};
	case "cement": {6500};
};