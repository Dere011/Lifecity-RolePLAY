/*
    File: fn_weed.sqf
    Author: Kuchiha

    Description:
    Marijuana effects.
*/
closeDialog 0;

sleep 2;

"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

_smoke = "SmokeShellGreen" createVehicle position player;
if (vehicle player != player) then {
    _smoke attachTo [vehicle player, [-0.6,-1,0]];
} else {
    _smoke attachTo [player, [0,-0.1,1.5]];
};
hideObjectGlobal _smoke;
_smoke hideObject true;

for "_i" from 0 to 44 do
{
    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
    "chromAberration" ppEffectCommit 1;   
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
    sleep 1;
};

"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;