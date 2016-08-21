/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
private ["_queststatus","_banditkills","_humanity","_quest","_type","_level"];

_quest = _this select 0;

if (_quest == "Hero") then {

_queststatus = player getVariable ["QuestHero",0];
_banditkills = player getVariable "banditKills";
_humanity = player getVariable["humanity",0];

if (isnil "_queststatus") then {
	player setVariable ["QuestHero",0,true];
};

if (_humanity <= DZSQ_RequiredHero) exitwith {systemchat 'I do not wish to talk to someone with your standings.';};
if (_queststatus == 1) exitwith {systemchat 'Youve already claimed your reward, I dont have anything else to give.';};
if (_banditkills <= 25) exitwith {systemchat 'Looks like you are not trying very hard... comeback when you get some more bandit kills.';};

if (DZSQ_Hero1 <= _banditkills) then {
	if (DZSQ_Hero2 <= _banditkills) then {
		if (DZSQ_Hero3 <= _banditkills) then {
			if (DZSQ_Hero4 <= _banditkills) then {
				_type = DZSQ_HeroRew4 select 0;
				_level = DZSQ_HeroRew4 select 1;
				[_type,_level,"QuestHero",[true,DZSQ_Hero4],[false,0],[false,0],0,"",0] call DZSQ_QuestRewardSystem;
			} else {
				_type = DZSQ_HeroRew3 select 0;
				_level = DZSQ_HeroRew3 select 1;
				[_type,_level,"QuestHero",[true,DZSQ_Hero3],[false,0],[false,0],0,"",0] call DZSQ_QuestRewardSystem;
			};
		} else {
			_type = DZSQ_HeroRew2 select 0;
			_level = DZSQ_HeroRew2 select 1;
			[_type,_level,"QuestHero",[true,DZSQ_Hero2],[false,0],[false,0],0,"",0] call DZSQ_QuestRewardSystem;
		};
	} else {
		_type = DZSQ_HeroRew1 select 0;
		_level = DZSQ_HeroRew1 select 1;
		[_type,_level,"QuestHero",[true,DZSQ_Hero1],[false,0],[false,0],0,"",0] call DZSQ_QuestRewardSystem;
	};
} else {systemchat 'Comeback when you have more humanity to spare.';};
} else {
	systemchat 'Something has gone wrong, please try again.';
};