params [

"_player",
"_didJIP"

];

waitUntil { alive player };

removeHeadgear player:
removeGoggles player;
removeVest player;
removeBackpack player;
removeUniform player;
removeAllWeapons player:
removeAllAssignedItems player;

//Security
DUCV_SEC_AUTHTOKEN = "";

_steamID64 = getPlayerUID player;
_clientID = clientOwner;


// Get token to work with
[_clientID, _steamID64] remoteExec ["duc_core_net_fnc_serverInterface", 2];

// Player is now authenticated

// Send Request to server so that the player is beeing initialized
["SYS", 0, [name player]] call CDUC_SYS_fnc_sendServer;
// wait until variables are here from server
//waitUntil { !isNil "DUCV_alive" }; todo delete

// player has now variables from server so the init of life can begin

// init the life mod
[] call compile preprocessFileLineNumbers "life\lifeInit.sqf";




// just temporary
// player setUnitLoadout DUCV_gearCivilian;
systemChat "INIT DONE";