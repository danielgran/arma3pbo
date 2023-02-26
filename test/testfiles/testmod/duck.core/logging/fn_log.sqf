params[
  ["_module", "", ["a"]],
  ["_message", "", ["a"]],
  ["_logLevel", 0, [0]]
];

private _outputMessage = "";
switch (_logLevel) do {
  case 0: { // Debug
    _outputMessage = format["[%1][DEBUG] %2", _module, _message];
  };
  case 1: { // Info
    _outputMessage = format["[%1][INFO] %2", _module, _message];
  };
  case 2: { // Warning
    _outputMessage = format["[%1][WARNING] %2", _module, _message];
  };
  case 3: { // Error
    _outputMessage = format["[%1][ERROR] %2", _module, _message];
  };
  case 4: { // Fatal
    _outputMessage = format["[%1][FATAL] %2", _module, _message];
  };
  default { };
};

diag_log _outputMessage;