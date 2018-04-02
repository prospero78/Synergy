unit Font8x8;
{ Модуль содержит русский (+английский шрифт, потом) размером 8х8.
   Сделано в форме массива, каждая буква имеет символьное имя.
   Этот модуль не предназначен для компиляции в составе Font_Creator }

interface

const
   // Русские маленькие буквы
   ru_SmA = ru_BigJa + 1;//А
   ru_SmB = ru_SmA + 1;//Б
   ru_SmW = ru_SmB + 1;//В
   ru_SmG = ru_SmW + 1;//Г
   ru_SmD = ru_SmG + 1;//Д
   ru_SmE = ru_SmD + 1;//Е
   ru_SmE2 = ru_SmE + 1;//Ё
   ru_SmZh = ru_SmE2 + 1;//Ж
   ru_SmZ = ru_SmZh + 1;//З
   ru_SmI = ru_SmZ + 1;//И
   ru_SmJ = ru_SmI + 1;//Й
   ru_SmK = ru_SmJ + 1;//К
   ru_SmL = ru_SmK + 1;//Л
   ru_SmM = ru_SmL + 1;//М
   ru_SmN = ru_SmM + 1;//Н
   ru_SmO = ru_SmN + 1;//О
   ru_SmP = ru_SmO + 1;//П
   ru_SmR = ru_SmP + 1;//Р
   ru_SmS = ru_SmR + 1;//С
   ru_SmT = ru_SmS + 1;//Т
   ru_SmU = ru_SmT + 1;//У
   ru_SmF = ru_SmU + 1;//Ф
   ru_SmKh = ru_SmF + 1;//Х
   ru_SmTc = ru_SmKh + 1;//Ц
   ru_SmCh = ru_SmTc + 1;//Ч
   ru_SmSh = ru_SmCh + 1;//Ш
   ru_SmShh = ru_SmSh + 1;//Щ
   ru_SmHz = ru_SmShh + 1;//Ъ
   ru_SmY = ru_SmHz + 1;//Ы
   ru_SmSz = ru_SmY + 1;//Ь
   ru_SmEh = ru_SmSz + 1;//Э
   ru_SmYu = ru_SmEh + 1;//Ю
   ru_SmJa = ru_SmYu + 1;//Я

