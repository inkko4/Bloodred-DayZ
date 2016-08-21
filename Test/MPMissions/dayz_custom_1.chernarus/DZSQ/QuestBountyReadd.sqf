/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
private ["_name","_location"];

waitUntil { sleep 1; !isNil ("Dayz_loginCompleted") };

if (Quest_HasBountyVariable) then {
_name = name player;
_location = Dayz_logonTown;
player setVariable ["quest10",1,true];
[nil,nil,rTitleText,format["%1 has logged in near %2 and still has a bounty on their head!\nKill them to claim the reward for the bounty quest!",_name,_location], "PLAIN",20] call RE;
waituntil {!(alive player)};
profileNamespace setVariable ["HasBounty",false];
saveProfileNamespace;
};