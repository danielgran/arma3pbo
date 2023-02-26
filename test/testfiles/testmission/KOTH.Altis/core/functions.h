class Core
{
  tag = "CDUC_CORE";

  class Methods
  {
    file = "core\methods";

    class getAllTurretWeapons {};

    class playSoundGlobal {};
  };
};

class System
{
  tag = "CDUC_SYS";

  class Handler
  {
    file = "core\modules\system";

    class handlerSystem {};
  };

  class Network
  {
    file = "core\modules\system\network";

    class setClientVars {};
    class sendServer {};
    class receiveServer {};
  }

};

class PTS
{
  tag = "CDUC_PTS";

  class Methods
  {
    file = "core\modules\pts\methods";

    class serverSwitch {};

  };
};