/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
private ["_variable","_random","_position","_vehicletype","_vehicle","_dir","_rewardname","_quest"];

_quest = _this select 0;

if (_quest == "Bounty") then {
_variable = profileNamespace getVariable "BountyClaimed";

if (isnil "_variable") then {
	_variable = false;
};

if (_variable) then {
	/*
		Not using reward function for this one since we need the vehicle in a specific area due to placement of quest giver.
		Possibly add in check for specific position later on?
	*/
	_random = ["UH1H_DZ2","Mi17_DZ","Pickup_PK_INS","Offroad_DSHKM_INS"] call BIS_fnc_selectrandom;

	_position = [[11404.2,5521.79,0],0,30,1,0,2000,0] call BIS_fnc_findSafePos;
	_vehicletype = _random;
	if (!(_vehicletype in DayZ_SafeObjects)) then {
		DayZ_SafeObjects = DayZ_SafeObjects + [_vehicletype];
		publicVariable "DayZ_SafeObjects";
	};
	
	_vehicle = createVehicle [_vehicletype, _position, [], 0, "CAN_COLLIDE"];
	clearWeaponCargoGlobal  _vehicle;
	clearMagazineCargoGlobal  _vehicle;
	clearBackpackCargoGlobal  _vehicle;	 
	_dir = getdir _vehicle;
	
	PVDZ_obj_Publish = [0,_vehicle,[_dir,_position],[]];
	publicVariableServer "PVDZ_obj_Publish";
	
	_rewardname = getText (configFile >> 'CfgVehicles' >> _vehicletype >> 'displayName');
	
	systemchat format['You have done well, I would like to give you %1 as a reward.',_rewardname];
	systemchat 'Look for your vehicle north east in the field.';
	
	profileNamespace setVariable ["BountyClaimed",false];
	saveProfileNamespace;
	
} else {
	systemchat 'Looks like you have no bounty to claim at the moment. Keep your eye open for new bounties I might put out.';
};

} else {
	systemchat 'Something has gone wrong. Please try again.';
};