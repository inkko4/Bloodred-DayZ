/*---------------------------------------------------------------------------
Function:	Toggleable Triple Mode Debug Monitor
Author:		Player2
www.ZombZ.org

	4 Modes - Off - Minimal - Full - Stats

Configuration Options

	Default setting for when a player loads into the server
	P2DZ_DebugMonDefault = 2; Valid Inputs: 1 (Off), 2 (Full), 3 (Minimal), 4 (Stats) - Disabled for Now
---------------------------------------------------------------------------*/
/* CONFIGURATION START */
//Default setting for when a player loads into the server
P2DZ_debugMonitor = 	false; //set to true at EOF
P2DZ_debugMonSleep = 	0.4; 
P2DZ_debugSliderRange = 100;
P2DZ_dbCurMode = 		2;
P2DZE_debugCol = 		[0,0,0,0.2];
diag_log("P2DEBUG: Spawning Debug Monitor in Mode: " + str P2DZ_dbCurMode + " Refresh Time: " + str P2DZ_debugMonSleep);


fnc_bloodCol = {
	private["_input","_output"];
	_input = round((r_player_blood * 2) / 1000);

	_output = switch (_input) do {
		//dead
 		default { "#210000" };
	    case 0: { "#210000" };
	    //reds
	    case 1: { "#330000" };
	    case 2: { "#630000" };
	    case 3: { "#910000" };
	    case 4: { "#BF0000" };
	    case 5: { "#E30000" };
	    case 6: { "#FF0000" };
	    //oranges
	    case 7: { "#FF3700" };
	    case 8: { "#FF4800" };
	    case 9: { "#FF6200" };
	    case 10: { "#FF8400" };
	    case 11: { "#FF9D00" };
	    case 12: { "#FFCC00" };
	    //yellows
	    case 13: { "#FFDD00" };
	    case 14: { "#FFEA00" };
	    case 15: { "#E8E800" };
	    case 16: { "#C9E800" };
	    case 17: { "#DDFF00" };
	    case 18: { "#CCFF00" };
	    //greens
	    case 19: { "#BFFF00" };
	    case 20: { "#A2FF00" };
	    case 21: { "#91FF00" };
	    case 22: { "#5EFF00" };
	    case 23: { "#15FF00" };
	    case 24: { "#00FF2F" };
	};
	//function by player2
	_output
};

fnc_pDir = {
	private["_d","_o"];
	_d = (round(getDir (vehicle player)));
	_o = switch (true) do {
 		default { (format["N %1", 	_pDir]) };
 		case 	(((_pDir >= 355) 	&& (_pDir <=359)) 
 		|| 		((_pDir >= 0) 		&& (_pDir <= 5))): 	{ (format["N %1", 	_pDir])	};
	    case 	((_pDir > 5) 		&& (_pDir < 85)): 	{ (format["NE %1", 	_pDir]) };
	    case 	((_pDir >= 85) 		&& (_pDir <= 95)): 	{ (format["E %1", 	_pDir]) };
	    case 	((_pDir > 95) 		&& (_pDir < 175)): 	{ (format["SE %1", 	_pDir]) };
	    case 	((_pDir >= 175) 	&& (_pDir <= 185)): { (format["S %1", 	_pDir]) };
	    case 	((_pDir > 185) 		&& (_pDir < 265)): 	{ (format["SW %1", 	_pDir]) };
	    case 	((_pDir >= 265) 	&& (_pDir <= 275)): { (format["W %1", 	_pDir]) };
	    case 	((_pDir > 275) 		&& (_pDir < 355)): 	{ (format["NW %1", 	_pDir]) };
	    //function by player2
	};
	_o
};

