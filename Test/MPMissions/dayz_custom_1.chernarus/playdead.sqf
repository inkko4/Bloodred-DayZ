if (isnil "play_deadtimer") then {
play_deadtimer = 0;
};
if (isnil "playdead_anim") then {
playdead_anim = false;
};
if (play_deadtimer > 0) exitwith {
	systemchat format["Please wait %1 seconds before trying to use this again.",play_deadtimer];
};
if (!playdead_anim) then {
	play_deadtimer = 30;
	playdead_anim = true;
	systemchat "Playing dead...";
	systemchat "Press the key again to stop...";
	[objNull, player, rPlayMove,'ainjppnemstpsnonwrfldnon'] call RE;
	[] spawn {
		for "_i" from 0 to 30 do {
			play_deadtimer = play_deadtimer - 1;
			sleep 1;
		};
		play_deadtimer = false;
	};
	waituntil {animationstate player != "ainjppnemstpsnonwrfldnon"};
	[objNull, player, rSwitchMove,''] call RE;
} else {
	systemchat "You stop playing dead...";
	[objNull, player, rSwitchMove,''] call RE;
	playdead_anim = true;
	play_deadtimer = 30;
	[] spawn {
		for "_i" from 0 to 30 do {
			play_deadtimer = play_deadtimer - 1;
			sleep 1;
		};
		play_deadtimer = false;
	};
};