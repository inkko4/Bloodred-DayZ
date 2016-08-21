class Stanag_to : Recipe {
	displayName = "Stanag to StanagSD";
	input[] =
	{
		{"30Rnd_556x45_Stanag","CfgMagazines",1}
	};
	output[] =
	{
		{"30Rnd_556x45_StanagSD","CfgMagazines",1}
	};
	required[] =
	{
	};
};

class StanagSD_to : Recipe {
	displayName = "StanagSD to Stanag";
	input[] =
	{
		{"30Rnd_556x45_StanagSD","CfgMagazines",1}
	};
	output[] =
	{
		{"30Rnd_556x45_Stanag","CfgMagazines",1}
	};
	required[] =
	{
	};
};
