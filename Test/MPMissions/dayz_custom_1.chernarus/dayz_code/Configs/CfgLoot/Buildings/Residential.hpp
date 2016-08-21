class Residential : Default
{
	zombieChance = 0.3;
	maxRoaming = 2;
	zombieClass[] =
	{
		"zZombie_Base",
		"z_hunter",
		"z_teacher",
		"z_villager1",
		"z_villager2",
		"z_villager3"
	};
	lootChance = 0.5;
	lootGroup = Residential;
};

class Land_HouseV_1I4 : Residential
{
	zedPos[] = {{-0.400146,-3.87891,-2.7688},{-3.67651,-2.51758,-2.76544},{-0.472412,3.19824,-2.72028}};
	lootPos[] = {{-0.400146,-3.87891,-2.7688},{-3.67651,-2.51758,-2.76544},{-0.472412,3.19824,-2.72028}};
};

class Land_kulna : Residential
{
	zedPos[] = {{-0.498291,1.92871,-1.12811},{0.503174,0.217773,-1.11633}};
	lootPos[] = {{0.503174,0.217773,-1.11633},{-0.498291,1.92871,-1.12811}};
};
class MAP_kulna: Land_kulna {};
class Land_hut06 : Residential
{
	zedPos[] = {{0.337402,2.27051,-1.56116},{-0.637695,0.753906,-1.53836}};
	lootPos[] = {{0.337402,2.27051,-1.56116},{-0.637695,0.753906,-1.53836}};
};
class MAP_hut06: Land_hut06 {};
class Land_Hlidac_budka : Residential
{
	zedPos[] = {{2.02051,0.444336,-0.81366},{-0.460938,1.75879,-0.78363},{-2.31836,1.5127,-0.78363}};
	lootPos[] = {{-2.31836,1.5127,-0.78363},{2.02051,0.444336,-0.81366},{-0.460938,1.75879,-0.78363}};
};
class Land_Hlidac_Budka_EP1: Land_Hlidac_budka {};
class Land_HouseV2_02_Interier : Residential
{
	zedPos[] = {{-3.62598,3.05273,-5.58072},{3.34814,1.9707,-5.57071},{5.20117,-1.54004,-5.57071},{-5.71094,5.49414,-5.57071},{7.23145,5.37109,-5.57071},{-7.57861,-1.01563,-5.57071},{8.5498,0.754883,-5.57071},{-6.52295,2.35547,-5.5607}};
	lootPos[] = {{7.23,5.37,-5.57},{8.55,0.75,-5.57},{5.2,-1.54,-5.57},{3.35,1.97,-5.57},{-3.63,3.05,-5.58},{-7.58,-1.02,-5.57},{-6.52,2.35,-5.56},{-5.71,5.49,-5.57},{6.53,1.49,-4.64},{0.05,1.32,-5.53}};
};
class MAP_HouseV2_02_Interier: Land_HouseV2_02_Interier {};
class Land_A_Pub_01 : Residential
{
	zombieChance = 0.2;
	lootPos[] = {{1.83,0.39,-5.75},{-1.77,0.33,-5.76},{-6.66,-6.43,-5.76},{-4.64,-0.1,-5.75},{-5.76,-3.05,-5.75},{-2.08,0.92,-1.79},{-4.77,-5.89,-1.78},{-6.94,-1.94,-1.77},{-4.05,-0.78,-1.78},{1.4,-1.74,-1.76},{3.14,-2.79,-1.76},{3.58,-0.59,-1.76},{3.03,-4.04,-1.76},{1.94,3.19,-1.78},{-0.1,6.22,-1.78},{5.3,7.56,-1.79},{6.93,-2.85,-1.79},{2.57,-4.6,-5.76},{4.07,5.41,-5.76},{0.75,2.3,-5.75},{6.47,-1.71,-5.06}};
	zedPos[] = {{-1.76563,0.334473,-5.75623},{2.56934,-4.6001,-5.75623},{4.06738,5.41406,-5.75623},{-6.66211,-6.4292,-5.75623},{0.75293,2.2998,-5.74622},{-4.63574,-0.100586,-5.74622},{-5.75977,-3.05029,-5.74622},{1.83398,0.394043,-5.74619},{-2.08203,0.922852,-1.79126},{5.30469,7.55957,-1.79126},{6.93164,-2.84668,-1.79126},{-0.0957031,6.22461,-1.78125},{1.94141,3.18799,-1.78125},{-4.05273,-0.779785,-1.78125},{-4.76563,-5.89111,-1.78125},{-6.94434,-1.9375,-1.77124},{1.39844,-1.73779,-1.76123},{3.03027,-4.04346,-1.76123},{3.13867,-2.78564,-1.76123},{3.58301,-0.591309,-1.76123}};
};
class MAP_A_Pub_01: Land_A_Pub_01 {};
class Land_Shed_wooden : Residential
{
	zedPos[] = {{-0.342773,1.0293,-1.29156},{1.26807,-0.362305,-1.29156}};
	lootPos[] = {{1.26807,-0.362305,-1.29156},{-0.342773,1.0293,-1.29156}};
};
class MAP_Shed_wooden: Land_Shed_wooden {};
class Land_HouseBlock_A1_1 : Residential
{
	zedPos[] = {{-3.52881,0.15918,-4.74365},{-3.56152,-2.33496,-4.73096}};
	lootPos[] = {{-3.52881,0.15918,-4.74365},{-3.56152,-2.33496,-4.73096}};
};

