﻿library terminal;
{ Библиотека представляет из себя эмулятор терминала.
Умеет воспринимать нажатые клавиши и отображать их на экране. }

uses Font8x8, GraphABC, System, Timers;

const
   /// Предельная позиция знакоместа в x
   х_лит_предел = 40;
   /// Предельная позиция знакоместа в y
   у_лит_предел = 30;
   /// РАзмер шрифта на экране
   шрифт = 8;
   /// Масштаб экрана
   масштаб = 2;
   окно_высота = шрифт * у_лит_предел * масштаб;
   окно_ширина = шрифт * х_лит_предел * масштаб + 8;
   
   фон = clBlack;
   перо = clWhite;

type
   тНажатие = procedure(лит: char);
   тКнопкаВниз = procedure(кнп: integer);
   тЭкран = class
   private 
      /// Позиция в литерах по х
      _х_лит: integer = 0;
      /// Позиция в литерах по y
      _у_лит: integer = 0;
      /// Состояние курсора
      _курс_показ: boolean = false;
      /// Признак скроллирования экрана
      _скроллинг: boolean = false;
      /// Таймер для курсора
      _таймер_курсор: Timer;
      /// Массив всех символов на экране
      _текст: string = '';
      /// Текущая литера
      _лит: тМасЛит;
      /// Печать выбранного байта
      procedure _Байт_Печать(байт: byte);
      /// Печать выбранной литеры
      procedure _Лит_Печать;
      /// Выбор русской малой литеры
      procedure _РусМал_Выбор(лит: char);
      /// Выбор русской большой литеры
      procedure _РусБол_Выбор(лит: char);
      /// Выбор английской малой буквы
      procedure _АнгМал_Выбор(лит: char);
      /// Выбор английской болшой буквы
      procedure _АнгБол_Выбор(лит: char);
      /// Выбор цифры
      procedure _Цифра_Выбор(лит: char);
      /// Специальные литеры цифры
      procedure _Спец_Выбор(лит: char);
      /// Выбор литеры из списка
      procedure _Лит_Выбор(лит: string);
      /// Таймер мерцания курсора
      procedure _Курсор_Мерцать;
      /// Добавление новой литеры в массив литер
      procedure _Текст_Добавить(лит: string);
      /// Скроллирует экран, если у_поз вышел за пределы
      function _Скролл(): boolean;
   public 
      /// Позиция точки по Х
      x_pos: integer = 0;
      /// Позиция точки по Y
      y_pos: integer = 0;
      /// Набор всех литер
      лит: тЛитера; 
      constructor Create(прцНажатие: тНажатие; прцКнпВниз: тКнопкаВниз);
      /// Процедура обработки нажатий на клавиши
      procedure Клик(лит: string);
   end;

constructor тЭкран.Create(прцНажатие: тНажатие; прцКнпВниз: тКнопкаВниз);
begin
   Window.Title := 'Test terminal';
   Window.Height := окно_высота;
   Window.Width := окно_ширина;
   Window.Clear(фон);
   // Буквы мелкие,подправим масштаб
   Coordinate.SetScale(масштаб);
   //Установим цвет пера
   Pen.Color := перо;
   // Запрещаем произвольную перерисовку
   LockDrawing;
   // Регистрируем обработчик нажатий клавиатуры
   OnKeyPress := прцНажатие;
   OnKeyDown := прцКнпВниз;
   self.лит := new тЛитера;
   // Назначаем мигалку курсору
   _таймер_курсор := new Timer(330, self._Курсор_Мерцать);
   _таймер_курсор.Start;
end;

procedure тЭкран.Клик(лит: string);
{$omp critical section}
begin
   //Writeln('Клик! ' + лит);
   // Останавливаем таймер курсора
   self._таймер_курсор.Stop;
   // Добавляем литеру в текст
   self._Текст_Добавить(лит);
   if not self._Скролл then
   begin
      // Выбрать литеру
      self._Лит_Выбор(лит);
      // Теперь напечатать литеру
      if self._лит[0] <> 255 then
         self._Лит_Печать;
   end;
   
   // Запускаем таймер курсора
   self._таймер_курсор.Start;
   Window.Title := 'x=' + IntToStr(self._х_лит) + ' y=' + IntToStr(self._у_лит) + ' Длина:' + IntToStr(self._текст.Length) + ' х_пред=' + IntToStr(х_лит_предел);
end;

function тЭкран._Скролл(): boolean;
begin
   var рез := false;
   if (self._текст.Length > у_лит_предел * х_лит_предел) then
   begin
      self._текст := self._текст.Remove(1, х_лит_предел);
      self.x_pos := 0;
      self.y_pos := 0;
      self._х_лит := 0;
      self._у_лит := 0;
      Window.Clear(clBlack);
      self._скроллинг := true;
      for var i := 1 to self._текст.Length do
      begin
         self._Лит_Выбор(self._текст[i]);
         self._Лит_Печать;
      end;
      self._скроллинг := false;
      Redraw;
      рез := true;
   end;
   Result := рез;
