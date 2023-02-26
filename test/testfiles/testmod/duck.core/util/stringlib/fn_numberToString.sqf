params[
  "_number"
];


_string = "";
if (_number < 10) then {
    _string = str _number;
} else {
  _lastNum = 0;
  while {_number >= 10} do {
      _digit = _number % 10;
      _string = format["%2%1", _string, floor _digit];
      _number = _number / 10;
      _lastNum = _number;
  };
  _string = format["%2%1", _string, floor (_lastNum)];
};

_string;

