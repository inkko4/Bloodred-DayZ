#define HIDE_FSM_VARS private ["__sc_task","__sc_code","__sc_period","__sc_next","__sc_taskArray", "__sc_lootT0"];


sched_spawnCheck_init = { []spawn{} };
sched_spawnCheck = {
	HIDE_FSM_VARS
	if (scriptDone _this) then {
		_this = [] execVM 'player_spawnCheck.sqf';  // stuffed with "sleep" commands, can't put it in scheduler
	};
	_this;
};