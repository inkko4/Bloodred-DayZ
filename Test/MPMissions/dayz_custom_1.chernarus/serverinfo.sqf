switch (_this) do {
	case 'Rules': {
		'Rules' hintC parseText format ["
			<t align='center'></t><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>No spamming side chat</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>No hacking / Glitching / Duping / Exploiting </t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>No advertising other servers</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>No demeaning races</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>No player impersonating</t><br/><br/>
		"];
		uiSleep .1;
	};
	case 'ContactInfo': {
		'Contact Info' hintC parseText format ["
			<t align='center'></t><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>Website: www.bloodredcommunity.com</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>Teamspeak: ts3.bloodredcommunity.com</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>Poke an admin in TS or message an admin on the website.</t><br/><br/>
		"];
		uiSleep .1;
	};
	case 'ServerTips': {
		'Server Tips' hintC parseText format ["
			<t align='center'></t><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>AI Missions are marked on map</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>Group system: Right control opens group menu</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>'I' to open crating menu.</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>Humanity now requires you to put on the civilian clothing of your choice.</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>8 key opens player menu dialog.</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>9 key opens weather menu dialog.</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>0 (zero) key opens group menu dialog.</t><br/><br/>
		"];
		uiSleep .1;
	};
	case 'Weather': {
		'Server Tips' hintC parseText format ["
			<t align='center'></t><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>Weather is completely for atmospheric purposes.</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>Any change requires a couple seconds to take effect.</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>Any changes will only show for you! No other player will be effected.</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>Fog, Rain, and Overcast are toggleable between full and none.</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>Random will randomize fog, rain, and overcast.</t><br/><br/>
			<t size='1.1' shadow='1' align='left' color='#FFFFFF'>You can toggle the other settings along side the random option to turn on or maxamize results.</t><br/><br/>
		"];
		uiSleep .1;
	};
	case 'uid': {
		_oldid = getPlayerUIDOld player;
		_newid = getPlayerUID player;
		systemchat format["Old player ID = %1 | Steam player ID = %2",_oldid,_newid];
		uiSleep .1;
	};
};