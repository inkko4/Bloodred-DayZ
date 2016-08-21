class Makarov_to : Recipe {
	displayName = "Makarov to MakarovSD ammo";
	input[] =
	{
		{"8Rnd_9x18_Makarov","CfgMagazines",1}
	};
	output[] =
	{
		{"8Rnd_9x18_MakarovSD","CfgMagazines",1}
	};
	required[] =
	{
	};
};

class MakarovSD_to : Recipe {
	displayName = "MakarovSD to Makarov ammo";
	input[] =
	{
		{"8Rnd_9x18_MakarovSD","CfgMagazines",1}
	};
	output[] =
	{
		{"8Rnd_9x18_Makarov","CfgMagazines",1}
	};
	required[] =
	{
	};
};
