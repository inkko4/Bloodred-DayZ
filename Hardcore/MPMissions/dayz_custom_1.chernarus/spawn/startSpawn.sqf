_halo = uiNamespace getVariable "haloChoice";
deleteVehicle _holder;
_finalSpawnPos = _debug;
if (!isNil "_grid") then {_finalSpawnPos = _grid;};

if (_halo > 0) then {
	if (isNil "_haloType") then {	
		player setPosATL [(_finalSpawnPos select 0),(_finalSpawnPos select 1),_haloHeight];
		[player,_haloHeight] spawn BIS_fnc_halo;
	} else {
		_finalSpawnPos call _haloDrop;
	};
} else {
	player setPosATL _finalSpawnPos;
};

player hideObject false;
enableEnvironment true;
0 fadeSound 1;
cutText ["","BLACK IN"];
playsound "intro";

[] spawn {
	/* Initial Variables */
	player addWeapon "ItemMap";
	systemchat format["BRLS :: Welcome %1, loadout system initializing...",name player];
	sleep 1;
	systemchat "BRLS :: Loadout system waiting for player to fully enter game...";
	waituntil {alive player};
	systemchat "BRLS :: Loadout system awaiting player movement...";
	waituntil {speed player > 1};
	systemchat "BRLS :: Loadout system starting...";
	PVCDZ_Loadout_Client = [];
	BR_DefaultP = ["M9_DZ","M9_SD_DZ","G17_SD_DZ","G17_DZ"] call bis_fnc_selectrandom;
	BR_DefaultW = ["ItemFlashlight","ItemCompass","ItemMap","ItemMachete"];
	BR_CustomTools = ["ItemCompass","ItemMachete","ItemMap","ItemFlashlight","ItemEtool","ItemGPS","ItemHatchet","ItemKnife","ItemMatchbox","ItemToolbox","ItemWatch","NVGoggles","Binocular_Vector"];
	BR_DefaultM = ["ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemMorphine","ItemAntibiotic","bloodBagONEG","FoodBeefCooked","ItemPainkiller","ItemWaterbottle","PartGeneric"];
	BR_DefaultB = "DZ_Assault_Pack_EP1";
	/* End Initial Vars */
	
	_puid = getPlayerUID player;
	PVCDZ_Loadout_Server = [player,_puid];
	publicVariableServer "PVCDZ_Loadout_Server";
	
	_timeout = time + 30;
	waituntil {(count PVCDZ_Loadout_Client > 1) || (time > _timeout) || PVCDZ_Loadout_Client select 0 == "Default"};
	if (count PVCDZ_Loadout_Client < 1) then { 
		PVCDZ_Loadout_Client = ["Default"];
	};
	
	/* Wipe the character */
	{
		player removeWeapon _x;
	} foreach (weapons player);
	{
		player removeMagazine _x;
	} foreach (magazines player);
	if (unitBackpack player != objNull) then {
		removeBackpack player;
	};
	/* Wipe Complete */
	
	/* loadout var check */
	_loadout = PVCDZ_Loadout_Client select 0;
	if (_loadout == "Default") then {
		
		// default loadout
		
		/*pistol randomization and ammo*/
		if (BR_DefaultP == "M9_DZ") then {
			BR_DefaultPM = "15Rnd_9x19_M9";
		} else {
			if (BR_DefaultP == "M9_SD_DZ") then {
				BR_DefaultPM = "15Rnd_9x19_M9SD";
			} else {
				if (BR_DefaultP == "G17_DZ") then {
					BR_DefaultPM = "17Rnd_9x19_glock17";
				} else {
					BR_DefaultPM = "17Rnd_9x19_glock17SD";
				};
			};
		};
	
		BR_DefaultWeapons = BR_DefaultW + [BR_DefaultP];
		BR_DefaultMagazines = BR_DefaultM + [BR_DefaultPM] + [BR_DefaultPM] + [BR_DefaultPM];
		
		
		[BR_DefaultWeapons,BR_DefaultMagazines] call player_gearSet;
		player addBackpack BR_DefaultB;
		
		dayz_myBackpack =	unitBackpack player;
		dayz_myBackpackMags =	getMagazineCargo dayz_myBackpack;
		dayz_myBackpackWpns =	getWeaponCargo dayz_myBackpack;
		
	} else {
		BR_CustomW = PVCDZ_Loadout_Client select 0;
		BR_CustomP = PVCDZ_Loadout_Client select 1;
		BR_CustomWM = PVCDZ_Loadout_Client select 2;
		BR_CustomPM = PVCDZ_Loadout_Client select 3;
		BR_CustomB = PVCDZ_Loadout_Client select 4;
		BR_CustomBW = PVCDZ_Loadout_Client select 5;
		BR_CustomBM = PVCDZ_Loadout_Client select 6;
		
		if (BR_CustomW == "Improved") then {
		BR_CustomWeapons = BR_CustomTools + [BR_CustomP];
		BR_CustomMagazines = BR_DefaultM + [BR_CustomPM] + [BR_CustomPM] + [BR_CustomPM];
		} else {
			if (BR_CustomWM in ["100Rnd_762x51_M240","200Rnd_556x45_M249"]) then {
				BR_CustomWeapons = BR_CustomTools + [BR_CustomP] + [BR_CustomW];
				BR_CustomMagazines = BR_DefaultM + [BR_CustomPM] + [BR_CustomPM] + [BR_CustomPM] + [BR_CustomWM] + [BR_CustomWM];
			} else {
				BR_CustomWeapons = BR_CustomTools + [BR_CustomP] + [BR_CustomW];
				BR_CustomMagazines = BR_DefaultM + [BR_CustomPM] + [BR_CustomPM] + [BR_CustomPM] + [BR_CustomWM] + [BR_CustomWM] + [BR_CustomWM];
			};
		};
		
		[BR_CustomWeapons,BR_CustomMagazines] call player_gearSet;
		
		player addBackpack BR_CustomB;
		dayz_myBackpack =	unitBackpack player;
		_backpackMagTypes = [];
		_backpackMagQty = [];
		if (count BR_CustomBM > 0) then {
			_backpackMagTypes = BR_CustomBM select 0;
			_backpackMagQty = BR_CustomBM select 1;
		};
		_countr = 0;
		
		//Fill backpack contents
		//Weapons
		_backpackWpnTypes = [];
		_backpackWpnQtys = [];
		if (count BR_CustomBW > 0) then {
			_backpackWpnTypes = BR_CustomBW select 0;
			_backpackWpnQtys = 	BR_CustomBW select 1;
		};
		//diag_log format["%1",_backpackWpnTypes];
		//diag_log format["%1",_backpackWpnQtys];
		_countr = 0;
		{
			if (_x == "Crossbow") then { _x = "Crossbow_DZ" };
			if (_x == "DMR") then { _x = "DMR_DZ" };
			//if (_x == "M14_EP1") then { _x = "M14_DZ" };
			if (_x == "SVD") then { _x = "SVD_DZ" };
			if (_x == "SVD_CAMO") then { _x = "SVD_CAMO_DZ" };
			dayz_myBackpack addWeaponCargoGlobal [_x,(_backpackWpnQtys select _countr)];
			_countr = _countr + 1;
		} forEach _backpackWpnTypes;
		//Magazines
		_countr = 0;
		{
			if (_x == "BoltSteel") then { _x = "WoodenArrow" };
			if (_x == "ItemBloodbag") then { _x = "bloodBagONEG" };
			dayz_myBackpack addMagazineCargoGlobal [_x,(_backpackMagQty select _countr)];
			_countr = _countr + 1;
		} forEach _backpackMagTypes;
		};
		
		call player_forceSave;
		
		systemchat "BRLS :: Loadout system complete.";
};

if (!isNil "_haloDrop") then {
	while {(((getPos player) select 2) > _autoOpenHeight) && {isNil "bis_fnc_halo_para_dirAbs"}} do {
		player allowDamage false;
		if (isNil "_haloType") then {
		titleText [("                                      ALTITUDE: " + str (round((getPos player) select 2)) + "\n\n                                      Scroll 'Mouse' select Open Chute"),"PLAIN DOWN",.1];
		} else {
		if !((vehicle player) isKindOf _haloType) then {
			titleText [("                                      ALTITUDE: " + str (round((getPos player) select 2)) + "\n\n                                      Scroll 'Mouse' select Open Chute"),"PLAIN DOWN",.1];
		};
		};
		uiSleep .1;
	};
	if ((((getPos player) select 2) > (_autoOpenHeight - 100)) && {isNil "bis_fnc_halo_para_dirAbs"}) then {[player] spawn BIS_fnc_Halo;};
	DZE_HaloJump = _haloJump;
	player allowDamage true;
};