class Bizon_to : Recipe {
	displayName = "Bizon to BizonSD ammo";
	input[] =
	{
		{"64Rnd_9x19_Bizon","CfgMagazines",1}
	};
	output[] =
	{
		{"64Rnd_9x19_SD_Bizon","CfgMagazines",1}
	};
	required[] =
	{
	};
};

class BizonSD_to : Recipe {
	displayName = "BizonSD to Bizon ammo";
	input[] =
	{
		{"64Rnd_9x19_SD_Bizon","CfgMagazines",1}
	};
	output[] =
	{
		{"64Rnd_9x19_Bizon","CfgMagazines",1}
	};
	required[] =
	{
	};
};
