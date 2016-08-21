if (dialog) then {closeDialog 0;} else {};
makebike_answer=nil;
makebike = 
[
	["",true],
	["Bike Confirmation", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
	["No", [2], "", -5, 	[["expression", "makebike_answer=false;"]], "1", "1"],
	["Yes", [3], "", -5, 	[["expression", "makebike_answer=true;"]], "1", "1"],
	["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
	["Exit", [-1], "", -3, 	[["expression", "makebike_answer=false;"]], "1", "1"]
];
showCommandingMenu "#USER:makebike";
waitUntil {((!isNil 'makebike_answer')||(commandingMenu == ""))};
if (isNil 'makebike_answer') then {makebike_answer=false;};
if (makebike_answer) then
{
if (false) then {
cutText [format["You are in combat and cannot build a bike."], "PLAIN DOWN"];
} else {
player removeAction s_player_deploybike;
player playActionNow "Medic";
r_interrupt = false;
player removeMagazine "PartGeneric";
_dis=10;
_sfx = "repair";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
_bike = ["Old_bike_TK_INS_EP1","Old_bike_TK_CIV_EP1"] call BIS_fnc_selectRandom;
sleep 6;
_dir = getdir vehicle player;
_pos = getPos vehicle player;
_pos = [(_pos select 0)+3*sin(_dir),(_pos select 1)+3*cos(_dir),0];
_veh = createVehicle [_bike, _pos,[],0,"CAN_COLLIDE"];
_veh setPosATL _pos;
_veh setDir _dir;
_veh setVariable ["Sarge",1,true];

player reveal _veh;

cutText [format["You've pieced together a bike!"], "PLAIN DOWN"];

r_interrupt = false;
player switchMove "";
player playActionNow "stop";

	_veh addEventHandler ["GetIn",{
		_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;
	}];
};
} else {
	systemChat ("Bike Canceled.");
};