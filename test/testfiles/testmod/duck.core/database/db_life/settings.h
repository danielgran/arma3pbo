class db_life
{

  // DB IDS of Redis are saved here
  class Redis
  {
    dbIDs[] =
    {
      {"playerdata", 0}, // Contains all the cached playerdata which the player is using
      {"garagedata", 1}, // Contains all playergarages and houses
      {"shopdata", 2}, // Contains Information about shops on the server
      {"vehicledata", 3},
      {"placeholder04", 4},
      {"placeholder05", 5},
      {"placeholder06", 6},
      {"placeholder07", 7},
      {"placeholder08", 8},
      {"placeholder09", 9},
      {"placeholder09", 10},
      {"placeholder09", 11},
      {"placeholder09", 12},
      {"placeholder10", 13}

    };
  };

  class tblGarageVehicle
  {
    schema[] =
    {
      {"id", "SCALAR"},
      {"intid", "STRING"},
      {"nameClass", "STRING"},
      {"nameDisplay", "STRING"},
      {"canSpawn", "BOOL"},
      {"priceBuy", "BOOL"},
      {"owner", "STRING"},
      {"keyOwner", "DBARRAY"},
      {"inventoryVirt", "DBARRAY"},
      {"fuel", "SCALAR"},
      {"hitInfo", "DBARRAY"},
      {"cargoBackpack", "DBARRAY"},
      {"cargoItem", "DBARRAY"},
      {"cargoWeapon", "DBARRAY"},
      {"cargoMagazine", "DBARRAY"},
      {"turretWeapon", "DBARRAY"},
      {"turretAmmo", "DBARRAY"}
    };
  };

  class tblPlayerServerTransact
  {
    schema[] =
    {

      {"steamid64", "STRING"},
      {"serverFrom", "SCALAR"},
      {"serverTo", "SCALAR"},
      {"vehicle", "STRING"},
      {"vehicleSkin", "STRING"},
      {"velocity", "DBARRAY"}

    };
  };



  class tblEcoShopServerInfo
  {

    // schema of the sp in the mysql 
    schemaSP[] =
    {
      {"shopID", "STRING"},
      {"shopName", "STRING"},
      {"shopType", "STRING"},
      {"itemClass", "STRING"},
      {"itemName", "STRING"},
      {"itemIsVirtual", "STRING"},
      {"itemType", "STRING"},
      {"itemPriceBuy", "SCALAR"},
      {"itemPriceSell", "SCALAR"},
      {"itemStock", "SCALAR"}
    };

    schemaCache[] = 
    {
      {"shopID", "STRING"},
      {"shopName", "STRING"},
      {"shopType", "STRING"},
      {"warehouse", "DBARRAY"}
    };


    schemaWarehouseItem[] =
    {
      {"className", "STRING"},
      {"priceBuy", "SCALAR"},
      {"priceSell", "SCALAR"},
      {"stock", "SCALAR"}
    };



  };


  // Contains all the vitems
  class tblListItems
  {
    schema[] = 
    {
      {"nameClass","STRING"},
      {"type","STRING"}, // via MySQL JOIN WHERE ... types ...
      {"isVirtual","BOOL"},
      {"nameDisplay","STRING"},
      {"priceBuy","SCALAR"},
      {"priceSell","SCALAR"}
    };

  };



};
