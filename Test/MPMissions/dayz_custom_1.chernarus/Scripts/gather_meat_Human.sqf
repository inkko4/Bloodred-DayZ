private ["_hasKnife","_body","_type","_started","_finished","_animState","_isMedic","_isOk","_proceed","_injureSelf","_counter","_itemOut","_countOut","_humanity","_new","_hasHarvested"];

_body = _this select 3;
_hasKnife =    "ItemKnife" in items player;
_type = typeOf _body;
_hasHarvested = _body getVariable["canibalize",false];
 
player removeAction s_player_butcher;
s_player_butcher = -1;
		
if (!_hasKnife) exitwith {cutText ["You do not have a knife to do this.", "PLAIN DOWN"];};
if (_hasHarvested) exitwith {cutText ["Someone has already gotten meat from this corpse...", "PLAIN DOWN"];};
 
if (_hasKnife || !_hasHarvested) then {
	_countOut = 1 + round(random 3);
	_counter = 0;
    _isOk = true;
    _proceed = false;
	_humanity = player getVariable["humanity",0];
	_new = _humanity - 500;
	player setVariable["humanity",_new,true];
	
    while {_isOk} do {
		player playActionNow "Medic";
		_body setVariable["canibalize",true,true];
		r_interrupt = false;
        _animState = animationState player;
        r_doLoop = true;
        _started = false;
        _finished = false;
		[player,"canabalize",0,false] call dayz_zombieSpeak;
		
        while {r_doLoop} do {
            _animState = animationState player;
            _isMedic = ["medic",_animState] call fnc_inString;
            if (_isMedic) then {
                _started = true;
            };
            if (_started and !_isMedic) then {
                r_doLoop = false;
                _finished = true;
            };
            if (r_interrupt) then {
                r_doLoop = false;
            };

            sleep 0.1;
        };

        if(!_finished) exitWith {
            _isOk = false;
            _proceed = false;
        };

        if(_finished) then {
            _injureSelf = false;
            if ([0.04] call fn_chance) then {
                _injureSelf = true;
            };
            
            _counter = _counter + 1;
            _itemOut = "FoodBeefRaw";
			//Drop Item to ground
			_itemOut call fn_dropItem;
        };
            
        if ((_counter == _countOut) || _injureSelf) exitWith {
			if (_injureSelf) then {
				r_player_inpain = true;
				player setVariable["USEC_inPain",true,true];
				r_player_blood = r_player_blood - 1000;
				cutText ["You feel the knife slice your finger.", "PLAIN DOWN"];
			};
            _isOk = false;
            _proceed = true;
            sleep 1;
        };
        cutText [format ["Gutted %1 out of %2 meat from corpse...", _counter,_countOut], "PLAIN DOWN"];
    };
	cutText ["You have gutted a human, your hands are covered with blood. You feel your humanity lower.", "PLAIN DOWN"];
};