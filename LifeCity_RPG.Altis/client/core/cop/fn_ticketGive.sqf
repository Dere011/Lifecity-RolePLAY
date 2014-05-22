/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint "Person to ticket is nil"};
if(isNull life_ticket_unit) exitWith {hint "Person to ticket doesn't exist."};
_val = ctrlText 2652;
if(!([_val] call fnc_isnumber)) 	exitWith {hint "Vous n'avez pas saisi de format de nombre correct."};
if((parseNumber _val) > 1000000) 	exitWith {hint "Les ammendes ne peuvent etre plus de $1,000,000!"};
[[0,format["%1 a donne une ammende de $%2 a %3",name player,[(parseNumber _val)] call life_fnc_numberText,name life_ticket_unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[player,(parseNumber _val)],"life_fnc_ticketPrompt",life_ticket_unit,false] spawn life_fnc_MP;
closeDialog 0;