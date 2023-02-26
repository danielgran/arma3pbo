class Logging
{
  tag = "log";
  class Functions
  {
    file = "duck.core\logging";
    class log
    {
    };
  };
};

class Duck_Core_Startup
{
  tag = "dc_init";
  class Initialize
  {
    file = "duck.core";

    class preInit
    {
      preInit = 1;
    };
    class postInit
    {
      postInit = 1;
    };
  };
};

class Duck_Core
{
  tag = "duc_core";
  class Util
  {
    file = "duck.core\util";

    class getConfigEntry
    {
    };

    class mresStringToArray
    {
    };
    class mresArrayToString
    {
    };
    class stringIsNumber {};
  };

  class ObjectUtils {
    file = "duck.core\util\objectlib";

    class getObjectValue {};
    class setObjectValue {};
    class newObject {};
  };

  class StringUtils
  {
    file = "duck.core\util\stringlib";

    class replaceString {};
    class generateID {};
    class stringStartsWith {};
    class stringIsNumber {};
    class safeString {};
    class numberToString {};
  };
};

class Duck_Core_MySQL_Life
{
  tag = "duc_core_mysql";

  class ObjectHandler {
    file = "duck.core\database\mysql";

    class objectExists {};
    class createObject {};
    class deleteObject {};
    class getObject {};
  };

  // Overall methods
  class MySQLDatabaseManager
  {
    file = "duck.core\database\helper\mysql";

    class buildInsert
    {
    };
    class buildSelect
    {
    };
    class buildUpdate
    {
    };

    class queryHandler
    {
    };
    class DBArrayToA3Array
    {
    };
    class A3ArrayToDBArray
    {
    };
    class A3ArrayToDBList
    {
    };
  };
};

class DUCC_Redis
{
  tag = "duc_core_redis";

  // Universal Methods which can be used with any db context
  class WrapperFunctions
  {
    file = "duck.core\database\redis";

    class connect
    {
    };
    class disconnect {};
    class DBFlush
    {
    };
    class DBGetKeys
    {
    };
    class DBGetSize
    {
    };

    class keyDelete
    {
    };
    class keyExists
    {
    };
    class keyGet
    {
    };
    class keySet
    {
    };

    class listAdd
    {
    };
    class listDelete
    {
    };
    class listFetch
    {
    };
    class listEntryGet
    {
    };
    class listEntryUpdate
    {
    };
  };

  class HelperFunctions
  {
    file = "duck.core\database\helper\redis";
    class checkVersion
    {
    };

    class DBArrayToA3Array
    {
    };
    class DBValToA3Val
    {
    };
    class A3ValToDBVal
    {
    };
  };
};

class Duck_Core_System
{
  tag = "duc_core_sys";

  class System
  {
    file = "duck.core\system";
    class handlerSystem
    {
    };
    class initPlayer
    {
    };

    class register {};
  };

  class Server
  {
    file = "duck.core\system\server";

    class getServerInfo
    {
    };
  };
};
class Duck_Core_NETWORK
{
  tag = "duc_core_net";

  class Network
  {
    file = "duck.core\system\network";

    class serverInterface
    {
    };
    class sendClient
    {
    };
    class prepClientVars
    {
    };
  };
};

class DCPlayerTransactionSystem
{
  tag = "DUC_CORE_PTS";
  class Functions
  {
    file = "duck.core\pts";
    class handlerPTS{};
    class getTransactionInfoPlayer
    {
    };
    class transactPlayer
    {
    };
  };
};