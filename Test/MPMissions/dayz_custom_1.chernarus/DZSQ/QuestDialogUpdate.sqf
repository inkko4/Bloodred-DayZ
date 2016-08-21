/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
private ["_text","_controltype"];

_controltype = _this select 0;

if (_controltype == "Antibiotic") then {
_text = [
format["I've been looking for some %1, if you were to get me some I would give you a reward! I've heard they can be found around some of the abandoned hospitals in some of the cities. Come see me once you have %1 to give me. Try not to die while you're out there!",DZSQ_MedsQ],
format["Got any %1? If you find any laying around bring them back to me and I got a weapon with some magazines with your name on it! You can find them in hospitals if that helps you find it quicker for me.",DZSQ_MedsQ],
format["Need a weapon and some magazines? Go out and find me an %1 and they're yours. Look around some of the hospitals in the area then come back to me once you have found some. Be careful with the zombies around, they may get you infected and you might need the %1 rather then giving them to me.",DZSQ_MedsQ]
] call BIS_fnc_selectrandom;

((findDisplay 44410) displayCtrl 1101) ctrlSetText _text;  
};

if (_controltype == "Zombie") then {
_text = [
format["I've been looking for someone who has been cleaning up all the zombies that are walking about. If you get some zombie kills saved up come see me again to trade those kills in for something. If you get more then %4 Ill give you something even better then I had planned on originally. Come back to me when you get more then %1 zombie kills or maybe see what you can get with more then %2, %3, and %4 zombie kills. Make sure not to die, otherwise you'll have to start all over. Your reward will be better the more kills you come back with!",DZSQ_Zed1,DZSQ_Zed2,DZSQ_Zed3,DZSQ_Zed4],
format["Been killing zombies? Well I've been looking for someone who has been cleaning them up. I got some rewards lined up if you've killed some. %1, %2, %3, and %4 zombies will get you different rewards. The more you kill the better the reward will be. I got a couple different types of rewards I'm looking to give out.",DZSQ_Zed1,DZSQ_Zed2,DZSQ_Zed3,DZSQ_Zed4],
format["How is the zombie slaying going? Been killing as many as possible and saving those kills up for me? Remember to be careful and not die out there or you'll have to start all over! Come back to me if you reach more then %1 zombie kills for a reward. If you come back with more then %2 I'll give you a better reward so on and so one for %3 and %4. As you get more kills the rewards will slowly get better!",DZSQ_Zed1,DZSQ_Zed2,DZSQ_Zed3,DZSQ_Zed4]
] call BIS_fnc_selectrandom;

((findDisplay 44411) displayCtrl 1102) ctrlSetText _text;  
};

if (_controltype == "Boat") then {
_text = [
format["Ahoy there! I seem to have found myself in a situation that maybe you can help me with now that you are here. I drove my boat out here to checkout the island. I ran across some rocks and now the %1 is broken so I need a new one. Could you go out and find me an %1, a hose, and some string? Id do it myself but I dont know how to swim. Ill give you my boat if you help me out.",DZSQ_RepairQ],
format["Do you have a second to help me out? My boat broke down and I need a new %1, hose, some string to repair it. I can't swim so I'm unable to get it myself. Would you be able to go out and find me what I need? If you do I'll give you my boat and wait for a passerby and get off this island myself.",DZSQ_RepairQ],
format["You wouldn't happen to have a(n) %1, a hose, and some string would you? I got a boat I need to repair but I'm unable to get off this island to get the repair items I need. If you go out and bring me back the supplies I will give you my boat and you can do with it as you please.",DZSQ_RepairQ]
] call BIS_fnc_selectrandom;

((findDisplay 44412) displayCtrl 1103) ctrlSetText _text;  
};

if (_controltype == "Bandit") then {
_text = [
format["I am looking for someone who has no heart. Someone who is not scared to get their hands dirty. There are people out there who are helping others and they need to be taken down. This is a survival situation and we don't need these people helping others and foiling our fun. If you could, try and go out and kill some of those people for me. Come back to me when you have some kills and I'll give you a reward in return. There may be few but if you look hard enough you'll find them slinking around... The more heroes and regular players you kill the better the reward Ill give you. Just make sure to kill them all! Try to get %1, %2, %3, or %4 kills stocked up and see what you can get as a reward when you come visit me.",DZSQ_Bandit1,DZSQ_Bandit2,DZSQ_Bandit3,DZSQ_Bandit4],
format["Murdered anyone recently? I'm looking for someone whose killed the innocent. If you see any heroes or survivors running around take them out! Save up your kills and come back to me for a reward. Make sure not to die or you'll have to start all over. Try to get %1, %2, %3, or %4 kills stocked up and see what you can get as a reward when you come visit me.",DZSQ_Bandit1,DZSQ_Bandit2,DZSQ_Bandit3,DZSQ_Bandit4],
format["Seen any heroes or survivors running around? Murder them and save up your kills for me. I'll reward you based on how many kills you get. Make sure not to die or you'll have to start over and that wont be fun. Get %1 or get even more %2, %3, and %4 kills to see what better rewards I'll give you.",DZSQ_Bandit1,DZSQ_Bandit2,DZSQ_Bandit3,DZSQ_Bandit4]
] call BIS_fnc_selectrandom;

((findDisplay 44413) displayCtrl 1104) ctrlSetText _text;  
};

