
private ["_timer","_crate"];

_crate = _this select 0;

_timer = 0;
while {alive _crate} do {
if ((_timer > 300) || ((getpos _crate) distance (getpos player) > 50)) then {
	deletevehicle _crate;
};
_timer = _timer + 1;
sleep 1;
};