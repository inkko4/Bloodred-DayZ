/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
	
	Reward tiers for quests. Vehicles and Weapons with 3 tiers in each.
	
	Format for weapons:
	DZSQ_Weapon1 = [["M1014_DZ","8Rnd_12Gauge_Slug"],["Remington870_DZ","8Rnd_12Gauge_Slug"],["Gun","Mag"]];

	Format for Vehicles:
	DZSQ_Vehicle1 = ["UH1H_DZ","UH1H_DZ2","Vehicle"];
*/
private ["_medicalsupplies","_repairsupplies","_races","_build1supplies","_build2supplies"];

DZSQ_Epoch = false; // weapon code ready, vehicle perm not ready, config not filled out.

// Attempts to create the vehicle and add it to the database using tent write. DZSQ_PermVehicle = true/false;
DZSQ_PermVehicle = true; // only compatible with dayz 1.8.5+ and epoch

// Create box to put rewards in rather then try and add to the player. (add box near quest giver in server side file to look for to add items?)
DZSQ_RewardBox = true; // WIP doesn't function yet.

DZSQ_DebugInfo = false; // client side debugging. (NOT SERVER SIDE DEBUG INFO!!!)
/*-----------------------------------------------------
	Configuration for Bandit, Hero, Zed, and Race quest
	- Required timer/amount
	- Reward ["type",level]
*/

// Zed kills
DZSQ_Zed1 = 20; // 1st level
DZSQ_Zed2 = 50; // 2nd level
DZSQ_Zed3 = 100; //...
DZSQ_Zed4 = 150;

// Zed rewards ["Reward Type",level of reward];
DZSQ_ZedRew1 = ["Weapon",1]; // level 1
DZSQ_ZedRew2 = ["Weapon",2]; // level 2...
DZSQ_ZedRew3 = ["Vehicle",1];
DZSQ_ZedRew4 = ["Vehicle",2];

// Bandit Level (Murders)
DZSQ_Bandit1 = 20;
DZSQ_Bandit2 = 50;
DZSQ_Bandit3 = 100;
DZSQ_Bandit4 = 150;

// Bandit Rewards
DZSQ_BanditRew1 = ["Weapon",1];
DZSQ_BanditRew2 = ["Weapon",2];
DZSQ_BanditRew3 = ["Vehicle",1];
DZSQ_BanditRew4 = ["Vehicle",2];

// Hero Levels (Bandit Kills)
DZSQ_Hero1 = 20;
DZSQ_Hero2 = 50;
DZSQ_Hero3 = 100;
DZSQ_Hero4 = 150;

// Hero Rewards
DZSQ_HeroRew1 = ["Weapon",1];
DZSQ_HeroRew2 = ["Weapon",2];
DZSQ_HeroRew3 = ["Vehicle",1];
DZSQ_HeroRew4 = ["Vehicle",2];

// Race avg time
//_formula = _racestartcords distance _objectivecords;
//_formula1 = round(_formula/DZSQ_RaceTime4); // ~mi17
DZSQ_RaceTime1 = 20; // slowest avg km/h
DZSQ_RaceTime2 = 80;
DZSQ_RaceTime3 = 120;
DZSQ_RaceTime4 = 190; // fastes avg km/h
//DZSQ_RaceTime5 = 390; (390 seconds plus)

// Race Rewards
DZSQ_RaceRew1 = ["Vehicle",2];
DZSQ_RaceRew2 = ["Vehicle",2];
DZSQ_RaceRew3 = ["Vehicle",1];
DZSQ_RaceRew4 = ["Vehicle",0];
DZSQ_RaceRew5 = ["Vehicle",0];

// required humanity for bandit quest
DZSQ_RequiredBandit = -2500;

// required humanity for hero quest.
DZSQ_RequiredHero = 5000;

// Race minimum time (in seconds)
DZSQ_RaceMin = 30; // long distance so shouldn't be able to do it extremely quickly

