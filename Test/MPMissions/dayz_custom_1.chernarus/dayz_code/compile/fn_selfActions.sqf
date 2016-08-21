scriptName "Functions\misc\fn_selfActions.sqf";
/***********************************************************
	ADD ACTIONS FOR SELF
	- Function
	- [] call fnc_usec_selfActions;
************************************************************/
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_cursorTarget = cursorTarget;
_primaryWeapon = primaryWeapon player;
_currentWeapon = currentWeapon player;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
//_canDrink = count nearestObjects [getPosATL player, ["Land_pumpa","Land_water_tank"], 2] > 0;

_nearLight = nearestObject [player,"LitObject"];
_canPickLight = false;

if (!isNull _nearLight) then {
	if (_nearLight distance player < 4) then {
		_canPickLight = isNull (_nearLight getVariable ["owner",objNull]);
	};
};

_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);

_isCopcar = typeOf _vehicle in ["LadaLM","HMMWV_Ambulance","HMMWV_Ambulance_CZ_DES_EP1","S1203_ambulance_EP1","GAZ_Vodnik_MedEvac","policecar"];
if (_inVehicle and _isCopcar and (driver _vehicle == player)) then {
	dayz_siren_vehicle = _vehicle;
	if (s_player_sirens_on < 0) then {
		s_player_sirens_on = dayz_siren_vehicle addAction ["Toggle Siren","Scripts\siren_on.sqf",dayz_siren_vehicle,2,false,true,"",""];
	};
} else {
	dayz_siren_vehicle removeAction s_player_sirens_on;
	s_player_sirens_on = -1;
};
//Grab Flare
if (_canPickLight and !dayz_hasLight) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};

if (s_player_equip_carry < 0) then
{
	if (dayz_onBack != "" && { !_inVehicle && { !_onLadder && { !r_player_unconscious } } }) then
	{
		dz_plr_carryActionItem = dayz_onBack;
		_text = getText (configFile >> "CfgWeapons" >> dz_plr_carryActionItem >> "displayName");
		s_player_equip_carry = player addAction [
			format [localize "STR_ACTIONS_WEAPON", _text],
			"\z\addons\dayz_code\actions\player_switchWeapon_action.sqf",
			nil, 0.5, false, true];
	};
}
else
{
	if (dayz_onBack != dz_plr_carryActionItem || { _inVehicle || { _onLadder || { r_player_unconscious } } } ) then
	{
		player removeAction s_player_equip_carry;
		s_player_equip_carry = -1;
	};
};

/*if (dayz_onBack != "" /*&& !dayz_onBackActive && !_inVehicle && !_onLadder && !r_player_unconscious) then {
	if (s_player_equip_carry < 0) then {
		_text = getText (configFile >> "CfgWeapons" >> dayz_onBack >> "displayName");
		s_player_equip_carry = player addAction [format[localize "STR_ACTIONS_WEAPON", _text], "\z\addons\dayz_code\actions\player_switchWeapon_action.sqf", nil, 0.5, false, true];
	};
} else {
	player removeAction s_player_equip_carry;
	s_player_equip_carry = -1;
};*/

//fishing
if ((_currentWeapon in Dayz_fishingItems) && !dayz_fishingInprogress && !_inVehicle && !dayz_isSwimming) then {
	if (s_player_fishing < 0) then {
		s_player_fishing = player addAction [localize "STR_ACTION_CAST", "\z\addons\dayz_code\actions\player_goFishing.sqf",player, 0.5, false, true];
	};
} else {
	player removeAction s_player_fishing;
	s_player_fishing = -1;
};
if ((_primaryWeapon in Dayz_fishingItems) && !dayz_fishingInprogress && (_inVehicle and (driver _vehicle != player))) then {
	if (s_player_fishing_veh < 0) then {
		s_player_fishing_veh = _vehicle addAction [localize "STR_ACTION_CAST", "\z\addons\dayz_code\actions\player_goFishing.sqf",_vehicle, 0.5, false, true];
	};
} else {
	_vehicle removeAction s_player_fishing_veh;
	s_player_fishing_veh = -1;
};

_canDoThis=false;
if (_canDo and !_inVehicle and !dayz_isSwimming) then {
	{
        _waterHoles = if (typeOf _x == "waterHoleProxy") then {nearestObjects [_x, [], 1];} else {[_x];};
		{
            _w2m = _x worldToModel (getPosATL player);
            _bb = (boundingbox _x) select 1;
            _dir = [player, _x] call BIS_fnc_relativeDirTo; if (_dir > 180) then {_dir = _dir - 360};
            if (((abs _dir < 45) and {(_x distance player < 2.22)})  // wells, kasna, pumpa
            	or {((("" == typeOf _x) and ((_w2m select 2) < 0.05)) and {((abs(_w2m select 0) < (_bb select 0)) and (abs(_w2m select 1) < (_bb select 1)))})}) exitWith { // ponds
				_canDoThis = true;
			};
		} count _waterHoles;
		if (_canDoThis) exitWith {
			if (s_player_Drinkfromhands < 0) then {
				s_player_Drinkfromhands = player addAction [localize "str_player_31_drink", "\z\addons\dayz_code\actions\player_drinkWater.sqf",player, 0.5, false, true];
			};
		};
	} foreach nearestObjects [player, ["waterHoleProxy", "Land_pumpa"], 50];
};
if (!_canDoThis and s_player_Drinkfromhands >= 0) then {
	player removeAction s_player_Drinkfromhands;
	s_player_Drinkfromhands = -1;
};

