#include "duck.core/meta/macros.h"
LOG("_____  _    _  _____ _  __  _____ ____  _____  ______  ", 0);
LOG("|  __ \| |  | |/ ____| |/ / / ____/ __ \|  __ \|  ____|", 0);
LOG("| |  | | |  | | |    | ' / | |   | |  | | |__) | |__   ", 0);
LOG("| |  | | |  | | |    |  <  | |   | |  | |  _  /|  __|  ", 0);
LOG("| |__| | |__| | |____| . \ | |___| |__| | | \ \| |____ ", 0);
LOG("|_____/ \____/ \_____|_|\_(_)_____\____/|_|__\_\______|", 0);
LOG("                                                       ", 0);
LOG("       |  __ \|  __ \|  ____|_   _| \ | |_   _|__   __|", 0);
LOG(" ______| |__) | |__) | |__    | | |  \| | | |    | |   ", 0);
LOG("|______|  ___/|  _  /|  __|   | | | . ` | | |    | |   ", 0);
LOG("       | |    | | \ \| |____ _| |_| |\  |_| |_   | |   ", 0);
LOG("       |_|    |_|  \_\______|_____|_| \_|_____|  |_|   ", 0);

private LOCK_SERVER = {
  serverCommand "#lock";
  LOG("Server locked", 4);
};

// let init only be executed once
if (!isNil("serverInitDone")) exitWith {diag_log "INIT EXECUTED TWICE?";};

#define __SVAR__(var1,var2) var1 = compileFinal (if(typeName var2 isEqualTo "STRING") then {var2} else {str(var2)})
#define __SCVAR__(var) var = compileFinal (if(typeName var isEqualTo "STRING") then {var} else {str(var)})



if (("A3MySQL" callExtension "version") == "") exitWith {
  LOG("ERROR: A3MySQL not found", 4);
  call LOCK_SERVER;
};
if (("A3Redis" callExtension "version") == "") exitWith {
  LOG("A3Redis not found", 4);
  call LOCK_SERVER;
};

LOG((format["A3MySQL version: %1", ("A3MySQL" callExtension "version")]), 1);
LOG((format["A3Redis version: %1", ("A3Redis" callExtension "version")]), 1);
LOG("All extensions loaded fine", 1);

if (("A3MySQL" callExtension "database connect arma3koth") != "ok") exitWith {
  diag_log "ERROR: A3MySQL connection failed";
  call LOCK_SERVER;
};


// Redis Handling
_con = call duc_core_redis_fnc_connect;
_a3rversion = call duc_core_redis_fnc_checkVersion;
if (_a3rversion isEqualTo "") exitWith
{
  diag_log text "__LINE__ [DUCK:CORE] A3Redis wurde nicht gefunden";
  call LOCK_SERVER;
};
call duc_core_redis_fnc_DBFlush;


_databaseResult = ["SHOW PROCESSLIST"] call duc_core_mysql_fnc_queryHandler;
if (_databaseResult isEqualTo [[]]) then // Check if Databaseconnection is established
{
  LOG("Database connection failed.", 1);
  call LOCK_SERVER;
} else
{
  diag_log __FILE__;
  LOG("Database connection established", 1);
};


//TODO: some sort of control structure if everything loaded fine<
serverInitDone = true;