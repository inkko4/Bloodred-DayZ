_pathtovehicles = "vehicles\vehicles\";
_vehpurchase = 'player execVM "'+_pathtovehicles+'%1"';
//customise these menus to fit your server
_oldid = ;
_newid = ;
if (((getplayeruidold player) in ["150531846","20549766","144150342","152129542","80532294","80564934","121604742","139786118","237927430","237913798","139156678","144347846","238979782","169686150","77070918","4420486","107431686","33169862","237960646"]) || ((getplayeruid player) in ["76561198191488406","76561198096311622","76561198061958351","76561198022953766","76561198155157302"])) then {
	if ((getplayeruidold player) in ["150531846"]) then {
        vehpurchase =
        [
			["",true],
				["SUV", [2],  "", -5, [["expression", format[_vehpurchase,"suv.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["144150342"]) then {
        vehpurchase =
        [
			["",true],
				["HMMWV", [2],  "", -5, [["expression", format[_vehpurchase,"hmmwv.sqf"]]], "1", "1"],
				["MX6J", [3],  "", -5, [["expression", format[_vehpurchase,"mhj.sqf"]]], "1", "1"],
				["UH1H", [4],  "", -5, [["expression", format[_vehpurchase,"uhh.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["20549766"]) then {
        vehpurchase =
        [
			["",true],
				["HMMWV", [2],  "", -5, [["expression", format[_vehpurchase,"hmmwv.sqf"]]], "1", "1"],
				["UH1H", [3],  "", -5, [["expression", format[_vehpurchase,"uhh.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruid player) in ["76561198065053729"]) then {
        vehpurchase =
        [
			["",true],
				["HMMWV", [2],  "", -5, [["expression", format[_vehpurchase,"hmmwv.sqf"]]], "1", "1"],
				["UH1H", [3],  "", -5, [["expression", format[_vehpurchase,"uhh.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["152129542"]) then {
        vehpurchase =
        [
			["",true],
				["Lada", [2],  "", -5, [["expression", format[_vehpurchase,"lada.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["80532294"]) then {
        vehpurchase =
        [
			["",true],
				["HMMWV", [2],  "", -5, [["expression", format[_vehpurchase,"hmmwv.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["237927430"]) then {
        vehpurchase =
        [
			["",true],
				["HMMWV", [2],  "", -5, [["expression", format[_vehpurchase,"hmmwv.sqf"]]], "1", "1"],
				["AH6X", [3],  "", -5, [["expression", format[_vehpurchase,"ahx.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["80564934","237913798","144347846"]) then {
        vehpurchase =
        [
			["",true],
				["AH6X", [2],  "", -5, [["expression", format[_vehpurchase,"ahx.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if (((getplayeruidold player) in ["238979782","107431686"]) || ((getplayerUID player) in ["76561198155157302"])) then {
        vehpurchase =
        [
			["",true],
				["MX6J", [2],  "", -5, [["expression", format[_vehpurchase,"mhj.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["121604742"]) then {
        vehpurchase =
        [
			["",true],
				["MX6J", [2],  "", -5, [["expression", format[_vehpurchase,"mhj.sqf"]]], "1", "1"],
				["HMMWV", [3],  "", -5, [["expression", format[_vehpurchase,"hmmwv.sqf"]]], "1", "1"],
				["UH1H", [4],  "", -5, [["expression", format[_vehpurchase,"uhh.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["139786118"] || (getplayerUID in ["76561198191488406"]) then {
        vehpurchase =
        [
			["",true],
				["Hilux", [2],  "", -5, [["expression", format[_vehpurchase,"hilux.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruid player) in ["76561198096311622"]) then {
        vehpurchase =
        [
			["",true],
				["UH1H 1", [2],  "", -5, [["expression", format[_vehpurchase,"uhh.sqf"]]], "1", "1"],
				["UH1H 2", [3],  "", -5, [["expression", format[_vehpurchase,"uhh1.sqf"]]], "1", "1"],
				["UH1H 3", [4],  "", -5, [["expression", format[_vehpurchase,"uhh2.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if (((getplayeruidold player) in ["169686150","77070918"]) || ((getplayeruid player) in ["76561198022953766"])) then {
        vehpurchase =
        [
			["",true],
				["UH1H 1", [2],  "", -5, [["expression", format[_vehpurchase,"uhh.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["4420486"]) then {
        vehpurchase =
        [
			["",true],
				["MX6J", [2],  "", -5, [["expression", format[_vehpurchase,"mhj.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["33169862"]) then {
        vehpurchase =
        [
			["",true],
				["Lada", [2],  "", -5, [["expression", format[_vehpurchase,"lada.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if (((getplayeruidold player) in ["237960646"]) || ((getplayeruid player) in ["76561198061958351"])) then {
        vehpurchase =
        [
			["",true],
				["Offroad", [6],  "", -5, [["expression", format[_vehpurchase,"offroad.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
		if ((getplayeruidold player) in ["XXX"]) then {
        vehpurchase =
        [
			["",true],
				["SUV", [2],  "", -5, [["expression", format[_vehpurchase,"suv.sqf"]]], "1", "1"],
				["Hilux", [3],  "", -5, [["expression", format[_vehpurchase,"hilux.sqf"]]], "1", "1"],
				["Lada", [4],  "", -5, [["expression", format[_vehpurchase,"lada.sqf"]]], "1", "1"],
				["HMMWV", [5],  "", -5, [["expression", format[_vehpurchase,"hmmwv.sqf"]]], "1", "1"],
				["Offroad", [6],  "", -5, [["expression", format[_vehpurchase,"offroad.sqf"]]], "1", "1"],
				["UH1H", [7],  "", -5, [["expression", format[_vehpurchase,"uhh.sqf"]]], "1", "1"],
				["AH6X", [8],  "", -5, [["expression", format[_vehpurchase,"ahx.sqf"]]], "1", "1"],
				["MX6J", [9],  "", -5, [["expression", format[_vehpurchase,"mhj.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
};
showCommandingMenu "#USER:vehpurchase";