/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns information on the search.
*/
private["_civ","_invs","_license","_robber","_guns","_gun"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_license = [_this,1,"",[""]] call BIS_fnc_param;
_invs = [_this,2,[],[[]]] call BIS_fnc_param;
_robber = [_this,3,false,[false]] call BIS_fnc_param;
if(isnull _civ) exitWith {};

if(_civ getVariable["adminlevel", 0] == 666) exitWith {
	hint "Ce civil est inconnu.";
}; 

_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr];
		_index = [_x select 0,sell_array] call fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * ((sell_array select _index) select 1));
		};
	} foreach _invs;
	
	[[0,format["%1 has $%2 worth of contraband on them.",name _civ,[_illegal] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
}
	else
{
	_inv = "No illegal items";
};
if(!alive _civ || player distance _civ > 5) exitWith {hint format["Couldn't search %1", name _civ]};
//hint format["%1",_this];
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>Licenses:</t></t><br/>%2<t color='#FFD700'><t size='1.5'><br/>Illegal Items</t></t><br/>%3<br/><br/><br/><br/><t color='#FF0000'>%4</t>"
,name _civ,_license,_inv,if(_robber) then {"Robbed the bank"} else {""}];

if(_robber) then
{
	[[0,format["%1 was identified as the bank robber!",name _civ]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};