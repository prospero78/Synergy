unit Monitor;
{ Модуль описывает окно монитора в форме типа}

interface

uses Font8x8, GraphABC, System;

type
   тЭкран = class
   private 
      /// Печать выбранного байта
      procedure _Байт_Печать(байт: byte);
      begin
         // 1. Печатаем точки побитно
         var bit := 0;
         bit := байт and 128;
            if bit = 0 then
               SetPixel(self.x_pos + 0, self.y_pos, clWhite)
            else
               SetPixel(self.x_pos + 0, self.y_pos, clBlack);
         
         bit := байт and 64;
            if bit = 0 then
               SetPixel(self.x_pos + 1, self.y_pos, clWhite)
            else
               SetPixel(self.x_pos + 1, self.y_pos, clBlack);
         
         bit := байт and 32;
            if bit = 0 then
               SetPixel(self.x_pos + 2, self.y_pos, clWhite)
            else
               SetPixel(self.x_pos + 2, self.y_pos, clBlack);
         
         bit := байт and 16;
            if bit = 0 then
               SetPixel(self.x_pos + 3, self.y_pos, clWhite)
            else
               SetPixel(self.x_pos + 3, self.y_pos, clBlack);
               
         bit := байт and 8;
            if bit = 0 then
               SetPixel(self.x_pos + 4, self.y_pos, clWhite)
            else
               SetPixel(self.x_pos + 4, self.y_pos, clBlack);
         
         bit := байт and 4;
            if bit = 0 then
               SetPixel(self.x_pos + 5, self.y_pos, clWhite)
            else
               SetPixel(self.x_pos + 5, self.y_pos, clBlack);
               
         bit := байт and 2;
            if bit = 0 then
               SetPixel(self.x_pos + 6, self.y_pos, clWhite)
            else
               SetPixel(self.x_pos + 6, self.y_pos, clBlack);
               
         bit := байт and 1;
            if bit = 0 then
               SetPixel(self.x_pos + 7, self.y_pos, clWhite)
            else
               SetPixel(self.x_pos + 7, self.y_pos, clBlack);
               
        { var маска := 32;
        for var x := 2 to 7 do
         begin
            маска := маска div 2;
            bit := байт and маска;
            if bit = 1 then
               SetPixel(self.x_pos + x, self.y_pos, clWhite)
            else
               SetPixel(self.x_pos + x, self.y_pos, clBlack);
         end;}
      end;
      /// Печать выбранной литеры
      procedure _Лит_Печать;
      begin
         // цикл по массиву байтов
         var байт := 0;
         for var y := 0 to 7 do
         begin
            байт := self._лит[y];
            // Отправляем байт на печать
            self._Байт_Печать(байт);
            self.y_pos += 1;
            Console.Write(IntToStr(байт)+' ');
         end;
         Console.WriteLine;
         self.x_pos += 8;
         self.y_pos -= 8;
      end;
      /// Выбор русской малой литеры
      procedure _РусМал_Выбор(лит: char);
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
      /// Выбор литеры из списка
      procedure _Лит_Выбор(лит: char);
      begin
         self._лит[0] := 255;//Не может быть больше 127 -- индикатор присвоения
         self._РусМал_Выбор(лит);
         if self._лит[0] = 255 then// Выбора не было, если 255
         ;
      end;
   
   public 
      /// Позиция курсора по Х
      x_pos: integer = 0;
      /// Позиция курсора по Y
      y_pos: integer = 0;
      /// Текущая литера
      _лит: тМасЛит;
      /// Набор всех литер
      лит: тЛитера;
      constructor Create;
      begin
         Window.Title := 'Test terminal';
         Window.Height := 480;
         Window.Width := 640;
         Window.Clear(clBlack);
         // Буквы мелкие,подправим масштаб
         Coordinate.SetScale(2);
         //Установим цвет пера
         Pen.Color := clWhite;
         /// Регистрируем обработчик нажатий клавиатуры
         OnKeyPress := self.Клик;
         self.лит := new тЛитера;
      end;
      /// Процедура обработки нажатий на клавиши
      procedure Клик(лит: char);
      begin
         //Writeln('Клик! ' + лит);
         // Выбрать литеру
         self._Лит_Выбор(лит);
         // Теперь напечатать литеру
         self._Лит_Печать;
      end;
   end;

implementation

end.