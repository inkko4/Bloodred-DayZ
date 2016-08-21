/*---------------------------------------------------------------------------
p2_miniMsg
   Can be used to broadcast a zombz style hint message in players debug mon colours

Inputs:
   _this select 0: [_Message_Title,_Message_Text] //Array, Message box title, message box text
   _this select 1: 5 //Number, time to show the message for

Example Use:

   _Message_Title = '<t size=''1'' font=''Bitstream'' align=''left'' color=''#FFFFFF''>Information</t>';
   _Message_Text = '<br /><t size=''1.5'' font=''Bitstream'' align=''center'' color=''#F7F2E0''>Coming Soon!</t>'
   _Message_Display_Time = 5;

   [[_Message_Title,_Message_Text],_Message_Display_Time] spawn p2_miniMsg;

---------------------------------------------------------------------------*/

p2_miniMsg = {
   private['_dbm','_msg','_len']; 
   _dbm = P2DZ_dbCurMode;
   if (P2DZ_announcementInProgress) exitWith {};
   P2DZ_dbCurMode = 1;   
   P2DZ_announcementInProgress = true;
   if (P2DZ_dbCurMode != 1) then {
      if (P2DZ_dbCurMode == 2) then {
         sleep P2DZ_debugMonSleep;
      };
      sleep P2DZ_debugMonSleep;
   }; 

   _msg = _this select 0;
   _msgTitle = _msg select 0;
   _msgText = _msg select 1;
   _len = _this select 1;
   for "_i" from 0 to (_len * 10) do {
      [_msgTitle,  
      _msgText,
      P2DZE_debugCol,
      false
      ] spawn P2DZ_hintMini;

      uisleep 0.01;
   };

   P2DZ_dbCurMode = _dbm;
   sleep 0.01;
   P2DZ_debugMonitor = true;
   P2DZ_announcementInProgress = false;
};