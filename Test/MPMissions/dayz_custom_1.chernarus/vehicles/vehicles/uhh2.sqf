if (!isnil ("VehUhih2")) then {
	// if defined adds to existing variable
	if ((getplayeruid player) in VehUhih2) then {
	cutText [format["%1 you have spawned a vehicle for this restart already.",player], "PLAIN DOWN"];
	} else {
	_dir = getdir vehicle player;
	_pos = getPos vehicle player;
	_pos = [(_pos select 0)+10*sin(_dir),(_pos select 1)+10*cos(_dir),0];
	_veh = createVehicle ["UH1H_DZ", _pos,[],0,"CAN_COLLIDE"];
	_veh setPosATL _pos;
	_veh setDir _dir;
	_objectID = str(round(random 999999));
	_veh setVariable ["ObjectID", _objectID, true];
	_veh setVariable ["ObjectUID", _objectID, true];
	_veh setVariable ["Sarge",1,true];
	dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _veh];
	cutText [format["%1, this vehicle will disappear after restart.",player], "PLAIN DOWN"];
	_id = getplayeruidold player;
	VehUhih2 = [_id]+VehUhih2;
	publicVariable "VehUhih2";
	_veh addEventHandler ["GetIn",{
		_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;
	}];
	};
} else {
	// if undefined defines it for the first time
	_dir = getdir vehicle player;
	_pos = getPos vehicle player;
	_pos = [(_pos select 0)+10*sin(_dir),(_pos select 1)+10*cos(_dir),0];
	_veh = createVehicle ["UH1H_DZ", _pos,[],0,"CAN_COLLIDE"];
	_veh setPosATL _pos;
	_veh setDir _dir;
	_objectID = str(round(random 999999));
	_veh setVariable ["ObjectID", _objectID, true];
	_veh setVariable ["ObjectUID", _objectID, true];
	_veh setVariable ["Sarge",1,true];
	dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _veh];
	cutText [format["%1, this vehicle will disappear after restart.",player], "PLAIN DOWN"];
	_id = getplayeruid player;
	VehUhih2 = [_id];
	publicVariable "VehUhih2";
	_veh addEventHandler ["GetIn",{
		_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Warning: This vehicle will disappear on server restart!","PLAIN DOWN",5] call RE;
	}];
};