type
   /// Тип описывает литеры цифр
   tDig = class
   public 
      d0: array[0..7] of byte = (62, 67, 69, 73, 81, 97, 62);
      d1: array[0..7] of byte = (1, 3, 5, 1, 1, 1, 1);
      d2: array[0..7] of byte = (62, 65, 2, 4, 8, 48, 127);
      d3: array[0..7] of byte = (127, 2, 28, 2, 1, 65, 62);
      d4: array[0..7] of byte = (3, 5, 9, 17, 33, 127, 1);
      d5: array[0..7] of byte = (127, 64, 126, 1, 1, 65, 62);
      d6: array[0..7] of byte = (62, 64, 64, 126, 65, 65, 62);
      d7: array[0..7] of byte = (127, 1, 2, 4, 8, 8, 8);
      d8: array[0..7] of byte = (62, 65, 65, 62, 65, 65, 62);
      d9: array[0..7] of byte = (62, 65, 65, 66, 1, 1, 62);
   end;
   /// Специальные литеры
   tSpez = class
   public 
      /// пробел
      space: array[0..7] of byte = (0, 0, 0, 0, 0, 0, 0);
      /// подчёркивание
      strike: array[0..7] of byte = (0, 0, 0, 0, 0, 0, 62);
      /// минус
      minus: array[0..7] of byte = (0, 0, 0, 127, 0, 0, 0);
      /// плюс
      plus: array[0..7] of byte = (8, 8, 8, 127, 8, 8, 8);
      /// (умножить)
      multi: array[0..7] of byte = (0, 42, 28, 62, 28, 42, 0);
      // (деление)
      _div: array[0..7] of byte = (8, 0, 0, 127, 0, 0, 8);
      // (запятая)
      hlp_comma: array[0..7] of byte = (0, 7, 7, 7, 1, 1, 3);
      // (точка)
      hlp_dot: array[0..7] of byte = (0, 0, 0, 0, 28, 28, 28);
      // (левая круглая скобка)
      hlp_lrb: array[0..7] of byte = (4, 8, 24, 24, 24, 8, 4);
      // (правая круглая скобка)
      hlp_rrb: array[0..7] of byte = (16, 8, 12, 12, 12, 8, 16);
      // (левая квадратная скобка)
      hlp_lsb: array[0..7] of byte = (28, 16, 16, 16, 16, 16, 28);
      // (правая квадратная скобка)
      hlp_rsb: array[0..7] of byte = (28, 4, 4, 4, 4, 4, 28);
      // (двойные кавычки)
      hlp_dqt: array[0..7] of byte = (102, 102, 102, 0, 0, 0, 0);
      // (одиночные кавычки)
      hlp_sqt: array[0..7] of byte = (24, 24, 24, 0, 0, 0, 0);
      // (апостроф)
      hlp_apo: array[0..7] of byte = (96, 120, 60, 12, 0, 0, 0);
      // (tilda)
      hlp_tilda: array[0..7] of byte = (0, 0, 0, 50, 76, 0, 0);
      // (восклицательный знак)
      hlp_akk: array[0..7] of byte =  (0, 24, 24, 24, 24, 0, 24);
      // (решётка)
      hlp_bang: array[0..7] of byte = (18, 127, 18, 36, 127, 36, 0);
      // (номер)
      hlp_numer: array[0..7] of byte = (72, 106, 109, 106, 88, 91, 72);
      // (доллар)
      hlp_dol: array[0..7] of byte = (62, 73, 72, 62, 9, 73, 62);
      // (точка с запятой)
      hlp_cdot: array[0..7] of byte = (28, 28, 0, 28, 28, 4, 12);
      // (процент)
      hlp_percent: array[0..7] of byte = (33, 82, 36, 8, 18, 37, 66);
      // (двоеточие)
      hlp_ddot: array[0..7] of byte = (24, 24, 0, 0, 0, 24, 24);
      // (амперсанд)
      hlp_amp: array[0..7] of byte = (24, 36, 40, 16, 42, 36, 27);
      // (вопрос)
      hlp_qst: array[0..7] of byte = (30, 33, 2, 4, 8, 0, 8);
      // (равно)
      hlp_equ: array[0..7] of byte = (0, 127, 0, 0, 127, 0, 0);
      // (слэш)
      hlp_slh: array[0..7] of byte = (1, 2, 4, 8, 16, 32, 64);
      // (обратный слэш)
      hlp_bslh: array[0..7] of byte = (64, 32, 16, 8, 4, 2, 1);
      // (меньше)
      hlp_lequ: array[0..7] of byte = (3, 12, 48, 64, 48, 12, 3);
      // (больше)
      hlp_requ: array[0..7] of byte = (96, 24, 6, 1, 6, 24, 96);
      // (степень)
      hlp_exp: array[0..7] of byte = (8, 20, 34, 65, 0, 0, 0);
      // (левая фигурная скобка)
      hlp_lfb: array[0..7] of byte = (12, 16, 16, 112, 16, 16, 12);
      // (правая фигурная скобка)
      hlp_rfb: array[0..7] of byte = (48, 8, 8, 14, 8, 8, 48);
   end;
   /// Английские буквы
   tLetEn = class
   public 
      en_BigA: array[0..7] of byte = (8, 20, 34, 65, 127, 65, 65);
      en_BigB: array[0..7] of byte = (126, 65, 65, 126, 65, 65, 126);
      en_BigC: array[0..7] of byte = (62, 65, 64, 64, 64, 65, 62);
      en_BigD: array[0..7] of byte = (124, 66, 65, 65, 65, 66, 124);
      en_BigE: array[0..7] of byte = (127, 64, 64, 124, 64, 64, 127);
      en_BigF: array[0..7] of byte = (127, 64, 64, 124, 64, 64, 64);
      en_BigG: array[0..7] of byte = (62, 64, 64, 79, 65, 65, 62);
      en_BigH: array[0..7] of byte = (65, 65, 65, 127, 65, 65, 65);
   end;
   /// Русские буквы
   tLetRu = class
   public
   ru_BigA: array[0..7] of byte = (3, 5, 9, 17, 63, 65, 65);
   ru_BigB: array[0..7] of byte = (126, 64, 126, 65, 65, 65, 126);
   ru_BigW: array[0..7] of byte = (124, 66, 68, 126, 65, 65, 126);
   ru_BigG: array[0..7] of byte = (127, 65, 64, 64, 64, 64, 64);
   ru_BigD: array[0..7] of byte = (62, 18, 18, 18, 34, 127, 65);
   ru_BigE: array[0..7] of byte = (127, 64, 124, 64, 64, 64, 127);
   ru_BigE2: array[0..7] of byte = (18, 127, 64, 124, 64, 64, 127);
   ru_BigZh: array[0..7] of byte = (73, 42, 28, 42, 73, 73, 73);
   ru_BigZ: array[0..7] of byte = (62, 65, 14, 1, 1, 65, 62);
   ru_BigI: array[0..7] of byte = (65, 67, 69, 73, 81, 97, 65);
   ru_BigK: array[0..7] of byte = (67, 76, 112, 72, 68, 66, 65);
   ru_BigL: array[0..7] of byte = (15, 17, 17, 17, 17, 17, 97);
   ru_BigM: array[0..7] of byte = (65, 99, 99, 85, 85, 73, 73);
   ru_BigN: array[0..7] of byte = (65, 65, 65, 127, 65, 65, 65);
   ru_BigO: array[0..7] of byte = (62, 65, 65, 65, 65, 65, 62);
   ru_BigP: array[0..7] of byte = (127, 65, 65, 65, 65, 65, 65);
   ru_BigR: array[0..7] of byte = (126, 65, 65, 65, 126, 64, 64);
   ru_BigS: array[0..7] of byte = (62, 65, 64, 64, 64, 65, 62);
   ru_BigT: array[0..7] of byte = (127, 8, 8, 8, 8, 8, 8);
   ru_BigU: array[0..7] of byte = (65, 65, 65, 63, 1, 65, 62);
   ru_BigF: array[0..7] of byte = (62, 73, 73, 73, 62, 8, 8);
   ru_BigKh: array[0..7] of byte = (65, 34, 20, 8, 20, 34, 65);
   ru_BigTc: array[0..7] of byte = (66, 66, 66, 66, 66, 127, 1);
   ru_BigCh: array[0..7] of byte = (65, 65, 65, 63, 1, 1, 1);
   ru_BigSh: array[0..7] of byte = (73, 73, 73, 73, 73, 73, 127);
   ru_BigShh: array[0..7] of byte = (84, 84, 84, 84, 84, 126, 2);
   ru_BigHz: array[0..7] of byte = (96, 32, 32, 62, 33, 33, 62);
   ru_BigY: array[0..7] of byte = (65, 65, 65, 121, 69, 69, 121);
   ru_BigSz: array[0..7] of byte = (64, 64, 64, 126, 65, 65, 126);
   ru_BigEh: array[0..7] of byte = (62, 65, 1, 31, 1, 65, 62);
   ru_BigYu: array[0..7] of byte = (78, 81, 81, 113, 81, 81, 78);
   ru_BigJa: array[0..7] of byte = (63, 65, 65, 63, 9, 17, 97);
   ru_SmA: array[0..7] of byte = (0, 28, 2, 30, 34, 34, 29);
   ru_SmB: array[0..7] of byte = (1, 30, 32, 62, 33, 33, 30);
   ru_SmW: array[0..7] of byte = (0, 30, 33, 62, 33, 33, 30);
   ru_SmG: array[0..7] of byte = (0, 30, 33, 6, 24, 33, 30);
   ru_SmD: array[0..7] of byte = (0, 14, 10, 10, 18, 63, 63);
   ru_SmE: array[0..7] of byte = (0, 30, 33, 63, 32, 33, 30);
   ru_SmE2: array[0..7] of byte = (18, 30, 33, 63, 32, 33, 30);
   end;
