disableSerialization;

AsReMixhud_Control = true;

while {true} do
{

	1000 cutRsc ["ZSC_Money_Display","PLAIN"];

	_wpui = uiNameSpace getVariable "ZSC_Money_Display";
    _vitals = _wpui displayCtrl 4900;
	_Player = player;

	ZSC_ZombieKills 		= 		_Player getVariable["zombieKills",0];
	ZSC_Money 		        = 		_Player getVariable["cashMoney",0];
	ZSC_Hero_Kills 			= 		_Player getVariable["humanKills",0];
    ZSC_Bank_Balance 		= 		profileNamespace getVariable "atmBank";
	ZSC_Bandit_Kills 		= 		_Player getVariable["banditKills",0];
	ZSC_Humanity 		    = 		_Player getVariable["humanity",0];
	ZSC_Blood 		        = 		_Player getVariable["USEC_BloodQty",12000];
	ZSC_Fps 		        = 		(round diag_fps);

	if(ZSC_Humanity >= 5000) then { Humanity_Icon = "<img size='0.9' image='ZSC\gui\HeroHumanity.paa'/>"; };
	if((ZSC_Humanity >= 200) && (ZSC_Humanity <= 4999)) then { Humanity_Icon = "<img size='0.9' image='ZSC\gui\CivHumanity.paa'/>"; };
	if(ZSC_Humanity <= 199) then { Humanity_Icon = "<img size='0.9' image='ZSC\gui\BanditHumanity.paa'/>"; };

	_vitals ctrlSetStructuredText parseText format 
["
	<t size='0.8' align='right'>~~~~~ Stats ~~~~~</t><br/>
	<t size='0.9'> %1 </t><img size='0.9' align='right' image='ZSC\gui\Health.paa'/><br/> 
	<t size='0.9'> %2 %3 </t><br/> 
	<t size='0.9'> %4 </t><img size='0.9' align='right' image='ZSC\gui\Money.paa'/><br/>
	<t size='0.9'> %5 </t><img size='0.9' align='right' image='ZSC\gui\Bank.paa'/><br/>
	<t size='0.9'> %6 </t><img size='0.9' align='right' image='ZSC\gui\HeroKills.paa'/><br/> 
	<t size='0.9'> %7 </t><img size='0.9' align='right' image='ZSC\gui\BanditKills.paa'/><br/>
	<t size='0.9'> %8 </t><img size='0.9' align='right' image='ZSC\gui\ZombieKills.paa'/><br/>
	<t size='0.9'> %9 </t><img size='0.9' align='right' image='ZSC\gui\Fps.paa'/><br/>
	<t size='0.8' align='right'>~~~~~~~~~~~~~~~~~</t><br/>",
	ZSC_Blood,
	[ZSC_Humanity] call BIS_fnc_numberText,
	Humanity_Icon,
	[ZSC_Money] call BIS_fnc_numberText,
	[ZSC_Bank_Balance] call BIS_fnc_numberText,
	ZSC_Hero_Kills,
	ZSC_Bandit_Kills,
	ZSC_ZombieKills,
	ZSC_Fps
];
	_vitals ctrlCommit 0;
    sleep 1.5;
};