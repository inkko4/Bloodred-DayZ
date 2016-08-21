/*
	Lotto Box Reward Script
*/
private ["_reward","_weapons","_weapon","_magazine","_magazineammount","_magazines","_ammount","_position","_crate","_visualaid","_random","_timeout","_loadout","_lotto_box","_lotto_box_uses","_lotto_box_type","_player_users","_puid","_weaponarray","_magazinearray","_randvehicle","_dirplayer","_vehicle"];

_lotto_box = _this select 3;
_lotto_box_uses = _lotto_box getVariable "LottoUses";
_lotto_box_type = _lotto_box getVariable "LottoReward";
_player_users = _lotto_box getVariable "LottoUsers";
_puid = getplayeruid player;

player removeAction s_player_lottoreward1;

if (_lotto_box_uses < 1) exitwith {systemchat "There are no more chances left on this box!";};
if (_puid in _player_users) exitwith {systemchat "You have already used your chance on this box!";};

systemchat "Rolling your chances...";
if (_lotto_box_type == 1) then {
_reward = 
		[
		"None","None","None","None","None","None","None","None","None","None","None","None","None","None",
		"None","None","None","None","None","None","Crate","Crate","Crate","Crate","Crate","Crate","Crate",
		"Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate",
		"Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate",
		"Crate","Crate","Crate","Crate","Crate","Temp","Temp","Temp","Temp","Temp","Temp","Temp","Temp",
		"Perm","Car","Car","Car","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate",
		"Crate","Crate","None","None","None","None","None","None","None","None","None","None","None",
		"None","None","None","None","None","None","None","None","None","None","None","None","None","None",
		"None","None","None","None","None","None","None","None","None","None","None","None","None","None","None",
		"None","None","None","None","None","None","None","None","None","None","None","None","None","None",
		"None","None","None","None","None","None","None","None","None","None","None","None","None","None","None",
		"None","None","None","None","None","None","None","None","None","None","None","None","None","None",
		"None","None","None","None","None","None","None","None","None","None","None","None","None","None","None"
		] call BIS_fnc_selectrandom;
} else {
_reward = 
		[
		"None","None","None","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate",
		"Temp","Temp","Temp","Temp","Temp","Temp","Temp","Temp","Temp","Temp","Temp","Temp","Perm","Car"
		] call BIS_fnc_selectrandom;
};

