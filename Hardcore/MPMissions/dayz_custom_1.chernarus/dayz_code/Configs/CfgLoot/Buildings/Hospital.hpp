class Hospital : Default
{
	zombieChance = 0.4;
	minRoaming = 2;
	maxRoaming = 4;
	zombieClass[] = {"z_doctor","z_doctor","z_doctor"};
	lootChance = 0.4;
	lootGroup = Hospital;
};

class Land_A_Hospital : Hospital
{
	lootPos[] = {{0.79834,-1.16895,-7.33966},{-7.2334,-2.63574,-7.33966},{-16.3687,-2.4043,-7.33966},{-12.2847,-3.19434,-7.33966},{4.24268,-3.59375,-7.33966},{-3.2666,-0.925781,-7.33966},{6.85693,-2.75098,-7.33966},{11.0151,-3.9541,-7.33966},{16.8198,-4.71094,-7.33966},{-1.6875,5.47168,-7.4494},{12.7476,0.144531,3.29184},{10.2661,-1.21582,3.29184}};
	zedPos[] = {{-1.6875,5.47168,-7.4494},{0.79834,-1.16895,-7.33966},{11.0151,-3.9541,-7.33966},{-12.2847,-3.19434,-7.33966},{-16.3687,-2.4043,-7.33966},{16.8198,-4.71094,-7.33966},{-3.2666,-0.925781,-7.33966},{4.24268,-3.59375,-7.33966},{6.85693,-2.75098,-7.33966},{-7.2334,-2.63574,-7.33966},{10.2661,-1.21582,3.29184},{12.7476,0.144531,3.29184}};
};
class MAP_a_hospital: land_a_hospital {}; 
class MASH : Hospital
{
	maxRoaming = 1;
	zombieClass[] = {"z_soldier","z_soldier_heavy","z_doctor","z_doctor","z_doctor"};
	lootPos[] = {{1.18213,-1.64844,-1.11786},{0.24707,0.798828,-1.11798}};
	zedPos[] = {{0.24707,0.798828,-1.11798},{1.18213,-1.64844,-1.11786}};
};

class MASH_EP1 : MASH
{
};
class MAP_MASH: MASH{};
class USMC_WarfareBFieldhHospital : MASH
{
	minRoaming = 1;
	maxRoaming = 3;
	lootPos[] = {{-3.52246,-5.03906,1.20731},{2.36621,-4.52246,1.20792},{1.39209,-0.420898,1.20752},{1.14258,5.01172,1.20786},{3.7124,1.89746,1.19794}};
	zedPos[] = {{3.7124,1.89746,1.19794},{-3.52246,-5.03906,1.20731},{1.39209,-0.420898,1.20752},{1.14258,5.01172,1.20786},{2.36621,-4.52246,1.20792}};
};

class RU_WarfareBFieldhHospital : MASH
{
	lootPos[] = {{-2.66,2.41,1.25},{3.19,-2.2,1.25}};
	zedPos[] = {{-2.66,2.41,1.25},{3.19,-2.2,1.25}};
	lootChance = 0.3;
	minRoaming = 2;
	maxRoaming = 3;
};