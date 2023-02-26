#include "duck.core/meta/macros.h"
params["_queryStatement"];

LOG((format["_queryStatement = %1", _queryStatement]), 0);

if (_queryStatement isEqualTo "") exitWith
{
  diag_log "_queryStatement is empty";
  false;
};

_queryResult = "A3MySQL" callExtension format["database query arma3koth ###%1###", _queryStatement];
LOG((format["_queryResult = %1", _queryResult]), 0);


_queryResult = call compile _queryResult;
_queryResult;