_weaponarray = [["AK74_DZ","30Rnd_545x39_AK",3],["AK74_DZ","30Rnd_545x39_AK",3],["AK74_DZ","30Rnd_545x39_AK",3],["AK74_DZ","30Rnd_545x39_AK",3],["AK74_Kobra_SD_DZ","30Rnd_545x39_AKSD",3],["AK74_Kobra_SD_DZ","30Rnd_545x39_AKSD",3],["AK74_GL_Kobra_SD_DZ","30Rnd_545x39_AKSD",3],["AK74_SD_DZ","30Rnd_545x39_AKSD",3],["AK74_SD_DZ","30Rnd_545x39_AKSD",3],["AK74_GL_PSO1_SD_DZ","30Rnd_545x39_AKSD",3],["DMR_DZ","20Rnd_762x51_DMR",2],["DMR_Gh_DZ","20Rnd_762x51_DMR",2],["FNFAL_DZ","20Rnd_762x51_FNFAL",3],["FNFAL_DZ","20Rnd_762x51_FNFAL",3],["FNFAL_Holo_DZ","20Rnd_762x51_FNFAL",3],["L85_Holo_DZ","30Rnd_556x45_Stanag",3],["M4A1_CCO_SD_DZ","30Rnd_556x45_StanagSD",3],["M4A1_CCO_SD_DZ","30Rnd_556x45_StanagSD",3],["M4A1_SD_DZ","30Rnd_556x45_StanagSD",3],["M4A1_SD_DZ","30Rnd_556x45_StanagSD",3],["M4A1_GL_CCO_SD_FL_DZ","30Rnd_556x45_StanagSD",3],["M4A1_GL_Holo_SD_FL_DZ","30Rnd_556x45_StanagSD",3],["M14_CCO_Gh_DZ","20Rnd_762x51_DMR",2],["M14_Holo_Gh_DZ","20Rnd_762x51_DMR",2],["M14_DZ","20Rnd_762x51_DMR",2],["M16A2_DZ","30Rnd_556x45_Stanag",3],["M16A2_DZ","30Rnd_556x45_Stanag",3],["M16A2_GL_DZ","30Rnd_556x45_Stanag",3],["M16A4_DZ","30Rnd_556x45_Stanag",3],["M16A4_DZ","30Rnd_556x45_Stanag",3],["M16A4_CCO_DZ","30Rnd_556x45_Stanag",3],["M16A4_GL_CCO_FL_DZ","30Rnd_556x45_Stanag",3],["M16A4_GL_Holo_FL_DZ","30Rnd_556x45_Stanag",3],["M24_DZ","5Rnd_762x51_M24",4],["M24_Gh_DZ","5Rnd_762x51_M24",4],["Mk48_CCO_DZ","100Rnd_762x51_M240",2],["Mk48_Holo_DZ","100Rnd_762x51_M240",2],["RPK74_DZ","75Rnd_545x39_RPK",2],["RPK74_PSO1_DZ","75Rnd_545x39_RPK",2],["RPK74_Kobra_DZ","75Rnd_545x39_RPK",2],["SVD_DZ","10Rnd_762x54_SVD",3],["SVD_Gh_DZ","10Rnd_762x54_SVD",3]];
_magazinearray = [["1Rnd_HE_M203",3],["1Rnd_Smoke_M203",3],["PipeBomb",1],["HandGrenade_West",2],["Skin_Camo1_DZ",3],["Skin_Sniper1_DZ",2],["Skin_Soldier1_DZ",3]];

if (_reward == "None") then {
systemchat "You won absolutely nothing! Try again another time!";
};

if (_reward == "Crate") then {
	systemchat "You won a crate filled with random items! Look around nearby for it!";
	_position = [getpos player,1,50,5,0,20,0] call BIS_fnc_findSafePos;
	_crate = createVehicle ["AmmoBoxBig", _position, [], 0, "CAN_COLLIDE"];
	_visualaid = createVehicle ["SmokeShellPurple", _position, [], 0, "CAN_COLLIDE"];
	_visualaid attachto [_crate, [0,0,0]];

	for "_i" from 0 to (round(random 5) + 5) do {
		_weapons = _weaponarray call bis_fnc_selectrandom;
		_weapon = _weapons select 0;
		_magazine = _weapons select 1;
		_magazineammount = _weapons select 2;
		_crate addWeaponCargoGlobal [_weapon,1];
		_crate addMagazineCargoGlobal [_magazine,_magazineammount];
	};

	for "_i" from 0 to (round(random 5)) do {
		_magazines = _magazinearray call bis_fnc_selectrandom;
		_magazine = _magazines select 0;
		_ammount = _magazines select 1;
		_crate addMagazineCargoGlobal [_magazine,_ammount];
	};
};

