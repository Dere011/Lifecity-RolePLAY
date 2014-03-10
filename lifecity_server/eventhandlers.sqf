if(!isServer) exitWith {};

"lifecity_fnc_MP_packet_30120" addPublicVariableEventHandler {
	[_this select 0,_this select 1] call life_fnc_MPexec;
};
"lifecity_fnc_MP_packet_30121" addPublicVariableEventHandler {
	[_this select 0,_this select 1] call life_fnc_MPexec;
};
"lifecity_fnc_MP_packet_30122" addPublicVariableEventHandler {
	[_this select 0,_this select 1] call life_fnc_MPexec;
};
"lifecity_fnc_MP_packet_30123" addPublicVariableEventHandler {
	[_this select 0,_this select 1] call life_fnc_MPexec;
};
"lifecity_fnc_MP_packet_30120_1" addPublicVariableEventHandler {
	[_this select 0,_this select 1] call life_fnc_MPexec;
};
"lifecity_fnc_MP_packet_30120_2" addPublicVariableEventHandler {
	[_this select 0,_this select 1] call life_fnc_MPexec;
};
"lifecity_fnc_MP_packet_30120_3" addPublicVariableEventHandler {
	[_this select 0,_this select 1] call life_fnc_MPexec;
};
"lifecity_fnc_MP_packet_30120_4" addPublicVariableEventHandler {
	[_this select 0,_this select 1] call life_fnc_MPexec;
};
"lifecity_fnc_MP_packet_30120_5" addPublicVariableEventHandler {
	[_this select 0,_this select 1] call life_fnc_MPexec;
};

"serv_killed" addPublicVariableEventHandler
{
	private["_unit","_type"];
	_unit = (_this select 1) select 0;
	_type = (_this select 1) select 1;
	switch(_type) do
	{
		case "187V": {_type = ["Vehicular Manslaughtter",6500]};
		case "187": {_type = ["Manslaughter",8500]};
		case "901": {_type = ["Escapping Jail",4500]};
		case "261": {_type = ["Rape",5000]};
		case "261A": {_type = ["Attempted Rape",3000]};
		case "215": {_type = ["Attempted Auto Theft",2000]};
		case "213": {_type = ["Use of illegal explosives",10000]};
		case "211": {_type = ["Robbery",1000]};
		case "207": {_type = ["Kidnapping",3500]};
		case "207A": {_type = ["Attempted Kidnapping",2000]};
		case "487": {_type = ["Grand Theft",1500]};
		case "488": {_type = ["Petty Theft",700]};
		case "480": {_type = ["Hit and run",1300]};
	};
	
	[_unit,_type] call life_fnc_wantedAdd;
};

"serv_wanted_remove" addPublicVariableEventHandler
{
	private["_unit"];
	_unit = (_this select 1) select 0;
	[_unit] call life_fnc_wantedRemove;
};

"serv_civ_query" addPublicVariableEventHandler 
{
	client_cop_query = (_this select 1);
	(owner ((_this select 1) select 0)) publicVariableClient "client_cop_query";
};

"serv_cop_query" addPublicVariableEventHandler 
{
	client_civ_query = (_this select 1) select 0;
	(owner ((_this select 1) select 1)) publicVariableClient "client_civ_query";
};

"bank_addfunds" addPublicVariableEventHandler
{
	private["_cash"];
	_cash = _this select 1;
	if(!isNil {_cash} && [str(_cash)] call fnc_isnumber) then
	{
		serv_bank_funds = serv_bank_funds + _cash;
	};
};

"bank_query" addPublicVariableEventHandler
{
	private["_unit"];
	_unit = _this select 1;
	if(!isNull _unit) then
	{
		bank_query_funds = serv_bank_funds;
		(owner _unit) publicVariableClient "bank_query_funds";
	};
};