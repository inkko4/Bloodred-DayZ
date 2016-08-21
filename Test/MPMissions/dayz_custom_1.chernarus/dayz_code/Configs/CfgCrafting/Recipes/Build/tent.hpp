class Junk_to : Recipe {
	displayName = "Junk to Tent";
	input[] =
	{
		{"equip_tent_poles","CfgMagazines",1},
		{"equip_rag","CfgMagazines",4},
		{"equip_string","CfgMagazines",1}
	};
	output[] =
	{
		{"ItemDomeTent","CfgMagazines",1}
	};
	required[] =
	{
		{"ItemToolbox","CfgWeapons",1}
	};
};
