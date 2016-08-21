/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
private ["_queststatus","_quest","_magazines"];

_quest = _this select 0;
diag_log format["DZSQ DEBUG: %1",_quest];
if (_quest == "Antibiotic") then {

_queststatus = player getVariable ["QuestAntibiotic",0]; //temporary antispam variable of quest. Can't redo quest until relog or death.

if (isnil "_queststatus") then {
	player setVariable ["QuestAntibiotic",0,true];
};

if (_queststatus == 1) exitwith {systemchat format['I do not need any more %1 at the moment.',DZSQ_MedsQ];};
	_magazines = magazines player;

	if (DZSQ_MedsQ in _magazines) then {
		["Weapon",0,"QuestAntibiotic",[false,0],[false,0],[false,0],1,DZSQ_MedsQ,0] call DZSQ_QuestRewardSystem;
	} else {
		systemchat format['You are missing %1 from your inventory.',DZSQ_MedsQ];
	};

} else {
	systemchat 'Something has gone wrong. Please try again.';
	diag_log format['DZSQ DEBUG: (%1) attempted quest %2. Failure in file DZSQ_QuestZombie.sqf',name (player),_quest];
};