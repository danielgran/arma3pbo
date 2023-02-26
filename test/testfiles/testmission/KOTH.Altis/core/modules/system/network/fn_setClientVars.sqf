private[

  "_placeholder"

];

params[

  ["_clientVars", []]

];


{
  if((typeName (_x select 1)) == "STRING" ) then
  {
    call compile format["DUCV_%1 = ""%2"";", toUpper (_x select 0), _x select 1];
  } else
  {
    call compile format["DUCV_%1 = %2;", toUpper (_x select 0), _x select 1];
  };
} forEach _clientVars;





































//
