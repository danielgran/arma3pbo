params[
  ["_token", "", [""]],
  ["_sender", objNull, [objNull]],
  ["_steamID64", "", [""]],
  ["_id", 0, [0]],
  ["_content", "", [[], ""]]
];

switch (_id) do {

    // Init Player so everything is loaded fine
    case (0): {
      // content here is name of player
      [_steamID64, _content] call duc_core_sys_fnc_initPlayer;
      _content = [_steamID64, _content] call duc_core_net_fnc_prepClientVars;
      diag_log _content;
    };
};

#ifdef release
[_token, "SYS", _id, _content, _sender] call DUC_CORE_NET_fnc_sendClient;
#else
_content
#endif