class AK_to : Recipe {
	displayName = "AK to AKSD ammo";
	input[] =
	{
		{"30Rnd_545x39_AK","CfgMagazines",1}
	};
	output[] =
	{
		{"30Rnd_545x39_AKSD","CfgMagazines",1}
	};
	required[] =
	{
	};
};

class AKSD_to : Recipe {
	displayName = "AKSD to AK ammo";
	input[] =
	{
		{"30Rnd_545x39_AKSD","CfgMagazines",1}
	};
	output[] =
	{
		{"30Rnd_545x39_AK","CfgMagazines",1}
	};
	required[] =
	{
	};
};
