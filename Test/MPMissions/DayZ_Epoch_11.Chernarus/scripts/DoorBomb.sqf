private ["_gearmenu","_playerPos","_buildingAmount","_objType","_sfx2","_item","_iPos","_radius","_nearDoor","_clientUID","_objectID","_objectUID","_pos","_bomb"];


_permDelete = true;
_playerPos = getPosATL player;



_nearDoor = count nearestObjects [_playerPos, ["CinderWallDoorLocked_DZ","Land_DZE_WoodDoorLocked","Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","CinderWallDoorSmallLocked_DZ"], 4] > 0;

_templist = nearestObjects [player, ["CinderWallDoorLocked_DZ","Land_DZE_WoodDoorLocked","Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","CinderWallDoorSmallLocked_DZ"], 4];

_door = _templist select 0;
_name = typeOf (_templist select 0);

//sleep function that uses diag_tickTime for accuracy
_DZMSSleep = {
	private["_sleepTime","_checkInterval","_startTime"];
	_sleepTime = _this select 0;
	_checkInterval = _this select 1;
	_startTime = diag_tickTime;
	waitUntil{sleep _checkInterval; (diag_tickTime - _startTime) > _sleepTime;};
};
	
if !(_nearDoor) exitWith {
	cutText [format["You need to be near a door in order to blow it up. Dumbass."], "PLAIN DOWN"];
};

if (dayz_combat == 1) then { 
    cutText [format["You are in combat."], "PLAIN DOWN"];
} else {
	
	cutText [format["Destroying the door."], "PLAIN DOWN"];
	
	/* BOOBY TRAP!! */
	_nearTrap = count nearestObjects [_playerPos, ["Barrel5"], 8] > 0;
	_trapObjectList = nearestObjects [player, ["Barrel5"], 8];
	_trapObject = _trapObjectList select 0;
	
	_time = 300;
	_trapTime = 10;
	
	_ipos = getPosATL _door;
	
	player removeMagazine "PMC_ied_v4";

	disableSerialization;
	player playActionNow "Medic";
	r_interrupt = false;
	_dis=20;
	_sfx = "repair";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
	sleep 6;
	
	if !(_nearTrap) then {
		_nul = [objNull, player, rSAY, "ticking"] call RE;
		systemchat "Explosives will detonate in 5 minutes...";
		[nil,nil,rTitleText,"A base is being raided. Go see if it is yours!", "PLAIN",10] call RE;
		[_time, 2] call _DZMSSleep;
		_objectID = _door getVariable ["ObjectID", "0"];
		_objectUID = _door getVariable ["ObjectUID", "0"];
		deleteVehicle _door;
		if(_permDelete) then{
			PVDZE_obj_Delete = [_objectID, _objectUID, player];
		};
		publicVariableServer "PVDZE_obj_Delete";
	};
	
	if(_nearTrap) then{
		_nul = [objNull, player, rSAY, "trap"] call RE;
		systemchat "A trap has caused the explosives to go off sooner...";
		[nil,nil,rTitleText,"A base is being raided. Go see if it is yours!", "PLAIN",10] call RE;
		[_trapTime, 1] call _DZMSSleep;
		cutText [format["TRAP"], "PLAIN DOWN"];	
		_objectID2 = _trapObject getVariable ["ObjectID", "0"];
		_objectUID2 = _trapObject getVariable ["ObjectUID", "0"];
		deleteVehicle _trapObject;
		PVDZE_obj_Delete = [_objectID2, _objectUID2, player];
		publicVariableServer "PVDZE_obj_Delete";
	};

	sleep .2;
	_pos = [_ipos select 0,_ipos select 1,0];
	_bomb = createVehicle ["Bo_GBU12_LGB",_pos,[],0,"CAN_COLLIDE"];
	_bomb setPos _pos;
	
		
};


