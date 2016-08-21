class BR_PlayerMenu
{
	idd = -1;
	movingenable = 0;

	class Controls
	{
		class DZSQ_Background: DZSQ_RscPicture
		{
			idc = 1200;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.261328 * safezoneW + safezoneX;
			y = 0.253274 * safezoneH + safezoneY;
			w = 0.641559 * safezoneW;
			h = 0.489688 * safezoneH;
		};
		class BR_TEXT_HEADER: DZSQ_RscText
		{
			idc = 1001;
			text = "Player Menu";
			x = 0.277068 * safezoneW + safezoneX;
			y = 0.266021 * safezoneH + safezoneY;
			w = 0.0727649 * safezoneW;
			h = 0.0340181 * safezoneH;
		};
		class BR_EXIT: DZSQ_RscButton
		{
			idc = 1700;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.639498 * safezoneW + safezoneX;
			y = 0.687851 * safezoneH + safezoneY;
			w = 0.0672967 * safezoneW;
			h = 0.0266013 * safezoneH;
		};
		class BR_DISTANCE: DZSQ_RscText
		{
			idc = 1002;
			text = "View Distance";
			x = 0.27968 * safezoneW + safezoneX;
			y = 0.312019 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
		class BR_PLAYERID: DZSQ_RscText
		{
			idc = 1003;
			text = "Get Player ID";
			x = 0.27968 * safezoneW + safezoneX;
			y = 0.382512 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
		class BR_WEATHER: DZSQ_RscText
		{
			idc = 1004;
			text = "Weather Menu";
			x = 0.27968 * safezoneW + safezoneX;
			y = 0.453005 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
		class BR_INFO: DZSQ_RscText
		{
			idc = 1005;
			text = "Server Info";
			x = 0.27968 * safezoneW + safezoneX;
			y = 0.523498 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
		class BR_GROUPS: DZSQ_RscText
		{
			idc = 1006;
			text = "Group System";
			x = 0.27968 * safezoneW + safezoneX;
			y = 0.593991 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
		class BR_500: DZSQ_RscButton
		{
			idc = 1601;
			text = "500";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {setViewDistance 500; systemchat 'Viewdistance set to 500.';};";
			x = 0.27968 * safezoneW + safezoneX;
			y = 0.347265 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_1000: DZSQ_RscButton
		{
			idc = 1602;
			text = "1000";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {setViewDistance 1000; systemchat 'Viewdistance set to 1000.';};";
			x = 0.323744 * safezoneW + safezoneX;
			y = 0.347265 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_1500: DZSQ_RscButton
		{
			idc = 1603;
			text = "1500";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {setViewDistance 1500; systemchat 'Viewdistance set to 1500.';};";
			x = 0.367808 * safezoneW + safezoneX;
			y = 0.347265 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_2000: DZSQ_RscButton
		{
			idc = 1604;
			text = "2000";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {setViewDistance 2000; systemchat 'Viewdistance set to 2000.';};";
			x = 0.411872 * safezoneW + safezoneX;
			y = 0.347265 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_2500: DZSQ_RscButton
		{
			idc = 1605;
			text = "2500";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {setViewDistance 2500; systemchat 'Viewdistance set to 2500.';};";
			x = 0.455936 * safezoneW + safezoneX;
			y = 0.347265 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_3000: DZSQ_RscButton
		{
			idc = 1606;
			text = "3000";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {setViewDistance 3000; systemchat 'Viewdistance set to 3000.';};";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.347265 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_3500: DZSQ_RscButton
		{
			idc = 1607;
			text = "3500";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {setViewDistance 3500; systemchat 'Viewdistance set to 3500.';};";
			x = 0.544064 * safezoneW + safezoneX;
			y = 0.347265 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_4000: DZSQ_RscButton
		{
			idc = 1612;
			text = "4000";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {setViewDistance 4000; systemchat 'Viewdistance set to 4000.';};";
			x = 0.588128 * safezoneW + safezoneX;
			y = 0.347265 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_4500: DZSQ_RscButton
		{
			idc = 1613;
			text = "4500";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {setViewDistance 4500; systemchat 'Viewdistance set to 4500.';};";
			x = 0.632192 * safezoneW + safezoneX;
			y = 0.347265 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_5000: DZSQ_RscButton
		{
			idc = 1614;
			text = "5000";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {setViewDistance 5000; systemchat 'Viewdistance set to 5000.';};";
			x = 0.676256 * safezoneW + safezoneX;
			y = 0.347265 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_PLAYERID_BUTTON: DZSQ_RscButton
		{
			idc = 1600;
			text = "Player ID";
			onButtonClick = "'uid' execVM 'serverinfo.sqf';";
			x = 0.27968 * safezoneW + safezoneX;
			y = 0.417758 * safezoneH + safezoneY;
			w = 0.0501563 * safezoneW;
			h = 0.0210405 * safezoneH;
		};
		class BR_INFO_BUTTON: DZSQ_RscButton
		{
			idc = 1609;
			text = "Info";
			onButtonClick = "closeDialog 0;'ContactInfo' execVM 'serverinfo.sqf';";
			x = 0.27968 * safezoneW + safezoneX;
			y = 0.558744 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_GROUPS_BUTTON: DZSQ_RscButton
		{
			idc = 1610;
			text = "Group Menu";
			onButtonClick = "closeDialog 0; execVM 'dzgm\loadGroupManagement.sqf';";
			x = 0.27968 * safezoneW + safezoneX;
			y = 0.629237 * safezoneH + safezoneY;
			w = 0.0806516 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_RULES_BUTTON: DZSQ_RscButton
		{
			idc = 1611;
			text = "Rules";
			onButtonClick = "closeDialog 0;'Rules' execVM 'serverinfo.sqf';";
			x = 0.323744 * safezoneW + safezoneX;
			y = 0.558744 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_TIPS_BUTTON: DZSQ_RscButton
		{
			idc = 1615;
			text = "Tips";
			onButtonClick = "closeDialog 0;'ServerTips' execVM 'serverinfo.sqf';";
			x = 0.367808 * safezoneW + safezoneX;
			y = 0.558744 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_WEATHER_BUTTON: DZSQ_RscButton
		{
			idc = 1608;
			text = "Weather Menu";
			onButtonClick = "closeDialog 0;createdialog 'BR_PlayerMenuWeather'";
			x = 0.27968 * safezoneW + safezoneX;
			y = 0.488251 * safezoneH + safezoneY;
			w = 0.0817031 * safezoneW;
			h = 0.0220387 * safezoneH;
		};
		class BR_GRASS: DZSQ_RscText
		{
			idc = 1007;
			text = "Grass Settings";
			x = 0.544064 * safezoneW + safezoneX;
			y = 0.382512 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
		class BR_GRASS_BUTTON_ON: DZSQ_RscButton
		{
			idc = 1616;
			text = "On";
			onButtonClick = "setTerrainGrid 25;systemchat 'Grass turned on.';";
			x = 0.544064 * safezoneW + safezoneX;
			y = 0.417758 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};		
		class BR_GRASS_BUTTON_OFF: DZSQ_RscButton
		{
			idc = 1617;
			text = "Off";
			onButtonClick = "setTerrainGrid 50;systemchat 'Grass turned off.';";
			x = 0.588128 * safezoneW + safezoneX;
			y = 0.417758 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_AMBIENT: DZSQ_RscText
		{
			idc = 1008;
			text = "Ambient Sounds";
			x = 0.544064 * safezoneW + safezoneX;
			y = 0.453005 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
		class BR_AMBIENT_ON: DZSQ_RscButton
		{
			idc = 1618;
			text = "On";
			onButtonClick = "enableEnvironment true;systemchat 'Ambient sounds turned on.';";
			x = 0.544064 * safezoneW + safezoneX;
			y = 0.488251 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_AMBIENT_OFF: DZSQ_RscButton
		{
			idc = 1619;
			text = "Off";
			onButtonClick = "enableEnvironment false;systemchat 'Ambient sounds turned off.';";
			x = 0.588128 * safezoneW + safezoneX;
			y = 0.488251 * safezoneH + safezoneY;
			w = 0.0375376 * safezoneW;
			h = 0.0200423 * safezoneH;
		};
		class BR_ANON: DZSQ_RscText
		{
			idc = 1010;
			text = "Anon Kill Msg";
			x = 0.544064 * safezoneW + safezoneX;
			y = 0.523498 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
		class BR_ANON_TOGG: DZSQ_RscButton
		{
			idc = 1011;
			text = "Toggle";
			onButtonClick = "_anonstat = profileNamespace getVariable 'Anon';if (isnil '_anonstat') then {player setVariable ['Anon',false,true];};if (player getvariable 'Anon') then { profileNamespace setVariable ['Anon',false];player setVariable ['Anon',false,true]; systemchat 'Your name will show up in kill messages now...';} else { profileNamespace setVariable ['Anon',true]; player setVariable ['Anon',true,true]; systemchat 'You will now be anonymous in kill messages.';};saveProfileNamespace;";
			x = 0.544064 * safezoneW + safezoneX;
			y = 0.558744 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
		class BR_LOADOUT: DZSQ_RscText
		{
			idc = 10012;
			text = "Loadout Toggle";
			x = 0.544064 * safezoneW + safezoneX;
			y = 0.593991 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
		class BR_LOADOUT_TOGG: DZSQ_RscButton
		{
			idc = 10013;
			text = "Toggle";
			onButtonClick = "_loadoutstatus = profileNamespace getVariable 'Loadout_Togg';if (isnil '_loadoutstatus') then {profileNamespace setVariable ['Loadout_Togg',false];};if (profileNamespace getvariable 'Loadout_Togg') then { profileNamespace setVariable ['Loadout_Togg',false];systemchat 'Your loadout is turned on now if you have one...';} else { profileNamespace setVariable ['Loadout_Togg',true];systemchat 'Your loadout is turned off now if you have one...';};saveProfileNamespace;";
			x = 0.544064 * safezoneW + safezoneX;
			y = 0.629237 * safezoneH + safezoneY;
			w = 0.0848579 * safezoneW;
			h = 0.0210407 * safezoneH;
		};
	};
};
class BR_PlayerMenuWeather
{
	idd = -1;
	movingenable = 0;

	class Controls
	{
		class BR_Background: DZSQ_RscPicture
		{
			idc = 1200;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.263441 * safezoneW + safezoneX;
			y = 0.352924 * safezoneH + safezoneY;
			w = 0.640517 * safezoneW;
			h = 0.31569 * safezoneH;
		};
		class BR_RscFrame_1800: DZSQ_RscFrame
		{
			idc = 1800;
			x = 0.634344 * safezoneW + safezoneX;
			y = 0.390789 * safezoneH + safezoneY;
			w = 0.086563 * safezoneW;
			h = 0.178386 * safezoneH;
		};
		class BR_RscText_1000: DZSQ_RscText
		{
			idc = 1000;
			x = 0.455936 * safezoneW + safezoneX;
			y = 0.429507 * safezoneH + safezoneY;
			w = 0.0470017 * safezoneW;
			h = 0.0469954 * safezoneH;
		};
		class BR_WEATHER_MENU: DZSQ_RscText
		{
			idc = 1001;
			text = "Weather Menu";
			x = 0.278698 * safezoneW + safezoneX;
			y = 0.356544 * safezoneH + safezoneY;
			w = 0.113119 * safezoneW;
			h = 0.0330799 * safezoneH;
		};
		class BR_WEATHER_FOG: DZSQ_RscText
		{
			idc = 1002;
			text = "Fog";
			x = 0.279739 * safezoneW + safezoneX;
			y = 0.394334 * safezoneH + safezoneY;
			w = 0.0511547 * safezoneW;
			h = 0.0275268 * safezoneH;
		};
		class BR_WEATHER_OVERCAST: DZSQ_RscText
		{
			idc = 1003;
			text = "Overcast";
			x = 0.279739 * safezoneW + safezoneX;
			y = 0.464778 * safezoneH + safezoneY;
			w = 0.0511547 * safezoneW;
			h = 0.0275268 * safezoneH;
		};
		class BR_WEATHER_RAIN: DZSQ_RscText
		{
			idc = 1004;
			text = "Rain";
			x = 0.279739 * safezoneW + safezoneX;
			y = 0.535222 * safezoneH + safezoneY;
			w = 0.0511547 * safezoneW;
			h = 0.0275268 * safezoneH;
		};
		class BR_WEATHER_BACK: DZSQ_RscButton
		{
			idc = 1600;
			text = "Back";
			onButtonClick = "closeDialog 0;createdialog 'BR_PlayerMenu'";
			x = 0.280259 * safezoneW + safezoneX;
			y = 0.636551 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_WEATHER_CLOSE: DZSQ_RscButton
		{
			idc = 1601;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.670793 * safezoneW + safezoneX;
			y = 0.636051 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_WEATHER_OFF: DZSQ_RscButton
		{
			idc = 1602;
			text = "Off";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setrain 0; 0 setovercast 0; 0 setfog 0;systemchat 'Weather turned off.';};";
			x = 0.654182 * safezoneW + safezoneX;
			y = 0.429556 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_WEATHER_QUICKCHANGE: DZSQ_RscText
		{
			idc = 1005;
			text = "Quick Change";
			x = 0.641634 * safezoneW + safezoneX;
			y = 0.393408 * safezoneH + safezoneY;
			w = 0.0735453 * safezoneW;
			h = 0.0303034 * safezoneH;
		};
		class BR_WEATHER_ON: DZSQ_RscButton
		{
			idc = 1603;
			text = "On";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setrain 1; 0 setovercast 1; 0 setfog 1;systemchat 'Weather turned on.';};";
			x = 0.654182 * safezoneW + safezoneX;
			y = 0.464778 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_WEATHER_RANDOM: DZSQ_RscButton
		{
			idc = 1604;
			text = "Random";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setrain (random 1); 0 setovercast (random 1); 0 setfog (random 1);systemchat 'Weather randomized.';};";
			x = 0.654182 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_FOG_OFF: DZSQ_RscButton
		{
			idc = 1605;
			text = "Off";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setfog 0;systemchat 'Fog disabled.';};";
			x = 0.279739 * safezoneW + safezoneX;
			y = 0.429556 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_FOG_02: DZSQ_RscButton
		{
			idc = 1606;
			text = "0.2";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setfog 0.2;systemchat 'Fog set to 0.2.';};";
			x = 0.338475 * safezoneW + safezoneX;
			y = 0.429556 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_FOG_04: DZSQ_RscButton
		{
			idc = 1607;
			text = "0.4";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setfog 0.4;systemchat 'Fog set to 0.4.';};";
			x = 0.397212 * safezoneW + safezoneX;
			y = 0.429556 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_FOG_06: DZSQ_RscButton
		{
			idc = 1608;
			text = "0.6";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setfog 0.6;systemchat 'Fog set to 0.6.';};";
			x = 0.455948 * safezoneW + safezoneX;
			y = 0.429556 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};	
		class BR_FOG_08: DZSQ_RscButton
		{
			idc = 1609;
			text = "0.8";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setfog 0.8;systemchat 'Fog set to 0.8.';};";
			x = 0.514684 * safezoneW + safezoneX;
			y = 0.429556 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_OVERCAST_OFF: DZSQ_RscButton
		{
			idc = 1610;
			text = "Off";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setovercast 0;systemchat 'Overcast disabled.';};";
			x = 0.279739 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_OVERCAST_02: DZSQ_RscButton
		{
			idc = 1611;
			text = "0.2";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setovercast 0.2;systemchat 'Overcast set to 0.2.';};";
			x = 0.338475 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_OVERCAST_04: DZSQ_RscButton
		{
			idc = 1612;
			text = "0.4";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setovercast 0.4;systemchat 'Overcast set to 0.4.';};";
			x = 0.397212 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_OVERCAST_06: DZSQ_RscButton
		{
			idc = 1613;
			text = "0.6";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setovercast 0.6;systemchat 'Overcast set to 0.6.';};";
			x = 0.455948 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_OVERCAST_08: DZSQ_RscButton
		{
			idc = 1614;
			text = "0.8";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setovercast 0.8;systemchat 'Overcast set to 0.8.';};";
			x = 0.514684 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_OVERCAST_1: DZSQ_RscButton
		{
			idc = 1615;
			text = "1.0";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setovercast 1;systemchat 'Overcast set to 1.';};";
			x = 0.57342 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_FOG_1: DZSQ_RscButton
		{
			idc = 1616;
			text = "1.0";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setfog 1;systemchat 'Fog set to 1.';};";
			x = 0.57342 * safezoneW + safezoneX;
			y = 0.429556 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_RAIN_OFF: DZSQ_RscButton
		{
			idc = 1617;
			text = "Off";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setrain 0;systemchat 'Rain disabled.';};";
			x = 0.279739 * safezoneW + safezoneX;
			y = 0.570444 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_RAIN_02: DZSQ_RscButton
		{
			idc = 1618;
			text = "0.2";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setrain 0.2;systemchat 'Rain set to 0.2.';};";
			x = 0.338475 * safezoneW + safezoneX;
			y = 0.570444 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_RAIN_04: DZSQ_RscButton
		{
			idc = 1619;
			text = "0.4";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setrain 0.4;systemchat 'Rain set to 0.4.';};";
			x = 0.397212 * safezoneW + safezoneX;
			y = 0.570444 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_RAIN_06: DZSQ_RscButton
		{
			idc = 1620;
			text = "0.6";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setrain 0.6;systemchat 'Rain set to 0.6.';};";
			x = 0.455948 * safezoneW + safezoneX;
			y = 0.570444 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_RAIN_08: DZSQ_RscButton
		{
			idc = 1621;
			text = "0.8";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setrain 0.8;systemchat 'Rain set to 0.8.';};";
			x = 0.514684 * safezoneW + safezoneX;
			y = 0.570444 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
		class BR_RAIN_1: DZSQ_RscButton
		{
			idc = 1622;
			text = "1.0";
			onButtonClick = "if (isnil ""holiday_event"") then {holiday_event = false;};if (holiday_event) then {systemchat ""Unable to do this at the current time."";} else {0 setrain 1;systemchat 'Rain set to 1.';};";
			x = 0.57342 * safezoneW + safezoneX;
			y = 0.570444 * safezoneH + safezoneY;
			w = 0.0459476 * safezoneW;
			h = 0.0182716 * safezoneH;
		};
	};
};