end;

procedure тЭкран._Текст_Добавить(лит: string);
begin
   if лит.Length = 1 then
      self._текст := self._текст + лит
   else//Вот здесь воткнуть специальные многолитерне коды
   begin
      if лит = 'enter' then
      begin
         var хвост := self._текст.Length mod х_лит_предел;
         var хвост_стр := хвост * ' ';
         self._текст := self._текст + хвост_стр;
         self._Лит_Выбор(' ');//Перебиваем курсор, добиваем пробелы до конца строки
         for var i := 1 to хвост do
            self._Лит_Печать;
         Redraw;
      end;
   end
end;

procedure тЭкран._Курсор_Мерцать;
begin
   if _курс_показ then
   begin
      self._лит := self.лит.спец.space;
      _курс_показ := false;
   end
         else
   begin
      self._лит := self.лит.спец.strike;
      _курс_показ := true;
   end;
   self._Лит_Печать;
   self.x_pos -= шрифт;
end;

procedure тЭкран._Лит_Выбор(лит: string);
begin
   self._лит[0] := 255;//Не может быть больше 127 -- индикатор присвоения
   if лит.Length = 1 then
   begin
      // Если передана одиночная литера,а не специальный код
      var лит1: char = лит[1];
      self._РусМал_Выбор(лит1);
      if self._лит[0] = 255 then// Выбора не было, если 255
         self._РусБол_Выбор(лит1);
      if self._лит[0] = 255 then// Выбора не было, если 255
         self._АнгМал_Выбор(лит1);
      if self._лит[0] = 255 then// Выбора не было, если 255
         self._АнгБол_Выбор(лит1);
      if self._лит[0] = 255 then// Выбора не было, если 255
         self._Цифра_Выбор(лит1); 
      if self._лит[0] = 255 then// Выбора не было, если 255
         self._Спец_Выбор(лит1); 
   end;
end;

