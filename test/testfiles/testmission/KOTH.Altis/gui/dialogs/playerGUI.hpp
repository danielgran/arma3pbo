/////////////////////////////////////////////////////////////////
/////////// This File was Edited by GUI D3V by Shinji ///////////
/////////////////////////////////////////////////////////////////
class DUC_playerMenu {
   idd = 1500;
   name = "DUC_playerMenu";
   movingenable = false;
   enablesimulation = true;
   class controlsBackground
   {
   };
   class controls
   {
       class DUC_background : IGUIBack
       {
           idc = 1001;
           x = 0.244270833333333 * safezoneW + safezoneX;
           y = 0.239120452310718 * safezoneH + safezoneY;
           w = 0.4390625 * safezoneW;
           h = 0.505408062930187 * safezoneH;
           colorbackground[] = {0,0,0,0.909803921568627};
       };
       class DUC_txt_header : RscText
       {
           idc = 1000;
           text = "DUCKOTH - King of the Hill";
           x = 0.413541666666667 * safezoneW + safezoneX;
           y = 0.239120452310718 * safezoneH + safezoneY;
           h = 0.037 * safezoneH;
           w = 0.121354166666666 * safezoneW;
       };
       class DUC_frame_personal : RscFrame
       {
           idc = 1002;
           colorbackground[] = {0,0,0,0.717647058823529};
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.338249754178958 * safezoneH + safezoneY;
           w = 0.270833333333333 * safezoneW;
           h = 0.388397246804326 * safezoneH;
       };
       class DUC_txt_hsteamid : RscText
       {
           idc = 1003;
           text = "Steam-ID:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.369714847590954 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_personalheader : RscText
       {
           idc = 1004;
           text = "Spielerinformationen:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.338249754178958 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_hduckothid : RscText
       {
           idc = 1005;
           text = "DUCKOTH-ID:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.40117994100295 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_hname : RscText
       {
           idc = 1006;
           text = "Name:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.432645034414946 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_hrank : RscText
       {
           idc = 1007;
           text = "Rang:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.464110127826942 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_hbanned : RscText
       {
           idc = 1008;
           text = "Gebannt:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.495575221238938 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_hexp : RscText
       {
           idc = 1009;
           text = "XP:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.527040314650934 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_hlevel : RscText
       {
           idc = 1010;
           text = "Level:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.55850540806293 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_hmoney : RscText
       {
           idc = 1011;
           text = "Geld:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.589970501474926 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_hteamkills : RscText
       {
           idc = 1012;
           text = "Teamkills:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.621435594886922 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_hkills : RscText
       {
           idc = 1013;
           text = "Kills:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.652900688298918 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_hdeaths : RscText
       {
           idc = 1014;
           text = "Tode:";
           x = 0.250520833333333 * safezoneW + safezoneX;
           y = 0.684365781710914 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.101041666666667 * safezoneW;
       };
       class DUC_txt_steamid : RscText
       {
           idc = 1015;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.369714847590954 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_txt_duckothid : RscText
       {
           idc = 1016;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.40117994100295 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_txt_name : RscText
       {
           idc = 1017;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.432645034414946 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_txt_rank : RscText
       {
           idc = 1018;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.464110127826942 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_txt_banned : RscText
       {
           idc = 1019;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.495575221238938 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_txt_exp : RscText
       {
           idc = 1020;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.527040314650934 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_txt_level : RscText
       {
           idc = 1021;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.55850540806293 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_txt_money : RscText
       {
           idc = 1022;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.589970501474926 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_txt_teamkills : RscText
       {
           idc = 1023;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.621435594886922 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_txt_kills : RscText
       {
           idc = 1024;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.652900688298918 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_txt_deaths : RscText
       {
           idc = 1025;
           text = "placeholder";
           x = 0.3515625 * safezoneW + safezoneX;
           y = 0.684365781710914 * safezoneH + safezoneY;
           h = 0.0314650934119961 * safezoneH;
           w = 0.16875 * safezoneW;
       };
       class DUC_btn_sync : RscButton
       {
           text = "Sync Data with Server";
           x = 0.549479166666667 * safezoneW + safezoneX;
           y = 0.352999016715831 * safezoneH + safezoneY;
           w = 0.0988361666666667 * safezoneW;
           h = 0.112036711897738 * safezoneH;
           idc = 1026;
       action = "call DUCSYNC_fnc_sendData";
       };
       class DUC_btn_close : RscButton
       {
           text = "X";
           colorbackground[] = {1,0,0,1};
           colorbackgrounddisabled[] = {1,1,1,0};
           colorbackgroundactive[] = {1,1,1,0};
           colorfocused[] = {1,1,1,0};
           colorborder[] = {1,1,1,0};
           x = 0.660416666666667 * safezoneW + safezoneX;
           y = 0.239120452310718 * safezoneH + safezoneY;
           w = 0.0223958333333333 * safezoneW;
           h = 0.039216 * safezoneH;
           idc = 1027;
           action = "closeDialog 0";
       };
   };
};
/////////////////////////////////////////////////////////////////
////////////////////////// FILE END /////////////////////////////
/////////////////////////////////////////////////////////////////
