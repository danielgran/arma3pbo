class DUC_gui_statusPlayer
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
    text = "Spieler";
    colorText[] = 
    {
      0.45490,
      0.72549,
      1,
      0.95
    };
    //rgb(116, 185, 255)
    x = safezoneX;
    y = safezoneY + safezoneH * 0.875;
    w = 2;
    h = 0.3;
    sizeEx = "0.063 / (getResolution select 5)";
  
  
  };
    }
};
