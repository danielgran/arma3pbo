private[

  "_return",
  "_dataType",
  "_value",
  "_insert"

];

_return = [];

params [
  ["_schema", []],
  ["_a3array", []]
];

{

  _dataType = (_x select 1);
  _value = _a3array select _forEachIndex;
  _insert = "";

  diag_log _dataType;

  switch (_dataType) do {
    case ("STRING"): {
      _insert = _value call duc_core_fnc_safeString;
    };

    case ("SCALAR"): {
      _insert = _value call duc_core_fnc_numberToString;
    };

    case ("BOOL"): {
      if (_value) exitWith { _insert = "1"; };
      _insert = "0";
    };



    case ("DBARRAY"): {
      diag_log (count (str(_value) splitString ""));
      if (count (str(_value) splitString "") < 5) exitWith {_insert = [[]] call duc_core_fnc_mresArrayToString;};
      // playerdata can go corrupted
      _insert = [_value] call duc_core_fnc_mresArrayToString;
    };

    case ("DBENUM"):
    {
      _insert = """" + _value + """";
    };

  };

  _return pushBack _insert;

} forEach _schema;


diag_log _return;
_return;