fnc_cEnts = {
	private ["_p2p", "_nE", "_cV"];
	P2DZ_db_tP = 0;	P2DZ_db_tN = -1;	P2DZ_db_tV = 0;	P2DZ_db_tZ = 0;
	
	_p2p = player;
	_nE = (position _p2p) nearEntities 32239;
	_cV = [];
	{
		private["_e"];
		_e = _x;

		if (_e isKindOf "LandVehicle" || _e isKindOf "Ship" || _e isKindOf "Air") then {
			P2DZ_db_tV = P2DZ_db_tV + 1;
		};

		if (_e isKindOf "zZombie_Base") then {
			P2DZ_db_tZ = P2DZ_db_tZ + 1;
		};

		if (isPlayer _e) then { 
			if (!(_e in _cV)) then {
				P2DZ_db_tP = P2DZ_db_tP + ({alive _x} count (crew _e));
				_cV = _cV + [(vehicle _e)];
				if ((((position _p2p) distance (position _e)) < 2500)) then {
					P2DZ_db_tN = P2DZ_db_tN + ({alive _x} count (crew _e));
				};
			};
		};
	} forEach _nE;

	_nE = nil;	_cV = nil;	_p2p = nil;
	//function by player2
};


fnc_debugFull = {
	private ["_p2plyr", "_p2vplyr", "_p2p", "_p2ps", "_p2mkills", "_p2bKills", "_p2zKills", "_p2zHSKills", "_p2wep", "_p2skin", "_pDir", "_gpsP2osZombZ", "_pDirT", "_zombztimeToRestart"];
	_p2plyr = player;
	_p2vplyr = vehicle _p2plyr;
	P2DZ_humanity = (_p2plyr getVariable['humanity', 0]);
	P2DZ_humanityLevel = P2DZ_humanity;

	_p2p = "img\logo.paa";
	_p2ps = "3.0";

	if (P2DZ_humanityLevel < 0) then {
		P2DZ_humanityPrefix = "Bandit: ";
	} else {
		if (P2DZ_humanityLevel > 0) then {
			P2DZ_humanityPrefix = "Hero: ";
		} else {
			if (P2DZ_humanityLevel == 0) then {
				P2DZ_humanityPrefix = "Survivor: ";
			};
		};
	};

	if (_p2plyr == _p2vplyr) then
	{
		_p2p = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon _p2plyr) >> 'picture'));	
		_p2ps = "3.0";
	} else	{
		_p2p = (gettext (configFile >> 'CfgVehicles' >> (typeof _p2vplyr) >> 'picture'));	
		_p2ps = "3.0";
	};

	if (_p2p == "") then { _p2p = "img\logo.paa"; _p2ps = "3.0"; };

	_p2mkills   = (_p2plyr getVariable['humanKills', 0]);
	_p2bKills   = (_p2plyr getVariable['banditKills', 0]);
	_p2zKills   = (_p2plyr getVariable['zombieKills', 0]); 
	_p2zHSKills = (_p2plyr getVariable['headShots', 0]);

	_p2wep = toUpper(currentWeapon _p2plyr);
	if ((isNil '_p2wep') || (_p2wep == "")) then {
		_p2wep = "Direct Chat";
	};
	_p2skin = (typeOf _p2plyr);

	_pDir = (round(getDir (_p2vplyr))); _gpsP2osZombZ = (mapGridPosition getPos _p2plyr);
	_pDirT = call fnc_pDir;

	P2DZ_debugMon_Mode = "Full"; P2DZ_debugMon_ToggleKey = "6";
	_zombztimeToRestart = 	(120 - (round(serverTime / 60)));

	["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
	"<img align='center' size=" + str _p2ps + " image=" + str _p2p + "/><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Players:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>" + str P2DZ_db_tP + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FC473A'>Murders: </t><t size='1' font='Bitstream' align='right' color='#FC473A'>" + str _p2mkills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#8BFF6B'>Bandit Kills: </t><t size='1' font='Bitstream' align='right' color='#8BFF6B'>" + str _p2bKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Blood: </t><t size='1' font='Bitstream' align='right' color=" + str P2DZ_debugBloodCol + ">" + str r_player_blood + "</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Gun: </t><t size='0.75' font='Bitstream' align='right' color='#01DFD7'>" + _p2wep + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Headshots / Z Kills: </t><t size='1' font='Bitstream' align='right' color='#01DFD7'>" + str _p2zHSKills + "/" + str _p2zKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Skin: </t><t size='0.8' font='Bitstream' align='right' color='#01DFD7'>" + _p2skin + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Humanity: </t><t size='1' font='Bitstream' align='right' color='#01DFD7'>" + str P2DZ_humanity + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Active Vehicles: </t><t size='1' font='Bitstream' align='right' color='#FFBF00'>" + str P2DZ_db_tV + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Active Zombies: </t><t size='1' font='Bitstream' align='right' color='#FFBF00'>" + str P2DZ_db_tZ + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FFBF00'>Restart In: </t><t size='1' font='Bitstream' align='right' color='#FFBF00'>" + str _zombztimeToRestart + " Mins</t><br/><br/>
	<t size='1' font='Bitstream' align='left' color='#F7F2E0'>DIR: "+ _pDirT + "</t><t size='1' font='Bitstream' align='right' color='#F7F2E0'>GPS: " + _gpsP2osZombZ + "</t>", 
	P2DZE_debugCol, //debug design by player2
	false
	] call P2DZ_hintFull;
};

