//---------------------------------------------------------------------
// Epoch Base Safe Area
// By MadMartyr
// Modified from generic ZombieShield code by felixberndt and meat
// http://opendayz.net/threads/prevent-zombie-spawning.8799/#post-32461
//---------------------------------------------------------------------


while {true} do {
  sleep 10;


  // No Zeds near Plot Poles
  _playerPos = getPos player;
  _nearPole = nearestObject [_playerPos, "Plastic_Pole_EP1_DZ"];
  if (!isNull _nearPole) then {
    _pos2 = getPos _nearPole;
	{
		if (!isNull _x) then
		{
			if !(isPlayer _x) then
			{
					deletevehicle _x;
			};
		};
	} forEach (_pos2 nearEntities ['zZombie_Base',dayz_poleSafeArea]);
  };
};