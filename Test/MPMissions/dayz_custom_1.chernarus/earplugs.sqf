if (isnil "br_earplugs") then {
	br_earplugs = false;
};
if (!br_earplugs) then {
	1 fadeSound 0.1;
	1 fadeMusic 0.1;
	br_earplugs = true;
	systemchat 'You have put Earplugs in!';
} else {
	1 fadeSound 1;
	1 fadeMusic 1;
	br_earplugs = false;
	systemchat 'You have taken out your Earplugs!';
};