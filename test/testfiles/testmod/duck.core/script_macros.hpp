// Core
#define DEF_CORE_CONST_SERVERID getNumber(configFile >> "CfgSettings" >> "serverID")
#define DEF_CORE_PRINT_DEBUG(MSG) diag_log MSG
#define DEF_CORE_GET_OBJECT_VALUE(SCHEMA, OBJECT, FIELD) ([SCHEMA, OBJECT, FIELD] call DUC_CORE_fnc_getObjectValue)

// Redis
#define DEF_DB_GET_SCHEMA(DB, TBL, SCH) (getArray(configFile >> "CfgSettings" >> DB >> TBL >> SCH))
#define DEF_DB_REDIS_GET_DBID(KEY) ([DEF_DB_GET_SCHEMA("db_life", "Redis", "dbIDs"), KEY] call DUC_CORE_fnc_getConfigEntry)

// MySQL
// Exec query without rs
#define DEF_DB_MYSQL_EXEC_QUERY(QUERY) [QUERY, 0, (call ducv_core_dbidplayerdata)] call duc_core_mysql_fnc_queryHandler
// Exec query with rs (ResultSet)
#define DEF_DB_MYSQL_EXEC_QUERY_RS(QUERY) [QUERY, 2, (call ducv_core_dbidplayerdata)] call duc_core_mysql_fnc_queryHandler
