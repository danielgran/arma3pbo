params[
  ["_toConvert", [], [[]]]
];

_toConvert = str(_toConvert);
_toConvert = [_toConvert, "[", "\'"] call DUC_CORE_fnc_replaceString;
_toConvert = [_toConvert, "]", "\'"] call DUC_CORE_fnc_replaceString;
_toConvert = [_toConvert, """", ""] call DUC_CORE_fnc_replaceString;
_toConvert = [_toConvert, ",", "\', \'"] call DUC_CORE_fnc_replaceString;
_toConvert;