class DUC_gui_statusAdmin
{
  movingenable = 0;
  idd = -1;
  fadeIn = 0;
  duration = 10e10;
  fadeOut = 0;
  name = "Playerstatus";
  class controls
  {

    class DUC_info_Playertype: RscText
    {
      idc = 1000;
      text = "Administrator";
      colorText[] = 
      {
        0.83922,
        0.18824,
        0.19216,
        0.95
      };
      x = safezoneX;
      y = safezoneY + safezoneH * 0.875;
      w = 2;
      h = 0.3;
      sizeEx = "0.063 / (getResolution select 5)";
    
    
    };
  }
};