procedure тЭкран._Спец_Выбор(лит: char);
begin
   case лит of
      ' ': self._лит := self.лит.спец.space;
      '_': self._лит := self.лит.спец.strike;
      '-': self._лит := self.лит.спец.minus;
      '+': self._лит := self.лит.спец.plus;
      '*': self._лит := self.лит.спец.multi;
      ',': self._лит := self.лит.спец.comma;
      '.': self._лит := self.лит.спец.dot;
      '(': self._лит := self.лит.спец.lrb;
      ')': self._лит := self.лит.спец.rrb;
      '[': self._лит := self.лит.спец.lsb;
      ']': self._лит := self.лит.спец.rsb;
      '"': self._лит := self.лит.спец.dqt;
      '''': self._лит := self.лит.спец.sqt;
      '`': self._лит := self.лит.спец.apo;
      '~': self._лит := self.лит.спец.tilda;
      '!': self._лит := self.лит.спец.akk;
      '№': self._лит := self.лит.спец.numer;
      '#': self._лит := self.лит.спец.bang;
      '$': self._лит := self.лит.спец.dol;
      ';': self._лит := self.лит.спец.cdot;
      '%': self._лит := self.лит.спец.percent;
      ':': self._лит := self.лит.спец.ddot;
      '&': self._лит := self.лит.спец.amp;
      '?': self._лит := self.лит.спец.qst;
      '=': self._лит := self.лит.спец.equ;
      '/': self._лит := self.лит.спец.slh;
      '\': self._лит := self.лит.спец.bslh;
      '<': self._лит := self.лит.спец.lequ;
      '>': self._лит := self.лит.спец.requ;
      '^': self._лит := self.лит.спец.exp;
      '{': self._лит := self.лит.спец.lfb;
      '}': self._лит := self.лит.спец.rfb;
      '@': self._лит := self.лит.спец.hun;
      '|': self._лит := self.лит.спец.vert;
   end;
end;

procedure тЭкран._Цифра_Выбор(лит: char);
begin
   case лит of
      '0': self._лит := self.лит.циф.d0;
      '1': self._лит := self.лит.циф.d1;
      '2': self._лит := self.лит.циф.d2;
      '3': self._лит := self.лит.циф.d3;
      '4': self._лит := self.лит.циф.d4;
      '5': self._лит := self.лит.циф.d5;
      '6': self._лит := self.лит.циф.d6;
      '7': self._лит := self.лит.циф.d7;
      '8': self._лит := self.лит.циф.d8;
      '9': self._лит := self.лит.циф.d9;
   end;
end;

procedure тЭкран._АнгБол_Выбор(лит: char);
begin
   case лит of
      'A': self._лит := self.лит.анг.bA;
      'B': self._лит := self.лит.анг.bB;
      'C': self._лит := self.лит.анг.bC;
      'D': self._лит := self.лит.анг.bD;
      'E': self._лит := self.лит.анг.bE;
      'F': self._лит := self.лит.анг.bF;
      'G': self._лит := self.лит.анг.bG;
      'H': self._лит := self.лит.анг.bH;
      'I': self._лит := self.лит.анг.bI;
      'J': self._лит := self.лит.анг.bJ;
      'K': self._лит := self.лит.анг.bK;
      'L': self._лит := self.лит.анг.bL;
      'M': self._лит := self.лит.анг.bM;
      'N': self._лит := self.лит.анг.bN;
      'O': self._лит := self.лит.анг.bO;
      'P': self._лит := self.лит.анг.bP;
      'Q': self._лит := self.лит.анг.bQ;
      'R': self._лит := self.лит.анг.bR;
      'S': self._лит := self.лит.анг.bS;
      'T': self._лит := self.лит.анг.bT;
      'U': self._лит := self.лит.анг.bU;
      'V': self._лит := self.лит.анг.bV;
      'W': self._лит := self.лит.анг.bW;
      'X': self._лит := self.лит.анг.bX;
      'Y': self._лит := self.лит.анг.bY;
      'Z': self._лит := self.лит.анг.bZ;
   end;
end;

procedure тЭкран._АнгМал_Выбор(лит: char);
begin
   case лит of
      'a': self._лит := self.лит.анг.sA;
      'b': self._лит := self.лит.анг.sB;
      'c': self._лит := self.лит.анг.sC;
      'd': self._лит := self.лит.анг.sD;
      'e': self._лит := self.лит.анг.sE;
      'f': self._лит := self.лит.анг.sF;
      'g': self._лит := self.лит.анг.sG;
      'h': self._лит := self.лит.анг.sH;
      'i': self._лит := self.лит.анг.sI;
      'j': self._лит := self.лит.анг.sJ;
      'k': self._лит := self.лит.анг.sK;
      'l': self._лит := self.лит.анг.sL;
      'm': self._лит := self.лит.анг.sM;
      'n': self._лит := self.лит.анг.sN;
      'o': self._лит := self.лит.анг.sO;
      'p': self._лит := self.лит.анг.sP;
      'q': self._лит := self.лит.анг.sQ;
      'r': self._лит := self.лит.анг.sR;
      's': self._лит := self.лит.анг.sS;
      't': self._лит := self.лит.анг.sT;
      'u': self._лит := self.лит.анг.sU;
      'v': self._лит := self.лит.анг.sV;
      'w': self._лит := self.лит.анг.sW;
      'x': self._лит := self.лит.анг.sX;
      'y': self._лит := self.лит.анг.sY;
      'z': self._лит := self.лит.анг.sZ;
   end;
end;

procedure тЭкран._РусБол_Выбор(лит: char);
begin
   case лит of
      'А': self._лит := self.лит.рус.bA;
      'Б': self._лит := self.лит.рус.bB;
      'В': self._лит := self.лит.рус.bW;
      'Г': self._лит := self.лит.рус.bG;
      'Д': self._лит := self.лит.рус.bD;
      'Е': self._лит := self.лит.рус.bE;
      'Ё': self._лит := self.лит.рус.bE2;
      'Ж': self._лит := self.лит.рус.bZh;
      'З': self._лит := self.лит.рус.bZ;
      'И': self._лит := self.лит.рус.bI;
      'Й': self._лит := self.лит.рус.bI2;
      'К': self._лит := self.лит.рус.bK;
      'Л': self._лит := self.лит.рус.bL;
      'М': self._лит := self.лит.рус.bM;
      'Н': self._лит := self.лит.рус.bN;
      'О': self._лит := self.лит.рус.bO;
      'П': self._лит := self.лит.рус.bP;
      'Р': self._лит := self.лит.рус.bR;
      'С': self._лит := self.лит.рус.bS;
      'Т': self._лит := self.лит.рус.bT;
      'У': self._лит := self.лит.рус.bU;
      'Ф': self._лит := self.лит.рус.bF;
      'Х': self._лит := self.лит.рус.bKh;
      'Ц': self._лит := self.лит.рус.bTc;
      'Ч': self._лит := self.лит.рус.bCh;
      'Ш': self._лит := self.лит.рус.bSh;
      'Щ': self._лит := self.лит.рус.bShh;
      'Ъ': self._лит := self.лит.рус.bHz;
      'Ы': self._лит := self.лит.рус.bY;
      'Ь': self._лит := self.лит.рус.bSz;
      'Э': self._лит := self.лит.рус.bEh;
      'Ю': self._лит := self.лит.рус.bYu;
      'Я': self._лит := self.лит.рус.bJa ;
   end;
end;

procedure тЭкран._РусМал_Выбор(лит: char);
begin
   case лит of
      'а': self._лит := self.лит.рус.sA;
      'б': self._лит := self.лит.рус.sB;
      'в': self._лит := self.лит.рус.sW;
      'г': self._лит := self.лит.рус.sG;
      'д': self._лит := self.лит.рус.sD;
      'е': self._лит := self.лит.рус.sE;
      'ё': self._лит := self.лит.рус.sE2;
      'ж': self._лит := self.лит.рус.sZh;
      'з': self._лит := self.лит.рус.sZ;
      'и': self._лит := self.лит.рус.sI;
      'й': self._лит := self.лит.рус.sI2;
      'к': self._лит := self.лит.рус.sK;
      'л': self._лит := self.лит.рус.sL;
      'м': self._лит := self.лит.рус.sM;
      'н': self._лит := self.лит.рус.sN;
      'о': self._лит := self.лит.рус.sO;
      'п': self._лит := self.лит.рус.sP;
      'р': self._лит := self.лит.рус.sR;
      'с': self._лит := self.лит.рус.sS;
      'т': self._лит := self.лит.рус.sT;
      'у': self._лит := self.лит.рус.sU;
      'ф': self._лит := self.лит.рус.sF;
      'х': self._лит := self.лит.рус.sKh;
      'ц': self._лит := self.лит.рус.sTc;
      'ч': self._лит := self.лит.рус.sCh;
      'ш': self._лит := self.лит.рус.sSh;
      'щ': self._лит := self.лит.рус.sShh;
      'ъ': self._лит := self.лит.рус.sHz;
      'ы': self._лит := self.лит.рус.sY;
      'ь': self._лит := self.лит.рус.sSz;
      'э': self._лит := self.лит.рус.sEh;
      'ю': self._лит := self.лит.рус.sYu;
      'я': self._лит := self.лит.рус.sJa ;
   end;
end;

procedure тЭкран._Лит_Печать;
begin
   // цикл по массиву байтов
   var байт := 0;
   for var y := 0 to 7 do
   begin
      байт := self._лит[y];
      // Отправляем байт на печать
      self._Байт_Печать(байт);
      self.y_pos += 1;
   end;
   self.x_pos += шрифт;
   if self.x_pos = (окно_ширина div масштаб) then
   begin
      self.x_pos := 0;
      self.y_pos += 1;
   end
   else
      self.y_pos -= 8;
   // скроллинг снимается в вызывающей процедуре
   if not self._скроллинг then
      Redraw;
   
   self._х_лит := self.x_pos div шрифт;
   self._у_лит := self.y_pos div шрифт;
end;

procedure тЭкран._Байт_Печать(байт: byte);
begin
   // 1. Печатаем точки побитно
   var bit := 0;
   bit := байт and 128;
   if bit = 128 then
      SetPixel(self.x_pos + 0, self.y_pos, перо)
   else
      SetPixel(self.x_pos + 0, self.y_pos, фон);
   
   bit := байт and 64;
   if bit = 64 then
      SetPixel(self.x_pos + 1, self.y_pos, перо)
   else
      SetPixel(self.x_pos + 1, self.y_pos, фон);
   
   bit := байт and 32;
   if bit = 32 then
      SetPixel(self.x_pos + 2, self.y_pos, перо)
   else
      SetPixel(self.x_pos + 2, self.y_pos, фон);
   
   bit := байт and 16;
   if bit = 16 then
      SetPixel(self.x_pos + 3, self.y_pos, перо)
   else
      SetPixel(self.x_pos + 3, self.y_pos, фон);
   
   bit := байт and 8;
   if bit = 8 then
      SetPixel(self.x_pos + 4, self.y_pos, перо)
   else
      SetPixel(self.x_pos + 4, self.y_pos, фон);
   
   bit := байт and 4;
   if bit = 4 then
      SetPixel(self.x_pos + 5, self.y_pos, перо)
   else
      SetPixel(self.x_pos + 5, self.y_pos, фон);
   
   bit := байт and 2;
   if bit = 2 then
      SetPixel(self.x_pos + 6, self.y_pos, перо)
   else
      SetPixel(self.x_pos + 6, self.y_pos, фон);
   
   bit := байт and 1;
   if bit = 1 then
      SetPixel(self.x_pos + 7, self.y_pos, перо)
   else
      SetPixel(self.x_pos + 7, self.y_pos, фон);
   
   {var маска := 128;
   for var x := 1 to 8 do
   begin
   маска := маска div 2;
   bit := байт and маска;
   if bit = маска then
   SetPixel(self.x_pos + x, self.y_pos, перо)
   else
   SetPixel(self.x_pos + x, self.y_pos, фон);
   end;}
end;

begin
end. 