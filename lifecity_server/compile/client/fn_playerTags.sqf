onEachFrame
{
	private["_vis","_pos","_near","_name","_icon","_width","_height","_nearH","_typeOf"];
	if(!isNull player && player == player) then {
		_near = getPos player nearEntities ["Man", 100];
		{
			if(player distance _x < 100 && isPlayer _x && _x != player) then {
				_vis 	= lineIntersects [eyePos player, eyePos _x,player, _x];
				_pos 	= visiblePosition _x;
				_pos set[2,(getPosATL _x select 2) + 2.2];
				if (!_vis && _x getVariable["adminlevel", 0] == 666) then {
					if(player distance _x < 50) then {
						_width 	= 0.85;
						_height = 0.85;
						_icon 	= [((8) - 1), "texture"] call BIS_fnc_rankParams;
						_name 	= format["[ADMIN] %1", name _x];
						drawIcon3D [_icon,[1,0,0,1],_pos,_width,_height,0,_name,0,0.04];
					};
				}else{
					 _icon 	= "";
					 _width = 0.85;
					_height = 0.85;
					if(side _x == civilian && side player == civilian) then {
						if(group player == group _x) then {
							_width 	= 0.85;
							_height = 0.85;
							_icon 	= [((1) - 1), "texture"] call BIS_fnc_rankParams;
							_name 	= format["[GROUP] %1", name _x];
							if(player distance _x < 100) then {
								drawIcon3D [_icon,[0,0,1,1],_pos,_width,_height,0,_name,0,0.04];
							};
						};
					}else{
						if(!_vis) then {
							if(side _x == west) then {
								switch (_x getVariable["coplevel", 0]) do {
										case (1) : {_name = format["Recrue %1", name _x];};
										case (2) : {_name = format["Caporal %1", name _x];}; 
										case (3) : {_name = format["Sergent %1", name _x];};
										case (4) : {_name = format["Major %1", name _x];};
										case (5) : {_name = format["Lieutenant %1", name _x];};
										case (6) : {_name = format["Capitaine %1", name _x];};
										case (7) : {_name = format["Commandant %1", name _x];};
										default {_name = name _x; _width = 0; _height = 0;}
								};
								if (_x getVariable["coplevel", 0] > 0) then {
									_icon = [((_x getVariable["coplevel", 0]) - 1), "texture"] call BIS_fnc_rankParams;
									if(player distance _x < 10) then {
										drawIcon3D [_icon,[1,1,1,1],_pos,_width,_height,0,_name,0,0.04];
									};
								};
							};
						};
					};
				};
			};
		} foreach _near;
		
		_icon 		= [((8) - 1), "texture"] call BIS_fnc_rankParams;
		_nearH 		= nearestObjects [player, ["i_garage_v1_f", "Land_InfoStand_V2_F", "Sign_Arrow_F"], 100];
		{
			if(player distance _x < 80) then {
				_typeOf 	= typeOf _x;
				if (_typeOf == "i_garage_v1_f") then {
					_pos 	= visiblePosition _x;
					_pos set[2,(getPosATL _x select 2) + 8];
					_width 	= 0.85;
					_height = 0.85;
					drawIcon3D [MISSION_ROOT + "client\icons\repair.paa",[1,1,1,0.8],_pos,_width,_height,0,"GARAGE",0,0.04];
				};
				if (_typeOf == "Land_InfoStand_V2_F") then {
					_pos 	= visiblePosition _x;
					_pos set[2,(getPosATL _x select 2) + 4];
					_width 	= 0.85;
					_height = 0.85;
					drawIcon3D [MISSION_ROOT + "client\icons\atm.paa",[1,1,1,0.8],_pos,_width,_height,0,"ATM",0,0.04];
				};
				if (_typeOf == "Sign_Arrow_F") then {
					_pos 	= visiblePosition _x;
					_pos set[2,(getPosATL _x select 2) +10];
					_width 	= 0.85;
					_height = 0.85;
					drawIcon3D [_icon,[1,1,1,0.8],_pos,_width,_height,0,"Habitation (AbdelKader)",0,0.04];
				};
			};
		} foreach _nearH;
	};
};