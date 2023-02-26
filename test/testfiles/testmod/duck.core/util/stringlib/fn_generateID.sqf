private["_return", "_allowedChars", "_allowedNumbers"];


_return = "";
_preReturn = [];
_allowedChars = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
_allowedNumbers = [0,1,2,3,4,5,6,7,8,9];

params[
  "_pattern" //X00XXX00X i.e.
];


// Loop through String
{
  switch (_x) do
  {
    case "X":
    {
      _preReturn pushBack (_allowedChars select (round (random 25)));
    };
    case "0":
    {
      _preReturn pushBack str((_allowedNumbers select (round (random 10))));
    };
  };
} forEach (_pattern splitString "");


{
  _return = _return + _x;
} forEach _preReturn;

_return;
