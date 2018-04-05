library keyboard;
{ Библиотека отслеживает нажатие всех возможных клавиш, конвертирует их
в строки, отправляет в место, куда назначено при запуске клавиатуры }
interface

const
   // Virtual Key Codes
   VK_Back = 8;              VK_Tab = 9;
   VK_LineFeed = 10;         VK_Enter = 13;
   VK_Return = 13;           VK_ShiftKey = 16;           VK_ControlKey = 17;
   VK_Menu = 18;             VK_Pause = 19;              VK_CapsLock = 20;
   VK_Capital = 20;
   VK_Escape = 27;
   VK_Space = 32;
   VK_Prior = 33;            VK_PageUp = 33;             VK_PageDown = 34;
   VK_Next = 34;             VK_End = 35;                VK_Home = 36;
   VK_Left = 37;             VK_Up = 38;                 VK_Right = 39;
   VK_Down = 40;             VK_Select = 41;             VK_Print = 42;
   VK_Snapshot = 44;         VK_PrintScreen = 44;
   VK_Insert = 45;           VK_Delete = 46;             VK_Help = 47;
   VK_A = 65;                VK_B = 66;
   VK_C = 67;                VK_D = 68;                  VK_E = 69;
   VK_F = 70;                VK_G = 71;                  VK_H = 72;
   VK_I = 73;                VK_J = 74;                  VK_K = 75;
   VK_L = 76;                VK_M = 77;                  VK_N = 78;
   VK_O = 79;                VK_P = 80;                  VK_Q = 81;
   VK_R = 82;                VK_S = 83;                  VK_T = 84;
   VK_U = 85;                VK_V = 86;                  VK_W = 87;
   VK_X = 88;                VK_Y = 89;                  VK_Z = 90;
   VK_LWin = 91;             VK_RWin = 92;               VK_Apps = 93;
   VK_Sleep = 95;            VK_NumPad0 = 96;            VK_NumPad1 = 97;
   VK_NumPad2 = 98;          VK_NumPad3 = 99;            VK_NumPad4 = 100;
   VK_NumPad5 = 101;         VK_NumPad6 = 102;           VK_NumPad7 = 103;
   VK_NumPad8 = 104;         VK_NumPad9 = 105;           VK_Multiply = 106;
   VK_Add = 107;             VK_Separator = 108;         VK_Subtract = 109;
   VK_Decimal = 110;         VK_Divide = 111;            VK_F1 = 112;
   VK_F2 = 113;              VK_F3 = 114;                VK_F4 = 115;
   VK_F5 = 116;              VK_F6 = 117;                VK_F7 = 118;
   VK_F8 = 119;              VK_F9 = 120;                VK_F10 = 121;
   VK_F11 = 122;             VK_F12 = 123;               VK_NumLock = 144;
   VK_Scroll = 145;          VK_LShiftKey = 160;         VK_RShiftKey = 161;
   VK_LControlKey = 162;     VK_RControlKey = 163;       VK_LMenu = 164;
   VK_RMenu = 165;           
   VK_KeyCode = 65535;       VK_Shift = 65536;           VK_Control = 131072;
   VK_Alt = 262144;          VK_Modifiers = -65536;

type
   тНажатие = procedure(лит: string);// ссылка н приём нажатия в terminal.dll
   тКлава = class
   public 
      передать: тНажатие;// хранит процедуру из terminal.dll
      /// клон OnKeyPress
      procedure Кнп_Нажата(лит: char);
      begin
         var стр := лит;
         self.передать(стр);
      end;
      /// Обратный вызов из terminal.dll
      procedure Кнопка_Вниз(кнп: integer);
      begin
         case кнп of
            VK_Enter: self.передать('enter');
            VK_Delete: self.передать('delete');
         end;
      end;
      
      constructor Create;
      begin
      end;
   end;

implementation

begin
end. 