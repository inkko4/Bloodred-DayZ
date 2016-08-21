/* 	
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
	
	["Weapon",1,"QuestHero",[false,0],[false,0],[false,0],1,"ItemAntibiotic",0] call DZSQ_QuestRewardSystem;
	["Vehicle",1,"QuestHero",[false,0],[false,0],[false,0],1,"ItemAntibiotic",0] call DZSQ_QuestRewardSystem;
	["Weapon",1,"QuestHero",[false,0],[false,0],[false,0],2,["ItemAntibiotic","ItemAntibiotic"],0] call DZSQ_QuestRewardSystem;
	["Vehicle",1,"QuestHero",[false,0],[false,0],[false,0],2,["ItemAntibiotic","ItemAntibiotic"],0] call DZSQ_QuestRewardSystem;
	
	[
	"Weapon", 			// weapon or vehicle
	1, 					// levels 0,1,2. 0 being low tier, 2 being high tier.
	"QuestHero",		// Quest name, for setting temp variable true so quest can't be completed again.
	[false,0],			// [true/false,value]. true/false to enable or disable use of humanity, value is for how much to take from humanity
	[false,0],			// [true/false,value]. true/false to enable or disable use of murders, value is for how much to take from murders.
	[false,0],			// Same as other 2, but zombie kills...
	1,					// Items requires; 0 - none, 1 - 1 item, 2 - multiple items.
	"ItemAntibiotic",	// ""/"item name"/["Item name","Item name","Item name"] (MUST BE 3 ITEMS!!!!). Specify if reward requires an item to complete.
	0					// if vehicle needs to be in water set to 2, if land set to 1. ONLY used with vehicle rewards
	] call DZSQ_QuestRewardSystem;
	
	+ Weapons/Vehicles can support array or single item for requirements (hopefully that is).
*/
private ["_rand_reward","_newhero","_newbandit","_newzombie","_result4","_result3","_result2","_result","_result0","_weapon","_magazine","_randvehicle","_vehicle","_objectID","_dirplayer","_posplayer","_position","_rand_reward2","_rand_reward3","_reward_type","_reward_level","_reward_quest","_reward_humanity","_reward_bandit","_reward_zombie","_reward_needed","_usehumanity","_heroamount","_usebandit","_banditamount","_usezombie","_zombieamount","_murderkills","_banditvalue","_zombiekills","_visualaid","_waterolandvehicle","_distance","_reward_value","_remove3","_remove2","_item1","_item2","_item3","_remove","_crate"];

_reward_type = _this select 0; // Weapon/Vehicle
_reward_level = _this select 1;	// 0,1,2
_reward_quest = _this select 2; // variable for quest to make it so it can't be done again till restart or relog. Sort of a temp cool down.
_reward_humanity = _this select 3; // array [true or false, value]. Set true or false if you want humanity removed. Value is how much is removed.
_reward_bandit = _this select 4; // array [true or false, value]. Set true or false if you want murder kills removed. Value is how much is removed.
_reward_zombie = _this select 5; // array [true or false, value]. Set true or false if you want zed kills removed. Value is how much is removed.
_reward_value = _this select 6;	// 0 = no items needed. 1 = single item is needed. 2 = multiple items needed (as many as you want that can fit in inventory.)
_reward_needed = _this select 7; // "" if no item is needed. "item name" for single item. ["itemname","itemname"] for array of needed items.
_waterolandvehicle = _this select 8;

//diag_log format["DZSQ DEBUG: ARRAY1 (%1)",_this];
//diag_log format["DZSQ DEBUG: ARRAY2 (%1 | %2 | %3 | %4 | %5 | %6 | %7)",_reward_type,_reward_level,_reward_quest,_reward_humanity,_reward_bandit,_reward_zombie,_reward_needed];
DZSQ_Tempholder = nil;

// humanity
_usehumanity = _reward_humanity select 0; // [false/true,value] <- this gets the false or true state.
_heroamount = _reward_humanity select 1; // [false/true,value] <- this gets the value.
//bandit (murders)
_usebandit = _reward_bandit select 0;
_banditamount = _reward_bandit select 1;
//zombie
_usezombie = _reward_zombie select 0;
_zombieamount = _reward_zombie select 1;

//_playeritems = [currentWeapon player] + (weapons player) + (magazines player);

_banditvalue = player getVariable "banditKills";//hero
_zombiekills = player getVariable "zombieKills";//zed
_murderkills = player getVariable ["humanKills",0];//bandit

