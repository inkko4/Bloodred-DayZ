/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
	
	To do:
	
	Update reward system to check for set position and change reward type to vehicle (Boat).
*/
private ["_queststatus","_quest","_magazines"];

_quest = _this select 0;

if (_quest == "Boat") then {

_queststatus = player getVariable ["QuestBoat",0];

if (isnil "_queststatus") then {
	player setVariable ["QuestBoat",0,true];
};

if (_queststatus == 1) exitwith {systemchat 'I do not need anymore parts at the moment, check back later and I may need more help.';};
	
	_magazines = magazines player; // magazine un-needed now?
	
	if (DZSQ_RepairQ in _magazines) then {
		["Vehicle",3,"QuestBoat",[false,0],[false,0],[false,0],2,[DZSQ_RepairQ,"equip_hose","equip_string"],2] call DZSQ_QuestRewardSystem;
	} else {
		systemchat format['You are missing %1 from your inventory.',DZSQ_RepairQ];
	};

} else {
systemchat 'Something has gone wrong please try again.';
};