if (_reward == "Temp") then {
	PVCDZ_Loadout_Server = [player,_puid];
	publicVariableServer "PVCDZ_Loadout_Server";

	_timeout = time + 30;
	waituntil {(count PVCDZ_Loadout_Client > 1) || (time > _timeout) || PVCDZ_Loadout_Client select 0 == "Default"};
	
	_loadout = PVCDZ_Loadout_Client select 0;
	if (_loadout == "Default" || _loadout == "Improved") then {
		LottoReward_Temp = [_puid];
		publicVariableServer "LottoReward_Temp";
		systemchat "You won a Temporary Loadout! Congratulations!";
	} else {
		_random = ["Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Car"] call BIS_fnc_selectrandom;
		if (_random == "Crate") then {
			systemchat "You won a crate filled with random items! Look around nearby for it!";
			_position = [getpos player,1,50,5,0,20,0] call BIS_fnc_findSafePos;
			_crate = createVehicle ["AmmoBoxBig", _position, [], 0, "CAN_COLLIDE"];
			_visualaid = createVehicle ["SmokeShellPurple", _position, [], 0, "CAN_COLLIDE"];
			_visualaid attachto [_crate, [0,0,0]];

			for "_i" from 0 to (round(random 5) + 5) do {
				_weapons = _weaponarray call bis_fnc_selectrandom;
				_weapon = _weapons select 0;
				_magazine = _weapons select 1;
				_magazineammount = _weapons select 2;
				_crate addWeaponCargoGlobal [_weapon,1];
				_crate addMagazineCargoGlobal [_magazine,_magazineammount];
			};

			for "_i" from 0 to (round(random 5)) do {
				_magazines = _magazinearray call bis_fnc_selectrandom;
				_magazine = _magazines select 0;
				_ammount = _magazines select 1;
				_crate addMagazineCargoGlobal [_magazine,_ammount];
			};
		} else {
			systemchat "You won a random Car! Congratulations! Look around nearby for it!";
			_randvehicle = ["SUV_DZ","HMMWV_DZ"] call BIS_fnc_selectrandom;
			_position = [getpos player,1,50,5,0,20,0] call BIS_fnc_findSafePos;
			while {player distance _position > 100} do {
			_position = [getpos player,1,50,5,0,20,0] call BIS_fnc_findSafePos;
			sleep 1;
			diag_log "safepos loop";
			};
			_dirplayer = getDir player;
	
			if (!(_randvehicle in DayZ_SafeObjects)) then {
				DayZ_SafeObjects = DayZ_SafeObjects + [_randvehicle];
				publicVariable "DayZ_SafeObjects";
			};
			
			_vehicle = createVehicle [_randvehicle, _position, [], 0, "CAN_COLLIDE"];
			_visualaid = createVehicle ["SmokeShellPurple", _position, [], 0, "CAN_COLLIDE"];
			_visualaid attachto [_vehicle, [0,0,0]];
			
			clearWeaponCargoGlobal  _vehicle;
			clearMagazineCargoGlobal  _vehicle;
			
			_vehicle setfuel 1;
			_vehicle setDir _dirplayer;
			
			// Serverside Hivewrite
			LottoReward_Vehicle = [_vehicle,_dirplayer,_position,_randvehicle];
			publicVariableServer "LottoReward_Vehicle";
			
			_vehicle addEventHandler ["GetIn",{_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;}];
		};
	}; 
};