class Land_HouseV_1I1 : Residential
{
	zedPos[] = {{0.100586,-2.34473,-2.88281}};
	lootPos[] = {{0.100586,-2.34473,-2.88281}};
};

class Land_A_MunicipalOffice : Residential
{
	maxRoaming = 3;
	zedPos[] = {{-0.20752,-6.48633,-18.429},{3.31641,-5.77441,-18.429},{-4.66113,-6.27246,-18.429}};
	lootChance = 0.4;
	lootPos[] = {{-4.66113,-6.27246,-18.429},{3.31641,-5.77441,-18.429},{-0.20752,-6.48633,-18.429},{-9.72412,-4.8877,-3.759},{-9.57813,3.55566,-3.759},{-7.17285,11.083,-3.76901},{5.06934,11.1836,-3.74899},{9.3208,5.38574,-3.76901},{9.65283,-4.82129,-3.74899},{3.23535,-0.106445,-0.169037},{4.85156,-3.69043,-0.169037},{-0.80127,-7.88184,-0.169037},{-4.4082,-4.91797,-0.169037},{-4.90771,-2.23145,-0.169037}};
};
class MAP_A_MunicipalOffice: Land_A_MunicipalOffice {};
class Land_HouseV2_04_interier : Residential
{
	zedPos[] = {{2.10938,6.60449,-5.76862},{-2.30029,4.22461,-5.75937},{-4.96289,2.91309,-5.74985},{1.95557,4.16211,-5.74939},{-5.13281,6.74316,-5.74857},{7.51025,-0.931641,-5.74176},{7.49561,5.83594,-5.73901}};
	lootPos[] = {{7.5,6.93,-5.74},{7.58,-1.89,-5.74},{1.85,2.66,-5.06},{3.38,6.4,-5.77},{-1.44,3.1,-5.76},{-3.63,6.88,-4.99},{-4.96,2.91,-5.75},{0.29,1.26,-2.93},{-1.44,6.44,-5.74},{4.82,2.63,-5.74}};
};
class MAP_HouseV2_04_interier: Land_HouseV2_04_interier {};
class Land_HouseV2_01A : Residential
{
	zedPos[] = {{-1.60547,-3.23535,-5.61884},{-3.37256,-3.34082,-5.58344}};
	lootPos[] = {{-3.37256,-3.34082,-5.58344},{-1.60547,-3.23535,-5.61884}};
};

class Land_psi_bouda : Residential
{
	zombieChance = 0;
	maxRoaming = 0;
	zedPos[] = {{1.02197,0.0185547,-0.519989}};
	lootPos[] = {{1.02197,0.0185547,-0.519989}};
};

class Land_KBud : Residential
{
	zombieChance = 0.3;
	maxRoaming = 0;
	zedPos[] = {{-0.017334,0.0107422,-0.663696}};
	lootPos[] = {{-0.017334,0.0107422,-0.663696}};
};
class MAP_KBud: Land_KBud {};
class Land_sara_domek_zluty : Residential
{
	maxRoaming = 1;
	zedPos[] = {{-6.17139,-2.33789,-2.43384},{-0.660645,2.05469,-2.43372},{6.36401,-0.236328,-2.43372},{2.95679,3.00684,-2.43365},{-3.75342,-3.54785,-2.42389},{-2.77441,0.751953,-2.42371},{-5.07666,3.04395,-2.42352},{0.627197,-0.584961,-2.41394},{7.06665,2.9541,-2.4137}};
	lootPos[] = {{2.96,3.01,-2.43},{7.07,2.95,-2.41},{6.36,-0.24,-2.43},{0.63,-0.58,-2.44},{-0.66,2.05,-2.43},{-2.77,0.75,-2.42},{-5.08,3.04,-2.42},{-6.17,-2.34,-2.43},{-3.75,-3.55,-2.42}};
};
class MAP_sara_domek_zluty: Land_sara_domek_zluty {};
class Land_HouseV_3I4 : Residential
{
	maxRoaming = 3;
	zedPos[] = {{5.46387,2.80273,-2.61298}};
	lootPos[] = {{5.46387,2.80273,-2.61298}};
};

class Land_Shed_W4 : Residential
{
	maxRoaming = 3;
	zedPos[] = {};
	lootPos[] = {};
};
class MAP_Shed_W4: Land_Shed_W4 {};
class Land_HouseV_3I1 : Residential
{
	maxRoaming = 3;
	zedPos[] = {};
	lootPos[] = {};
};

class Land_HouseV_1L2 : Residential
{
	maxRoaming = 3;
	zedPos[] = {{-0.448242,5.29883,-3.01697}};
	lootPos[] = {{-0.448242,5.29883,-3.01697}};
};

