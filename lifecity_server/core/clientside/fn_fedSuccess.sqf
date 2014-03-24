/*
	File: fn_fedSuccess.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Ugh coming up with a name for it was stupid but whatever.
	If the robbery was successful on the Federal reserve then punish
	everyone and take some money.

	Support for Bank Insurance is there.
*/
private["_funds"];
_funds = [_this,0,-1,[0]] call BIS_fnc_param;
if(_funds == -1) exitWith {};
if(!life_use_atm) exitWith {};
sleep 45;

if(lc_has_insurance) then {
	hint "Le vol recent de la reserve federale a frappe les comptes des civils, mais heureusement, vous avez l'assurance de la banque de sorte que vous n'avez rien perdu.!\n\nToutefois vous avez perdu votre assurance bancaire! Soyez sûr de visiter un guichet pour renouveler votre plan d'assurance!";
	lc_has_insurance = false;
}else{
	if(_funds > srwapffq) then {
		hint "En raison de ce vol sur la Reserve federale, vous avez perdu un pourcentage de votre argent, mais vous n'avez pas fait faillite. La prochaine fois acheter une assurance bancaire lors de votre prochaine visite à un guichet automatique pour mieux proteger vos biens!";
		srwapffq 	= 0;
	}else{
		hint format["En raison de la recente vol sur la Reserve federale, vous avez perdu $%1 a partir de votre compte bancaire, la prochaine fois acheter une assurance bancaire!\n\nVous pouvez acheter une assurance bancaire dans sur un ATM!", [_funds] call life_fnc_numberText];
		srwapffq 	= srwapffq - _funds;
	};
};