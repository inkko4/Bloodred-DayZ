[]spawn {
sidechatwarning = 0;
sidechatcooldown = false;
while {1 == 1} do {
disableSerialization;
if (isnil "sidechatwarning") then {sidechatwarning = 0};
if(!isNull findDisplay 63) then
{
	_ctrlText = ctrlText (findDisplay 63 displayCtrl 101);
	_chID = switch _ctrlText do {
		case localize 'STR_GLOBAL_CHANNEL' : {3};
		case localize 'STR_SIDE_CHANNEL' : {1};
		default {['',-1]};
	};
if((!isNull findDisplay 55) && (_chID in [3,1])) then
{
	_msg = 'DO NOT USE VOICE IN SIDE/GLOBAL CHAT!';

	1 cutText [format ['%1',_msg],'PLAIN DOWN'];
	systemchat _msg;
	
	if (sidechatwarning > 1 && !sidechatcooldown) then {
		[] spawn {
		sidechatcooldown = true;
		sidechatwarning = sidechatwarning + 1;
		systemchat 'Do not use voice chat in side! You have been warned! 3 of 3';
		playSound "shutup";
		player setHit["legs",1];
		(vehicle player) SetVelocity [6,6,2];
		uiSleep 1;
		(vehicle player) SetVelocity [6,6,2];
		uiSleep 1;
		(vehicle player) SetVelocity [6,6,2];
		uiSleep 4;
		[100,15] call fnc_usec_pitchWhine;
		sleep 1;
		endmission "Loser";
		sidechatcooldown = false;
		};
	};
	if (sidechatwarning == 1 && !sidechatcooldown) then {
		[] spawn {
		sidechatcooldown = true;
		sidechatwarning = sidechatwarning + 1;
		systemchat 'Do not use voice chat in side! You have been warned! 2 of 3';
		playSound "shutup";
		player setHit["legs",1];
		(vehicle player) SetVelocity [6,6,2];
		uiSleep 1;
		(vehicle player) SetVelocity [6,6,2];
		uiSleep 1;
		(vehicle player) SetVelocity [6,6,2];
		uisleep 4;
		[80,15] call fnc_usec_pitchWhine;
		sidechatcooldown = false;
		};
	};
	if (sidechatwarning == 0 && !sidechatcooldown) then {
		[] spawn {
		sidechatcooldown = true;
		sidechatwarning = sidechatwarning + 1;
		systemchat 'Do not use voice chat in side! You have been warned! 1 of 3';
		playSound "shutup";
		(vehicle player) SetVelocity [6,6,2];
		uisleep 1;
		(vehicle player) SetVelocity [6,6,2];
		uisleep 1;
		(vehicle player) SetVelocity [6,6,2];
		uisleep 4;
		[60,15] call fnc_usec_pitchWhine;
		sidechatcooldown = false;
		};
	};
	
};
};
sleep 1;
};
};