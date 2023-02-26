private[

  "_placeholder"

];

params[

  ["_id", objNull],
  ["_content", []]

];

diag_log _content;

switch (_id) do {
  // Set / Update all client vars
  case (0): {
    [_content] call CDUC_SYS_fnc_setClientVars;
  };
};
