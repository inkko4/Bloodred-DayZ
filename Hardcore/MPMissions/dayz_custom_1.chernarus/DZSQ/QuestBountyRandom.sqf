/*
	DayZ Simple Quests (DZSQ)
	Created by Inkko
	Revision V1.0
*/
private ["_variable","_location","_name","_number"];

_location = _this select 0;

_name = name player;
_number = round (random 500);

_variable = profileNamespace getVariable "HasBounty";

if (isnil "_variable") then {
	_variable = false;
};

if (_variable) exitwith {};

waituntil {speed player > 1}; //make sure its not triggered preemptively

if (_number <= 25) then {

player setVariable ["quest10",1,true];
profilenamespace setVariable ["HasBounty",true];
saveProfileNamespace;

[nil,nil,rTitleText,format["A bounty has been placed on %1 near %2.\nKill them and claim the bounty before anyone else!",_name,_location], "PLAIN",20] call RE;

waituntil {!(alive player)}; // if they logout we want to keep the bounty on them!
profilenamespace setVariable ["HasBounty",false];
saveProfileNamespace;
};