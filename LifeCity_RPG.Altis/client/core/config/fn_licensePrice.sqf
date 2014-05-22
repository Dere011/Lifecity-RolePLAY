/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do {
	case "driver": {500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {250000}; //Pilot/air license cost
	case "gun": {15000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {35000}; //Oil processing license cost546456
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {175000}; //Heroin processing license cost
	case "marijuana": {75000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {0}; //Gang license cost
	case "rebel": {250000}; //Rebel license cost
	case "truck": {75000}; //Truck license cost
	case "diamond": {75000};
	case "salt": {25000};
	case "cocaine": {250000};
	case "sand": {75000};
	case "iron": {50000};
	case "copper": {15000};
	case "cement": {7500};
};