class Land_HouseV_1T : Residential
{
	maxRoaming = 3;
	zedPos[] = {{2.53027,-2.41895,-3.22815}};
	lootPos[] = {{2.53027,-2.41895,-3.22815}};
};

class Land_HouseV_1L1 : Residential
{
	zedPos[] = {{1.20801,5.86035,-1.09302}};
	lootPos[] = {{1.20801,5.86035,-1.09302}};
};

class Land_HouseV_1I2 : Residential
{
	zedPos[] = {{-3.60205,2.81641,-2.23148}};
	lootPos[] = {{-3.60205,2.81641,-2.23148}};
};

class Land_HouseV_2L : Residential
{
	zedPos[] = {{-3.98438,-3.87207,-4.02338},{4.32617,1.81836,-3.96332}};
	lootPos[] = {{4.32617,1.81836,-3.96332},{-3.98438,-3.87207,-4.02338}};
};

class Land_HouseV_1I3 : Residential
{
	zedPos[] = {{2.19531,-0.954102,-2.23218}};
	lootPos[] = {{2.19531,-0.954102,-2.23218}};
};

class Land_houseV_2T2 : Residential
{
	zedPos[] = {{-4.24951,0.988281,-4.0574}};
	lootPos[] = {{-4.24951,0.988281,-4.0574}};
};

class Land_HouseBlock_A1 : Residential
{
	zedPos[] = {{-3.48242,2.13965,-8.81882},{-4.56689,-3,-8.81262}};
	lootPos[] = {{-4.56689,-3,-8.81262},{-3.48242,2.13965,-8.81882}};
};

class Land_HouseBlock_A2_1 : Residential
{
	zedPos[] = {{3.98975,4.48926,-7.4043}};
	lootPos[] = {{3.98975,4.48926,-7.4043}};
};

class Land_HouseBlock_A3 : Residential
{
	zedPos[] = {{0.554688,2.70801,-5.4317}};
	lootPos[] = {{0.554688,2.70801,-5.4317}};
};

class Land_HouseBlock_B5 : Residential
{
	zedPos[] = {{-5.10742,5.23926,-7.57431}};
	lootPos[] = {{-5.10742,5.23926,-7.57431}};
};

class Land_HouseBlock_B6 : Residential
{
	zedPos[] = {{-3.01172,0.820313,-7.60886}};
	lootPos[] = {{-3.01172,0.820313,-7.60886}};
};

class Land_HouseBlock_C1 : Residential
{
	zedPos[] = {{5.85889,4.46875,-9.59036}};
	lootPos[] = {{5.85889,4.46875,-9.59036}};
};

class Land_HouseV2_01B : Residential
{
	zedPos[] = {{9.53711,3.39453,-6.11053}};
	lootPos[] = {{9.53711,3.39453,-6.11053}};
};

class Land_HouseV2_03 : Residential
{
	zedPos[] = {{0.812988,7.99805,-5.89618},{9.96143,-9.00488,-5.48578}};
	lootPos[] = {{0.812988,7.99805,-5.89618},{9.96143,-9.00488,-5.48578}};
};

class Land_Mil_Guardhouse : Residential
{
	maxRoaming = 3;
	zedPos[] = {{-2.44727,0.250977,-1.70563},{-2.44873,3.00293,-1.70285}};
	lootPos[] = {{-2.44727,0.250977,-1.70563},{-2.44873,3.00293,-1.70285}};
};

class LADAWreck : Residential
{
	maxRoaming = 0;
	zedPos[] = {};
	lootChance = 0.2;
	lootPos[] = {{-0.106934,-0.660156,-0.144714}};
};

class SKODAWreck : Residential
{
	maxRoaming = 0;
	zedPos[] = {};
	lootChance = 0.2;
	lootPos[] = {{-0.66,-0.09,-0.58}};
};

class Land_GuardShed : Residential
{
	maxRoaming = 1;
	zedPos[] = {{-0.02,-1,-0.61}};
	lootPos[] = {{-0.02,-1,-0.61}};
};

class RU_WarfareBBarracks : Residential
{
	maxRoaming = 0;
	zedPos[] = {{2.06,-2.63,0.52},{-0.01,2.35,0.55},{2.43,2.04,1.08},{-2.81,2.49,1.3},{-0.72,-0.03,1.31},{-0.38,-2.29,1.87}};
	lootChance = 0.1;
	lootPos[] = {{-2.81,2.49,1.3},{-0.72,-0.03,1.31},{2.06,-2.63,0.52},{-0.38,-2.29,1.87},{2.43,2.04,1.08},{-0.01,2.35,0.55}};
};

class Land_NAV_Lighthouse : Residential
{
	zedPos[] = {{-0.16,-0.1,-6.78},{-0.06,3.36,-7.87}};
	lootChance = 0.4;
	lootPos[] = {{-0.16,-0.1,-6.78},{0.01,-1.7,2.42},{-0.06,3.36,-7.87}};
};

class Land_Panelak3 : Residential
{
	zedPos[] = {};
	lootPos[]={{0.54,-0.71,-8.11},{2.51,-1.84,12.38},{2.8,-0.67,12.38},{3.98,-1.49,12.38}};
};
class MAP_Panelak3: land_panelak3 {};