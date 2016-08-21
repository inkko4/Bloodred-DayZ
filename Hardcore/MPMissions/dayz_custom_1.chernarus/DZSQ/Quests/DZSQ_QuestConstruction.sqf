/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
private ["_queststatus","_quest"];

_quest = _this select 0;

if (_quest == "Construction") then {

_queststatus = player getVariable ["QuestConstruction",0];

if (isnil "_queststatus") then {
	player setVariable ["QuestConstruction",0,true];
};

if (_queststatus == 1) exitwith {systemchat 'I do not need anymore supplies at the moment.';};

["Buildable",1,"QuestConstruction",[false,0],[false,0],[false,0],2,[DZSQ_Build1Q,"itemPickaxe","itemsledgehammer"],0] call DZSQ_QuestRewardSystem;

} else {
	systemchat 'Something has gone wrong. Please try again.';
};