fnc_debugMini = {
	private ["_p2plyr", "_p2vplyr", "_p2mkills", "_p2bKills", "_pDir", "_gpsP2osZombZ", "_pDirT"];
	_p2plyr = player;
	_p2vplyr = vehicle _p2plyr;
	P2DZ_debugMon_Mode = "Mini";
	P2DZ_debugMon_ToggleKey = "6";

	_p2mkills = (_p2plyr getVariable['humanKills', 0]);
	_p2bKills = (_p2plyr getVariable['banditKills', 0]);
	_pDir = (round(getDir (_p2vplyr)));
	_gpsP2osZombZ = (mapGridPosition getPos _p2plyr);
	_pDirT = call fnc_pDir;

	["<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Mode: " + P2DZ_debugMon_Mode + "</t><t size='1' font='Bitstream' align='right'>Key: " + P2DZ_debugMon_ToggleKey + "</t>", 
	"<t size='1' font='Bitstream' align='left' color='#FFFFFF'>Players:</t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>" + str P2DZ_db_tP + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#FC473A'>Murders:</t><t size='1' font='Bitstream' align='right' color='#FC473A'>" + str _p2mkills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#8BFF6B'>Bandit Kills:</t><t size='1' font='Bitstream' align='right' color='#8BFF6B'>" + str _p2bKills + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#01DFD7'>Blood: </t><t size='1' font='Bitstream' align='right' color=" + str P2DZ_debugBloodCol + ">" + str r_player_blood + "</t><br/>
	<t size='1' font='Bitstream' align='left' color='#F7F2E0'>DIR: "+ _pDirT + "</t><t size='1' font='Bitstream' align='right' color='#F7F2E0'>GPS: " + _gpsP2osZombZ + "</t>", 
	P2DZE_debugCol, //debug design by player2
	false
	] call P2DZ_hintMini;
};

 /* CONFIGURATION END */

fnc_debugMon = {
	private["_entCounterThread","_debugMonThread"];

	_entCounterThread = [] spawn {
		while {true} do {
			if (P2DZ_debugMonitor) then {
				[] call fnc_cEnts;
				uiSleep 9;
			};
			uiSleep 1;
		};
	};

	_debugMonThread = [] spawn {
		private["_handle0","_handle1","_handle2","_handle3"];
		_handle0 = -1;
		_handle1 = -1;
		_handle2 = -1;
		_handle3 = -1;
		while {true} do {
			if (P2DZ_debugMonitor) then {
				switch (P2DZ_dbCurMode) do
				{
				    case 1:
				    {
				        667 cutText ["", "PLAIN"];
						P2DZ_debugMonitor = false;
						player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true];
				    };
				    case 2:
				    {
				    	P2DZ_debugBloodCol = [] call fnc_bloodCol;
				        _handle2 = [] call fnc_debugFull;
						P2DZ_debugMonitor = true;
						player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true];
						uiSleep P2DZ_debugMonSleep; //double sleep for full mode
				    };
				    case 3:
				    {
				    	P2DZ_debugBloodCol = [] call fnc_bloodCol;
						_handle3 = [] call fnc_debugMini;
						P2DZ_debugMonitor = true;
						player setVariable ["P2_DebugMonMode", P2DZ_dbCurMode, true];
					};
					default
					{
				        667 cutText ["", "PLAIN"];
				        P2DZ_debugMonitor = false;
					};
				};
			};

			//function by player2
			uiSleep P2DZ_debugMonSleep;
		};
	};
};

P2DZ_debugMonitor = 	true;