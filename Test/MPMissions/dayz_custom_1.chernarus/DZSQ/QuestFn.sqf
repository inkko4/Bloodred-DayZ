/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/

switch (_this select 3) do {
	case 'Antibiotic': {
		closeDialog 0;createdialog 'Quest_Antibiotics';
	};
	case 'Zombie': {
		closeDialog 0;createdialog 'Quest_Zombies';
	};
	case 'Boat': {
		closeDialog 0;createdialog 'Quest_Boat';
	};
	case 'Bandit': {
		closeDialog 0;createdialog 'Quest_Bandit';
	};
	case 'Hero': {
		closeDialog 0;createdialog 'Quest_Hero';
	};
	case 'Lumber': {
		closeDialog 0;createdialog 'Quest_Lumber';
	};
	case 'Bounty': {
		closeDialog 0;createdialog 'Quest_Bounty';
	};
	case 'Construction': {
		closeDialog 0;createdialog 'Quest_Zelenogorsk';
	};
	case 'Race': {
		closeDialog 0;createdialog 'Quest_Race';
	};
	case 'Claim': {
		systemchat 'You search the body and find what you are looking for. Return to Mista to claim your reward.'; profileNamespace setVariable ["BountyClaimed",true]; saveProfileNamespace; cursorTarget setvariable ["quest10",0,true];
	};
};