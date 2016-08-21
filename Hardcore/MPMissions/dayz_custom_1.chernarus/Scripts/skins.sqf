private ["_skin","_removeSkin","_choice"];
if (isnil "LastSkinChange") then {
LastSkinChange = 0;
};
_skin = _this select 0;
_removeSkin = _this select 1;
_choice = _this select 2;
_humanity = player getVariable["humanity",0];
_model = typeOf player;
_AddSkin = "Skin_Survivor2_DZ"; // default
_SkinLastUsedTime = 30; // Amount of time in seconds before player can use lockpick again after a succesful use
// ---------------------- config end ---------------------

if (isnil "LastSkinChange") then {
_SkinChangeTime = 0;
} else {
_SkinChangeTime = time - LastSkinChange; // Variable used for easy reference in determining the self bloodbag cooldown
};
_lockpickUsageTime = time;
_timeout = player getVariable["combattimeout", 0];
_inCombat = if (_timeout >= diag_tickTime) then { true } else { false };

if(_SkinChangeTime < _SkinLastUsedTime) exitWith { // If cooldown is not done then exit script
	cutText [format["You may not change skins so soon please wait %1 more seconds!",round((_SkinChangeTime - _SkinLastUsedTime)*-1)], "PLAIN DOWN"]; //display text at bottom center of screen when players cooldown is not done
};

if (_inCombat) then { // Check if in combat
    cutText [format["You are in Combat and cannot continue your action!"], "PLAIN DOWN"]; //display text at bottom center of screen when in combat
} else {
// added model check to give correct parcels when changing between skins
if(_model in ["Sniper1_DZ","GUE_Soldier_Sniper","Ins_Soldier_Sniper"]) then{
	_AddSkin = "Skin_Sniper1_DZ";
};
if(_model in ["Camo1_DZ","GUE_Soldier_CO","FR_GL"]) then{
	_AddSkin = "Skin_Camo1_DZ";
};
if(_model in ["Soldier1_DZ","GUE_Commander","TK_Soldier_EP1"]) then{
	_AddSkin = "Skin_Soldier1_DZ";
};
if (_skin == "camoh") then {
	if(_humanity >= 5000) then{
    player removeMagazine _removeSkin;
    player addMagazine _AddSkin;
    uisleep 0.5;
    [dayz_playerUID,dayz_characterID,_choice] spawn player_humanityMorph;
    player removeWeapon "ItemRadio";
	} else {
		closeDialog 0;
		cutText [format["You do not have the required humanity. Your humanity is %1, you need to gain %2 more.",_humanity,(5000 - _humanity)], "PLAIN DOWN"];
	};
};

if (_skin == "camob") then {
	if(_humanity <= -2500) then{
    player removeMagazine _removeSkin;
    player addMagazine _AddSkin;
    uisleep 0.5;
    [dayz_playerUID,dayz_characterID,_choice] spawn player_humanityMorph;
    player removeWeapon "ItemRadio";
	} else {
		closeDialog 0;
		cutText [format["You do not have the required humanity. Your humanity is %1, you need to lose %2 .",_humanity,(-2500 - _humanity)], "PLAIN DOWN"];
	};
};

if (_skin == "soldierh") then {
	if(_humanity >= 5000) then{
    player removeMagazine _removeSkin;
    player addMagazine _AddSkin;
    uisleep 0.5;
    [dayz_playerUID,dayz_characterID,_choice] spawn player_humanityMorph;
    player removeWeapon "ItemRadio";
	} else {
		closeDialog 0;
		cutText [format["You do not have the required humanity. Your humanity is %1, you need to gain %2 more.",_humanity,(5000 - _humanity)], "PLAIN DOWN"];
	};
};

if (_skin == "soldierb") then {
	if(_humanity <= -2500) then{
    player removeMagazine _removeSkin;
    player addMagazine _AddSkin;
    uisleep 0.5;
    [dayz_playerUID,dayz_characterID,_choice] spawn player_humanityMorph;
    player removeWeapon "ItemRadio";
	} else {
		closeDialog 0;
		cutText [format["You do not have the required humanity. Your humanity is %1, you need to lose %2 .",_humanity,(-2500 - _humanity)], "PLAIN DOWN"];
	};
};

if (_skin == "sniperh") then {
	if(_humanity >= 5000) then{
    player removeMagazine _removeSkin;
    player addMagazine _AddSkin;
    uisleep 0.5;
    [dayz_playerUID,dayz_characterID,_choice] spawn player_humanityMorph;
    player removeWeapon "ItemRadio";
	} else {
		closeDialog 0;
		cutText [format["You do not have the required humanity. Your humanity is %1, you need to gain %2 more.",_humanity,(5000 - _humanity)], "PLAIN DOWN"];
	};
};

if (_skin == "sniperb") then {
	if(_humanity <= -2500) then{
    player removeMagazine _removeSkin;
    player addMagazine _AddSkin;
    uisleep 0.5;
    [dayz_playerUID,dayz_characterID,_choice] spawn player_humanityMorph;
    player removeWeapon "ItemRadio";
	} else {
		closeDialog 0;
		cutText [format["You do not have the required humanity. Your humanity is %1, you need to lose %2 .",_humanity,(-2500 - _humanity)], "PLAIN DOWN"];
	};
};

if (_skin == "normal") then {
	if (_choice in ["Survivor3_DZ","SurvivorW3_DZ"]) then {
	if(_humanity >= 5000) then {
	player removeMagazine _removeSkin;
	player addMagazine _AddSkin;
	uisleep 0.5;
	[dayz_playerUID,dayz_characterID,_choice] spawn player_humanityMorph;
	player removeWeapon "ItemRadio";
	} else {
	closeDialog 0;
	cutText [format["You do not have the required humanity. Your humanity is %1, you need to gain %2 more.",_humanity,(5000 - _humanity)], "PLAIN DOWN"];
	};
	} else {
		if (_choice in ["SurvivorW2_DZ","Bandit1_DZ"]) then {
		if(_humanity <= -2500) then {
		player removeMagazine _removeSkin;
		player addMagazine _AddSkin;
		uisleep 0.5;
		[dayz_playerUID,dayz_characterID,_choice] spawn player_humanityMorph;
		player removeWeapon "ItemRadio";
		} else { 
		closeDialog 0;
		cutText [format["You do not have the required humanity. Your humanity is %1, you need to lose %2 .",_humanity,(-2500 - _humanity)], "PLAIN DOWN"];
		};
		} else {
			player removeMagazine _removeSkin;
			player addMagazine _AddSkin;
			uisleep 0.5;
			[dayz_playerUID,dayz_characterID,_choice] spawn player_humanityMorph;
			player removeWeapon "ItemRadio";
		};
	};
};
};