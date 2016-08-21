_level = player getVariable "HeroPerk";

if (_level == 1) then {

	_pos = getpos player;
	_dir = getDir player;
	_object = 'M1030' createVehicle [(_pos select 0)+12*sin(_dir),(_pos select 1)+12*cos(_dir),0];
	_object setVariable ["Malsar",1,true];
	_uniqueid = str(round(random 999999));
	_object setVariable ["ObjectID", _uniqueid, true];
	_object setVariable ["ObjectUID", _uniqueid, true];
	clearMagazineCargo _object;
	clearWeaponCargo _object;
	titleText ["Hero Perk spawned!", "PLAIN DOWN", 3];
	player setVariable ["HeroPerk",0,true];
	_object addEventHandler ["GetIn",{
		_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;
	}];
		
};
if (_level == 2) then {

	_pos = getpos player;
	_dir = getDir player;
	_object = 'SUV_PMC' createVehicle [(_pos select 0)+12*sin(_dir),(_pos select 1)+12*cos(_dir),0];
	_object setVariable ["Malsar",1,true];
	_uniqueid = str(round(random 999999));
	_object setVariable ["ObjectID", _uniqueid, true];
	_object setVariable ["ObjectUID", _uniqueid, true];
	clearMagazineCargo _object;
	clearWeaponCargo _object;
	titleText ["Hero Perk spawned!", "PLAIN DOWN", 3];
	player setVariable ["HeroPerk",0,true];
	_object addEventHandler ["GetIn",{
		_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;
	}];
	
};
if (_level == 3) then {

	_pos = getpos player;
	_dir = getDir player;
	_object = 'CSJ_GyroC' createVehicle [(_pos select 0)+12*sin(_dir),(_pos select 1)+12*cos(_dir),0];
	_object setVariable ["Malsar",1,true];
	_uniqueid = str(round(random 999999));
	_object setVariable ["ObjectID", _uniqueid, true];
	_object setVariable ["ObjectUID", _uniqueid, true];
	clearMagazineCargo _object;
	clearWeaponCargo _object;
	_pos = getPosATL player;
	_box = 'Foodbox0' createVehicle [(_pos select 0)+4*sin(_dir),(_pos select 1)+4*cos(_dir),0];
	_box setPosATL [(_pos select 0)+4*sin(_dir),(_pos select 1)+4*cos(_dir),0];
	_box setVariable ["permaLoot",true];
	_box setVariable ["Malsar",1,true];
	clearWeaponCargoGlobal _box;
	clearmagazinecargoGlobal _box;
	{_box addWeaponCargoGlobal [_x, 1];} forEach _crateweps;
	{_box addMagazineCargoGlobal [_x, 3];} forEach _cratemags;
	_box addBackpackCargo [_cratebp, 1];
	titleText ["Hero Perk spawned! Box will despawn in 4 minutes!", "PLAIN DOWN", 3];
	player setVariable ["HeroPerk",0,true];
	_object addEventHandler ["GetIn",{
		_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;
	}];
	sleep 240;
	deleteVehicle _box;
};