if (_reward == "Perm") then {
	PVCDZ_Loadout_Server = [player,_puid];
	publicVariableServer "PVCDZ_Loadout_Server";

	_timeout = time + 30;
	waituntil {(count PVCDZ_Loadout_Client > 1) || (time > _timeout) || PVCDZ_Loadout_Client select 0 == "Default"};
	
	_loadout = PVCDZ_Loadout_Client select 0;
	if (_loadout == "Default" || _loadout == "Improved") then {
		systemchat "You won a Permanent Loadout! Congratulations! Contact an admin to have it setup for you!";
	} else {
		_random = ["Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Crate","Car"] call BIS_fnc_selectrandom;
		if (_random == "Crate") then {
			systemchat "You won a crate filled with random items! Look around nearby for it!";
			_position = [getpos player,1,50,5,0,20,0] call BIS_fnc_findSafePos;
			_crate = createVehicle ["AmmoBoxBig", _position, [], 0, "CAN_COLLIDE"];
			_visualaid = createVehicle ["SmokeShellPurple", _position, [], 0, "CAN_COLLIDE"];
			_visualaid attachto [_crate, [0,0,0]];

			for "_i" from 0 to (round(random 5) + 5) do {
				_weapons = _weaponarray call bis_fnc_selectrandom;
				_weapon = _weapons select 0;
				_magazine = _weapons select 1;
				_magazineammount = _weapons select 2;
				_crate addWeaponCargoGlobal [_weapon,1];
				_crate addMagazineCargoGlobal [_magazine,_magazineammount];
			};

			for "_i" from 0 to (round(random 5)) do {
				_magazines = _magazinearray call bis_fnc_selectrandom;
				_magazine = _magazines select 0;
				_ammount = _magazines select 1;
				_crate addMagazineCargoGlobal [_magazine,_ammount];
			};
		} else {
			systemchat "You won a random Car! Congratulations! Look around nearby for it!";
			_randvehicle = ["SUV_DZ","HMMWV_DZ"] call BIS_fnc_selectrandom;
			_position = [getpos player,1,50,5,0,20,0] call BIS_fnc_findSafePos;
			while {player distance _position > 100} do {
			_position = [getpos player,1,50,5,0,20,0] call BIS_fnc_findSafePos;
			sleep 1;
			diag_log "safepos loop";
			};
			_dirplayer = getDir player;
	
			if (!(_randvehicle in DayZ_SafeObjects)) then {
				DayZ_SafeObjects = DayZ_SafeObjects + [_randvehicle];
				publicVariable "DayZ_SafeObjects";
			};
			
			_vehicle = createVehicle [_randvehicle, _position, [], 0, "CAN_COLLIDE"];
			_visualaid = createVehicle ["SmokeShellPurple", _position, [], 0, "CAN_COLLIDE"];
			_visualaid attachto [_vehicle, [0,0,0]];
			
			clearWeaponCargoGlobal  _vehicle;
			clearMagazineCargoGlobal  _vehicle;
			
			_vehicle setfuel 1;
			_vehicle setDir _dirplayer;
			
			// Serverside Hivewrite
			LottoReward_Vehicle = [_vehicle,_dirplayer,_position,_randvehicle];
			publicVariableServer "LottoReward_Vehicle";
			
			_vehicle addEventHandler ["GetIn",{_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;}];
		};
	};
};

if (_reward == "Car") then {
	systemchat "You won a random Car! Congratulations! Look around nearby for it!";
	_randvehicle = ["SUV_DZ","HMMWV_DZ"] call BIS_fnc_selectrandom;
	_position = [getpos player,1,50,5,0,20,0] call BIS_fnc_findSafePos;
	while {player distance _position > 100} do {
	_position = [getpos player,1,50,5,0,20,0] call BIS_fnc_findSafePos;
	sleep 1;
	diag_log "safepos loop";
	};
	_dirplayer = getDir player;
	
	if (!(_randvehicle in DayZ_SafeObjects)) then {
		DayZ_SafeObjects = DayZ_SafeObjects + [_randvehicle];
		publicVariable "DayZ_SafeObjects";
	};
	
	_vehicle = createVehicle [_randvehicle, _position, [], 0, "CAN_COLLIDE"];
	_visualaid = createVehicle ["SmokeShellPurple", _position, [], 0, "CAN_COLLIDE"];
	_visualaid attachto [_vehicle, [0,0,0]];
	
	clearWeaponCargoGlobal  _vehicle;
	clearMagazineCargoGlobal  _vehicle;
	
	_vehicle setfuel 1;
	_vehicle setDir _dirplayer;
	
	// Serverside Hivewrite
	LottoReward_Vehicle = [_vehicle,_dirplayer,_position,_randvehicle];
	publicVariableServer "LottoReward_Vehicle";
	
	_vehicle addEventHandler ["GetIn",{_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;}];
};

LottoReward_Log = format["%1 (%2) has recieved %3 as a reward",name player,_puid,_reward];
publicVariableServer "LottoReward_Log";

_lotto_box_uses = _lotto_box_uses - 1;
_lotto_box setVariable ["LottoUses",_lotto_box_uses,true];

_player_users = _player_users + [_puid];
_lotto_box setVariable ["LottoUsers",_player_users,true];
systemchat "This script is still in progress. Please report any bugs or issues to an admin if encountered.";