private["_return"];


params[

  ["_toCheck", "", ["a"]],
  ["_rule", "", ["a"]]

];

_toCheck = _toCheck splitString "";
_rule = _rule splitString "";
_return = true;


{
  if ((_toCheck select _forEachIndex) isNotEqualTo (_rule select _forEachIndex)) exitWith {_return = false;};
} forEach _rule;

_return;