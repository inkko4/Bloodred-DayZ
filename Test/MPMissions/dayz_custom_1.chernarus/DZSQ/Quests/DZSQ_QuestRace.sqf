/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
private ["_timer","_quest","_queststatus","_type","_level","_racestartname","_racestartcords","_objectivename","_objectivecords","_formula","_formula1","_formula2","_formula3","_formula4"];

_quest = _this select 0;

if (_quest == "Race") then {
_queststatus = player getVariable ["QuestRace",0];
_racestartname = DZSQ_RaceQ select 0;
_racestartcords = DZSQ_RaceQ select 1;
_objectivename = DZSQ_RaceQ select 2;
_objectivecords = DZSQ_RaceQ select 3;

_timer = 0;

while {(count (waypoints (group player))) > 0} do
{
	deleteWaypoint ((waypoints (group player)) select 0);
};
 
DZSQ_Waypnt = (group player) addwaypoint [(getpos player), 0];
DZSQ_Waypnt = (group player) addwaypoint [_racestartcords, 0];
if (isnil "_queststatus") then {
	player setVariable ["QuestRace",0,true];
};

if (_queststatus == 1) exitwith {systemchat 'Youve already started this quest.';};
player setVariable ["QuestRace",1,true]; // we set this here so you cannot start multiple races
waituntil {(getpos player) distance _racestartcords < 200};

DZSQ_Waypnt = (group player) addwaypoint [_objectivecords, 0];

systemchat format["You have reached the race start (%1) try and get to %2 as fast as possible!",_racestartname,_objectivename];
while {(getpos player) distance _objectivecords > 500} do {
systemchat format['Timer: %1',_timer];
_timer = _timer + 1;
uisleep 1;
};

_formula = _racestartcords distance _objectivecords;
_formula1 = round(_formula/((DZSQ_RaceTime4 * 1000)/3600)); // ~mi17
_formula2 = round(_formula/((DZSQ_RaceTime3 * 1000)/3600)); // ~Uh1h
_formula3 = round(_formula/((DZSQ_RaceTime2 * 1000)/3600)); // ~vehicle
_formula4 = round(_formula/((DZSQ_RaceTime1 * 1000)/3600)); // ~walking

while {(count (waypoints (group player))) > 0} do
{
	deleteWaypoint ((waypoints (group player)) select 0);
};

systemchat format['Your time was %1s',_timer];

// min time requirement so that people can't cheat somehow...
if (_timer < DZSQ_RaceMin) exitwith {systemchat 'You were a little too fast... maybe something went wrong so try again.';player setVariable ["QuestRace",0,true];};

if (_timer > _formula1) then { //120
	if (_timer > _formula2) then { //210
		if (_timer > _formula3) then { //300
			if (_timer > _formula4) then { //390
				_type = DZSQ_RaceRew5 select 0;
				_level = DZSQ_RaceRew5 select 1;
				[_type,_level,"QuestRace",[false,0],[false,0],[false,0],0,"",0] call DZSQ_QuestRewardSystem; // (390+)
			} else {	
				_type =  DZSQ_RaceRew4 select 0;
				_level =  DZSQ_RaceRew4 select 1;
				[_type,_level,"QuestRace",[false,0],[false,0],[false,0],0,"",0] call DZSQ_QuestRewardSystem; // (300-390)
			};
		} else {
			_type =  DZSQ_RaceRew3 select 0;
			_level =  DZSQ_RaceRew3 select 1;
			[_type,_level,"QuestRace",[false,0],[false,0],[false,0],0,"",0] call DZSQ_QuestRewardSystem; // (210-300)
		};
	} else {
		_type =  DZSQ_RaceRew2 select 0;
		_level =  DZSQ_RaceRew2 select 1;
		[_type,_level,"QuestRace",[false,0],[false,0],[false,0],0,"",0] call DZSQ_QuestRewardSystem; // (120-210)
	};
} else {
	_type =  DZSQ_RaceRew1 select 0;
	_level =  DZSQ_RaceRew1 select 1;
	[_type,_level,"QuestRace",[false,0],[false,0],[false,0],0,"",0] call DZSQ_QuestRewardSystem; // between DZSQ_RaceTime1 and DZSQ_RaceMin (30-120s default)
};
} else {
	systemchat 'Something has gone wrong, please try again.';player setVariable ["QuestRace",0,true];
};