if (_controltype == "Hero") then {
_text = [
format["I'm looking for others who want to help people. There are lots of bandits running around and we are out numbered! Can you try and lower there numbers so we have a fighting chance? I hear that they are everywhere and we need a better chance against them. Find some bandits running around and kill them, try to stock up your kills and comeback and visit me. See what you'll get at %1, %2, %3, and %4 kills. I'll give you a reward, the more you kill the better the reward will be!",DZSQ_Hero1,DZSQ_Hero2,DZSQ_Hero3,DZSQ_Hero4],
format["Looking for heroes out there who have taken out some of the increasing bandit population. Make sure not to die or you'll have to start over from scratch! Come back to me when you have saved up some bandit kills and I will reward you with some rewards. %1, %2, %3, and %4 are the different amounts I'll take and the more the better for you!",DZSQ_Hero1,DZSQ_Hero2,DZSQ_Hero3,DZSQ_Hero4],
format["Killed any bandits recently? If you die your kills get reset. Come see me any time you have a bunch of bandit kills saved up and I got some rewards lined up for you for your efforts. Save up %1, %2, %3, or %4 kill and the more you turn in the better the reward.",DZSQ_Hero1,DZSQ_Hero2,DZSQ_Hero3,DZSQ_Hero4]
] call BIS_fnc_selectrandom;

((findDisplay 44414) displayCtrl 1105) ctrlSetText _text;  
};

if (_controltype == "Lumber") then {
_text = [
format["I have been trying to figure out how to start off on building a wall for a while, would you be able to help me out? I think I need a %1 and 2 rough stones but I do not have any of those with me. Can you go out and find me the materials I need to start building? If you help me out I will give you some building supplies that will help you start building as well.",DZSQ_Build2Q],
format["I'm trying to piece together what I need to start building a wall. I think I need a %1 and 2 rough stones but I do not have those with me. Would you be able to go out and search around for those for me? Bring them back to me and I'll give you some supplies to start building your own base. Be careful out there and don't forget about me!",DZSQ_Build2Q],
format["You wouldn't happen to have a %1 and 2 rough stones would you? I'm trying to start building and I don't have either of those items in my supplies. If you happen to find those laying around, bring them to me and I'll give you some supplies to start building your own stuff.",DZSQ_Build2Q]
] call BIS_fnc_selectrandom;

((findDisplay 44415) displayCtrl 1106) ctrlSetText _text;  
};

if (_controltype == "Bounty") then {
_text = [
"I'm looking for someone who is willing to risk their life for a reward. If you kill someone with a bounty on their head and check their body you'll get something I want. Be wary for when a bounty pops up. You'll want to be quick and kill them before anyone else. Come back to me when you've taken what I need off their body.",
"Have you seen any bounties pop up yet? If you do make sure you are the first one to their corpse to claim the reward! I have a couple powerful vehicles I'm looking to give away if you can bring me back what I need off of their body.",
"Every now and then I put a bounty on someone cause they have something I want. If you ever notice someone with a bounty kill them and search their body. You should find something that I want off of them and you can bring it back to me for a reward at any time. I got some pretty good rewards lined up if you come back with what I need."
] call BIS_fnc_selectrandom;

((findDisplay 44416) displayCtrl 1107) ctrlSetText _text;  
};

if (_controltype == "Construction") then {
_text = [
format["Hey there! Got time to spare? I have been scouring this building looking for supplies and am having a hard time finding what I need. Could you bring me a %1, pickaxe, and a sledge hammer? I'll give you some materials to upgrade any buildings you may have!",DZSQ_Build1Q],
format["You wouldn't happen to have a pickaxe, sledgehammer, and %1 would you? I've been looking around this building trying to find them and have been having terrible luck. If you find those tools and bring them back to me I'll reward you with some building supplies.",DZSQ_Build1Q],
format["Got a pickaxe, sledgehammer, and %1 on you? If you do I'll give you some building supplies as a reward for helping me out. I've been searching this building for a while trying to find the supplies I need but I just can't seem to find them. If you ever find yourself with everything I need come see me for a reward.",DZSQ_Build1Q]
] call BIS_fnc_selectrandom;

((findDisplay 44417) displayCtrl 1108) ctrlSetText _text;  
};

if (_controltype == "Race") then {
_text = [
format["I've been wondering how long it takes to get from %1 to %2. Would you mind making your way down there and see how quickly you can get there? I'll give you a reward depending on how fast you are! Don't get side tracked or it will take you longer.",(DZSQ_RaceQ select 0),(DZSQ_RaceQ select 2)],
format["Ever wondered how long it takes to get from %1 all the way down to %2? Well I have! I'm giving out rewards to players who attempt it. The quicker you are in getting there the better the reward will be! I got some nice vehicles I'm giving out as rewards so try and be quick!",(DZSQ_RaceQ select 0),(DZSQ_RaceQ select 2)],
format["Want to take on a task and reach %2 from %1 as fast as possible? If you're quick enough you could get some nice rewards for your effort. If you don't take it seriously you may be disappointed in what I'll give you. Start the race with me at any time and get ready to go as quickly as possible!",(DZSQ_RaceQ select 0),(DZSQ_RaceQ select 2)]
] call BIS_fnc_selectrandom;

((findDisplay 44418) displayCtrl 1109) ctrlSetText _text;  
};
