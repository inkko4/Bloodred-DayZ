/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
private ["_queststatus","_murderkills","_humanity","_quest","_type","_level"];

_quest = _this select 0;

if (_quest == "Bandit") then {

_queststatus = player getVariable ["QuestBandit",0];
_murderkills = player getVariable ["humanKills",0];
_humanity = player getVariable["humanity",0];

if (isnil "_queststatus") then {
player setVariable ["QuestBandit",0,true];
};
if (DZSQ_RequiredBandit <= _humanity) exitwith {systemchat 'I do not wish to talk to someone who has not gotten their hands dirty.'};
if (_queststatus == 1) exitwith {systemchat 'Youve already claimed your reward, I dont have anything else to give.';};
if (_murderkills < DZSQ_Bandit1) exitwith {systemchat 'Looks like you are not trying very hard... comeback when you get some more bandit kills.';};

if (DZSQ_Bandit1 <= _murderkills) then {
	if (DZSQ_Bandit2 <= _murderkills) then {
		if (DZSQ_Bandit3 <= _murderkills) then {
			if (DZSQ_Bandit4 <= _murderkills) then {
				_type = DZSQ_BanditRew4 select 0;
				_level = DZSQ_BanditRew4 select 1;
				[_type,_level,"QuestBandit",[false,0],[true,DZSQ_Bandit4],[false,0],0,"",0] call DZSQ_QuestRewardSystem;
			} else {
				_type = DZSQ_BanditRew3 select 0;
				_level = DZSQ_BanditRew3 select 1;
				[_type,_level,"QuestBandit",[false,0],[true,DZSQ_Bandit3],[false,0],0,"",0] call DZSQ_QuestRewardSystem;
			};
		} else {
			_type = DZSQ_BanditRew2 select 0;
			_level = DZSQ_BanditRew2 select 1;
			[_type,_level,"QuestBandit",[false,0],[true,DZSQ_Bandit2],[false,0],0,"",0] call DZSQ_QuestRewardSystem;
		};
	} else {
		_type = DZSQ_BanditRew1 select 0;
		_level = DZSQ_BanditRew1 select 1;
		[_type,_level,"QuestBandit",[false,0],[true,DZSQ_Bandit1],[false,0],0,"",0] call DZSQ_QuestRewardSystem;
	};
} else {
 systemchat 'Comeback when you have murdered some more people.';
};
} else {
	systemchat 'Something went wrong. Please try again.';
};