private[

  "_return"

];

params[

  "_value",
  ["_dataType", "", [""]]

];



switch (_dataType) do {

    case ("STRING"): {
        _return = _value;
    };
    case ("SCALAR"): {
        _return = _value call DUC_CORE_fnc_numberToString;
    };
    case ("BOOL"): {
        if(_value) exitWith { _return = "true"; };
        _return = "false";
    };
    case ("DBARRAY"): {
        _return = str(_value);
    };
    case ("DBENUM"): {
        _return = str(_value);
    };
};


_return;



































//
