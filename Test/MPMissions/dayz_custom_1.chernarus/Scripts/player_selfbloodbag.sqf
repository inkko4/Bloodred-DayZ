//////////////////////////////////////////////////////////////////////////////////////////////
// Script writen by Krixes																	//
//    Infection chance and some comments added by Player2									//
//    Combat check added by istealth														//
//																							//
//	Version 1.4																				//
//																							//
// Change Log:																			    //
// 1: Added bloodbag use timer																//
// 2: Added a timer for the amount of time before player can use self bloodbag again		//
//////////////////////////////////////////////////////////////////////////////////////////////

private ["_bloodAmount","_humanityBool","_infectionChance","_humanityNegBool","_humanityNegAmount","_humanityAmount","_infectedLifeLost","_infectedLifeBool","_lastBloodbag","_bloodbagLastUsedTime","_bloodbagTime","_bloodbagUseTime","_bloodbagUsageTime","_incombat","_timeout"];
bloodbag_answer=nil;
sbloodbag = 
[
	["",true],
	["Self Bloodbag Confirmation", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
	["No", [2], "", -5, 	[["expression", "bloodbag_answer=false;"]], "1", "1"],
	["Yes", [3], "", -5, 	[["expression", "bloodbag_answer=true;"]], "1", "1"],
	["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
	["Exit", [-1], "", -3, 	[["expression", "bloodbag_answer=false;"]], "1", "1"]
];
showCommandingMenu "#USER:sbloodbag";
waitUntil {((!isNil 'bloodbag_answer')||(commandingMenu == ""))};
if (isNil 'bloodbag_answer') then {bloodbag_answer=false;};
if (bloodbag_answer) then
{
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Config Start-----------------------------------------------------------------------------------------------------------------------//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_bloodAmount = 8000; // Amount of blood to give to player
_bloodbagUseTime = 10; // Amount of time it takes in second for the player to use the self bloodbag
_bloodbagLastUsedTime = 60; // Amount of time in seconds before player can use self bloodbag again after a succesful use

_infectionChance = 10; // Percent chance of player infection on self bloodbag (10 = 10% | 2 = 50% | 1 = 100%)
_infectedLifeBool = true; // Whether the player can loose life if infected (True = On | False = off)
_infectedLifeLost = 1000; // Amount of life to loose in becomes infected

_humanityBool = false; // Whether the player can get humanity from giving self a bloodbag (True = On | False = off)
_humanityAmount = 50; // Amount of humanity to give player if _humanityBool is true (250 is default for normal bloodbags)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Config End-------------------------------------------------------------------------------------------------------------------------//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////////////////////////////
// Everything below need not be modified unless you know what you are doing! //
///////////////////////////////////////////////////////////////////////////////
if (isnil "lastBloodbag") then {
lastBloodbag = 0;
};
_bloodbagTime = time - lastBloodbag; // Variable used for easy reference in determining the self bloodbag cooldown
_bloodbagUsageTime = time;
_timeout = player getVariable["combattimeout", 0];
_inCombat = if (_timeout >= diag_tickTime) then { true } else { false };

if(_bloodbagTime < _bloodbagLastUsedTime) exitWith { // If cooldown is not done then exit script
	cutText [format["You may not use Self Bloodbag this soon please wait %1!",(_bloodbagTime - _bloodbagLastUsedTime)], "PLAIN DOWN"]; //display text at bottom center of screen when players cooldown is not done
};

if (_inCombat) then { // Check if in combat
    cutText [format["You are in Combat and cannot give yourself a Bloodbag"], "PLAIN DOWN"]; //display text at bottom center of screen when in combat
} else {

	player removeAction s_player_selfBloodbag; //remove the action from users scroll menu
	
	player playActionNow "Medic"; //play bloodbag animation
	
	////////////////////////////////////////////////
	// Fancy cancel if interrupted addition start //
	////////////////////////////////////////////////
	r_interrupt = false; // public interuppt variable
	_animState = animationState player; // get the animation state of the player
	r_doLoop = true; // while true sets whether to continue self bloodbagging
	_started = false; // this starts as false as a check
	_finished = false; // this starts as false and when true later sets players blood
	while {r_doLoop} do {
		_animState = animationState player; // keep checking to make sure player is in correct animation
		_isMedic = ["medic",_animState] call fnc_inString; // checking to make sure the animstate is the medic animation still
		if (_isMedic) then {
			_started = true; // this is a check to make sure everything is still ok
		};
		if(!_isMedic && !r_interrupt && (time - _bloodbagUsageTime) < _bloodbagUseTime) then {
			player playActionNow "Medic"; //play bloodbag animation
			_isMedic = true;
		};
		if (_started && !_isMedic && (time - _bloodbagUsageTime) > _bloodbagUseTime) then {
			r_doLoop = false; // turns off the loop
			_finished = true; // set finished to true to finish the self bloodbag and give player health/humanity
			lastBloodbag = time; // the last self bloodbag time
		};
		if (r_interrupt) then {
			r_doLoop = false; // if interuppted turns loop off early so _finished is never true
		};
		sleep 0.1;
	};
	r_doLoop = false; // make sure loop is off on successful self bloodbag
	///////////////////////////////////////////////
	// Fancy cancel if interrupted addition end //
	//////////////////////////////////////////////

	if (_finished) then {
	_mags = magazines player;
	if ("ItemBloodbag" in _mags) then {
		player removeMagazine "ItemBloodbag"; //remove the used bloodbag from inventory
	} else {
		if ("bloodBagOPOS" in _mags) then {
			player removeMagazine "bloodBagOPOS"; //remove the used bloodbag from inventory
		} else {
			if ("bloodBagONEG" in _mags) then {
				player removeMagazine "bloodBagONEG"; //remove the used bloodbag from inventory
			} else {
				if ("bloodBagABPOS" in _mags) then {
					player removeMagazine "bloodBagABPOS"; //remove the used bloodbag from inventory
				} else {
					if ("bloodBagABNEG" in _mags) then {
						player removeMagazine "bloodBagABNEG"; //remove the used bloodbag from inventory
					} else {
						if ("bloodBagBPOS" in _mags) then {
							player removeMagazine "bloodBagBPOS"; //remove the used bloodbag from inventory
						} else {
							if ("bloodBagAPOS" in _mags) then{
								player removeMagazine "bloodBagAPOS"; //remove the used bloodbag from inventory
							} else {
								if ("bloodBagANEG" in _mags) then {
									player removeMagazine "bloodBagANEG"; //remove the used bloodbag from inventory
								} else {
									if ("WholebloodBagOPOS" in _mags) then {
										player removeMagazine "WholebloodBagOPOS"; //remove the used bloodbag from inventory
									} else {
										if ("WholebloodBagONEG" in _mags) then {
											player removeMagazine "WholebloodBagONEG"; //remove the used bloodbag from inventory
										} else {
											if ("WholebloodBagABPOS" in _mags) then {
												player removeMagazine "WholebloodBagABPOS"; //remove the used bloodbag from inventory
											} else {
												if ("WholebloodBagABNEG" in _mags) then {
													player removeMagazine "WholebloodBagABNEG"; //remove the used bloodbag from inventory
												} else {
													if ("WholebloodBagBPOS" in _mags) then {
														player removeMagazine "WholebloodBagBPOS"; //remove the used bloodbag from inventory
													} else {
														if ("WholebloodBagAPOS" in _mags) then{
															player removeMagazine "WholebloodBagAPOS"; //remove the used bloodbag from inventory
														} else {
															if ("WholebloodBagANEG" in _mags) then {
																player removeMagazine "WholebloodBagANEG"; //remove the used bloodbag from inventory
															};};};};};};};};};};};};};};};
		r_player_blood = r_player_blood + _bloodAmount; //set players LOCAL blood to a certain ammount
		
		if(r_player_blood > 12000) then {
			r_player_blood = 12000; // If players blood is greater then max amount allowed set it to max allowed (this check keeps an error at bay)
		};
		
		// check if infected
		if (random(_infectionChance) < 0) then {
			r_player_infected = true; //set players client to show infection
			player setVariable["USEC_infected",true,true]; //tell the server the player is infected
			cutText [format["You have used a bloodbag on yourself but the bloodbag was infected!"], "PLAIN DOWN"]; //display text at bottom center of screen if infected
			
			// check for if loosing life on infection is turned on
			if(_infectedLifeBool) then {
				r_player_blood = r_player_blood - _infectedLifeLost; //set players LOCAL blood to a certain ammount
				player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
			} else { // if loosing life is turned off
				r_player_lowblood = false; //set lowblood setting to false
				10 fadeSound 1; //slowly fade their volume back to maximum
				"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5; //disable post processing blur effect
				"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5; //give them their colour back
				r_player_lowblood = false; //just double checking their blood isnt low
				player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
			};
		} else { // if not infected
			r_player_lowblood = false; //set lowblood setting to false
			10 fadeSound 1; //slowly fade their volume back to maximum
			"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5; //disable post processing blur effect
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5; //give them their colour back
			r_player_lowblood = false; //just double checking their blood isnt low
			player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
	 
			cutText [format["You have used a bloodbag on yourself!"], "PLAIN DOWN"]; //display text at bottom center of screen on succesful self bloodbag
		};
		
		// check if giving player humanity is on
		if(_humanityBool) then {
			[player,_humanityAmount] call player_humanityChange; // Set players humanity based on amount listed in config area
		};
	} else {
		// this is for handling if interrupted
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		cutText [format["You have interrupted giving yourself a bloodbag!"], "PLAIN DOWN"]; //display text at bottom center of screen on interrupt
	};
};
} else {
	systemChat ("Self Bloodbag Canceled.");
};