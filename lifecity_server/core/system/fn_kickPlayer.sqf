private["_id","_ret"];
_id 	= _this select 0;
_ret 	= _this select 1;

serverCommand format["#kick %1", _id]; 