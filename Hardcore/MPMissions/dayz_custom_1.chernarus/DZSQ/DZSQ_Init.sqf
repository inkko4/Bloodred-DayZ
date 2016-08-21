/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/

//DZSQ_QuestSystem = compile preprocessFileLineNumbers "Quest\QuestSystem.sqf";

// Extended Configuration
call compile preprocessFileLineNumbers "DZSQ\Configurables.sqf";

// Quests
DZSQ_QuestAntibiotic = 		compile preprocessFileLineNumbers "DZSQ\Quests\DZSQ_QuestAntibiotic.sqf";
DZSQ_QuestZombie = 			compile preprocessFileLineNumbers "DZSQ\Quests\DZSQ_QuestZombie.sqf";
DZSQ_QuestBoat = 			compile preprocessFileLineNumbers "DZSQ\Quests\DZSQ_QuestBoat.sqf";
DZSQ_QuestBandit = 			compile preprocessFileLineNumbers "DZSQ\Quests\DZSQ_QuestBandit.sqf";
DZSQ_QuestHero = 			compile preprocessFileLineNumbers "DZSQ\Quests\DZSQ_QuestHero.sqf";
DZSQ_QuestLumber = 			compile preprocessFileLineNumbers "DZSQ\Quests\DZSQ_QuestLumber.sqf";
DZSQ_QuestBounty = 			compile preprocessFileLineNumbers "DZSQ\Quests\DZSQ_QuestBounty.sqf";
DZSQ_QuestConstruction = 	compile preprocessFileLineNumbers "DZSQ\Quests\DZSQ_QuestConstruction.sqf";
DZSQ_QuestRace = 			compile preprocessFileLineNumbers "DZSQ\Quests\DZSQ_QuestRace.sqf";

// Defines
DZSQ_QuestDialogUpdate = 	compile preprocessFileLineNumbers "DZSQ\QuestDialogUpdate.sqf";
DZSQ_QuestBountyRandom = 	compile preprocessFileLineNumbers "DZSQ\QuestBountyRandom.sqf";
DZSQ_QuestBountyReadd = 	compile preprocessFileLineNumbers "DZSQ\QuestBountyReadd.sqf";
DZSQ_QuestRewardSystem = 	compile preprocessFileLineNumbers "DZSQ\QuestRewardSystem.sqf";
DZSQ_QuestBoxCleanup = 		compile preprocessFileLineNumbers "DZSQ\QuestBoxCleanup.sqf";

systemchat '[DZSQ] Compiled, current build (V 1.0).';

// Ending portion of initialization. Must happen at end so that nothing gets held up.

waitUntil { sleep 1; !isNil ("Dayz_loginCompleted") };

Quest_BountyVariable = profileNamespace getVariable "BountyClaimed";
if (isnil "Quest_BountyVariable") then {
Quest_BountyVariable = false;
};

Quest_HasBountyVariable = profileNamespace getVariable "HasBounty";
if (isnil "Quest_HasBountyVariable") then {
Quest_HasBountyVariable = false;
};

if (Quest_HasBountyVariable) then {
call DZSQ_QuestBountyReadd;
};