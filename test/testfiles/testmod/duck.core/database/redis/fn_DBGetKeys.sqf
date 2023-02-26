params[
  "_databaseID",
  "_regex"
];

private _stmt = format["dbkeys:%1:%2", _databaseID, _regex];
private _databaseResult = "A3Redis" callExtension _stmt;

private _databaseResult = [] call compile _databaseResult;
_databaseResult;