var
   /// Шрифт 8х8
   f88: array[0..255, 0..6]of byte = (
      // Русские маленькие
         (0, 21, 21, 14, 21, 21, 21),//ru_SmZh
         (0, 30, 33, 14, 1, 33, 30),//ru_SmZ
         (0, 33, 35, 37, 41, 49, 33),//ru_SmI
         (0, 33, 34, 60, 34, 33, 33),//ru_SmK
         (0, 15, 17, 17, 17, 17, 33),//ru_SmL
         (0, 17, 27, 27, 31, 21, 21),//ru_SmM
         (0, 33, 33, 63, 33, 33, 33),//ru_SmN
         (0, 30, 33, 33, 33, 33, 30),//ru_SmO
         (0, 63, 33, 33, 33, 33, 33),//ru_SmP
         (0, 62, 63, 33, 62, 32, 32),//ru_SmR
         (0, 30, 33, 32, 32, 33, 30),//ru_SmS
         (0, 31, 4, 4, 4, 4, 4),//ru_SmT
         (0, 33, 33, 31, 1, 33, 30),//ru_SmU
         (0, 14, 21, 21, 21, 14, 4),//ru_SmF
         (0, 33, 18, 12, 12, 18, 33),//ru_SmKh
         (0, 34, 34, 34, 34, 31, 1),//ru_SmTc
         (0, 33, 33, 33, 31, 1, 1),//ru_SmCh
         (21, 21, 21, 21, 21, 21, 31),//ru_SmSh
         (0, 42, 42, 42, 42, 63, 1),//ru_SmShh
         (0, 48, 16, 30, 17, 17, 30),//ru_SmHz
         (0, 33, 33, 57, 37, 37, 57),//ru_SmY
         (0, 32, 32, 62, 33, 33, 62),//ru_SmSz
         (0, 30, 33, 15, 1, 33, 30),//ru_SmEh
         (0, 38, 41, 57, 41, 41, 38),//ru_SmYu
         (0, 31, 33, 33, 31, 9, 49)//ru_SmJa
   );
   dig: record
   
   end;
   ru: record
   
   end;

implementation

begin

end. 
