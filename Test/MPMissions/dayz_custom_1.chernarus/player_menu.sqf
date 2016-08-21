player_menu =
[
	["",true],
	["Server info", [2], "#USER:sInfo", -5, [["expression", ""]], "1", "1"],
	["View distance", [3], "#USER:vd_menu", -5, [["expression", ""]], "1", "1"],
	["Group Management", [4],  "", -5, [["expression","execVM 'dzgm\loadGroupManagement.sqf';"]], "1", "1"],
	["Get player ID", [5],  "", -5, [["expression","'uid' execVM 'serverinfo.sqf'"]], "1", "1"],
	["Weather Options", [6], "#USER:vd_weather", -5, [["expression", ""]], "1", "1"],
	["Toggle Earplugs", [7],  "", -5, [["expression","execVM 'earplugs.sqf';"]], "1", "1"],
	["Toggle Anonymous", [8],  "", -5, [["expression","_anonstat = profileNamespace getVariable 'Anon';if (isnil '_anonstat') then {player setVariable ['Anon',false,true];};if (player getvariable 'Anon') then { profileNamespace setVariable ['Anon',false];player setVariable ['Anon',false,true]; systemchat 'Your name will show up in kill messages now...';} else { profileNamespace setVariable ['Anon',true]; player setVariable ['Anon',true,true]; systemchat 'You will now be anonymous in kill messages.';};saveProfileNamespace;"]], "1", "1"],
	["Save Player", [9],  "", -5, [["expression","execVM 'playersave.sqf';"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

vd_menu =
[
	["",true],
	[" 600 m", [2],  "", -5, [["expression", "setViewDistance 600"]], "1", "1"],
	[" 800 m", [3],  "", -5, [["expression", "setViewDistance 800"]], "1", "1"],
	["1000 m", [4],  "", -5, [["expression", "setViewDistance 1000"]], "1", "1"],
	["1250 m", [5],  "", -5, [["expression", "setViewDistance 1250"]], "1", "1"],
	["1500 m", [6],  "", -5, [["expression", "setViewDistance 1500"]], "1", "1"],
	["2000 m", [7],  "", -5, [["expression", "setViewDistance 2000"]], "1", "1"],
	["3000 m", [8],  "", -5, [["expression", "setViewDistance 3000"]], "1", "1"],
	["4000 m", [9],  "", -5, [["expression", "setViewDistance 4000"]], "1", "1"]
];

sInfo =
[
	["",true],
	["Contact info", [2],  "", -5, [["expression","'ContactInfo' execVM 'serverinfo.sqf';"]], "1", "1"],
	["Rules", [3],  "", -5, [["expression","'Rules' execVM 'serverinfo.sqf';"]], "1", "1"],
	["Server tips", [4],  "", -5, [["expression","'ServerTips' execVM 'serverinfo.sqf';"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

vd_weather =
[
	["",true],
	["  = Weather Options =", [-1], "", -5, [], "1", "0"],
	["Weather Info", [2],  "", -5, [["expression","'Weather' execVM 'serverinfo.sqf'"]], "1", "1"],
	["Toggle Fog", [3],  "", -5, [["expression","['Fog'] execVM 'toggle.sqf';"]], "1", "1"],
	["Toggle Rain", [4],  "", -5, [["expression","['Rain'] execVM 'toggle.sqf';"]], "1", "1"],
	["Toggle Overcast", [5],  "", -5, [["expression","['Overcast'] execVM 'toggle.sqf';"]], "1", "1"],
	["Toggle Random Weather", [6],  "", -5, [["expression","['Random'] execVM 'toggle.sqf';"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"],
	["= Atmospheric Settings =", [-1], "", -5, [], "1", "0"]
];
showCommandingMenu "#USER:player_menu";