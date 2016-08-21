/* Single Currency 3.0 uses storages to store money which can be accessed by anyone if open of course (safe,lockbox). Each storage has his own money, so no global access. */

// Name of your currency
CurrencyName = "Coins"; 

// Objects that can hold money. Vehicles are added automaticly. Size of  money capacity is depended on ammount of magazines the object can hold.
ZSC_MoneyStorage = ["VaultStorage","Laptop_EP1","LockboxStorage","StorageShed_DZ","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","GunRack_DZ","WoodCrate_DZ","TentStorage","TentStorageDomed","TentStorageDomed2"];
CurrencyName = "Coins"; // name of your currency
Bank_Object = ["VaultStorage"]; // Object to get option to bank
LimitOnBank = false; // false = no limits, true = banks are limited on the value below
MaxBankMoney = 10000000; // limit on bank for normal players
DonatorBank = [""]; // Bigger banks, Players ID
MaxDonatorBankMoney = 100000000; // Bank size for donators
InstantTrading = true; // (True = No Animation / False = Animation)
// Multiplier how much money an object can hold. This number X ammount of magazines it can hold. ( so URAL -> 500 items * 1000 = 5 MIL cash).
ZSC_MaxMoneyInStorageMultiplier = 100000;

// (True = No Animation / False = Animation)
InstantTrading = true; 

// If TRUE: overwrite yours player_switchmodel.sqf with mine. | IF False: Change content yourself @ step D
ZSC_Overwrite_SwitchModel = false; 

 // if TRUE: Overwrites yours fn_selfactions.sqf with default 1 + edits. | IF False: Change content yourself @ step D
ZSC_Overwrite_SelfActions = false;

 // if TRUE: Overwrites yours player_unlockVault.sqf with default 1 + edits. | IF False: Change content yourself @ step D
ZSC_Overwrite_UnLockVault = false;

 // if TRUE: Overwrites yours player_lockVault.sqf with default 1 + edits. | IF False: Change content yourself @ step D
ZSC_Overwrite_LockVault = false;

// if TRUE: Overwrites yours player_packVault.sqf with default 1 + edits. | IF False: Change content yourself @ step D
zsc_overwrite_packvault = false;

zsc_overwrite_packtent = false;


/* IF YOU USE different mods like P4L it's recommended to do changes yourself or it wont work */

