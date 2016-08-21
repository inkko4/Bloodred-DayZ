if (isnil "player_save") then {
player_save = false;
};
if (player_save ) exitwith {systemchat "You have to wait to do that again.";};

if (!player_save) then {
call player_forceSave;
player_save = true;
systemchat "Saving character...";
[] spawn {sleep 300; player_save = false;};
};