if (_reward_type == "Weapon") then {
	// reward level (switch case of this way?)
	if (_reward_level == 0) then {
		_rand_reward = DZSQ_Weapon1 call bis_fnc_selectrandom;
	};
	if (_reward_level == 1) then {
		_rand_reward = DZSQ_Weapon2 call bis_fnc_selectrandom;
	};
	if (_reward_level == 2) then {
		_rand_reward = DZSQ_Weapon3 call bis_fnc_selectrandom;
	};
	//if (_reward_level != 0 || _reward_level != 1 || _reward_level != 2) exitwith {systemchat 'Something has gone wrong please try again.';};
	_weapon = _rand_reward select 0;
	_magazine = _rand_reward select 1;
	
	if (_reward_value == 0) then {
	if (DZSQ_RewardBox) then {
			systemchat format['Quest completed! You have received a(n) %1 with 3 %2',_weapon,_magazine];
					if (_usehumanity) then {
						_newhero = _banditvalue - _heroamount;
						if (_newhero < 1) then {
							player setVariable ["banditKills",0,true];
						} else {
							player setVariable ["banditKills",_newhero,true];
						};
					};
						if (_usebandit) then {
							_newbandit = _murderkills - _banditamount;
							if (_newbandit < 1) then {
								player setVariable ["humanKills",0,true];
							} else {
								player setVariable ["humanKills",_newbandit,true];
							};
						};
						if (_usezombie) then {
							_newzombie = _zombiekills - _zombieamount;
								if (_newzombie < 1) then {
									player setVariable ["zombieKills",0,true];
								} else {
									player setVariable ["zombieKills",_newzombie,true];
								};
							};
							player setVariable [_reward_quest,1,true];
							_crate = "AmmoBoxBig" createVehicle (position player);
							_crate setVariable ["Sarge",1,true];

							clearWeaponCargoGlobal _crate;
							clearMagazineCargoGlobal _crate;

							// add weapons
							_crate addWeaponCargoGlobal [_weapon, 1];
							// add items
							_crate addMagazineCargoGlobal [_magazine, 3];

							_crate attachto [player, [0,3,1.7]];
							systemchat 'Reward box created at your feet. Will detach in 5 seconds.';
							sleep 5;
							detach _crate;
							player reveal _crate;
							systemchat 'Box will despawn in 5 minutes or if you walk 50 meters away.';
							[_crate] call DZSQ_QuestBoxCleanup;
	} else {
		_result = [player,_weapon] call BIS_fnc_invAdd;
		if (_result) then {
			_result2 = [player,_magazine] call BIS_fnc_invAdd;
			if (_result2) then {
				_result3 =  [player,_magazine] call BIS_fnc_invAdd;
				if (_result3) then {
					_result4 =  [player,_magazine] call BIS_fnc_invAdd;
					if (_result4) then {
						systemchat format['Quest completed! You have received a(n) %1 with 3 %2',_weapon,_magazine];
						if (_usehumanity) then {
							_newhero = _banditvalue - _heroamount;
							if (_newhero < 1) then {
								player setVariable ["banditKills",0,true];
							} else {
								player setVariable ["banditKills",_newhero,true];
							};
						};
						if (_usebandit) then {
							_newbandit = _murderkills - _banditamount;
							if (_newbandit < 1) then {
								player setVariable ["humanKills",0,true];
							} else {
								player setVariable ["humanKills",_newbandit,true];
							};
						};
						if (_usezombie) then {
							_newzombie = _zombiekills - _zombieamount;
							if (_newzombie < 1) then {
								player setVariable ["zombieKills",0,true];
							} else {
								player setVariable ["zombieKills",_newzombie,true];
							};
						};
						player setVariable [_reward_quest,1,true];
					} else {
						systemchat format['You did not have enough space in your inventory for a(n) %1.',_magazine];
						[player,_weapon] call BIS_fnc_invRemove;
						[player,_magazine] call BIS_fnc_invRemove;
						[player,_magazine] call BIS_fnc_invRemove;
					};
				} else {
					systemchat format['You did not have enough space in your inventory for a(n) %1.',_magazine];
					[player,_weapon] call BIS_fnc_invRemove;
					[player,_magazine] call BIS_fnc_invRemove;
				};
			} else {
				systemchat format['You did not have enough space in your inventory for a(n) %1.',_magazine];
				[player,_weapon] call BIS_fnc_invRemove;
			};
		} else {
			systemchat format['You did not have enough space in your inventory for a(n) %1.',_weapon];
		};
	};
	};
	if (_reward_value == 2) then {
		
		_item1 = _reward_needed select 0;
		_item2 = _reward_needed select 1;
		_item3 = _reward_needed select 2;
		
		_remove = [player,_item1] call BIS_fnc_invRemove;
		if (_remove == 1) then {
		
		_remove2 = [player,_item2] call BIS_fnc_invRemove;
		if (_remove2 == 1) then {
		
		_remove3 = [player,_item3] call BIS_fnc_invRemove;
		if (_remove3 == 1) then {
			if (DZSQ_RewardBox) then {
				systemchat format['Quest completed! You have received a(n) %1 with 3 %2',_weapon,_magazine];
							if (_usehumanity) then {
								_newhero = _banditvalue - _heroamount;
							if (_newhero < 1) then {
								player setVariable ["banditKills",0,true];
							} else {
								player setVariable ["banditKills",_newhero,true];
							};
						};
						if (_usebandit) then {
							_newbandit = _murderkills - _banditamount;
							if (_newbandit < 1) then {
								player setVariable ["humanKills",0,true];
							} else {
								player setVariable ["humanKills",_newbandit,true];
							};
						};
						if (_usezombie) then {
							_newzombie = _zombiekills - _zombieamount;
								if (_newzombie < 1) then {
									player setVariable ["zombieKills",0,true];
								} else {
									player setVariable ["zombieKills",_newzombie,true];
								};
							};
							player setVariable [_reward_quest,1,true];
							_crate = "AmmoBoxBig" createVehicle (position player);
							_crate setVariable ["Sarge",1,true];

							clearWeaponCargoGlobal _crate;
							clearMagazineCargoGlobal _crate;

							// add weapons
							_crate addWeaponCargoGlobal [_weapon, 1];
							// add items
							_crate addMagazineCargoGlobal [_magazine, 3];

							_crate attachto [player, [0,3,1.7]];
							systemchat 'Reward box created at your feet. Will detach in 5 seconds.';
							sleep 5;
							detach _crate;
							player reveal _crate;
							systemchat 'Box will despawn in 5 minutes or if you walk 50 meters away.';
							[_crate] call DZSQ_QuestBoxCleanup;
			} else {
			_result = [player,_weapon] call BIS_fnc_invAdd;
			if (_result) then {
				_result2 = [player,_magazine] call BIS_fnc_invAdd;
				if (_result2) then {
					_result3 =  [player,_magazine] call BIS_fnc_invAdd;
					if (_result3) then {
						_result4 =  [player,_magazine] call BIS_fnc_invAdd;
						if (_result4) then {
							systemchat format['Quest completed! You have received a(n) %1 with 3 %2',_weapon,_magazine];
							if (_usehumanity) then {
								_newhero = _banditvalue - _heroamount;
								if (_newhero < 1) then {
									player setVariable ["banditKills",0,true];
								} else {
									player setVariable ["banditKills",_newhero,true];
								};
							};
							if (_usebandit) then {
								_newbandit = _murderkills - _banditamount;
								if (_newbandit < 1) then {
									player setVariable ["humanKills",0,true];
								} else {
									player setVariable ["humanKills",_newbandit,true];
								};
							};
							if (_usezombie) then {
								_newzombie = _zombiekills - _zombieamount;
								if (_newzombie < 1) then {
									player setVariable ["zombieKills",0,true];
								} else {
									player setVariable ["zombieKills",_newzombie,true];
								};
							};
							player setVariable [_reward_quest,1,true];
						} else {
							systemchat format['You did not have enough space in your inventory for a(n) %1.',_magazine];
							[player,_weapon] call BIS_fnc_invRemove;
							[player,_magazine] call BIS_fnc_invRemove;
							[player,_magazine] call BIS_fnc_invRemove;
							[player,_item1] call BIS_fnc_invAdd;
							[player,_item2] call BIS_fnc_invAdd;
							[player,_item3] call BIS_fnc_invAdd;;
						};
					} else {
						systemchat format['You did not have enough space in your inventory for a(n) %1.',_magazine];
						[player,_weapon] call BIS_fnc_invRemove;
						[player,_magazine] call BIS_fnc_invRemove;
						[player,_item1] call BIS_fnc_invAdd;
						[player,_item2] call BIS_fnc_invAdd;
						[player,_item3] call BIS_fnc_invAdd;
					};
				} else {
					systemchat format['You did not have enough space in your inventory for a(n) %1.',_magazine];
					[player,_weapon] call BIS_fnc_invRemove;
					[player,_item1] call BIS_fnc_invAdd;
					[player,_item2] call BIS_fnc_invAdd;
					[player,_item3] call BIS_fnc_invAdd;
				};
			} else {
				systemchat format['You did not have enough space in your inventory for a(n) %1.',_weapon];
				[player,_item1] call BIS_fnc_invAdd;
				[player,_item2] call BIS_fnc_invAdd;
				[player,_item3] call BIS_fnc_invAdd;
			};
			};
		} else {
			systemchat format['You were missing %1 from your inventory.',_item3];
			[player,_item1] call BIS_fnc_invAdd;
			[player,_item2] call BIS_fnc_invAdd;
		};
		} else {
			systemchat format['You were missing %1 from your inventory.',_item2];
			[player,_item1] call BIS_fnc_invAdd;
		};
		} else {
			systemchat format['You were missing %1 from your inventory.',_item1];
		};
	};
			
	if (_reward_value == 1) then {

		_result0 = [player,_reward_needed] call BIS_fnc_invRemove;
		if (_result0 == 1) then {
			if (DZSQ_RewardBox) then {
				systemchat format['Quest completed! You have received a(n) %1 with 3 %2',_weapon,_magazine];
							if (_usehumanity) then {
								_newhero = _banditvalue - _heroamount;
							if (_newhero < 1) then {
								player setVariable ["banditKills",0,true];
							} else {
								player setVariable ["banditKills",_newhero,true];
							};
						};
						if (_usebandit) then {
							_newbandit = _murderkills - _banditamount;
							if (_newbandit < 1) then {
								player setVariable ["humanKills",0,true];
							} else {
								player setVariable ["humanKills",_newbandit,true];
							};
						};
						if (_usezombie) then {
							_newzombie = _zombiekills - _zombieamount;
								if (_newzombie < 1) then {
									player setVariable ["zombieKills",0,true];
								} else {
									player setVariable ["zombieKills",_newzombie,true];
								};
							};
							player setVariable [_reward_quest,1,true];
							_crate = "AmmoBoxBig" createVehicle (position player);
							_crate setVariable ["Sarge",1,true];

							clearWeaponCargoGlobal _crate;
							clearMagazineCargoGlobal _crate;

							// add weapons
							_crate addWeaponCargoGlobal [_weapon, 1];
							// add items
							_crate addMagazineCargoGlobal [_magazine, 3];

							_crate attachto [player, [0,3,1.7]];
							systemchat 'Reward box created at your feet. Will detach in 5 seconds.';
							sleep 5;
							detach _crate;
							player reveal _crate;
							systemchat 'Box will despawn in 5 minutes or if you walk 50 meters away.';
							[_crate] call DZSQ_QuestBoxCleanup;
			} else {
			_result = [player,_weapon] call BIS_fnc_invAdd;
			if (_result) then {
				_result2 = [player,_magazine] call BIS_fnc_invAdd;
				if (_result2) then {
					_result3 =  [player,_magazine] call BIS_fnc_invAdd;
					if (_result3) then {
						_result4 =  [player,_magazine] call BIS_fnc_invAdd;
						if (_result4) then {
							systemchat format['Quest completed! You have received a(n) %1 with 3 %2',_weapon,_magazine];
							if (_usehumanity) then {
								_newhero = _banditvalue - _heroamount;
							if (_newhero < 1) then {
								player setVariable ["banditKills",0,true];
							} else {
								player setVariable ["banditKills",_newhero,true];
							};
						};
						if (_usebandit) then {
							_newbandit = _murderkills - _banditamount;
							if (_newbandit < 1) then {
								player setVariable ["humanKills",0,true];
							} else {
								player setVariable ["humanKills",_newbandit,true];
							};
						};
						if (_usezombie) then {
							_newzombie = _zombiekills - _zombieamount;
								if (_newzombie < 1) then {
									player setVariable ["zombieKills",0,true];
								} else {
									player setVariable ["zombieKills",_newzombie,true];
								};
							};
							player setVariable [_reward_quest,1,true];
						} else {
							systemchat format['You did not have enough space in your inventory for a(n) %1.',_magazine];
							[player,_weapon] call BIS_fnc_invRemove;
							[player,_magazine] call BIS_fnc_invRemove;
							[player,_magazine] call BIS_fnc_invRemove;
							[player,_reward_needed] call BIS_fnc_invAdd;
						};
					} else {
						systemchat format['You did not have enough space in your inventory for a(n) %1.',_magazine];
						[player,_weapon] call BIS_fnc_invRemove;
						[player,_magazine] call BIS_fnc_invRemove;
						[player,_reward_needed] call BIS_fnc_invAdd;
					};
				} else {
					systemchat format['You did not have enough space in your inventory for a(n) %1.',_magazine];
					[player,_weapon] call BIS_fnc_invRemove;
					[player,_reward_needed] call BIS_fnc_invAdd;
				};
			} else {
				systemchat format['You did not have enough space in your inventory for a(n) %1.',_weapon];
			};
			};
		} else {
			systemchat format['You were missing %1 from your inventory',_reward_needed];
		};
	};
};
/*
	Vehicle Rewards
	Todo:
	+ Add items needed
	+ Add epoch DB write (maybe via trader buy so they get key?)
*/
// vehicle reward lacking _reward_needed portion - only supports humanity,murders,zed kills
if (_reward_type == "Vehicle") then {
	// Reward levels and their proper vehicle arrays.
	if (_reward_level == 0) then {
		_randvehicle = DZSQ_Vehicle1 call bis_fnc_selectrandom;
	};
	if (_reward_level == 1) then {
		_randvehicle = DZSQ_Vehicle2 call bis_fnc_selectrandom;
	};
	if (_reward_level == 2) then {
		_randvehicle = DZSQ_Vehicle3 call bis_fnc_selectrandom;
	};
	
	// BOATS ONLY
	if (_reward_level == 3) then {
		_randvehicle = DZSQ_Vehicle4 call bis_fnc_selectrandom;
	};
	// Exits if the reward level is not correct.
	//if (_reward_level != 0 || _reward_level != 1 || _reward_level != 2) exitwith {systemchat 'Something has gone wrong please try again.';};
	
	// <- insert item chunk here and envelope vehicle code inside?
	if (_reward_value == 0) then {
		_dirplayer = getdir vehicle player;
		_posplayer = getPos vehicle player;
		_position = [_posplayer,5,50,10,_waterolandvehicle,0,0] call BIS_fnc_findSafePos;
		DZSQ_Tempholder = _position;
		_distance = (getpos player) distance _position;
		if (_distance > 400) then {DZSQ_Tempholder = [(_posplayer select 0)+15*sin(_dirplayer),(_posplayer select 1)+15*cos(_dirplayer),0];}; //failsafe
		_position = DZSQ_Tempholder;
		DZSQ_Tempholder = nil;
		//_position = [(_posplayer select 0)+15*sin(_dirplayer),(_posplayer select 1)+15*cos(_dirplayer),0]; // should be semi straight infront of player about 8-15m away
		if (DZSQ_PermVehicle) then {
			if (DZSQ_Epoch) then {
			/*
				Epoch DB write
			*/
			/*
				_keyColor = ["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom;
				_keyNumber = (floor(random 2500)) + 1;
				_keySelected = format[("ItemKey%1%2"),_keyColor,_keyNumber];	
				_isKeyOK = isClass(configFile >> "CfgWeapons" >> _keySelected);
				_config = _keySelected;
				_isOk = [player,_config] call BIS_fnc_invAdd;
	
				waitUntil {!isNil "_isOk"};
				if (_isOk and _isKeyOK) then {
		
	
					_dir = round(random 360);
					_helipad = nearestObjects [player, ["HeliHCivil","HeliHempty"], 100];

					if(count _helipad > 0) then {
						_location = (getPosATL (_helipad select 0));
					} else {
						_location = [(position player),0,20,1,0,2000,0] call BIS_fnc_findSafePos;
					};

					_veh = createVehicle ["Sign_arrow_down_large_EP1", _location, [], 0, "CAN_COLLIDE"];
					_location = (getPosATL _veh);

					PVDZE_veh_Publish2 = [_veh,[_dir,_location],_part_out,false,_keySelected,_activatingPlayer];
					publicVariableServer  "PVDZE_veh_Publish2";

					cutText [format[("Bought %3 for %1 %2, key added to toolbelt."),_qty_in,_textPartIn,_textPartOut], "PLAIN DOWN"];

				} else {
					cutText [(localize "str_epoch_player_107"), "PLAIN DOWN"];
				};
			*/
			// WIP
			} else {
			/*
				Non epoch attempt DB write (only original DayZ mod)
			*/
				if (!(_randvehicle in DayZ_SafeObjects)) then {
					DayZ_SafeObjects = DayZ_SafeObjects + [_randvehicle];
					publicVariable "DayZ_SafeObjects";
				};
				_vehicle = createVehicle [_randvehicle, _position, [], 0, "CAN_COLLIDE"];
				_visualaid = createVehicle ["SmokeShellRed", _position, [], 0, "CAN_COLLIDE"];
				_visualaid attachto [_vehicle, [0,0,0]];
				clearWeaponCargoGlobal  _vehicle;
				clearMagazineCargoGlobal  _vehicle;
				_vehicle setfuel 1;
				//_vehicle setPosATL _position;
				_vehicle setDir _dirplayer;
				_vehicle setVariable ["Sarge",1,true]; // using sarge anti hacker variable since i already have it in place. Just in case for DB write...
				_vehicle addEventHandler ["GetIn",{_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle may despawn, lose fuel, or bug out in other ways due to an in development script.","PLAIN DOWN",5] call RE;}];
				PVDZ_obj_Publish = [0,_vehicle,[_dirplayer,_position],[]];
				publicVariableServer "PVDZ_obj_Publish";
				if (_usehumanity) then {
					_newhero = _banditvalue - _heroamount;
					if (_newhero < 1) then {
						player setVariable ["banditKills",0,true];
					} else {
						player setVariable ["banditKills",_newhero,true];
					};
				};
				if (_usebandit) then {
					_newbandit = _murderkills - _banditamount;
					if (_newbandit < 1) then {
						player setVariable ["humanKills",0,true];
					} else {
						player setVariable ["humanKills",_newbandit,true];
					};
				};
				if (_usezombie) then {
					_newzombie = _zombiekills - _zombieamount;
					if (_newzombie < 1) then {
						player setVariable ["zombieKills",0,true];
					} else {
						player setVariable ["zombieKills",_newzombie,true];
					};
				};
				systemchat format['Quest completed! A(n) %1 has been spawned nearby for you. Look around nearby to find it.',_randvehicle];
			};
		} else {
			_vehicle = createVehicle [_randvehicle, _position, [], 0, "CAN_COLLIDE"];
			_visualaid = createVehicle ["SmokeShellRed", _position, [], 0, "CAN_COLLIDE"];
			_visualaid attachto [_vehicle, [0,0,0]];
			clearWeaponCargoGlobal  _vehicle;
			clearMagazineCargoGlobal  _vehicle;
			_vehicle setfuel 1;
			//_vehicle setPosATL _position;
			_vehicle setDir _dirplayer;
			_objectID = str(round(random 999999));
			_vehicle setVariable ["ObjectID", _objectID, true];
			_vehicle setVariable ["ObjectUID", _objectID, true];
			_vehicle setVariable ["Sarge",1,true]; // using sarge anti hacker variable since i already have it in place
			dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _vehicle];
			cutText [format["%1, this vehicle will disappear after restart.",player], "PLAIN DOWN"];
			_vehicle addEventHandler ["GetIn",{_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;}];
			if (_usehumanity) then {
				_newhero = _banditvalue - _heroamount;
				if (_newhero < 1) then {
					player setVariable ["banditKills",0,true];
				} else {
					player setVariable ["banditKills",_newhero,true];
				};
			};
			if (_usebandit) then {
				_newbandit = _murderkills - _banditamount;
				if (_newbandit < 1) then {
					player setVariable ["humanKills",0,true];
				} else {
					player setVariable ["humanKills",_newbandit,true];
				};
			};
			if (_usezombie) then {
				_newzombie = _zombiekills - _zombieamount;
				if (_newzombie < 1) then {
					player setVariable ["zombieKills",0,true];
				} else {
					player setVariable ["zombieKills",_newzombie,true];
				};
			};
			systemchat format['Quest completed! A(n) temporary %1 has been spawned nearby for you. Look around nearby to find it.',_randvehicle];
		};
	};
	
	if (_reward_value == 2) then {
		/*DZSQ_hasitems = true;
		{
			if (_x in _playeritems) then {
				// blank stating that DZSQ_hasitems is still true and false should trigger script to fail cause of missing item.
			} else {
				DZSQ_hasitems = false;
				systemchat format["You are missing %1 from your inventory.",_x];
			};
		} foreach _reward_needed;
		if (DZSQ_hasitems) then {
		{
			[player,_x] call BIS_fnc_invRemove;
		} foreach _reward_needed;*/
		
		_item1 = _reward_needed select 0;
		_item2 = _reward_needed select 1;
		_item3 = _reward_needed select 2;
		
		_remove = [player,_item1] call BIS_fnc_invRemove;
		if (_remove == 1) then {
		
		_remove2 = [player,_item2] call BIS_fnc_invRemove;
		if (_remove2 == 1) then {
		
		_remove3 = [player,_item3] call BIS_fnc_invRemove;
		if (_remove3 == 1) then {
		// removed array items, now give vehicle
		_dirplayer = getdir vehicle player;
		_posplayer = getPos vehicle player;
		_position = [_posplayer,5,50,10,_waterolandvehicle,0,0] call BIS_fnc_findSafePos;
		DZSQ_Tempholder = _position;
		_distance = (getpos player) distance _position;
		if (_distance > 400) then {DZSQ_Tempholder = [(_posplayer select 0)+15*sin(_dirplayer),(_posplayer select 1)+15*cos(_dirplayer),0];}; //failsafe
			_position = DZSQ_Tempholder;
			DZSQ_Tempholder = nil;
			if (DZSQ_PermVehicle) then {
				if (DZSQ_Epoch) then {
				/*
					Epoch DB write
				*/
				// WIP
				} else {
				/*
					Non epoch attempt DB write (only original DayZ mod)
				*/
					if (!(_randvehicle in DayZ_SafeObjects)) then {
						DayZ_SafeObjects = DayZ_SafeObjects + [_randvehicle];
						publicVariable "DayZ_SafeObjects";
					};
					_vehicle = createVehicle [_randvehicle, _position, [], 0, "CAN_COLLIDE"];
					_visualaid = createVehicle ["SmokeShellRed", _position, [], 0, "CAN_COLLIDE"];
					_visualaid attachto [_vehicle, [0,0,0]];
					clearWeaponCargoGlobal  _vehicle;
					clearMagazineCargoGlobal  _vehicle;
					_vehicle setfuel 1;
					//_vehicle setPosATL _position;
					_vehicle setDir _dirplayer;
					_vehicle setVariable ["Sarge",1,true]; // using sarge anti hacker variable since i already have it in place. Just in case for DB write...
					_vehicle addEventHandler ["GetIn",{_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle may despawn, lose fuel, or bug out in other ways due to an in development script.","PLAIN DOWN",5] call RE;}];
					PVDZ_obj_Publish = [0,_vehicle,[_dirplayer,_position],[]];
					publicVariableServer "PVDZ_obj_Publish";
					if (_usehumanity) then {
						_newhero = _banditvalue - _heroamount;
						if (_newhero < 1) then {
							player setVariable ["banditKills",0,true];
						} else {
							player setVariable ["banditKills",_newhero,true];
						};
					};
					if (_usebandit) then {
						_newbandit = _murderkills - _banditamount;
						if (_newbandit < 1) then {
							player setVariable ["humanKills",0,true];
						} else {
							player setVariable ["humanKills",_newbandit,true];
						};
					};
					if (_usezombie) then {
						_newzombie = _zombiekills - _zombieamount;
						if (_newzombie < 1) then {
							player setVariable ["zombieKills",0,true];
						} else {
							player setVariable ["zombieKills",_newzombie,true];
						};
					};
					systemchat format['Quest completed! A(n) %1 has been spawned nearby for you. Look around nearby to find it.',_randvehicle];
				};
			} else {
				_vehicle = createVehicle [_randvehicle, _position, [], 0, "CAN_COLLIDE"];
				_visualaid = createVehicle ["SmokeShellRed", _position, [], 0, "CAN_COLLIDE"];
				_visualaid attachto [_vehicle, [0,0,0]];
				clearWeaponCargoGlobal  _vehicle;
				clearMagazineCargoGlobal  _vehicle;
				_vehicle setfuel 1;
				//_vehicle setPosATL _position;
				_vehicle setDir _dirplayer;
				_objectID = str(round(random 999999));
				_vehicle setVariable ["ObjectID", _objectID, true];
				_vehicle setVariable ["ObjectUID", _objectID, true];
				_vehicle setVariable ["Sarge",1,true]; // using sarge anti hacker variable since i already have it in place
				dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _vehicle];
				cutText [format["%1, this vehicle will disappear after restart.",player], "PLAIN DOWN"];
				_vehicle addEventHandler ["GetIn",{_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;}];
				if (_usehumanity) then {
					_newhero = _banditvalue - _heroamount;
					if (_newhero < 1) then {
						player setVariable ["banditKills",0,true];
					} else {
						player setVariable ["banditKills",_newhero,true];
					};
				};
				if (_usebandit) then {
					_newbandit = _murderkills - _banditamount;
					if (_newbandit < 1) then {
						player setVariable ["humanKills",0,true];
					} else {
						player setVariable ["humanKills",_newbandit,true];
					};
				};
				if (_usezombie) then {
					_newzombie = _zombiekills - _zombieamount;
					if (_newzombie < 1) then {
						player setVariable ["zombieKills",0,true];
					} else {
						player setVariable ["zombieKills",_newzombie,true];
					};
				};
				systemchat format['Quest completed! A(n) temporary %1 has been spawned nearby for you. Look around nearby to find it.',_randvehicle];
			};
		} else {
			systemchat format['You were missing an item from your inventory.',_item3];
			[player,_item1] call BIS_fnc_invAdd;
			[player,_item2] call BIS_fnc_invAdd;
		};
		} else {
			systemchat format['You were missing an item from your inventory.',_item2];
			[player,_item1] call BIS_fnc_invAdd;
		};
		} else {
			systemchat format['You were missing an item from your inventory.',_item3];
		};
	};
		
	if (_reward_value == 1) then {
		_result0 = [player,_reward_needed] call BIS_fnc_invRemove;
		if (_result0 == 1) then {
			_dirplayer = getdir vehicle player;
			_posplayer = getPos vehicle player;
			_position = [_posplayer,5,50,10,_waterolandvehicle,0,0] call BIS_fnc_findSafePos;
			//_position = [(_posplayer select 0)+15*sin(_dirplayer),(_posplayer select 1)+15*cos(_dirplayer),0]; // should be semi straight infront of player about 8-15m away
			if (DZSQ_PermVehicle) then {
				if (DZSQ_Epoch) then {
				/*
					Epoch DB write
				*/
					// WIP
				} else {
				/*
					Non epoch attempt DB write (only original DayZ mod)
				*/
					if (!(_randvehicle in DayZ_SafeObjects)) then {
						DayZ_SafeObjects = DayZ_SafeObjects + [_randvehicle];
						publicVariable "DayZ_SafeObjects";
					};
					_vehicle = createVehicle [_randvehicle, _position, [], 0, "CAN_COLLIDE"];
					_visualaid = createVehicle ["SmokeShellRed", _position, [], 0, "CAN_COLLIDE"];
					_visualaid attachto [_vehicle, [0,0,0]];
					clearWeaponCargoGlobal  _vehicle;
					clearMagazineCargoGlobal  _vehicle;
					_vehicle setfuel 1;
					//_vehicle setPosATL _position;
					_vehicle setDir _dirplayer;
					_vehicle setVariable ["Sarge",1,true]; // using sarge anti hacker variable since i already have it in place. Just in case for DB write...
					_vehicle addEventHandler ["GetIn",{_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle may despawn, lose fuel, or bug out in other ways due to an in development script.","PLAIN DOWN",5] call RE;}];
					PVDZ_obj_Publish = [0,_vehicle,[_dirplayer,_position],[]];
					publicVariableServer "PVDZ_obj_Publish";
					if (_usehumanity) then {
						_newhero = _banditvalue - _heroamount;
						if (_newhero < 1) then {
							player setVariable ["banditKills",0,true];
						} else {
							player setVariable ["banditKills",_newhero,true];
						};
					};
					if (_usebandit) then {
						_newbandit = _murderkills - _banditamount;
						if (_newbandit < 1) then {
							player setVariable ["humanKills",0,true];
						} else {
							player setVariable ["humanKills",_newbandit,true];
						};
					};
					if (_usezombie) then {
						_newzombie = _zombiekills - _zombieamount;
						if (_newzombie < 1) then {
							player setVariable ["zombieKills",0,true];
						} else {
							player setVariable ["zombieKills",_newzombie,true];
						};
					};
					systemchat format['Quest completed! A(n) %1 has been spawned nearby for you. Look around nearby to find it.',_randvehicle];
				};
			} else {
				_vehicle = createVehicle [_randvehicle, _position, [], 0, "CAN_COLLIDE"];
				_visualaid = createVehicle ["SmokeShellRed", _position, [], 0, "CAN_COLLIDE"];
				_visualaid attachto [_vehicle, [0,0,0]];
				clearWeaponCargoGlobal  _vehicle;
				clearMagazineCargoGlobal  _vehicle;
				_vehicle setfuel 1;
				//_vehicle setPosATL _position;
				_vehicle setDir _dirplayer;
				_objectID = str(round(random 999999));
				_vehicle setVariable ["ObjectID", _objectID, true];
				_vehicle setVariable ["ObjectUID", _objectID, true];
				_vehicle setVariable ["Sarge",1,true]; // using sarge anti hacker variable since i already have it in place
				dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _vehicle];
				cutText [format["%1, this vehicle will disappear after restart.",player], "PLAIN DOWN"];
				_vehicle addEventHandler ["GetIn",{_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;}];
				if (_usehumanity) then {
					_newhero = _banditvalue - _heroamount;
					if (_newhero < 1) then {
						player setVariable ["banditKills",0,true];
					} else {
						player setVariable ["banditKills",_newhero,true];
					};
				};
				if (_usebandit) then {
					_newbandit = _murderkills - _banditamount;
					if (_newbandit < 1) then {
						player setVariable ["humanKills",0,true];
					} else {
						player setVariable ["humanKills",_newbandit,true];
					};
				};
				if (_usezombie) then {
					_newzombie = _zombiekills - _zombieamount;
					if (_newzombie < 1) then {
						player setVariable ["zombieKills",0,true];
					} else {
						player setVariable ["zombieKills",_newzombie,true];
					};
				};
				systemchat format['Quest completed! A(n) temporary %1 has been spawned nearby for you. Look around nearby to find it.',_randvehicle];
			};
		} else {
			systemchat 'You were missing an item from your inventory.';
		};
	};	
};
/*
	Buildable item rewards
	+ need to make sure multiple tool items (DIY items) are not added... so only add 1 of them.
*/
if (_reward_type == "Buildable") then {
	// reward level (switch case of this way?)
	if (_reward_level == 0) then {
		_rand_reward = DZSQ_Buildables1 call bis_fnc_selectrandom;
		_rand_reward2 = DZSQ_Buildables1 call bis_fnc_selectrandom;
		_rand_reward3 = DZSQ_Buildables1 call bis_fnc_selectrandom;
	};
	if (_reward_level == 1) then {
		_rand_reward = DZSQ_Buildables2 call bis_fnc_selectrandom;
		_rand_reward2 = DZSQ_Buildables2 call bis_fnc_selectrandom;
		_rand_reward3 = DZSQ_Buildables2 call bis_fnc_selectrandom;
	};
	if (_reward_level == 2) then {
		_rand_reward = DZSQ_Buildables3 call bis_fnc_selectrandom; // since they get one maybe we should add a lil more...
		_rand_reward2 = DZSQ_Buildables2 call bis_fnc_selectrandom;
		_rand_reward3 = DZSQ_Buildables2 call bis_fnc_selectrandom;
	};
	//if (_reward_level != 0 || _reward_level != 1 || _reward_level != 2) exitwith {systemchat 'Something has gone wrong please try again.';};
	
	if (_reward_value == 0) then { // most likely wont be giving building supplies for free....
	// no items needed for reward
			if (DZSQ_RewardBox) then {
				systemchat format['Quest completed! You have received a %1, %2, and %3!',_rand_reward,_rand_reward2,_rand_reward3];
						if (_usehumanity) then {
							_newhero = _banditvalue - _heroamount;
							if (_newhero < 1) then {
								player setVariable ["banditKills",0,true];
							} else {
								player setVariable ["banditKills",_newhero,true];
							};
						};
						if (_usebandit) then {
							_newbandit = _murderkills - _banditamount;
							if (_newbandit < 1) then {
								player setVariable ["humanKills",0,true];
							} else {
								player setVariable ["humanKills",_newbandit,true];
							};
						};
						if (_usezombie) then {
							_newzombie = _zombiekills - _zombieamount;
							if (_newzombie < 1) then {
								player setVariable ["zombieKills",0,true];
							} else {
								player setVariable ["zombieKills",_newzombie,true];
							};
						};
						player setVariable [_reward_quest,1,true];
						_crate = "AmmoBoxBig" createVehicle (position player);
							_crate setVariable ["Sarge",1,true];

							clearWeaponCargoGlobal _crate;
							clearMagazineCargoGlobal _crate;

							// add items
							_crate addMagazineCargoGlobal [_rand_reward, 1];
							_crate addMagazineCargoGlobal [_rand_reward2, 1];
							_crate addMagazineCargoGlobal [_rand_reward3, 1];

							_crate attachto [player, [0,3,1.7]];
							systemchat 'Reward box created at your feet. Will detach in 5 seconds.';
							sleep 5;
							detach _crate;
							player reveal _crate;
							systemchat 'Box will despawn in 5 minutes or if you walk 50 meters away.';
							[_crate] call DZSQ_QuestBoxCleanup;
			} else {
			_result = [player,_rand_reward] call BIS_fnc_invAdd;
			if (_result) then {
				_result2 = [player,_rand_reward2] call BIS_fnc_invAdd;
				if (_result2) then {
					_result3 =  [player,_rand_reward3] call BIS_fnc_invAdd;
					if (_result3) then {
						systemchat format['Quest completed! You have received a %1, %2, and %3!',_rand_reward,_rand_reward2,_rand_reward3];
						if (_usehumanity) then {
							_newhero = _banditvalue - _heroamount;
							if (_newhero < 1) then {
								player setVariable ["banditKills",0,true];
							} else {
								player setVariable ["banditKills",_newhero,true];
							};
						};
						if (_usebandit) then {
							_newbandit = _murderkills - _banditamount;
							if (_newbandit < 1) then {
								player setVariable ["humanKills",0,true];
							} else {
								player setVariable ["humanKills",_newbandit,true];
							};
						};
						if (_usezombie) then {
							_newzombie = _zombiekills - _zombieamount;
							if (_newzombie < 1) then {
								player setVariable ["zombieKills",0,true];
							} else {
								player setVariable ["zombieKills",_newzombie,true];
							};
						};
						player setVariable [_reward_quest,1,true];
					} else {
						systemchat format['You did not have enough space in your inventory for a(n) %1.',_rand_reward3];
						[player,_rand_reward2] call BIS_fnc_invRemove;
						[player,_rand_reward] call BIS_fnc_invRemove;
					};
				} else {
					systemchat format['You did not have enough space in your inventory for a(n) %1.',_rand_reward2];
					[player,_rand_reward] call BIS_fnc_invRemove;
				};
			} else {
				systemchat format['You did not have enough space in your inventory for a(n) %1.',_rand_reward];
			};
		};
	};
		if (_reward_value == 2) then {
		
		_item1 = _reward_needed select 0;
		_item2 = _reward_needed select 1;
		_item3 = _reward_needed select 2;
		
		_remove = [player,_item1] call BIS_fnc_invRemove;
		if (_remove == 1) then {
		
		_remove2 = [player,_item2] call BIS_fnc_invRemove;
		if (_remove2 == 1) then {
		
		_remove3 = [player,_item3] call BIS_fnc_invRemove;
		if (_remove3 == 1) then {
		if (DZSQ_RewardBox) then {
				systemchat format['Quest completed! You have received a %1, %2, and %3!',_rand_reward,_rand_reward2,_rand_reward3];
						if (_usehumanity) then {
							_newhero = _banditvalue - _heroamount;
							if (_newhero < 1) then {
								player setVariable ["banditKills",0,true];
							} else {
								player setVariable ["banditKills",_newhero,true];
							};
						};
						if (_usebandit) then {
							_newbandit = _murderkills - _banditamount;
							if (_newbandit < 1) then {
								player setVariable ["humanKills",0,true];
							} else {
								player setVariable ["humanKills",_newbandit,true];
							};
						};
						if (_usezombie) then {
							_newzombie = _zombiekills - _zombieamount;
							if (_newzombie < 1) then {
								player setVariable ["zombieKills",0,true];
							} else {
								player setVariable ["zombieKills",_newzombie,true];
							};
						};
						player setVariable [_reward_quest,1,true];
						_crate = "AmmoBoxBig" createVehicle (position player);
							_crate setVariable ["Sarge",1,true];

							clearWeaponCargoGlobal _crate;
							clearMagazineCargoGlobal _crate;

							// add items
							_crate addMagazineCargoGlobal [_rand_reward, 1];
							_crate addMagazineCargoGlobal [_rand_reward2, 1];
							_crate addMagazineCargoGlobal [_rand_reward3, 1];

							_crate attachto [player, [0,3,1.7]];
							systemchat 'Reward box created at your feet. Will detach in 5 seconds.';
							sleep 5;
							detach _crate;
							player reveal _crate;
							systemchat 'Box will despawn in 5 minutes or if you walk 50 meters away.';
							[_crate] call DZSQ_QuestBoxCleanup;
		} else {
				_result = [player,_rand_reward] call BIS_fnc_invAdd;
				if (_result) then {
					_result2 = [player,_rand_reward2] call BIS_fnc_invAdd;
					if (_result2) then {
						_result3 =  [player,_rand_reward3] call BIS_fnc_invAdd;
						if (_result3) then {
							systemchat format['Quest completed! You have received a %1, %2, and %3!',_rand_reward,_rand_reward2,_rand_reward3];
							if (_usehumanity) then {
								_newhero = _banditvalue - _heroamount;
								if (_newhero < 1) then {
									player setVariable ["banditKills",0,true];
								} else {
									player setVariable ["banditKills",_newhero,true];
								};
							};
							if (_usebandit) then {
								_newbandit = _murderkills - _banditamount;
								if (_newbandit < 1) then {
									player setVariable ["humanKills",0,true];
								} else {
									player setVariable ["humanKills",_newbandit,true];
								};
							};
							if (_usezombie) then {
								_newzombie = _zombiekills - _zombieamount;
								if (_newzombie < 1) then {
									player setVariable ["zombieKills",0,true];
								} else {
									player setVariable ["zombieKills",_newzombie,true];
								};
							};
							player setVariable [_reward_quest,1,true];
						} else {
							systemchat format['You did not have enough space in your inventory for a(n) %1.',_rand_reward3];
							[player,_rand_reward2] call BIS_fnc_invRemove;
							[player,_rand_reward] call BIS_fnc_invRemove;
							[player,_item1] call BIS_fnc_invAdd;
							[player,_item2] call BIS_fnc_invAdd;
							[player,_item3] call BIS_fnc_invAdd;
						};
					} else {
						systemchat format['You did not have enough space in your inventory for a(n) %1.',_rand_reward2];
						[player,_rand_reward] call BIS_fnc_invRemove;
						[player,_item1] call BIS_fnc_invAdd;
						[player,_item2] call BIS_fnc_invAdd;
						[player,_item3] call BIS_fnc_invAdd;
					};
				} else {
					systemchat format['You did not have enough space in your inventory for a(n) %1.',_rand_reward];
					[player,_item1] call BIS_fnc_invAdd;
					[player,_item2] call BIS_fnc_invAdd;
					[player,_item3] call BIS_fnc_invAdd;
				};
				};
			} else {
				systemchat format['You were missing %1 from your inventory.',_item3];
				[player,_item1] call BIS_fnc_invAdd;
				[player,_item2] call BIS_fnc_invAdd;
			};
			} else {
				systemchat format['You were missing %1 from your inventory.',_item2];
				[player,_item1] call BIS_fnc_invAdd;
			};
			} else {
				systemchat format['You were missing %1 from your inventory.',_item1];
			};
		};
	if (_reward_value == 1) then {

		// single item needed for reward
		_result0 = [player,_reward_needed] call BIS_fnc_invRemove;
		if (_result0 == 1) then {
			if (DZSQ_RewardBox) then {
				systemchat format['Quest completed! You have received a %1, %2, and %3!',_rand_reward,_rand_reward2,_rand_reward3];
						if (_usehumanity) then {
							_newhero = _banditvalue - _heroamount;
							if (_newhero < 1) then {
								player setVariable ["banditKills",0,true];
							} else {
								player setVariable ["banditKills",_newhero,true];
							};
						};
						if (_usebandit) then {
							_newbandit = _murderkills - _banditamount;
							if (_newbandit < 1) then {
								player setVariable ["humanKills",0,true];
							} else {
								player setVariable ["humanKills",_newbandit,true];
							};
						};
						if (_usezombie) then {
							_newzombie = _zombiekills - _zombieamount;
							if (_newzombie < 1) then {
								player setVariable ["zombieKills",0,true];
							} else {
								player setVariable ["zombieKills",_newzombie,true];
							};
						};
						player setVariable [_reward_quest,1,true];
						_crate = "AmmoBoxBig" createVehicle (position player);
							_crate setVariable ["Sarge",1,true];

							clearWeaponCargoGlobal _crate;
							clearMagazineCargoGlobal _crate;

							// add items
							_crate addMagazineCargoGlobal [_rand_reward, 1];
							_crate addMagazineCargoGlobal [_rand_reward2, 1];
							_crate addMagazineCargoGlobal [_rand_reward3, 1];

							_crate attachto [player, [0,3,1.7]];
							systemchat 'Reward box created at your feet. Will detach in 5 seconds.';
							sleep 5;
							detach _crate;
							player reveal _crate;
							systemchat 'Box will despawn in 5 minutes or if you walk 50 meters away.';
							[_crate] call DZSQ_QuestBoxCleanup;
			} else {
			_result = [player,_rand_reward] call BIS_fnc_invAdd;
			if (_result) then {
				_result2 = [player,_rand_reward2] call BIS_fnc_invAdd;
				if (_result2) then {
					_result3 =  [player,_rand_reward3] call BIS_fnc_invAdd;
					if (_result3) then {
						systemchat format['Quest completed! You have received a %1, %2, and %3!',_rand_reward,_rand_reward2,_rand_reward3];
						if (_usehumanity) then {
							_newhero = _banditvalue - _heroamount;
							if (_newhero < 1) then {
								player setVariable ["banditKills",0,true];
							} else {
								player setVariable ["banditKills",_newhero,true];
							};
						};
						if (_usebandit) then {
							_newbandit = _murderkills - _banditamount;
							if (_newbandit < 1) then {
								player setVariable ["humanKills",0,true];
							} else {
								player setVariable ["humanKills",_newbandit,true];
							};
						};
						if (_usezombie) then {
							_newzombie = _zombiekills - _zombieamount;
							if (_newzombie < 1) then {
								player setVariable ["zombieKills",0,true];
							} else {
								player setVariable ["zombieKills",_newzombie,true];
							};
						};
						player setVariable [_reward_quest,1,true];
					} else {
						systemchat format['You did not have enough space in your inventory for a(n) %1.',_rand_reward3];
						[player,_rand_reward2] call BIS_fnc_invRemove;
						[player,_rand_reward] call BIS_fnc_invRemove;
					};
				} else {
					systemchat format['You did not have enough space in your inventory for a(n) %1.',_rand_reward2];
					[player,_rand_reward] call BIS_fnc_invRemove;
				};
			} else {
				systemchat format['You did not have enough space in your inventory for a(n) %1.',_rand_reward];
			};
			};
		} else {
			systemchat format['You were missing %1 from your inventory.',_reward_needed];
		};
		};
};
