/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
private ["_queststatus","_zombiekills","_quest","_type","_level"];

_quest = _this select 0;
diag_log format["DZSQ DEBUG: %1",_quest];
if (_quest == "Zombie") then {

_queststatus = player getVariable ["QuestZombie",0];
_zombiekills = player getVariable "zombieKills";

if (isnil "_queststatus") then {
	player setVariable ["QuestZombie",0,true];
};

if (_queststatus == 1) exitwith {systemchat 'You have already claimed your reward, I dont have anything else to give.';};
if (_zombiekills < DZSQ_Zed1) exitwith {systemchat 'Come back when youve killed more zombies.';};

if (DZSQ_Zed1 <= _zombiekills) then {
	if (DZSQ_Zed2 <= _zombiekills) then {
		if (DZSQ_Zed3 <= _zombiekills) then {
			if (DZSQ_Zed4 <= _zombiekills) then {
				_type = DZSQ_ZedRew4 select 0;
				_level = DZSQ_ZedRew4 select 1;
				[_type,_level,"QuestZombie",[false,0],[false,0],[true,DZSQ_Zed4],0,"",0] call DZSQ_QuestRewardSystem;
			} else {
				_type = DZSQ_ZedRew3 select 0;
				_level = DZSQ_ZedRew3 select 1;
				[_type,_level,"QuestZombie",[false,0],[false,0],[true,DZSQ_Zed3],0,"",0] call DZSQ_QuestRewardSystem;
			};
		} else {
			_type = DZSQ_ZedRew2 select 0;
			_level = DZSQ_ZedRew2 select 1;
			[_type,_level,"QuestZombie",[false,0],[false,0],[true,DZSQ_Zed2],0,"",0] call DZSQ_QuestRewardSystem;
		};
	} else {
		_type = DZSQ_ZedRew1 select 0;
		_level = DZSQ_ZedRew1 select 1;
		[_type,_level,"QuestZombie",[false,0],[false,0],[true,DZSQ_Zed1],0,"",0] call DZSQ_QuestRewardSystem;
	};
} else {
	systemchat 'Comeback when you have killed more zombies.';
};
} else {
	systemChat 'Something went wrong, please try again.';
	//diag_log format['DZSQ DEBUG: (%1) attempted quest %2. Failure in file DZSQ_QuestZombie.sqf',name (player),_quest];
};