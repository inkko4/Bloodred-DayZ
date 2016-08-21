/*  

Spawn Configuration:

1. These spawns are just examples to show what this mod can do. You can add or delete
any spawn in the _spawnPoints list. Don't forget to leave off the last comma for the last
element in the array.

2. Spawn format: 
	[Name, Pos, VIP Level, Humanity Level]
	Name - Each spawn must have a unique name. Can be anything. Do not use double quotes " inside.
	Pos - Coordinates in AboveTerrainLevel Format [x,y,z]
	VIP Level -
		0 - Anyone can pick this spawn
		1 - Only players with UIDs in _spawnLevel1 can pick this spawn
		2 - Only players with UIDs in _spawnLevel2 can pick this spawn
		3 - Only players with UIDs in _spawnLevel3 can pick this spawn​
	Humanity Level -
		0 - Anyone can pick this spawn
		Negative # - Only players with humanity less than this number can pick this spawn
		Positive # - Only players with humanity greater than this number can pick this spawn​

3. _customBase - List of UIDs that own custom bases.
   _customBases - List of custom bases in this format: ["Name",[Pos]]
   Name - Each base must have unique name. Can be anything. Do not use double quotes " inside.
   Pos - In AboveTerrainLevel [x,y,z] format
   These must match the order of the first list. The first UID in _customBase corresponds with the first base in _customBases and so on. 
   These will only show in the spawn list for the player who owns them. If multiple UIDs share the same base then add the same base multiple times to maintain order, 
   or consider making it a VIP spawn in _spawnPoints instead. Pos is exactly where you will spawn, does not run through findSafePos. These override body check.

*/

_bodyCheck = 1500; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
_mapRadius = 12000; // Distance from center to farthest edge of map. Only used when spawnNearPlot is enabled.
_spawnNearGroup = true; // Allow players to spawn near their group. Blocked if the player has a body within bodyCheck distance of the leader. Requires DZGM to work.
_spawnNearPlot = true; // Allow players to spawn near their plot. Blocked if the player has a body within bodyCheck distance of their plot. Requires Plot4Life to work. 
_spawnRadius = 1000; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.
_customBase = [
	"76561198014219874", // ebay
	"0",
	"0"
];
_customBases = [ // Do not use a z (height) higher than _autoOpenHeight in haloConfig.sqf if using halo
	["ebay's base",[2324,15365,0]],
	[],
	[]
];

_spawnLevel1 = [];
_spawnLevel2 = [];
_spawnLevel3 = [];
// To give higher level VIPs access to lower level VIP spawns too use +. For example:
// _spawnLevel2 = ["0","0","0"] + _spawnLevel1;
// _spawnLevel3 = ["0","0","0"] + _spawnLevel2;

_spawnPoints = [
	["Random",[[4932,1989,0],[12048,8352,0],[6901,2509,0],[10294,2191,0],[2236,1923,0],[13510,5249,0]],0,0,1], // Random will never be blocked, so you should always keep it if using body check.
	["Balota",[4932,1989,0],0,0],
	["Berezino",[12048,8352,0],0,0],
	["Cherno",[6901,2509,0],0,0],
	["Elektro",[10294,2191,0],0,0],
	["Kamenka",[2236,1923,0],0,0],
	["Solnichny",[13510,5249,0],0,0],
	["Kamyshovo",[12071,3591,0],0,0],
	["Krutoy",[13407,4175,0],0,0],
	// Above are defaults
	["Gorka",[9711,8962,0],0,0],
	["Guglovo",[8421,6643,0],0,0],
	["Kabanino",[5301,8548,0],0,0],
	["Komarovo",[3608,2152,0],0,0],
	["Lopatino",[2718,10094,0],0,0],
	["Pogorevka",[4582,6457,0],0,0],
	["Prigor",[7952,3205,0],0,0],
	["Pusta",[9153,3901,0],0,0],
	["Vybor",[3626,8976,0],0,0],
	["Vyshnoye",[6587,6026,0],0,0],
	["Zelenogorsk",[2692,5284,0],0,0]
];
_spawnPoints2 = [
	["Gorka",[9711,8962,0],0,0],
	["Guglovo",[8421,6643,0],0,0],
	["Kabanino",[5301,8548,0],0,0],
	["Komarovo",[3608,2152,0],0,0],
	["Lopatino",[2718,10094,0],0,0],
	["Pogorevka",[4582,6457,0],0,0],
	["Prigor",[7952,3205,0],0,0],
	["Pusta",[9153,3901,0],0,0],
	["Vybor",[3626,8976,0],0,0],
	["Vyshnoye",[6587,6026,0],0,0],
	["Zelenogorsk",[2692,5284,0],0,0]
];