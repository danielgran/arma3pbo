params[

  ["_token", "", ["a"]],
  ["_module", "", ["a"]],
  ["_id", -1, [1]],
  "_content",
  "_sender"

];

[_token, _module, _id, _content] remoteExec ["CDUC_SYS_fnc_receiveServer", _sender];
