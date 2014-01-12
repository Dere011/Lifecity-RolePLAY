private["_uid","_name","_side","_money","_bank","_licenses","_gear","_array","_unit","_dbName","_check","_time","_arested","_assurance"];

_uid 			= [_this,0,"",[""]] call BIS_fnc_param;
_name 			= [_this,1,"",[""]] call BIS_fnc_param;
_side 			= [_this,2,civilian,[civilian]] call BIS_fnc_param;
_money 			= [_this,3,"0",[""]] call BIS_fnc_param;
_bank 			= [_this,4,"2500",[""]] call BIS_fnc_param;
_licenses 		= [_this,5,[],[[]]] call BIS_fnc_param;
_gear 			= [_this,6,[],[[]]] call BIS_fnc_param;
_unit 			= [_this,7,Objnull,[Objnull]] call BIS_fnc_param;
_assurance 		= [_this,8,false,[false]] call BIS_fnc_param;
_arested 		= [_this,9,false,[false]] call BIS_fnc_param;
_time			= time;
_dbName 		= ["Player_", _uid] call PDB_databaseNameCompiler;
_check 			= (_dbName) call iniDB_exists;
_uuid 			= round(random(1000000));

if((_uid == "") OR (_name == "")) exitWith {[[0,"[SYNC DATA] FATAL ERROR 701 - Merci d'avertire un admin."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;};
if(!_check) exitWith {[[0,"[SYNC DATA] FATAL ERROR 702 - Merci d'avertire un admin."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;};

switch (_side) do {
	case west: {
		private["_air","_cg"];
		
		if(typeName _licenses == "ARRAY") then {
			for "_i" from 0 to (count _licenses)-1 do {
				_bool 	= [(_licenses select _i) select 1] call DB_fnc_bool;
				_licenses set[_i,[(_licenses select _i) select 0, _bool]];
			};
		}else{
			_licenses	= [];
		};

		[_dbName, _uid, "cop_licenses", _licenses] call iniDB_write;
		[_dbName, _uid, "cop_gear", _gear] call iniDB_write;
	};
	
	case civilian:
	{
		private["_car","_boat","_dive","_air","_oil","_truck","_gang","_gun","_reb","_d_h","_weed","_weed_med"];
		
		if(typeName _licenses == "ARRAY") then {
			for "_i" from 0 to (count _licenses)-1 do
			{
				_bool 	= [(_licenses select _i) select 1] call DB_fnc_bool;
				_licenses set[_i,[(_licenses select _i) select 0,_bool]];
			};
		}else{
			_licenses	= [];
		};

		[_dbName, _uid, "civ_gear", _gear] call iniDB_write;
		[_dbName, _uid, "civ_licenses", _licenses] call iniDB_write;
		[_dbName, _uid, "arrested", _arested] call iniDB_write;
	};
};

[_dbName, _uid, "playerid", _uid] call iniDB_write;
[_dbName, _uid, "name", _name] call iniDB_write;
[_dbName, _uid, "cash", _money] call iniDB_write;
[_dbName, _uid, "bankacc", _bank] call iniDB_write;
[_dbName, _uid, "update_uuid", _uuid] call iniDB_write;
[_dbName, _uid, "has_insurance", _assurance] call iniDB_write;
[_dbName, _uid, "serv_uuid", serv_uuid] call iniDB_write;

//if((alive _unit)) then {
//	[_dbName, _uid, "location", (location _unit)] call iniDB_write;
//}else{
//	[_dbName, _uid, "location", []] call iniDB_write;
//};

[[0, format["[SYNC DATA] La synchronisation est OK (%1).", _uuid]], "life_fnc_broadcast", _unit, false] spawn life_fnc_MP;