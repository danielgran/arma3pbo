class Synchronize
{
  tag = "DUCSYNC";
  class Sync
  {
    file = "functions\serverSync";
    class receiveData{};
    class sendData {};
  };
};

class Message
{
  tag = "DUCREC";
  class Receive
  {
    file = "functions";
    class receiveServerMessage {};
  };
};

class GUI
{
  tag = "DUCGUI";
  class Playermenu
  {
    file = "functions\gui";
    class openPlayerMenu {};
  };
};

class LevelSystem
{
  tag = "DUCLVL";
  class Functions
  {
    file = "functions\levelSystem";
    class receiveLevelinfo {};
    class nextLevelEvent {};
    class addEXP {};
  };
};