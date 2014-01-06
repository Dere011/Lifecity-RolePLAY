private["_uid","_name","_side","_money","_bank","_licenses","_misc","_query","_result","_array","_civGear","_unit","_dbName","_check","_time"];

_uid 			= [_this,0,"",[""]] call BIS_fnc_param;
_name 			= [_this,1,"",[""]] call BIS_fnc_param;
_side 			= [_this,2,civilian,[civilian]] call BIS_fnc_param;
_money 			= [_this,3,"0",[""]] call BIS_fnc_param;
_bank 			= [_this,4,"2500",[""]] call BIS_fnc_param;
_licenses 		= [_this,5,[],[[]]] call BIS_fnc_param;
_civGear 		= [_this,7,[],[[]]] call BIS_fnc_param;
_unit 			= [_this,8,Objnull,[Objnull]] call BIS_fnc_param;
_time			= time;
_dbName 		= ["Player_", _uid] call PDB_databaseNameCompiler;
_check 			= (_dbName) call iniDB_exists;

switch (_side) do
{
	case west: {_misc = [_this,6,[],[[]]] call BIS_fnc_param;};
	case civilian: {_misc = [_this,6,false,[false]] call BIS_fnc_param;};
};

[[0, "[SYNC DATA] La synchronisation est star65456t."],"life_fnc_broadcast", _unit, false] spawn life_fnc_MP;

if((_uid == "") OR (_name == "")) exitWith {[[0,"[SYNC DATA] FATAL ERROR 701 - Merci d'avertire un admin."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;};
if(!_check) exitWith {[[0,"[SYNC DATA] FATAL ERROR 702 - Merci d'avertire un admin."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;};

[[0, "[SYNC DATA] La synchronisation est start."],"life_fnc_broadcast", _unit, false] spawn life_fnc_MP;

switch (_side) do
{
	case west:
	{
		private["_air","_cg"];
		for "_i" from 0 to (count _licenses)-1 do
		{
			_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
			_licenses set[_i,[(_licenses select _i) select 0,_bool]];
		};
		_licenses 	= [_licenses] call DB_fnc_mresArray;
		_misc 		= [_misc] call DB_fnc_mresArray;
		
		[_dbName, _uid, "cop_licenses", _licenses] call iniDB_write;
		[_dbName, _uid, "cop_gear", _misc] call iniDB_write;
	};
	
	case civilian:
	{
		private["_car","_boat","_dive","_air","_oil","_truck","_gang","_gun","_reb","_d_h","_weed","_weed_med"];
		for "_i" from 0 to (count _licenses)-1 do
		{
			_bool 	= [(_licenses select _i) select 1] call DB_fnc_bool;
			_licenses set[_i,[(_licenses select _i) select 0,_bool]];
		};
		_licenses 	= [_licenses] call DB_fnc_mresArray;
		if(typeName _misc == "BOOL") then {_misc = [_misc] call DB_fnc_bool;};
		_civGear 	= [_civGear] call DB_fnc_mresArray;
		
		[_dbName, _uid, "civ_gear", _civGear] call iniDB_write;
		[_dbName, _uid, "arrested", _misc] call iniDB_write;
		[_dbName, _uid, "civ_licenses", _licenses] call iniDB_write;
	};
};
[[0, "[SYNC DATA] La synchronisation est sdsds."],"life_fnc_broadcast", _unit, false] spawn life_fnc_MP;
[_dbName, _uid, "playerid", _uid] call iniDB_write;
[_dbName, _uid, "name", _name] call iniDB_write;
[_dbName, _uid, "cash", _money] call iniDB_write;
[_dbName, _uid, "bankacc", _bank] call iniDB_write;

[[0, "[SYNC DATA] La synchronisation est OK."],"life_fnc_broadcast", _unit, false] spawn life_fnc_MP;