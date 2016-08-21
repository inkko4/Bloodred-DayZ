class ExtraRc {
	class ItemBloodbag {
		class Self_Bloodbag {
			text = "Self Bloodbag";
			script =  "execVM 'Scripts\player_selfbloodbag_rc.sqf'";
		};
	};
	class PartGeneric {
		class make_bike {
			text = "Create Bike";
			script =  "execVM 'Scripts\make_bike.sqf'";
		};
	};
	class Skin_Camo1_DZ {	
		class skin1 {
			text = "Hero Camo";
			script =  "['camoh','Skin_Camo1_DZ','FR_GL'] execVM 'Scripts\skins.sqf';";
		};
		class skin2 {
			text = "Bandit Camo";
			script =  "['camob','Skin_Camo1_DZ','GUE_Soldier_CO'] execVM 'Scripts\skins.sqf';";
		};
	};
	class Skin_Sniper1_DZ {
		class skin3 {
			text = "Hero Ghillie";
			script =  "['sniperh','Skin_Sniper1_DZ','GUE_Soldier_Sniper'] execVM 'Scripts\skins.sqf';";
		};
		class skin4 {
			text = "Bandit Ghillie";
			script =  "['sniperb','Skin_Sniper1_DZ','Ins_Soldier_Sniper'] execVM 'Scripts\skins.sqf';";
		};
	};
	class Skin_Soldier1_DZ {
		class skin5 {
			text = "Hero Soldier";
			script =  "['soldierh','Skin_Soldier1_DZ','GUE_Commander'] execVM 'Scripts\skins.sqf';";
		};
		class ski6 {
			text = "Bandit Soldier";
			script =  "['soldierb','Skin_Soldier1_DZ','TK_Soldier_EP1'] execVM 'Scripts\skins.sqf';";
		};
	};
    class Skin_Survivor2_DZ {
		class skin7 {
            text = "Wear Taki Civ";
            script = "['normal','Skin_Survivor2_DZ','TK_GUE_Soldier_Sniper_EP1'] execVM 'Scripts\skins.sqf';";
        };
		class skin8 {
            text = "Wear Bodyguard";
            script = "['normal','Skin_Survivor2_DZ','Soldier_Bodyguard_M4_PMC'] execVM 'Scripts\skins.sqf';";
        };
		class skin9 {
            text = "Wear Bodyguard 2";
            script = "['normal','Skin_Survivor2_DZ','Soldier_Bodyguard_AA12_PMC'] execVM 'Scripts\skins.sqf';";
        };
		class skin10 {
            text = "Wear Hero";
            script = "['normal','Skin_Survivor2_DZ','Survivor3_DZ'] execVM 'Scripts\skins.sqf';";
        };
		class skin11 {
            text = "Wear Bandit";
            script = "['normal','Skin_Survivor2_DZ','Bandit1_DZ'] execVM 'Scripts\skins.sqf';";
        };
		class skin12 {
            text = "Wear Bandit Female";
            script = "['normal','Skin_Survivor2_DZ','BanditW1_DZ'] execVM 'Scripts\skins.sqf';";
        };
		class skin13 {
            text = "Wear Female Clothing";
            script = "['normal','Skin_Survivor2_DZ','SurvivorW2_DZ'] execVM 'Scripts\skins.sqf';";
        };
    };
	class ItemRadio {
		class ItemActions  {
            text = "Open GroupManagement";
            script = "execVM 'dzgm\loadGroupManagement.sqf'";
        };
	};
};
