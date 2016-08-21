private ["_mrkr","_name","_pos"];

while {true} do {
	if (visibleMap) then {
		{
			if (!isNull _x) then {
				if ((getPlayerUID _x != "") && ((driver (vehicle _x)) == _x)) then {
					_name = name _x;
					if (group _x == group player) then {
						_pos = getPosATL _x;
						if (surfaceIsWater _pos) then {_pos = getPosASL _x;};
						if (_name == name player) then {_name = "I am here";};
						deleteMarkerLocal _name;
						_mrkr = createMarkerLocal [_name,_pos];
						_mrkr setMarkerTypeLocal "DestroyedVehicle";
						_mrkr setMarkerTextLocal format ["%1",_name];
					} else {
						deleteMarkerLocal _name;
					};
				};
			};
		} count playableUnits;
	
	
		{
			if (!isNull _x) then {
				_name = _x getVariable["bodyName","unknown"];
				if (_name == name player) then {_name = "My body";};
				_pPos = getPosATL _x;
				_nameID = _name + str(_pPos);
				if (_name == "My body") then {
					deleteMarkerLocal _nameID;
					_mrkr = createMarkerLocal [_nameID,_pPos];
					_mrkr setMarkerTypeLocal "DestroyedVehicle";
					_mrkr setMarkerTextLocal format ["%1",_name];
					_mrkr setMarkerColorLocal "ColorRed";
				} else {
					deleteMarkerLocal _nameID;
				};
			};
		} count allDead;
	};
	
	uiSleep 1;
};