private[
  "_return"
];

params[
  ["_value", ""],
  ["_dataType", ""]
];

switch (_dataType) do {
    case ("STRING"): {
        _return = _value;
    };
    case ("SCALAR"): {
        _return = parseNumber _value;
    };
    case ("BOOL"): {
        if (_value isEqualTo "true") exitWith { _return = true; };
        _return = false;
    };
    case ("DBARRAY"): {
        _return = call compile _value;
    };
    case ("DBENUM"): {
        _return = str(_value);
    };
};

_return;
