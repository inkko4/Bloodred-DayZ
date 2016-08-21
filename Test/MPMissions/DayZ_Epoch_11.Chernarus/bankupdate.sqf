private ["_runonce","_bank","_puid","_bankupdate"];

_runonce = profileNamespace getVariable "BankUpdate";
_bank = profileNamespace getVariable "atmBank";
if (isnil "_runonce") then {
	if (_bank > 0) exitwith {systemchat "It looks like you already have coins in the bank, contact an admin for further assistance with bank currency recovery."};
	_puid = getplayerUID player;
	if (_puid in ['76561198103195762','76561198087149415','76561198180656346','76561198202865131','76561198138514808','76561198057584805','76561198146721582','76561198045871281','76561198207913745','76561198067228835','76561198038091605','76561198116123127','76561198133913145','76561197993623424','76561198083629031','76561198009422645','76561198007096918','76561197969276669','76561198073465751','76561198037657781','76561198124462251','76561198131708876','76561198138580184','76561198219862751','76561198267686264','76561197994936580','76561198054115001','76561198045496838','76561198167079518','76561197998590974','76561198065987199','76561198063347276','76561198002961292','76561198168053350','76561198269522890','76561198140939465']) then {
		systemchat "Updating banking system to newest version...";
		PVDZ_BankCheck = [player,getplayerUID player];
		publicVariableServer "PVDZ_BankCheck";

		waituntil {!isnil "PVDZ_BankCheckReturn"};

		if (PVDZ_BankCheckReturn) exitwith {systemchat "Bank update has already run! If you changed your name please change back and empty your bank first!";};

		switch _puid do {
			case '76561198083629031' : { _bankupdate = 86222600; };
			case '76561198103195762' : { _bankupdate = 78300000; };
			case '76561198087149415' : { _bankupdate = 48545700; };
			case '76561198180656346' : { _bankupdate = 19043000; };
			case '76561198202865131' : { _bankupdate = 14486200; };
			case '76561198138514808' : { _bankupdate = 12401400; };
			case '76561198057584805' : { _bankupdate = 11650000; };
			case '76561198146721582' : { _bankupdate = 10601100; };
			case '76561198045871281' : { _bankupdate = 10360200; };
			case '76561198207913745' : { _bankupdate = 9718200; };
			case '76561198067228835' : { _bankupdate = 9372700; };
			case '76561198038091605' : { _bankupdate = 7637960; };
			case '76561198133913145' : { _bankupdate = 4910730; };
			case '76561197993623424' : { _bankupdate = 4640750; };
			case '76561198116123127' : { _bankupdate = 4401770; };
			case '76561198007096918' : { _bankupdate = 3258500; };
			case '76561197969276669' : { _bankupdate = 2522580; };
			case '76561198073465751' : { _bankupdate = 2061770; };
			case '76561198037657781' : { _bankupdate = 2044700; };
			case '76561198124462251' : { _bankupdate = 2029350; };
			case '76561198063347276' : { _bankupdate = 886759; };
			case '76561198131708876' : { _bankupdate = 601025; };
			case '76561198138580184' : { _bankupdate = 589339; };
			case '76561198219862751' : { _bankupdate = 533211; };
			case '76561198267686264' : { _bankupdate = 490770; };
			case '76561197994936580' : { _bankupdate = 485000; };
			case '76561198054115001' : { _bankupdate = 461841; };
			case '76561198045496838' : { _bankupdate = 416501; };
			case '76561198167079518' : { _bankupdate = 200000; };
			case '76561197998590974' : { _bankupdate = 167000; };
			case '76561198065987199' : { _bankupdate = 150000; };
			case '76561198002961292' : { _bankupdate = 75000; };
			case '76561198168053350' : { _bankupdate = 61300; };
			case '76561198269522890' : { _bankupdate = 28000; };
			case '76561198140939465' : { _bankupdate = 10000; };
			default { _bankupdate = 0; };
		};
		systemchat format["Updating your new bank account with %1 coins..",_bankupdate];
		profileNamespace setVariable ["atmBank",_bankupdate];
		profileNamespace setVariable ["BankUpdate",true];
		saveProfilenamespace;
	};
};