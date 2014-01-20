if (!isServer) exitWith {};

private ["_packetKey", "_packetKeyArray", "_assignPacketKey"];

_packetKey 			= call generateKey;
_assignPacketKey 	= "";
for "_x" from 0 to (floor random 50) do { _assignPacketKey = _assignPacketKey + " " };
_assignPacketKey = _assignPacketKey + 'private "_mpPacketKey";';
for "_x" from 0 to (floor random 50) do { _assignPacketKey = _assignPacketKey + " " };
_assignPacketKey = _assignPacketKey + "call compile toString ";
_packetKeyArray = "_mpPacketKey = ";
{
	if (_forEachIndex > 0) then { _packetKeyArray = _packetKeyArray + "+" };
	_packetKeyArray = _packetKeyArray + format ['"%1"', toString [_x]];
} forEach toArray _packetKey;
assignPacketKey = _assignPacketKey + (str toArray _packetKeyArray) + ";";