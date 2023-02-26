params[
  ["_config", []],
  ["_cfgName", ""]
];

_return = objNull;
{
  if (_cfgName isEqualTo (_x select 0)) exitWith
  {
    _return = (_x select 1);
  };
} forEach _config;

_return;