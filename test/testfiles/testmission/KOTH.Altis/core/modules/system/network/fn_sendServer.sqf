private[

  "_token",
  "_sender",
  "_steamID64"

];

_token = DUCV_SEC_AUTHTOKEN;
_sender = clientOwner;
_steamID64 = getPlayerUID player;

params[

  ["_moduleName", ""],
  ["_moduleID", ""],
  ["_content", ""]

];

if (_content isEqualTo "") then
{
  [_sender, _steamID64, _token, _moduleName, _moduleID] remoteExec ["duc_core_net_fnc_serverInterface", 2];
} else
{
  [_sender, _steamID64, _token, _moduleName, _moduleID, _content] remoteExec ["duc_core_net_fnc_serverInterface", 2];
};