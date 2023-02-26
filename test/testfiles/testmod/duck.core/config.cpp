class CfgPatches
{
  class duck_core
  {
    name = "DUCK.CORE";
    author = "Duckfine";
    url = "ONE-UNIT.NET";

    requiredAddons[] = {};
    units[] = {};
    weapons[] = {};
  };
};

class CfgFunctions
{
  #include "functions.h"
};

class CfgRemoteExec
{
  #include "CfgRemoteExec.hpp"
};


class CfgSettings
{
  ServerID = 1;
  #include "duck.core/database/config.h"

   // Settings for DB related stuff
  #include "duck.core/database/db_life/settings.h"

  class Classes {
    player[] = {
      {"steamid64", "STRING"},
      {"a3name", "STRING"},
      {"rankTeam", "SCALAR"},
      {"rankDonator", "SCALAR"},
      {"nickname", "STRING"},
      {"location", "DBARRAY"},
      {"gearCivilian", "DBARRAY"},
      {"gearPolice", "DBARRAY"},
      {"gearMedic", "DBARRAY"},
      {"gearMechanic", "DBARRAY"},
      {"invVirtual", "DBARRAY"},
      {"alive", "BOOL"},
      {"arrested", "DBARRAY"},
      {"banned", "BOOL"},
      {"cash", "SCALAR"},
      {"bank", "SCALAR"},
      {"teamkills", "SCALAR"},
      {"kills", "SCALAR"},
      {"deaths", "SCALAR"},
      {"xp", "SCALAR"},
      {"levelPlayer", "SCALAR"},
      {"levelPolice", "SCALAR"},
      {"levelMedic", "SCALAR"},
      {"levelMech", "SCALAR"},
      {"playtime", "SCALAR"},
      {"lastconnect", "SCALAR"}
    };
  };

  class Logging
  {
    A3Log = true;
    extdb_playerdata = true;
    extdb_querylog = true; //Logs every single query to server
  };
};
