﻿unit Font8x8;
{ Модуль содержит русский (+английский шрифт, потом) размером 8х8.
   Сделано в форме массива, каждая буква имеет символьное имя.
   Этот модуль не предназначен для компиляции в составе Font_Creator }

interface


type
   тМасЛит = array [0..7] of byte;
   /// Тип описывает литеры цифр
   tDig = class
   public 
      d0: тМасЛит = (0, 62, 67, 69, 73, 81, 97, 62);
      d1: тМасЛит = (0, 1, 3, 5, 1, 1, 1, 1);
      d2: тМасЛит = (0, 62, 65, 2, 4, 8, 48, 127);
      d3: тМасЛит = (0, 127, 2, 28, 2, 1, 65, 62);
      d4: тМасЛит = (0, 3, 5, 9, 17, 33, 127, 1);
      d5: тМасЛит = (0, 127, 64, 126, 1, 1, 65, 62);
      d6: тМасЛит = (0, 62, 64, 64, 126, 65, 65, 62);
      d7: тМасЛит = (0, 127, 1, 2, 4, 8, 8, 8);
      d8: тМасЛит = (0, 62, 65, 65, 62, 65, 65, 62);
      d9: тМасЛит = (0, 62, 65, 65, 66, 1, 1, 62);
   end;
   /// Специальные литеры
   tSpez = class
   public 
      /// пробел
      space: тМасЛит = (0, 0, 0, 0, 0, 0, 0, 0);
      /// подчёркивание
      strike: тМасЛит = (0, 0, 0, 0, 0, 0, 0, 62);
      /// минус
      minus: тМасЛит = (0, 0, 0, 0, 127, 0, 0, 0);
      /// плюс
      plus: тМасЛит = (0, 8, 8, 8, 127, 8, 8, 8);
      /// умножить
      multi: тМасЛит = (0, 0, 42, 28, 62, 28, 42, 0);
      /// деление
      _div: тМасЛит = (0, 8, 0, 0, 127, 0, 0, 8);
      /// запятая
      comma: тМасЛит = (0, 0, 7, 7, 7, 1, 1, 3);
      /// точка
      dot: тМасЛит = (0, 0, 0, 0, 0, 28, 28, 28);
      /// левая круглая скобка
      lrb: тМасЛит = (0, 4, 8, 24, 24, 24, 8, 4);
      /// правая круглая скобка
      rrb: тМасЛит = (0, 16, 8, 12, 12, 12, 8, 16);
      /// левая квадратная скобка
      lsb: тМасЛит = (0, 28, 16, 16, 16, 16, 16, 28);
      /// правая квадратная скобка
      rsb: тМасЛит = (0, 28, 4, 4, 4, 4, 4, 28);
      /// двойные кавычки
      dqt: тМасЛит = (0, 102, 102, 102, 0, 0, 0, 0);
      /// одиночные кавычки
      sqt: тМасЛит = (0, 24, 24, 24, 0, 0, 0, 0);
      /// апостроф
      apo: тМасЛит = (0, 96, 120, 60, 12, 0, 0, 0);
      /// тильда
      tilda: тМасЛит = (0, 0, 0, 0, 50, 76, 0, 0);
      /// восклицательный знак
      hlp_akk: тМасЛит =  (0, 0, 24, 24, 24, 24, 0, 24);
      /// решётка
      bang: тМасЛит = (0, 18, 127, 18, 36, 127, 36, 0);
      /// номер
      numer: тМасЛит = (0, 72, 106, 109, 106, 88, 91, 72);
      /// доллар
      dol: тМасЛит = (0, 62, 73, 72, 62, 9, 73, 62);
      /// точка с запятой
      cdot: тМасЛит = (0, 28, 28, 0, 28, 28, 4, 12);
      /// процент
      percent: тМасЛит = (0, 33, 82, 36, 8, 18, 37, 66);
      /// двоеточие
      ddot: тМасЛит = (0, 24, 24, 0, 0, 0, 24, 24);
      /// амперсанд
      amp: тМасЛит = (0, 24, 36, 40, 16, 42, 36, 27);
      /// вопрос
      qst: тМасЛит = (0, 30, 33, 2, 4, 8, 0, 8);
      /// равно
      equ: тМасЛит = (0, 0, 127, 0, 0, 127, 0, 0);
      /// слэш
      hlp_slh: тМасЛит = (0, 1, 2, 4, 8, 16, 32, 64);
      /// обратный слэш
      bslh: тМасЛит = (0, 64, 32, 16, 8, 4, 2, 1);
      /// меньше
      lequ: тМасЛит = (0, 3, 12, 48, 64, 48, 12, 3);
      /// больше
      requ: тМасЛит = (0, 96, 24, 6, 1, 6, 24, 96);
      /// степень
      exp: тМасЛит = (0, 8, 20, 34, 65, 0, 0, 0);
      /// левая фигурная скобка
      lfb: тМасЛит = (0, 12, 16, 16, 112, 16, 16, 12);
      /// правая фигурная скобка
      rfb: тМасЛит = (0, 48, 8, 8, 14, 8, 8, 48);
   end;
   /// Английские буквы
   tLetEn = class
   public 
      bA: тМасЛит = (0, 8, 20, 34, 65, 127, 65, 65);
      sA: тМасЛит = (0, 0, 30, 1, 31, 33, 35, 29);
      
      bB: тМасЛит = (0, 126, 65, 65, 126, 65, 65, 126);
      sB: тМасЛит = (0, 0, 32, 32, 62, 33, 33, 30);
      
      bC: тМасЛит = (0, 62, 65, 64, 64, 64, 65, 62);
      sC: тМасЛит = (0, 0, 30, 33, 32, 32, 33, 30);
      
      bD: тМасЛит = (0, 124, 66, 65, 65, 65, 66, 124);
      sD: тМасЛит = (0, 0, 1, 1, 31, 33, 33, 31);
      
      bE: тМасЛит = (0, 127, 64, 64, 124, 64, 64, 127);
      sE: тМасЛит = (0, 0, 30, 33, 38, 56, 33, 30);
      
      bF: тМасЛит = (0, 127, 64, 64, 124, 64, 64, 64);
      sF: тМасЛит = (0, 0, 6, 9, 8, 28, 8, 8);
      
      bG: тМасЛит = (0, 62, 64, 64, 79, 65, 65, 62);
      sG: тМасЛит = (0, 0, 30, 33, 33, 31, 1, 30);
      
      bH: тМасЛит = (0, 65, 65, 65, 127, 65, 65, 65);
      sH: тМасЛит = (0, 0, 32, 32, 62, 33, 33, 33);
      
      bI: тМасЛит = (0, 24, 24, 24, 24, 24, 24, 24);
      sI: тМасЛит = (0, 0, 12, 0, 12, 12, 12, 12);
      
      bJ: тМасЛит = (0, 127, 1, 1, 1, 1, 65, 62);
      sJ: тМасЛит = (0, 0, 12, 0, 12, 12, 44, 28);
      
      bK: тМасЛит = (0, 65, 66, 68, 120, 68, 66, 65);
      sK: тМасЛит = (0, 0, 33, 38, 56, 36, 34, 33);
      
      bL: тМасЛит = (0, 64, 64, 64, 64, 64, 64, 127);
      sL: тМасЛит = (0, 0, 16, 16, 16, 16, 16, 14);
      
      bM: тМасЛит = (0, 65, 99, 85, 73, 65, 65, 65);
      sM: тМасЛит = (0, 0, 52, 42, 42, 42, 42, 42);
      
      bN: тМасЛит = (0, 65, 97, 81, 73, 69, 67, 65);
      sN: тМасЛит = (0, 0, 46, 49, 33, 33, 33, 33);
      
      bO: тМасЛит = (0, 62, 65, 65, 65, 65, 65, 62);
      sO: тМасЛит = (0, 0, 30, 33, 33, 33, 33, 30);
      
      bP: тМасЛит = (0, 126, 65, 65, 65, 126, 64, 64);
      sP: тМасЛит = (0, 0, 62, 33, 33, 62, 32, 32);
      
      bQ: тМасЛит = (0, 60, 66, 66, 66, 74, 70, 61);
      sQ: тМасЛит = (0, 0, 30, 34, 34, 30, 3, 2);
      
      bR: тМасЛит = (0, 126, 65, 65, 126, 80, 76, 67);
      sR: тМасЛит = (0, 0, 38, 41, 40, 48, 32, 32);
      
      bS: тМасЛит = (0, 62, 65, 64, 62, 1, 65, 62);
      sS: тМасЛит = (0, 0, 30, 33, 28, 2, 33, 30);
      
      bT: тМасЛит = (0, 127, 8, 8, 8, 8, 8, 8);
      sT: тМасЛит = (0, 0, 8, 8, 28, 8, 9, 6);
      
      bU: тМасЛит = (0, 65, 65, 65, 65, 65, 65, 62);
      sU: тМасЛит = (0, 0, 34, 34, 34, 34, 34, 29);
      
      bV: тМасЛит = (0, 65, 65, 34, 34, 20, 20, 8);
      sV: тМасЛит = (0, 0, 34, 34, 20, 20, 8, 8);
      
      bW: тМасЛит = (0, 73, 73, 85, 85, 54, 34, 34);
      sW: тМасЛит = (0, 0, 42, 42, 42, 42, 20, 20);
      
      bX: тМасЛит = (0, 65, 34, 20, 8, 20, 34, 65);
      sX: тМасЛит = (0, 0, 33, 18, 12, 12, 18, 33);
      
      bY: тМасЛит = (0, 65, 34, 20, 8, 8, 8, 8);
      sY: тМасЛит = (0, 0, 34, 34, 26, 6, 34, 28);
      
      bZ: тМасЛит = (0, 127, 2, 4, 8, 16, 32, 127);
      sZ: тМасЛит = (0, 0, 63, 2, 4, 8, 16, 63);
   end;
   /// Русские буквы
   tLetRu = class
   public 
      /// Литера А
      bA: тМасЛит = (0, 3, 5, 9, 17, 63, 65, 65);
      /// Литера а
      sA: тМасЛит = (0, 0, 28, 2, 30, 34, 34, 29);
      
      /// Литера Б
      bB: тМасЛит = (0, 126, 64, 126, 65, 65, 65, 126);
      /// Литера б
      sB: тМасЛит = (0, 1, 30, 32, 62, 33, 33, 30);
      
      /// Литера В
      bW: тМасЛит = (0, 124, 66, 68, 126, 65, 65, 126);
      /// Литера в
      sW: тМасЛит = (0, 0, 30, 33, 62, 33, 33, 30);
      
      /// Литера Г
      bG: тМасЛит = (0, 127, 65, 64, 64, 64, 64, 64);
      /// Литера г
      sG: тМасЛит = (0, 0, 30, 33, 6, 24, 33, 30);
      
      /// Литера Д
      bD: тМасЛит = (0, 62, 18, 18, 18, 34, 127, 65);
      /// Литера д
      sD: тМасЛит = (0, 0, 14, 10, 10, 18, 63, 63);
      
      /// Литера Е
      bE: тМасЛит = (0, 127, 64, 124, 64, 64, 64, 127);
      /// Литера е
      sE: тМасЛит = (0, 0, 30, 33, 63, 32, 33, 30);
      
      /// Литера Ё
      bE2: тМасЛит = (0, 18, 127, 64, 124, 64, 64, 127);
      /// Литера ё
      sE2: тМасЛит = (0, 18, 30, 33, 63, 32, 33, 30);
      
      /// Литера Ж
      bZh: тМасЛит = (0, 73, 42, 28, 42, 73, 73, 73);
      /// Литера ж
      sZh: тМасЛит = (0, 0, 21, 21, 14, 21, 21, 21);
      
      /// Литера З
      bZ: тМасЛит = (0, 62, 65, 14, 1, 1, 65, 62);
      /// Литера з
      sZ: тМасЛит = (0, 0, 30, 33, 14, 1, 33, 30);
      
      /// Литера И
      bI: тМасЛит = (0, 65, 67, 69, 73, 81, 97, 65);
      /// Литера и
      sI: тМасЛит = (0, 0, 33, 35, 37, 41, 49, 33);
      
      /// Литера Й
      bI2: тМасЛит = (0, 89, 65, 67, 69, 73, 81, 97);
      /// Литера й
      sI2: тМасЛит = (0, 0, 12, 33, 35, 37, 41, 49);
      
      /// Литера К
      bK: тМасЛит = (0, 67, 76, 112, 72, 68, 66, 65);
      /// Литера к
      sK: тМасЛит = (0, 0, 33, 34, 60, 34, 33, 33);
      
      /// Литера Л
      bL: тМасЛит = (0, 15, 17, 17, 17, 17, 17, 97);
      /// Литера л
      sL: тМасЛит = (0, 0, 15, 17, 17, 17, 17, 33);
      
      /// Литера М
      bM: тМасЛит = (0, 65, 99, 99, 85, 85, 73, 73);
      /// Литера м
      sM: тМасЛит = (0, 0, 17, 27, 27, 31, 21, 21);
      
      /// Литера Н
      bN: тМасЛит = (0, 65, 65, 65, 127, 65, 65, 65);
      /// Литера н
      sN: тМасЛит = (0, 0, 33, 33, 63, 33, 33, 33);
      
      /// Литера О
      bO: тМасЛит = (0, 62, 65, 65, 65, 65, 65, 62);
      /// Литера о
      sO: тМасЛит = (0, 0, 30, 33, 33, 33, 33, 30);
      
      /// Литера П
      bP: тМасЛит = (0, 127, 65, 65, 65, 65, 65, 65);
      /// Литера п
      sP: тМасЛит = (0, 0, 63, 33, 33, 33, 33, 33);
      
      /// Литера Р
      bR: тМасЛит = (0, 126, 65, 65, 65, 126, 64, 64);
      /// Литера р
      sR: тМасЛит = (0, 0, 62, 63, 33, 62, 32, 32);
      
      /// Литера С
      bS: тМасЛит = (0, 62, 65, 64, 64, 64, 65, 62);
      /// Литера с
      sS: тМасЛит = (0, 0, 30, 33, 32, 32, 33, 30);
      
      /// Литера Т
      bT: тМасЛит = (0, 127, 8, 8, 8, 8, 8, 8);
      /// Литера т
      sT: тМасЛит = (0, 0, 31, 4, 4, 4, 4, 4);
      
      /// Литера У
      bU: тМасЛит = (0, 65, 65, 65, 63, 1, 65, 62);
      /// Литера у
      sU: тМасЛит = (0, 0, 33, 33, 31, 1, 33, 30);
      
      /// Литера Ф
      bF: тМасЛит = (0, 62, 73, 73, 73, 62, 8, 8);
      /// Литера ф
      sF: тМасЛит = (0, 0, 14, 21, 21, 21, 14, 4);
      
      /// Литера Х
      bKh: тМасЛит = (0, 65, 34, 20, 8, 20, 34, 65);
      /// Литера А
      sKh: тМасЛит = (0, 0, 33, 18, 12, 12, 18, 33);
      
      /// Литера Ц
      bTc: тМасЛит = (0, 66, 66, 66, 66, 66, 127, 1);
      /// Литера ц
      sTc: тМасЛит = (0, 0, 34, 34, 34, 34, 31, 1);
      
      /// Литера Ч
      bCh: тМасЛит = (0, 65, 65, 65, 63, 1, 1, 1);
      /// Литера ч
      sCh: тМасЛит = (0, 0, 33, 33, 33, 31, 1, 1);
      
      /// Литера Ш
      bSh: тМасЛит = (0, 73, 73, 73, 73, 73, 73, 127);
      /// Литера ш
      sSh: тМасЛит = (0, 0, 21, 21, 21, 21, 21, 31);
      
      /// Литера Щ
      bShh: тМасЛит = (0, 84, 84, 84, 84, 84, 126, 2);
      /// Литера щ
      sShh: тМасЛит = (0, 0, 42, 42, 42, 42, 63, 1);
      
      /// Литера Ъ
      bHz: тМасЛит = (0, 96, 32, 32, 62, 33, 33, 62);
      /// Литера ъ
      sHz: тМасЛит = (0, 0, 48, 16, 30, 17, 17, 30);
      
      /// Литера Ы
      bY: тМасЛит = (0, 65, 65, 65, 121, 69, 69, 121);
      /// Литера ы
      sY: тМасЛит = (0, 0, 33, 33, 57, 37, 37, 57);
      
      /// Литера Ь
      bSz: тМасЛит = (0, 64, 64, 64, 126, 65, 65, 126);
      /// Литера ь
      sSz: тМасЛит = (0, 0, 32, 32, 62, 33, 33, 62);
      
      /// Литера Э
      bEh: тМасЛит = (0, 62, 65, 1, 31, 1, 65, 62);
      /// Литера э
      sEh: тМасЛит = (0, 0, 30, 33, 15, 1, 33, 30);
      
      /// Литера Ю
      bYu: тМасЛит = (0, 78, 81, 81, 113, 81, 81, 78);
      /// Литера ю
      sYu: тМасЛит = (0, 0, 38, 41, 57, 41, 41, 38);
      
      /// Литера Я
      bJa: тМасЛит = (0, 63, 65, 65, 63, 9, 17, 97);
      /// Литера я
      sJa: тМасЛит = (0, 0, 31, 33, 33, 31, 9, 49);
   end;
   /// Объединяет части литер
   тЛитера = class
   public 
      циф: tDig;
      спец: tSpez;
      анг: tLetEn;
      рус: tLetRu;
      constructor Create;
      begin
         self.циф := new tDig;
         self.спец := new tSpez;
         self.анг := new tLetEn;
         self.рус := new tLetRu;
      end;
      /// Выводит в указанную позицию литеру
      procedure Печать(лит: char; х, у: integer);
      begin
      end;
   end;

implementation

begin

end. 
