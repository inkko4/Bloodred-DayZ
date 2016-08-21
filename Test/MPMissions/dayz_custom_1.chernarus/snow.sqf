if (isnil "snow_script") then {
snow_script = false;
};

waituntil {snow_script};

if (!snow_script) exitwith {};
/*---------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------*/
/*-----------------------------Color Corrections-----------------------------------*/
/*---------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------*/
// Darker/Colder Atmosphere
_hndl = ppEffectCreate ["colorCorrections", 1501];
_hndl ppEffectEnable true;
_hndl ppEffectAdjust [ .5, 0.21, 0, [0.1, 0, 0, 0],[3.59, 3.49, 3.78, 0.83],[-0.31, 0.08, 3.79, 5]];
_hndl ppEffectCommit 0;
/*---------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------*/
/*------------------------------------Snow-----------------------------------------*/
/*---------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------*/
//Snow Storm
//Modified by Audio Rejectz, all credits go to original creators JW - Snow script / BI - Wind & Dust particles
"filmGrain" ppEffectEnable true;
"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
"filmGrain" ppEffectCommit 5;
 
setviewdistance 1000;
0 setovercast 0;
0 setrain 0;
0 setfog 0;
 
//--- Wind & Dust
[] spawn {
    waituntil {isplayer player};
    setwind [0.201112,0.204166,true];
    while {snow_script} do {
        _ran = ceil random 5;
        playsound format ["wind_%1",_ran];
        _obj = vehicle player;
        _pos = position _obj;
 
        //--- Dust
            setwind [0.201112*2,0.204166*2,false];
        _velocity = [random 10,random 10,-1];
        _color = [1.0, 0.9, 0.8];
        _alpha = 0.02 + random 0.02;
        _ps = "#particlesource" createVehicleLocal _pos;
        _ps setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 12, 8], "", "Billboard", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _obj];
        _ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
        _ps setParticleCircle [0.1, [0, 0, 0]];
        _ps setDropInterval 0.01;
 
        sleep (random 1);
        deletevehicle _ps;
        _delay = 10 + random 20;
        sleep _delay;
 
    };
};
 
//Snow script
 
setWind [0, -5, true];
 
_obj = player;
 
_pos = position (vehicle _obj);
 
_d  = 15;
_h  = 12;
_h1 = 8;
_h2 = 4;
_density = 20000;
 
 
 
_fog1 = "#particlesource" createVehicleLocal _pos;
_fog1 setParticleParams [
  ["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
  [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
  [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
];
_fog1 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog1 setParticleCircle [0.001, [0, 0, -0.12]];
_fog1 setDropInterval 0.01;
 
_fog2 = "#particlesource" createVehicleLocal _pos;
_fog2 setParticleParams [
  ["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
  [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
  [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
];
_fog2 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog2 setParticleCircle [0.001, [0, 0, -0.12]];
_fog2 setDropInterval 0.01;
 
_fog3 = "#particlesource" createVehicleLocal _pos;
_fog3 setParticleParams [
  ["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
  [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
  [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
];
_fog3 setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog3 setParticleCircle [0.001, [0, 0, -0.12]];
_fog3 setDropInterval 0.01;
 
 
while {snow_script} do
{
_a = 0;
while { _a < _density } do
{
_pos = position player;
_fog1 setpos _pos;
_fog2 setpos _pos;
_fog3 setpos _pos;
0 setRain 0;
 
_dpos = [((_pos select 0) + (_d - (random (2*_d))) + ((velocity vehicle player select 0)*1)),((_pos select 1) + (_d - (random (2*_d))) + ((velocity vehicle player select 0)*1)),((_pos select 2) + _h)];
drop ["\ca\data\cl_water", "", "Billboard", 1, 7, _dpos, [0,0,-1], 1, 0.0000001, 0.000, 0.7, [0.07], [[1,1,1,0], [1,1,1,1], [1,1,1,1], [1,1,1,1]], [0,0], 0.2, 1.2, "", "", ""];    _a = _a + 1;
 
 
_dpos = [((_pos select 0) + (_d - (random (2*_d))) + ((velocity vehicle player select 0)*1)),((_pos select 1) + (_d - (random (2*_d))) + ((velocity vehicle player select 0)*1)),((_pos select 2) + _h1)];
drop ["\ca\data\cl_water", "", "Billboard", 1, 7, _dpos, [0,0,-1], 1, 0.0000001, 0.000, 0.7, [0.07], [[1,1,1,0], [1,1,1,1], [1,1,1,1], [1,1,1,1]], [0,0], 0.2, 1.2, "", "", ""];
 
 
_dpos = [((_pos select 0) + (_d - (random (2*_d))) + ((velocity vehicle player select 0)*1)),((_pos select 1) + (_d - (random (2*_d))) + ((velocity vehicle player select 0)*1)),((_pos select 2) + _h2)];
drop ["\ca\data\cl_water", "", "Billboard", 1, 7, _dpos, [0,0,-1], 1, 0.0000001, 0.000, 0.7, [0.07], [[1,1,1,0], [1,1,1,1], [1,1,1,1], [1,1,1,1]], [0,0], 0.2, 1.2, "", "", ""];
if (!snow_script) exitwith {};
};
sleep 0.2;
};