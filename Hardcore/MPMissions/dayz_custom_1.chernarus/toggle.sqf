_selection = _this select 0;
if (isnil "holiday_event") then {
holiday_event = false;
};

if (holiday_event) exitwith {systemchat "Unable to do this at the current time.";};

if (_selection == "Fog") then {
if (BR_Toggle_Weather_Fog == 1) then {
	15 setFog 1;
	systemchat "Fog changing over several seconds...";
	BR_Toggle_Weather_Fog = 0;
} else {
	15 setFog 0;
	BR_Toggle_Weather_Fog = 1;
	systemchat "Fog Disabled.";
};
};
if (_selection == "Rain") then {
if (BR_Toggle_Weather_Rain == 1) then {
	15 setRain 1;
	systemchat "Rain requires overcast.";
	systemchat "Rain changing over several seconds...";
	BR_Toggle_Weather_Rain = 0;
} else {
	15 setRain 0;
	BR_Toggle_Weather_Rain = 1;
	systemchat "Rain Disabled.";
};
};
if (_selection == "Overcast") then {
if (BR_Toggle_Weather_Overcast == 1) then {
	15 setOvercast 1;
	systemchat "Overcast changing over several seconds...";
	BR_Toggle_Weather_Overcast = 0;
} else {
	15 setOvercast 0;
	BR_Toggle_Weather_Overcast = 1;
	systemchat "Overcast Disabled.";
};
};
if (_selection == "Random") then {
if (BR_Toggle_Weather_Random == 1) then {
	_randomfog = random 1;
	_randomrain = random 1;
	_randomovercast = random 1;
	15 setFog _randomfog;
	15 setRain _randomrain;
	15 setOvercast _randomovercast;
	systemchat "Random weather started..";
	uisleep 15;
	if (_randomovercast > 0.75) then {
	systemchat "Possible Rain Forcasted...";
	systemchat format["Fog set to: %1 Rain set to: %2 Overcast set to: %3",_randomfog,_randomrain,_randomovercast];
	} else {
	systemchat "No Rain Forcasted...";
	systemchat format["Fog set to: %1 Rain set to: %2 Overcast set to: %3",_randomfog,_randomrain,_randomovercast];
	};
	BR_Toggle_Weather_Random = 0;
} else {
	0 setFog 0;
	0 setRain 0;
	0 setOvercast 0;
	BR_Toggle_Weather_Random = 1;
	systemchat "Weather Disabled.";
};
};