/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_minutes = [_this,2,8,[]] call BIS_fnc_param;
if(_bad) then { _time = time + 750; } else { _time = time + (10 * 60); };

[1, true, true] call life_fnc_sessionHandle;

if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 1500; _time = time + (_minutes * 60); };
_esc = false;
_bail = false;

[] spawn
{
	life_canpay_bail = false;
	sleep ((_minutes/2) * 60);
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 minute(s)",round(round(_time - time) / 60)]} else {format["%1 second(s)",round(_time - time)]};
		hintSilent format["Time Remaining:\n %1\n\nCan pay bail: %3\nBail Price: $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
	};
	
	if(player distance (getMarkerPos "jail_marker") > 60) exitWith
	{
		_esc = true;
	};
	
	if(life_bail_paid) exitWith
	{
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	
	if(!alive player && ((round(_time - time)) > 0)) exitWith {
	};
	sleep 1;
};


switch (true) do {
	case (_bail) : {
		rvudxsiq 				= false;
		life_bail_paid 		= false;
		hint "You have paid your bail and are now free.";
		serv_wanted_remove 	= [player];
		publicVariableServer "serv_wanted_remove";
		player setPos (getMarkerPos "jail_release");
		[1, false] call life_fnc_sessionHandle;
	};
	
	case (_esc) : {
		rvudxsiq 				= false;
		hint "You have escaped from jail, you still retain your previous crimes and now have a count of Escapping jail.";
		[[0,format["%1 has escaped from jail!",name player]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		serv_killed = [player,"901"];
		publicVariableServer "serv_killed";
	};
	
	case (alive player && !_esc && !_bail) : {
		rvudxsiq 				= false;
		hint "You have served your time in jail and have been released.";
		serv_wanted_remove = [player];
		publicVariableServer "serv_wanted_remove";
		player setPos (getMarkerPos "jail_release");
		[1,false] call life_fnc_sessionHandle;
	};
};