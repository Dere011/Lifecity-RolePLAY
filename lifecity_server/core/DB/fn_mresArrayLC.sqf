/*
	File:
	Author:
	
	Description:
*/
private["_array"];

_array 		= (_this select 0);
_type 		= (_this select 1);
_new_array	= [];

if(_type == 1) then {
	if(typeName _array == "ARRAY") exitWith {
		for "_i" from 0 to (count _array - 1) do {
			_new_array set [_i, str(_array select _i)];
		};
		
		_array = str(str(_array));
		_array = toArray(_array);
		for "_i" from 0 to (count _array)-1 do {
			_sel = _array select _i;
			if((_i != 0 && _i != ((count _array)-1))) then {
				if(_sel == 34) then
				{
					_array set[_i,96];
				};
			};
		};
		_array = toString(_array);
		_string = format["%1", _new_array];
		_string;
	};

	if(typeName _array == "STRING") exitWith {
		_string = format["%1", _array];
		_string;
	};

	if(typeName _array == "NUMBER") exitWith {
		_string = format["%1", [str(_array)]];
		_string;
	};
}else{
	if(typeName _array == "STRING") exitWith {
		_array 	 = toArray(_array);
		for "_i" from 0 to (count _array)-1 do {
			_sel = _array select _i;
			if(_sel == 96) then { 
				_array set[_i,34];
			};
		};
		_string = toString(_array);
		_string = format["%1", _string];
		_string = call compile _string;
		_string;
	};
	
	if(typeName _array == "ARRAY") exitWith {
		_array;
	};
	
	if(isNull _array) exitWith {
		[];
	};
};