if (!isNull _cursorTarget and !_inVehicle and (player distance _cursorTarget < 4) and _canDo) then { 
//Has some kind of target
	_isVehicle = _cursorTarget isKindOf "AllVehicles";
	_isBicycle = _cursorTarget isKindOf "Bicycle";
	_isMan = _cursorTarget isKindOf "Man";
	_isAnimal = _cursorTarget isKindOf "Animal";
	_isZombie = _cursorTarget isKindOf "zZombie_base";
	_isDestructable = _cursorTarget isKindOf "BuiltItems";
	//_isTent = _cursorTarget isKindOf "TentStorage";
	//_isStash = _cursorTarget isKindOf "StashSmall";
	//_isMediumStash = _cursorTarget isKindOf "StashMedium";
	_isHarvested = _cursorTarget getVariable["meatHarvested",false];
	_isGenerator = _cursorTarget isKindOf "Generator_DZ";
	_ownerID = _cursorTarget getVariable ["characterID","0"];
	_isVehicletype = typeOf _cursorTarget in ["ATV_US_EP1","ATV_CZ_EP1"];
	_isFuel = false;
	_hasFuel20 = "ItemJerrycan" in magazines player;
	_hasFuel5 = "ItemFuelcan" in magazines player;
	_hasEmptyFuelCan = (("ItemJerrycanEmpty" in magazines player) || ("ItemFuelcanEmpty" in magazines player));
	_hasToolbox = "ItemToolbox" in items player;
	_hasGutTool = "ItemKnife" in items player;
	_hasbottleitem = (("ItemWaterBottle" in magazines player) || ("ItemWaterBottleInfected" in magazines player) || ("ItemWaterBottleSafe" in magazines player));
	_isAlive = alive _cursorTarget;
	_canmove = canmove _cursorTarget;
	_text = getText (configFile >> "CfgVehicles" >> typeOf _cursorTarget >> "displayName");
	_isPlant = typeOf _cursorTarget in Dayz_plants;
	_istypeTent = (_cursorTarget isKindOf "TentStorage_base") or (_cursorTarget isKindOf "IC_Tent");
	_upgradeItems = ["TentStorage","TentStorage0","TentStorage1","TentStorage2","TentStorage3","StashSmall","StashSmall1","StashSmall2","StashSmall3","StashSmall4","StashMedium","StashMedium1","StashMedium2","StashMedium3","DomeTentStorage","DomeTentStorage0","DomeTentStorage1","DomeTentStorage2","DomeTentStorage3","DomeTentStorage4"];

	_isCampSite = _cursorTarget isKindOf "IC_Fireplace1";

	//fuel tanks
	if (_hasEmptyFuelCan) then {
		//_isFuel = typeOf _cursorTarget in ["Land_Ind_TankSmall","Land_fuel_tank_big","Land_fuel_tank_stairs","Land_wagon_tanker","Land_fuelstation","Land_fuelstation_army"];
		_isFuel = (_cursorTarget isKindOf "Land_Ind_TankSmall") or (_cursorTarget isKindOf "Land_fuel_tank_big") or (_cursorTarget isKindOf "Land_fuel_tank_stairs") or (_cursorTarget isKindOf "Land_wagon_tanker");
	};

	//remove gathered plant if empty 
	if(_isPlant) then {
		_cursorTarget call player_gather;
	};
	
	//-----------ARREST----------------
	_side = side _cursorTarget == west; //so only Players can be detained
	_string = "equip_string" in magazines player;
	if (player getVariable "Detain" == 1) then {
	player removeAction s_player_arrest;
	};
	if(_isMan && !_isZombie && _canDo && _isAlive && !_isAnimal && _string && _side) then {
		if (_cursorTarget getVariable "Detain" == 1) exitWith {};
            if (s_player_arrest < 0) then {
                s_player_arrest = player addaction [("<t color=""#0074E8"">" + ("Detain") +"</t>"), "Scripts\arrest\Detain.sqf",_cursorTarget,100,false,true,"", ""];
                };
        } else {
            player removeAction s_player_arrest;
            s_player_arrest = -1;
    };
	if ((_cursorTarget getVariable "Detain" == 1) && cursorTarget distance player < 2 && _isMan && !_isZombie && _canDo && _isAlive) then {
            if (s_player_escort < 0) then {
                s_player_escort = player addaction [("<t color=""#0074E8"">" + ("Escort") +"</t>"), "Scripts\arrest\Escort.sqf",_cursorTarget, 1, true, true, "", ""];
            };
            if (s_player_search < 0) then {
                s_player_search = player addaction [("<t color=""#0074E8"">" + ("Search") +"</t>"), "Scripts\arrest\search.sqf",_cursorTarget, 1, true, true, "", ""];
            };
            if (s_player_release < 0) then {
                s_player_release = player addaction [("<t color=""#0074E8"">" + ("Release") +"</t>"), "Scripts\arrest\release.sqf",_cursorTarget, 1, true, true, "", ""];
            };
	} else {
			player removeAction s_player_release;
            s_player_release = -1;
			player removeAction s_player_search;
            s_player_search = -1;
			player removeAction s_player_escort;
            s_player_escort = -1;
	};
	//-----------ARREST----------------
	
	//flip vehicle
	if ((_isVehicletype) and !_canmove and _isAlive and (player distance _cursorTarget >= 2) and (count (crew _cursorTarget))== 0 and ((vectorUp _cursorTarget) select 2) < 0.5) then {
		if (s_player_flipveh < 0) then {
			s_player_flipveh = player addAction [format[localize "str_actions_flipveh",_text], "\z\addons\dayz_code\actions\player_flipvehicle.sqf",_cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_flipveh;
		s_player_flipveh = -1;
	};
	
	//Allow player to fill Fuel can
	if(_hasEmptyFuelCan and _isFuel and !_isZombie and !_isAnimal and !_isMan and !a_player_jerryfilling) then {
		if (s_player_fillfuel < 0) then {
			s_player_fillfuel = player addAction [localize "str_actions_self_10", "\z\addons\dayz_code\actions\jerry_fill.sqf",[], 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_fillfuel;
		s_player_fillfuel = -1;
	};
	
	if (damage _cursorTarget < 1) then {
		//Allow player to fill vehicle 20L
		if(_hasFuel20 and !_isZombie and !_isAnimal and !_isMan and (_isVehicle or _isGenerator) and (fuel _cursorTarget < 1) and !a_player_jerryfilling) then {
			if (s_player_fillfuel20 < 0) then {
				s_player_fillfuel20 = player addAction [format[localize "str_actions_medical_10",_text,"20"], "\z\addons\dayz_code\actions\refuel.sqf",["ItemJerrycan"], 0, true, true, "", "'ItemJerrycan' in magazines player"];
			};
		} else {
			player removeAction s_player_fillfuel20;
			s_player_fillfuel20 = -1;
		};

		//Allow player to fill vehicle 5L
		if(_hasFuel5 and !_isZombie and !_isAnimal and !_isMan and (_isVehicle or _isGenerator) and (fuel _cursorTarget < 1) and !a_player_jerryfilling) then {
			if (s_player_fillfuel5 < 0) then {
				s_player_fillfuel5 = player addAction [format[localize "str_actions_medical_10",_text,"5"], "\z\addons\dayz_code\actions\refuel.sqf",["ItemFuelcan"], 0, true, true, "", "'ItemFuelcan' in magazines player"];
			};
		} else {
			player removeAction s_player_fillfuel5;
			s_player_fillfuel5 = -1;
		};
		/*
		//power on Gen
		if (_isGenerator AND (fuel _cursorTarget > 0)) then {
			player action["EngineOn", _cursorTarget];
		};
		*/
		//
		//Allow player to spihon vehicles
		if (_hasEmptyFuelCan and !_isZombie and !_isAnimal and !_isMan and _isVehicle and !_isBicycle and !a_player_jerryfilling and (fuel _cursorTarget > 0)) then {
			if (s_player_siphonfuel < 0) then {
				s_player_siphonfuel = player addAction [format[localize "str_siphon_start"], "dayz_code\actions\siphonFuel.sqf",_cursorTarget, 0, true, true, "", ""];
			};
		} else {
			player removeAction s_player_siphonfuel;
			s_player_siphonfuel = -1;
		};
	} else {
		player removeAction s_player_fillfuel20;
		s_player_fillfuel20 = -1;
		player removeAction s_player_fillfuel5;
		s_player_fillfuel5 = -1;	
		player removeAction s_player_siphonfuel;
		s_player_siphonfuel = -1;
	};
	
	//Harvested
	if (!alive _cursorTarget and _isAnimal and !_isHarvested) then {
		//_hasknife = {_x in ["ItemKnife","ItemKnife5","ItemKnife4","ItemKnife3","ItemKnife2","ItemKnifeBlunt"]} count items player > 0;
		//make sure the player has a knife
		//if (_hasknife) then {
		if (s_player_butcher < 0) then {
			s_player_butcher = player addAction [localize "str_actions_self_04", "\z\addons\dayz_code\actions\gather_meat.sqf",_cursorTarget, 3, true, true, "", ""];
		};
		//} else {
		//	player removeAction s_player_butcher;
		//	s_player_butcher = -1;
		//};
	} else {
		player removeAction s_player_butcher;
		s_player_butcher = -1;
	};
	
	//Fireplace Actions check
	if ((_cursorTarget call isInflamed) or (inflamed _cursorTarget)) then {
		_hasRawMeat = {_x in Dayz_meatraw} count magazines player > 0;
		_hastinitem = {_x in boil_tin_cans} count magazines player > 0;
		
	//Cook Meat	
		if (_hasRawMeat and !a_player_cooking) then {
			if (s_player_cook < 0) then {
				s_player_cook = player addAction [localize "str_actions_self_05", "\z\addons\dayz_code\actions\cook.sqf",_cursorTarget, 3, true, true, "", ""];
			};
		}; 
	//Boil Water
		if (_hastinitem and _hasbottleitem and !a_player_boil) then {
			if (s_player_boil < 0) then {
				s_player_boil = player addAction [localize "str_actions_boilwater", "\z\addons\dayz_code\actions\boil.sqf",_cursorTarget, 3, true, true, "", ""];
			};
		};
	} else {
		if (a_player_cooking) then {
			player removeAction s_player_cook;
			s_player_cook = -1;
		};
		if (a_player_boil) then {
			player removeAction s_player_boil;
			s_player_boil = -1;
		};
	};
	
//	Not needed.
/*
	if(_cursorTarget == dayz_hasFire) then {
		if ((s_player_fireout < 0) and !(_cursorTarget call isInflamed) and (player distance _cursorTarget < 3)) then {
			s_player_fireout = player addAction [localize "str_actions_self_06", "\z\addons\dayz_code\actions\fire_pack.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_fireout;
		s_player_fireout = -1;
	};
*/

	//remove Own objects
	if (_ownerID == dayz_characterID) then {
		if(_isDestructable and _hasToolbox) then {
			if (s_player_deleteBuild < 0) then {
				s_player_deleteBuild = player addAction [format[localize "str_actions_delete",_text], "\z\addons\dayz_code\actions\remove.sqf",_cursorTarget, 1, true, true, "", ""];
			};
		} else {
			player removeAction s_player_deleteBuild;
			s_player_deleteBuild = -1;
		};
		
		//upgrade items
		if (typeOf _cursorTarget in _upgradeItems) then {
			if (s_player_upgradestroage < 0) then {
				if (isText (configFile >> "CfgVehicles" >> (typeof _cursorTarget) >> "Upgrade" >> "create")) then {
					_displayName = getText (configFile >> "CfgVehicles" >> (typeOf _cursorTarget) >> "displayName");
					s_player_upgradestroage = player addAction [format[localize "str_upgrade",_displayName], "\z\addons\dayz_code\actions\object_upgradeStorage.sqf",_cursorTarget, 0, false, true, "",""];
				};
			};
		} else {
			player removeAction s_player_upgradestroage;
			s_player_upgradestroage = -1
		};
		if (_istypeTent) then {
			if (_ownerID == dayz_characterID) then {
				//Packing my tent
				if (s_player_packtent < 0) then {
					s_player_packtent = player addAction [localize "str_actions_self_07", "\z\addons\dayz_code\actions\tent_pack.sqf",_cursorTarget, 0, false, true, "",""];
				};
				//sleep
				if (s_player_sleep < 0) then {
					s_player_sleep = player addAction [localize "str_actions_self_sleep", "\z\addons\dayz_code\actions\player_sleep.sqf",_cursorTarget, 0, false, true, "",""];
				};
			};
		} else {
			player removeAction s_player_packtent;
			s_player_packtent = -1;
			player removeAction s_player_sleep;
			s_player_sleep = -1;
		};
	} else {
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = -1;
		player removeAction s_player_upgradestroage;
		s_player_upgradestroage = -1;
		player removeAction s_player_packtent;
		s_player_packtent = -1;
		player removeAction s_player_sleep;
		s_player_sleep = -1;
	};
	// Lotto Reward 1
	if (!_isMan && !_isZombie && !_isAnimal) then {
		if ((_cursortarget getvariable ["LottoReward",0]) == 1 || (_cursortarget getvariable ["LottoReward",0]) == 2) then {
			if (s_player_lottoreward1 < 0) then {
				s_player_lottoreward1 = player addAction [format["Lottery Reward (Uses: %1)",_cursortarget getVariable "LottoUses"], "lotto\lottoreward.sqf",_cursortarget, 1, false, true, "", ""];
			};
		};
	} else {
		player removeAction s_player_lottoreward1;
		s_player_lottoreward1 = -1;
	};
	// q1
	if (_isMan && !_isZombie && !_isAnimal && ((_cursortarget getvariable ["quest1",0]) == 1)) then {
		if (s_player_quest1 < 0) then {
			s_player_quest1 = player addaction [("<t color=""#0074E8"">" + ("Quest Menu") +"</t>"),"DZSQ\QuestFn.sqf","Antibiotic",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_quest1;
		s_player_quest1 = -1;
	};
	// q2
	if (_isMan && !_isZombie && !_isAnimal && ((_cursortarget getvariable ["quest2",0]) == 1)) then {
		if (s_player_quest2 < 0) then {
			s_player_quest2 = player addaction [("<t color=""#0074E8"">" + ("Quest Menu") +"</t>"),"DZSQ\QuestFn.sqf","Zombie",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_quest2;
		s_player_quest2 = -1;
	};
	// q3
	if (_isMan && !_isZombie && !_isAnimal && ((_cursortarget getvariable ["quest3",0]) == 1)) then {
		if (s_player_quest3 < 0) then {
			s_player_quest3 = player addaction [("<t color=""#0074E8"">" + ("Quest Menu") +"</t>"),"DZSQ\QuestFn.sqf","Boat",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_quest3;
		s_player_quest3 = -1;
	};
	// q4
	if (_isMan && !_isZombie && !_isAnimal && ((_cursortarget getvariable ["quest4",0]) == 1)) then {
		if (s_player_quest4 < 0) then {
			s_player_quest4 = player addaction [("<t color=""#0074E8"">" + ("Quest Menu") +"</t>"),"DZSQ\QuestFn.sqf","Bandit",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_quest4;
		s_player_quest4 = -1;
	};
	// q5
	if (_isMan && !_isZombie && !_isAnimal && ((_cursortarget getvariable ["quest5",0]) == 1)) then {
		if (s_player_quest5 < 0) then {
			s_player_quest5 = player addaction [("<t color=""#0074E8"">" + ("Quest Menu") +"</t>"),"DZSQ\QuestFn.sqf","Hero",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_quest5;
		s_player_quest5 = -1;
	};
	// q6
	if (_isMan && !_isZombie && !_isAnimal && ((_cursortarget getvariable ["quest6",0]) == 1)) then {
		if (s_player_quest6 < 0) then {
			s_player_quest6 = player addaction [("<t color=""#0074E8"">" + ("Quest Menu") +"</t>"),"DZSQ\QuestFn.sqf","Lumber",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_quest6;
		s_player_quest6 = -1;
	};
	// q7
	if (_isMan && !_isZombie && !_isAnimal && ((_cursortarget getvariable ["quest7",0]) == 1)) then {
		if (s_player_quest7 < 0) then {
			s_player_quest7 = player addaction [("<t color=""#0074E8"">" + ("Quest Menu") +"</t>"),"DZSQ\QuestFn.sqf","Bounty",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_quest7;
		s_player_quest7 = -1;
	};
	// q8
	if (_isMan && !_isZombie && !_isAnimal && ((_cursortarget getvariable ["quest8",0]) == 1)) then {
		if (s_player_quest8 < 0) then {
			s_player_quest8 = player addaction [("<t color=""#0074E8"">" + ("Quest Menu") +"</t>"),"DZSQ\QuestFn.sqf","Construction",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_quest8;
		s_player_quest8 = -1;
	};
	// q9
	if (_isMan && !_isZombie && !_isAnimal && ((_cursortarget getvariable ["quest9",0]) == 1)) then {
		if (s_player_quest9 < 0) then {
			s_player_quest9 = player addaction [("<t color=""#0074E8"">" + ("Quest Menu") +"</t>"),"DZSQ\QuestFn.sqf","Race",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_quest9;
		s_player_quest9 = -1;
	};
	if (_isMan && !_isZombie && !_isAnimal && ((_cursortarget getvariable ["quest10",0]) == 1) && !_isAlive) then {
		if (s_player_quest10 < 0) then {
			s_player_quest10 = player addaction [("<t color=""#0074E8"">" + ("Quest: Search Body") +"</t>"),"DZSQ\QuestFn.sqf","Claim",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_quest10;
		s_player_quest10 = -1;
	};
	//other tents
	if (_istypeTent) then {
		//destroy tents
		//Located in variables Dayz_Ignators = ["ItemMatchbox","Item5Matchbox","Item4Matchbox","Item3Matchbox","Item2Matchbox","Item1Matchbox"];
		_hasIgnators = {_x in Dayz_Ignators} count items player > 0;
		if ((_hasFuel20 or _hasFuel5) AND (_hasIgnators)) then {
			if (s_player_destorytent < 0) then {
				s_player_destorytent = player addAction [localize "str_actions_self_destorytent", "\z\addons\dayz_code\actions\player_destroyTent.sqf",_cursorTarget, 0, false, true, "",""];
			};
		} else {
			player removeAction s_player_destorytent;
			s_player_destorytent = -1;
		};
		
		if (typeOf _cursorTarget in ["IC_DomeTent","IC_Tent"]) then {
			if (s_player_packtentinfected < 0) then {
				s_player_packtentinfected = player addAction [localize "str_actions_self_07", "\z\addons\dayz_code\actions\tent_pack.sqf",_cursorTarget, 0, false, true, "",""];
			};
		} else {
			player removeAction s_player_packtentinfected;
			s_player_packtentinfected = -1;
		};
	};
					
	//Study Body
	if (_isMan and !_isAlive and !_isZombie and !_isAnimal) then {
		if (s_player_studybody < 0) then {
			s_player_studybody = player addAction [localize "str_action_studybody", "\z\addons\dayz_code\actions\study_body.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_studybody;
		s_player_studybody = -1;
	};
/*	
	//Carbomb
	_hasCarBomb = "ItemCarBomb" in magazines player;
	if (((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Air") || (cursorTarget isKindOf "Motorcycle")) and _hasCarBomb) then {
		if (s_player_attach_bomb < 0) then {
			s_player_attach_bomb = player addAction [localize "str_bombAttach", "\z\addons\dayz_code\actions\player_attach_bomb.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
			player removeAction s_player_attach_bomb;
			s_player_attach_bomb = -1;
	};
*/	
	_clothesTaken = _cursorTarget getVariable["clothesTaken",false];
	// Take clothes by Zabn
    if (_isMan and !_isAlive and !_isZombie and !_clothesTaken) then {
        if (s_player_clothes < 0) then {
            s_player_clothes = player addAction [("<t color='#0096ff'>")+("Take Clothes")+("</t>"), "Scripts\player_takeClothes_v2.sqf",_cursorTarget, -10, false, true, "",""];
        };
    } else {
        player removeAction s_player_clothes;
        s_player_clothes = -1;
    };
	
	_meatTaken = _cursorTarget getVariable["canibalize",false];
	if (_isMan and !_isAlive and !_isZombie and !_meatTaken and _hasGutTool) then {
        if (s_player_canibalize < 0) then {
            s_player_canibalize = player addAction [("<t color='#0096ff'>")+("Gut Body")+("</t>"), "Scripts\gather_meat_Human.sqf",_cursorTarget, -10, false, true, "",""];
        };
    } else {
        player removeAction s_player_canibalize;
        s_player_canibalize = -1;
    };
	
	//Repairing Vehicles
	if ((dayz_myCursorTarget != _cursorTarget) and _isVehicle and !_isMan and _hasToolbox and (damage _cursorTarget < 1)) then {		
		if (s_player_repair_crtl < 0) then {
			dayz_myCursorTarget = _cursorTarget;
			_menu = dayz_myCursorTarget addAction [localize "str_actions_rapairveh", "\z\addons\dayz_code\actions\repair_vehicle.sqf",_cursorTarget, 0, true, false, "",""];
			_menu1 = dayz_myCursorTarget addAction [localize "str_actions_salvageveh", "\z\addons\dayz_code\actions\salvage_vehicle.sqf",_cursorTarget, 0, true, false, "",""];
			s_player_repairActions set [count s_player_repairActions,_menu];
			s_player_repairActions set [count s_player_repairActions,_menu1];
			s_player_repair_crtl = 1;
		} else {
			{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;
			s_player_repairActions = [];
			s_player_repair_crtl = -1;
		};
	};
	
	// House locking and unlocking
	_isHouse = (typeOf cursorTarget) in ["SurvivorWorkshopAStage5", "SurvivorWorkshopBStage5", "SurvivorWorkshopCStage5"];
	_isGate = (typeOf cursorTarget) in ["WoodenGate_1","WoodenGate_2","WoodenGate_3","WoodenGate_4","MetalGate_1","MetalGate_2","MetalGate_3","MetalGate_4"];
	_isFence = (typeOf cursorTarget) in ["WoodenFence_1","WoodenFence_2","WoodenFence_3","WoodenFence_4","WoodenFence_5","WoodenFence_6","MetalFence_1","MetalFence_2","MetalFence_3","MetalFence_4","MetalFence_5","MetalFence_6","MetalFence_7"];

	//Only the owners can lock the gates
	_isLockableGate = (typeOf cursorTarget) in ["WoodenGate_2","WoodenGate_3","WoodenGate_4","MetalGate_2","MetalGate_3","MetalGate_4"];
	_isUnlocked = cursorTarget getVariable ["isOpen","0"] == "1";

	//Allow the gates to be opened when not locked by anyone
	_isOpen = ((cursorTarget animationPhase "DoorL") == 1) || ((cursorTarget animationPhase "DoorR") == 1);
	_isClosed = ((cursorTarget animationPhase "DoorL") == 0) || ((cursorTarget animationPhase "DoorR") == 0);
	
	//[["ownerArray",["PID"]]]
	_ownerArray = _cursorTarget getVariable ["ownerArray",["0"]];
	
	_ownerBuildLock = _cursorTarget getVariable ["BuildLock",false];
	
	_ownerPID = (_ownerArray select 0);
	
	// open Gate
	if (_isGate and _isClosed and _isUnlocked and _canDo) then {
		if (s_player_openGate < 0) then {
			s_player_openGate = player addAction ["Open Gate", "\z\addons\dayz_code\actions\player_operate.sqf",[cursorTarget,"Open"], 1, true, true, "", ""];
		}
	} else {
		player removeAction s_player_openGate;
		s_player_openGate = -1;
	};
	// Close Gate
	if (_isGate and _isOpen and _isUnlocked and _canDo) then {
		if (s_player_CloseGate < 0) then {
			s_player_CloseGate = player addAction ["Close Gate", "\z\addons\dayz_code\actions\player_operate.sqf",[cursorTarget,"Close"], 1, true, true, "", ""];
		}
	} else {
		player removeAction s_player_CloseGate;
		s_player_CloseGate = -1;
	};
	// Set
	if ((_isHouse or _isLockableGate) and (_ownerPID == (getPlayerUID player)) and !_isUnlocked and _isClosed and _canDo) then {
		if (s_player_setCode < 0) then {
			s_player_setCode = player addAction ["Set Lock Code", "\z\addons\dayz_code\actions\player_operate.sqf",[cursorTarget,"Set"], 1, true, true, "", ""];
		}
	} else {
		player removeAction s_player_setCode;
		s_player_setCode = -1;
	};
	//Lock Build point
	if ((_isFence or _isGate) and (_ownerPID == (getPlayerUID player)) and !_ownerBuildLock and _canDo) then {
		if (s_player_BuildLock < 0) then {
			s_player_BuildLock = player addAction ["Lock Build", "\z\addons\dayz_code\actions\player_operate.sqf",[cursorTarget,"BuildLock"], 1, true, true, "", ""];
		}
	} else {
		player removeAction s_player_BuildLock;
		s_player_BuildLock = -1;
	};
	//UnLock Build point
	if ((_isFence or _isGate) and (_ownerPID == (getPlayerUID player)) and _ownerBuildLock and _canDo) then {
		if (s_player_BuildUnLock < 0) then {
			s_player_BuildUnLock = player addAction ["UnLock Build", "\z\addons\dayz_code\actions\player_operate.sqf",[cursorTarget,"BuildUnLock"], 1, true, true, "", ""];
		}
	} else {
		player removeAction s_player_BuildUnLock;
		s_player_BuildUnLock = -1;
	};
	// Unlock Gate/House
	if ((_isHouse or _isLockableGate) and !_isUnlocked and _isClosed and _canDo) then {
		if (s_player_unlockhouse < 0) then {
			s_player_unlockhouse = player addAction ["Unlock Gate", "\z\addons\dayz_code\actions\player_operate.sqf",[cursorTarget,"Unlock"], 1, true, true, "", ""];
		}
	} else {
		player removeAction s_player_unlockhouse;
		s_player_unlockhouse = -1;
	};
	// Lock Gate/House
	if ((_isHouse or _isLockableGate) and _isUnlocked and _isClosed and _canDo) then {
		if (s_player_lockhouse < 0) then {
			s_player_lockhouse = player addAction ["Lock Gate", "\z\addons\dayz_code\actions\player_operate.sqf",[cursorTarget,"Lock"], 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_lockhouse;
		s_player_lockhouse = -1;
	};
	//Break In
	if ((_isHouse or _isLockableGate) and (_ownerPID != (getPlayerUID player)) and !_isUnlocked and _canDo) then {
		if (s_player_breakinhouse < 0) then {
			s_player_breakinhouse = player addAction ["Break In", "\z\addons\dayz_code\actions\player_breakin.sqf",cursorTarget, 1, true, true, "", ""];
		}
	} else {
		player removeAction s_player_breakinhouse;
		s_player_breakinhouse = -1;
	};
	
	
} else {
	//Engineering
	{dayz_myCursorTarget removeAction _x} count s_player_repairActions;s_player_repairActions = [];
	player removeAction s_player_repair_crtl;
	s_player_repair_crtl = -1;
	dayz_myCursorTarget = objNull;
	//Others
	//player removeAction s_player_forceSave;
	//s_player_forceSave = -1;
	player removeAction s_player_flipveh;
	s_player_flipveh = -1;
	player removeAction s_player_sleep;
	s_player_sleep = -1;
	player removeAction s_player_deleteBuild;
	s_player_deleteBuild = -1;
	player removeAction s_player_butcher;
	s_player_butcher = -1;
	player removeAction s_player_cook;
	s_player_cook = -1;
	player removeAction s_player_boil;
	s_player_boil = -1;
	player removeAction s_player_fireout;
	s_player_fireout = -1;
	player removeAction s_player_packtent;
	s_player_packtent = -1;
	player removeAction s_player_packtentinfected;
	s_player_packtentinfected = -1;
	player removeAction s_player_fillfuel;
	s_player_fillfuel = -1;
	player removeAction s_player_studybody;
	s_player_studybody = -1;
	player removeAction s_player_quest2;
	s_player_quest2 = -1;
	player removeAction s_player_quest1;
	s_player_quest1 = -1;
	player removeAction s_player_lottoreward1;
	s_player_lottoreward1 = -1;
	player removeAction s_player_quest3;
	s_player_quest3 = -1;
	player removeAction s_player_quest4;
	s_player_quest4 = -1;
	player removeAction s_player_quest5;
	s_player_quest5 = -1;
	player removeAction s_player_quest6;
	s_player_quest6 = -1;
	player removeAction s_player_quest7;
	s_player_quest7 = -1;
	player removeAction s_player_quest8;
	s_player_quest8 = -1;
	player removeAction s_player_quest9;
	s_player_quest9 = -1;
	player removeAction s_player_quest10;
	s_player_quest10 = -1;
	//fuel
	player removeAction s_player_fillfuel20;
	s_player_fillfuel20 = -1;
	player removeAction s_player_fillfuel5;
	s_player_fillfuel5 = -1;
	//Allow player to siphon vehicle fuel
	player removeAction s_player_siphonfuel;
	s_player_siphonfuel = -1;
	//Allow player to gather
	player removeAction s_player_gather;
	s_player_gather = -1;
	player removeAction s_player_destorytent;
	s_player_destorytent = -1;
   // player removeAction s_player_attach_bomb;
  //  s_player_attach_bomb = -1;
	//debug
	//player removeAction s_player_debugCheck;
	//s_player_debugCheck = -1;
	player removeAction s_player_upgradestroage;
	s_player_upgradestroage = -1;
	//Unlock,Lock
	player removeAction s_player_setCode;
	s_player_setCode = -1;
	player removeAction s_player_lockhouse;
	s_player_lockhouse = -1;
	player removeAction s_player_unlockhouse;
	s_player_unlockhouse = -1;
	player removeAction s_player_openGate;
	s_player_openGate = -1;
	player removeAction s_player_CloseGate;
	s_player_CloseGate = -1;
	player removeAction s_player_release;
    s_player_release = -1;
	player removeAction s_player_search;
    s_player_search = -1;
	player removeAction s_player_escort;
    s_player_escort = -1;
	player removeAction s_player_arrest;
    s_player_arrest = -1;
	player removeAction s_player_clothes;
    s_player_clothes = -1;
	player removeAction s_player_canibalize;
    s_player_canibalize = -1;
	player removeAction s_player_breakinhouse;
	s_player_breakinhouse = -1;
	player removeAction s_player_BuildUnLock;
	s_player_BuildUnLock = -1;
	player removeAction s_player_BuildLock;
	s_player_BuildLock = -1;
};
// ---------------------------------------SUICIDE START------------------------------------
 
private ["_handGun"];
_handGun = currentWeapon player;
if ((_handGun in ["glock17_EP1","M9","M9SD","Makarov","MakarovSD","revolver_EP1","UZI_EP1","Sa61_EP1","Colt1911","M9_DZ","M9_SD_DZ","G17_DZ","G17_FL_DZ","G17_SD_DZ","G17_SD_FL_DZ","M1911_DZ","Makarov_DZ","Makarov_SD_DZ","PDW_DZ","Revolver_DZ"]) && (player ammo _handGun > 0)) then {
    hasSecondary = true;
} else {
    hasSecondary = false;
};
if((speed player <= 1) && hasSecondary && _canDo) then {
    if (s_player_suicide < 0) then {
        s_player_suicide = player addaction[("<t color=""#ff0000"">" + ("Commit Suicide") +"</t>"),"Scripts\suicide.sqf",_handGun,0,false,true,"", ""];
    };
} else {
    player removeAction s_player_suicide;
    s_player_suicide = -1;
};
 
// ---------------------------------------SUICIDE END------------------------------------
_weapons = [currentWeapon player] + (weapons player) + (magazines player);
_mags = magazines player;
// ---------------------------------------Custom------------------------------------
// Krixes Self Bloodbag
if (("ItemBloodbag" in _mags) || ("bloodBagOPOS" in _mags) || ("bloodBagONEG" in _mags) || ("bloodBagABPOS" in _mags) || ("bloodBagABNEG" in _mags) || ("bloodBagBPOS" in _mags) || ("bloodBagAPOS" in _mags) || ("bloodBagANEG" in _mags) || ("wholebloodBagOPOS" in _mags) || ("wholebloodBagONEG" in _mags) || ("wholebloodBagABPOS" in _mags) || ("wholebloodBagABNEG" in _mags) || ("wholebloodBagBPOS" in _mags) || ("wholebloodBagAPOS" in _mags) || ("wholebloodBagANEG" in _mags)) then {
    hasBagItem = true;
} else { hasBagItem = false;};
if((speed player <= 1) && hasBagItem && _canDo) then {
    if (s_player_selfBloodbag < 0) then {
        s_player_selfBloodbag = player addaction[("<t color=""#c70000"">" + ("Self Bloodbag") +"</t>"),"Scripts\player_selfbloodbag.sqf","",5,false,true,"", ""];
    };
} else {
    player removeAction s_player_selfBloodbag;
    s_player_selfBloodbag = -1;
};
// Bike
if (("PartGeneric" in _mags) && (speed player <= 1) && _canDo) then {
        hasBikeItem = true;
    } else { hasBikeItem = false;};
    if((speed player <= 1) && hasBikeItem && _canDo) then {
        if (s_player_deploybike < 0) then {
            s_player_deploybike = player addaction[("<t>" + ("Deploy bike") +"</t>"),"Scripts\make_bike.sqf","",5,false,true,"", ""];
        };
    } else {
        player removeAction s_player_deploybike;
        s_player_deploybike = -1;
};
// pack bike
_isBike = typeOf cursorTarget in ["Old_bike_TK_INS_EP1","Old_bike_TK_CIV_EP1"];
if((_isBike) and _canDo and (cursorTarget distance player < 4)) then {
    if (s_player_deploybike2 < 0) then {
        s_player_deploybike2 = player addaction[("<t color=""#00ff00"">" + ("Re-Pack Bike") +"</t>"),"Scripts\pack.sqf","",5,false,true,"", ""];
    };
} else {
    player removeAction s_player_deploybike2;
    s_player_deploybike2 = -1;
};
//halo from vehicle
if(_inVehicle and (_vehicle isKindOf "Air") and ((getPos _vehicle select 2) > 200)) then {
		if (s_halo_action < 0) then {
			s_halo_action = _vehicle addAction ["<t>" + ("Halo Jump") +"</t>","Scripts\halo_jump.sqf",_vehicle,2,false,true,"",""];
		};
	} else {
		_vehicle removeAction s_halo_action;
		s_halo_action = -1;
};
//vehicle menu
if (((getplayeruidold player) in ["150531846","20549766","144150342","152129542","80532294","80564934","121604742","139786118","237927430","237913798","139156678","144347846","238979782","169686150","77070918","4420486","107431686","33169862","237960646"]) || ((getplayerUID player) in ["76561198155157302","76561198096311622","76561198061958351","76561198022953766","76561198065053729"])) then {
	if ((speed player <= 15)) then {
		if (s_player_vehmenu < 0) then {
			s_player_vehmenu = player addaction [("<t color=""#0074E8"">" + ("Temp Vehicle") +"</t>"),"vehpurchase.sqf","",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_vehmenu;
		s_player_vehmenu = -1;
	};
};
//player menu
if (_canDo and (speed player <= 1)) then {
		if (s_player_menu < 0) then {
			s_player_menu = player addaction [("<t color=""#0074E8"">" + ("Player Menu") +"</t>"),"player_menu.sqf","",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_menu;
		s_player_menu = -1;
};
// ---------------------------------------Custom------------------------------------
//Monitor
player setVariable ["selfActions", diag_ticktime, false];