//-----------------------------------------------------
if (DZSQ_Epoch) then {
/*
	Epoch mod (Changes vehicle DB write to epoch one only if DZSQ_PermVehicle = true;)
*/
//low tier
DZSQ_Weapon1 = [["",""],["",""],["",""],["",""],["",""]];
//mid tier
DZSQ_Weapon2 = [["",""],["",""],["",""],["",""],["",""]];
//high tier
DZSQ_Weapon3 = [["",""],["",""],["",""],["",""],["",""]];

//low tier
DZSQ_Vehicle1 = ["","","",""];
//mid tier
DZSQ_Vehicle2 = ["","","",""];
//high tier
DZSQ_Vehicle3 = ["","","",""];

//low tier
DZSQ_Buildables1 = ["","","",""];
//mid tier
DZSQ_Buildables2 = ["","","",""];
// high tier
DZSQ_Buildables3 = ["","","",""];

} else {
/*
	Non Epoch mods
*/
//low tier
DZSQ_Weapon1 = [
["M1014_DZ","8Rnd_12Gauge_Slug"],
["Remington870_DZ","8Rnd_12Gauge_Slug"],
["Bizon_DZ","64Rnd_9x19_Bizon"],
["Bizon_SD_DZ","64Rnd_9x19_SD_Bizon"],
["MP5_DZ","30Rnd_9x19_MP5"],
["MP5_SD_DZ","30Rnd_9x19_MP5SD"],
["Mosin_Nagant","Mosin_Nagant_Ammo"],
["AKM_DZ","30Rnd_762x39_AK47"]
];
//mid tier
DZSQ_Weapon2 = [
["AK74_DZ","30Rnd_545x39_AK"],
["M16A2_DZ","30Rnd_556x45_Stanag"],
["M16A4_DZ","30Rnd_556x45_Stanag"],
["FNFAL_DZ","20Rnd_762x51_FNFAL"],
["M4A1_DZ","30Rnd_556x45_Stanag"],
["M14_DZ","20Rnd_762x51_DMR"],
["M240_DZ","100Rnd_762x51_M240"],
["L85_Holo_DZ","30Rnd_556x45_Stanag"]
];
//high tier
DZSQ_Weapon3 = [
["M4SPR","20Rnd_556x45_Stanag"],
["AK_107_pso","30Rnd_545x39_AK"],
["M4A1_GL_Holo_SD_FL_DZ","30Rnd_556x45_StanagSD"],
["M14_Holo_Gh_DZ","20Rnd_762x51_DMR"],
["M249_Holo_DZ","200Rnd_556x45_M249"],
["M24_DZ","5Rnd_762x51_M24"],
["M40A3_DZ","5Rnd_762x51_M24"],
["M40A3_Gh_DZ","5Rnd_762x51_M24"],
["DMR_Gh_DZ","20Rnd_762x51_DMR"],
["DMR_DZ","20Rnd_762x51_DMR"],
["SVD_DZ","10Rnd_762x54_SVD"],
["SVD_Gh_DZ","10Rnd_762x54_SVD"]
];

//low tier
DZSQ_Vehicle1 = ["Old_bike_TK_INS_EP1","TT650_Civ","ATV_US_EP1","ATV_US_EP1"];
//mid tier
DZSQ_Vehicle2 = ["BAF_Offroad_D","HMMWV_DZ","SUV_DZ","Pickup_PK_INS","Offroad_DSHKM_INS"];
//high tier
DZSQ_Vehicle3 = ["MH6J_DZ","UH1H_DZ","Mi17_DZ","UH1H_DZ2"];

//Boat Tier
DZSQ_Vehicle4 = ["PBX","PBX","PBX","Small_boat2"];

/*
	Magazine tier for building reward quests.
	Need to update QuestRewardSystem to have magazine statement.
*/
//
DZSQ_Buildables1 = ["itemlog","ItemPadlock","itemstone"]; // ONLY Magazines
DZSQ_Buildables2 = ["ItemStone","ItemPlank","itemlog","PartWoodPile","ItemPadlock"]; // ONLY Magazines
DZSQ_Buildables3 = ["itemDIY_Gate","itemDIY_wood","itemDIY_Metal","itemPickaxe","itemsledgehammer"]; // ONLY put tool belt items here.
};

// Semi-randomize medical quest on startup (first player randomizes variable for everyone.)
if (isnil "DZSQ_MedsQ") then {
_medicalsupplies = ["ItemEpinephrine","ItemMorphine","ItemAntibiotic"] call bis_fnc_selectrandom;
DZSQ_MedsQ = _medicalsupplies;
publicVariable "DZSQ_MedsQ";
};

// Semi-randomize boat quest on startup (first player randomizes variable for everyone.)
if (isnil "DZSQ_RepairQ") then {
_repairsupplies = ["PartFueltank","PartEngine","PartGeneric"] call bis_fnc_selectrandom;
DZSQ_RepairQ = _repairsupplies;
publicVariable "DZSQ_RepairQ";
};

// Semi-randomize boat quest on startup (first player randomizes variable for everyone.)
if (isnil "DZSQ_Build1Q") then {
_build1supplies = ["itemcrowbar","ItemHatchet","MeleeMachete","MeleeBaseBallBat"] call bis_fnc_selectrandom;
DZSQ_Build1Q = _build1supplies;
publicVariable "DZSQ_Build1Q";
};

// Semi-randomize boat quest on startup (first player randomizes variable for everyone.)
if (isnil "DZSQ_Build2Q") then {
_build2supplies = ["itemlog","ItemPlank","PartWoodPile","ItemPadlock"] call bis_fnc_selectrandom;
DZSQ_Build2Q = _build2supplies;
publicVariable "DZSQ_Build2Q";
};


// Semi-randomize race location on startup (first player randomizes variable for everyone.)
if (isnil "DZSQ_RaceQ") then {
_races = [
["Skulka Barn",[1301.06, 13384.3, 0],"NWAF",[4254.98, 10402.5, 0]],
["Misty Peak",[3726.28, 14487, 0],"Pobeda Dam",[9666.4, 13551.5, 0]],
["Rify",[13970, 11248, 0],"Polana Factory",[11463.4, 7546.68, 0]],
["Black Forest",[9081.21, 8034.49, 0],"Mogilevka",[7702.63, 5134.23, 0]]
] call bis_fnc_selectrandom;
DZSQ_RaceQ = _races;
publicVariable "DZSQ_RaceQ";
};

// Need to add these 2 variables to publicvariable.txt so they don't kick players as well as any other custom publicVariables used in this script.