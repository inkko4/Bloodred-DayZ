/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
// Antibiotic
class Quest_Antibiotics
{
	idd = 44410;
	movingenable = 0;
	onLoad = "['Antibiotic'] spawn DZSQ_QuestDialogUpdate;";
	class Controls
	{
		class DZSQ_Background: DZSQ_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.261328 * safezoneW + safezoneX;
			y = 0.253274 * safezoneH + safezoneY;
			w = 0.638955 * safezoneW;
			h = 0.488762 * safezoneH;
		};
		class DZSQ_Header: DZSQ_RscText
		{
			idc = -1;
			text = "DayZ Simple Quest V1.0";
			x = 0.277068 * safezoneW + safezoneX;
			y = 0.266021 * safezoneH + safezoneY;
			w = 0.150872 * safezoneW;
			h = 0.0340181 * safezoneH;
		};
		class DZSQ_Text: DZSQ_RscStructuredText
		{
			idc = 1101;
			x = 0.280781 * safezoneW + safezoneX;
			y = 0.31212 * safezoneH + safezoneY;
			w = 0.437002 * safezoneW;
			h = 0.348682 * safezoneH;
		};
		class DZSQ_Close: DZSQ_RscButton
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.646841 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0574032 * safezoneW;
			h = 0.031229 * safezoneH;
		};
		class DZSQ_Complete: DZSQ_RscButton
		{
			idc = -1;
			text = "Give Meds";
			onButtonClick = "closeDialog 0; ['Antibiotic'] spawn DZSQ_QuestAntibiotic;";
			x = 0.288592 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0881252 * safezoneW;
			h = 0.031229 * safezoneH;
		};
	};
};
// Zombie
class Quest_Zombies
{
	idd = 44411;
	movingenable = 0;
	onLoad = "['Zombie'] spawn DZSQ_QuestDialogUpdate;";
	class Controls
	{
		class DZSQ_Background: DZSQ_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.261328 * safezoneW + safezoneX;
			y = 0.253274 * safezoneH + safezoneY;
			w = 0.638955 * safezoneW;
			h = 0.488762 * safezoneH;
		};
		class DZSQ_Header: DZSQ_RscText
		{
			idc = -1;
			text = "DayZ Simple Quest V1.0";
			x = 0.277068 * safezoneW + safezoneX;
			y = 0.266021 * safezoneH + safezoneY;
			w = 0.150872 * safezoneW;
			h = 0.0340181 * safezoneH;
		};
		class DZSQ_Text: DZSQ_RscStructuredText
		{
			idc = 1102;
			x = 0.280781 * safezoneW + safezoneX;
			y = 0.31212 * safezoneH + safezoneY;
			w = 0.437002 * safezoneW;
			h = 0.348682 * safezoneH;
		};
		class DZSQ_Close: DZSQ_RscButton
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.646841 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0574032 * safezoneW;
			h = 0.031229 * safezoneH;
		};
		class DZSQ_Complete: DZSQ_RscButton
		{
			idc = -1;
			text = "Trade Zed Kills";
			onButtonClick = "closeDialog 0; ['Zombie'] spawn DZSQ_QuestZombie;";
			x = 0.288592 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0881252 * safezoneW;
			h = 0.031229 * safezoneH;
		};
	};
};
// Boat
class Quest_Boat
{
	idd = 44412;
	movingenable = 0;
	onLoad = "['Boat'] spawn DZSQ_QuestDialogUpdate;";
	class Controls
	{
		class DZSQ_Background: DZSQ_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.261328 * safezoneW + safezoneX;
			y = 0.253274 * safezoneH + safezoneY;
			w = 0.638955 * safezoneW;
			h = 0.488762 * safezoneH;
		};
		class DZSQ_Header: DZSQ_RscText
		{
			idc = -1;
			text = "DayZ Simple Quest V1.0";
			x = 0.277068 * safezoneW + safezoneX;
			y = 0.266021 * safezoneH + safezoneY;
			w = 0.150872 * safezoneW;
			h = 0.0340181 * safezoneH;
		};
		class DZSQ_Text: DZSQ_RscStructuredText
		{
			idc = 1103;
			x = 0.280781 * safezoneW + safezoneX;
			y = 0.31212 * safezoneH + safezoneY;
			w = 0.437002 * safezoneW;
			h = 0.348682 * safezoneH;
		};
		class DZSQ_Close: DZSQ_RscButton
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.646841 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0574032 * safezoneW;
			h = 0.031229 * safezoneH;
		};
		class DZSQ_Complete: DZSQ_RscButton
		{
			idc = -1;
			text = "Give Parts";
			onButtonClick = "closeDialog 0; ['Boat'] spawn DZSQ_QuestBoat;";
			x = 0.288592 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0881252 * safezoneW;
			h = 0.031229 * safezoneH;
		};
	};
};
// Bandit
class Quest_Bandit
{
	idd = 44413;
	movingenable = 0;
	onLoad = "['Bandit'] spawn DZSQ_QuestDialogUpdate;";
	class Controls
	{
		class DZSQ_Background: DZSQ_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.261328 * safezoneW + safezoneX;
			y = 0.253274 * safezoneH + safezoneY;
			w = 0.638955 * safezoneW;
			h = 0.488762 * safezoneH;
		};
		class DZSQ_Header: DZSQ_RscText
		{
			idc = -1;
			text = "DayZ Simple Quest V1.0";
			x = 0.277068 * safezoneW + safezoneX;
			y = 0.266021 * safezoneH + safezoneY;
			w = 0.150872 * safezoneW;
			h = 0.0340181 * safezoneH;
		};
		class DZSQ_Text: DZSQ_RscStructuredText
		{
			idc = 1104;
			x = 0.280781 * safezoneW + safezoneX;
			y = 0.31212 * safezoneH + safezoneY;
			w = 0.437002 * safezoneW;
			h = 0.348682 * safezoneH;
		};
		class DZSQ_Close: DZSQ_RscButton
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.646841 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0574032 * safezoneW;
			h = 0.031229 * safezoneH;
		};
		class DZSQ_Complete: DZSQ_RscButton
		{
			idc = -1;
			text = "Trade Murders";
			onButtonClick = "closeDialog 0; ['Bandit'] spawn DZSQ_QuestBandit;";
			x = 0.288592 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0881252 * safezoneW;
			h = 0.031229 * safezoneH;
		};
	};
};
// Hero
class Quest_Hero
{
	idd = 44414;
	movingenable = 0;
	onLoad = "['Hero'] spawn DZSQ_QuestDialogUpdate;";
	class Controls
	{
		class DZSQ_Background: DZSQ_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.261328 * safezoneW + safezoneX;
			y = 0.253274 * safezoneH + safezoneY;
			w = 0.638955 * safezoneW;
			h = 0.488762 * safezoneH;
		};
		class DZSQ_Header: DZSQ_RscText
		{
			idc = -1;
			text = "DayZ Simple Quest V1.0";
			x = 0.277068 * safezoneW + safezoneX;
			y = 0.266021 * safezoneH + safezoneY;
			w = 0.150872 * safezoneW;
			h = 0.0340181 * safezoneH;
		};
		class DZSQ_Text: DZSQ_RscStructuredText
		{
			idc = 1105;
			x = 0.280781 * safezoneW + safezoneX;
			y = 0.31212 * safezoneH + safezoneY;
			w = 0.437002 * safezoneW;
			h = 0.348682 * safezoneH;
		};
		class DZSQ_Close: DZSQ_RscButton
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.646841 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0574032 * safezoneW;
			h = 0.031229 * safezoneH;
		};
		class DZSQ_Complete: DZSQ_RscButton
		{
			idc = -1;
			text = "Bandit Kills";
			onButtonClick = "closeDialog 0; ['Hero'] spawn DZSQ_QuestHero;";
			x = 0.288592 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0881252 * safezoneW;
			h = 0.031229 * safezoneH;
		};
	};
};
// Lumber
class Quest_Lumber
{
	idd = 44415;
	movingenable = 0;
	onLoad = "['Lumber'] spawn DZSQ_QuestDialogUpdate;";
	class Controls
	{
		class DZSQ_Background: DZSQ_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.261328 * safezoneW + safezoneX;
			y = 0.253274 * safezoneH + safezoneY;
			w = 0.638955 * safezoneW;
			h = 0.488762 * safezoneH;
		};
		class DZSQ_Header: DZSQ_RscText
		{
			idc = -1;
			text = "DayZ Simple Quest V1.0";
			x = 0.277068 * safezoneW + safezoneX;
			y = 0.266021 * safezoneH + safezoneY;
			w = 0.150872 * safezoneW;
			h = 0.0340181 * safezoneH;
		};
		class DZSQ_Text: DZSQ_RscStructuredText
		{
			idc = 1106;
			x = 0.280781 * safezoneW + safezoneX;
			y = 0.31212 * safezoneH + safezoneY;
			w = 0.437002 * safezoneW;
			h = 0.348682 * safezoneH;
		};
		class DZSQ_Close: DZSQ_RscButton
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.646841 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0574032 * safezoneW;
			h = 0.031229 * safezoneH;
		};
		class DZSQ_Complete: DZSQ_RscButton
		{
			idc = -1;
			text = "Give Materials";
			onButtonClick = "closeDialog 0; ['Lumber'] spawn DZSQ_QuestLumber;";
			x = 0.288592 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0881252 * safezoneW;
			h = 0.031229 * safezoneH;
		};
	};
};
// Bounty
class Quest_Bounty
{
	idd = 44416;
	movingenable = 0;
	onLoad = "['Bounty'] spawn DZSQ_QuestDialogUpdate;";
	class Controls
	{
		class DZSQ_Background: DZSQ_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.261328 * safezoneW + safezoneX;
			y = 0.253274 * safezoneH + safezoneY;
			w = 0.638955 * safezoneW;
			h = 0.488762 * safezoneH;
		};
		class DZSQ_Header: DZSQ_RscText
		{
			idc = -1;
			text = "DayZ Simple Quest V1.0";
			x = 0.277068 * safezoneW + safezoneX;
			y = 0.266021 * safezoneH + safezoneY;
			w = 0.150872 * safezoneW;
			h = 0.0340181 * safezoneH;
		};
		class DZSQ_Text: DZSQ_RscStructuredText
		{
			idc = 1107;
			x = 0.280781 * safezoneW + safezoneX;
			y = 0.31212 * safezoneH + safezoneY;
			w = 0.437002 * safezoneW;
			h = 0.348682 * safezoneH;
		}
		class DZSQ_Close: DZSQ_RscButton
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.646841 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0574032 * safezoneW;
			h = 0.031229 * safezoneH;
		};
		class DZSQ_Complete: DZSQ_RscButton
		{
			idc = -1;
			text = "Claim Bounty";
			onButtonClick = "closeDialog 0; ['Bounty'] spawn DZSQ_QuestBounty;";
			x = 0.288592 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0881252 * safezoneW;
			h = 0.031229 * safezoneH;
		};
	};
};
// zeleno buildable
class Quest_Zelenogorsk
{
	idd = 44417;
	movingenable = 0;
	onLoad = "['Construction'] spawn DZSQ_QuestDialogUpdate;";
	class Controls
	{
		class DZSQ_Background: DZSQ_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.261328 * safezoneW + safezoneX;
			y = 0.253274 * safezoneH + safezoneY;
			w = 0.638955 * safezoneW;
			h = 0.488762 * safezoneH;
		};
		class DZSQ_Header: DZSQ_RscText
		{
			idc = -1;
			text = "DayZ Simple Quest V1.0";
			x = 0.277068 * safezoneW + safezoneX;
			y = 0.266021 * safezoneH + safezoneY;
			w = 0.150872 * safezoneW;
			h = 0.0340181 * safezoneH;
		};
		class DZSQ_Text: DZSQ_RscStructuredText
		{
			idc = 1108;
			x = 0.280781 * safezoneW + safezoneX;
			y = 0.31212 * safezoneH + safezoneY;
			w = 0.437002 * safezoneW;
			h = 0.348682 * safezoneH;
		};
		class DZSQ_Close: DZSQ_RscButton
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.646841 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0574032 * safezoneW;
			h = 0.031229 * safezoneH;
		};
		class DZSQ_Complete: DZSQ_RscButton
		{
			idc = -1;
			text = "Give Items";
			onButtonClick = "closeDialog 0; ['Construction'] spawn DZSQ_QuestConstruction;";
			x = 0.288592 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0881252 * safezoneW;
			h = 0.031229 * safezoneH;
		};
	};
};
// Race
class Quest_Race
{
	idd = 44418;
	movingenable = 0;
	onLoad = "['Race'] spawn DZSQ_QuestDialogUpdate;";
	class Controls
	{
		class DZSQ_Background: DZSQ_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.261328 * safezoneW + safezoneX;
			y = 0.253274 * safezoneH + safezoneY;
			w = 0.638955 * safezoneW;
			h = 0.488762 * safezoneH;
		};
		class DZSQ_Header: DZSQ_RscText
		{
			idc = -1;
			text = "DayZ Simple Quest V1.0";
			x = 0.277068 * safezoneW + safezoneX;
			y = 0.266021 * safezoneH + safezoneY;
			w = 0.150872 * safezoneW;
			h = 0.0340181 * safezoneH;
		};
		class DZSQ_Text: DZSQ_RscStructuredText
		{
			idc = 1109;
			x = 0.280781 * safezoneW + safezoneX;
			y = 0.31212 * safezoneH + safezoneY;
			w = 0.437002 * safezoneW;
			h = 0.348682 * safezoneH;
		};
		class DZSQ_Close: DZSQ_RscButton
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.646841 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0574032 * safezoneW;
			h = 0.031229 * safezoneH;
		};
		class DZSQ_Complete: DZSQ_RscButton
		{
			idc = -1;
			text = "Start Race";
			onButtonClick = "closeDialog 0; ['Race'] spawn DZSQ_QuestRace;";
			x = 0.288592 * safezoneW + safezoneX;
			y = 0.690657 * safezoneH + safezoneY;
			w = 0.0881252 * safezoneW;
			h = 0.031229 * safezoneH;
		};
	};
};