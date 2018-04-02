unit Monitor;
{ Модуль описывает окно монитора в форме типа}

interface

uses Font8x8, GraphABC;

type
   тЭкран = class
   private 
      /// Выбор русской малой литеры
      procedure _РусМал_Выбор(лит: char);
      begin
         case лит of
            'а': self._лит := self.лит.рус.sA;
            'б': self._лит := self.лит.рус.sA;
            'в': self._лит := self.лит.рус.sA;
            'г': self._лит := self.лит.рус.sA;
            'д': self._лит := self.лит.рус.sA;
            'е': self._лит := self.лит.рус.sA;
            'ё': self._лит := self.лит.рус.sA;
            'ж': self._лит := self.лит.рус.sA;
            'з': self._лит := self.лит.рус.sA;
            'и': self._лит := self.лит.рус.sA;
            'й': self._лит := self.лит.рус.sA;
            'к': self._лит := self.лит.рус.sA;
            'л': self._лит := self.лит.рус.sA;
            'м': self._лит := self.лит.рус.sA;
            'н': self._лит := self.лит.рус.sA;
            'о': self._лит := self.лит.рус.sA;
            'п': self._лит := self.лит.рус.sA;
            'р': self._лит := self.лит.рус.sA;
            'с': self._лит := self.лит.рус.sA;
            'т': self._лит := self.лит.рус.sA;
            'у': self._лит := self.лит.рус.sA;
            'ф': self._лит := self.лит.рус.sA;
            'х': self._лит := self.лит.рус.sA;
            'ц': self._лит := self.лит.рус.sA;
            'ч': self._лит := self.лит.рус.sA;
            'ш': self._лит := self.лит.рус.sA;
            'щ': self._лит := self.лит.рус.sA;
            'ъ': self._лит := self.лит.рус.sA;
            'ы': self._лит := self.лит.рус.sA;
            'ь': self._лит := self.лит.рус.sA;
            'э': self._лит := self.лит.рус.sA;
            'ю': self._лит := self.лит.рус.sA;
            'я': self._лит := self.лит.рус.sA ;
         end;
      end;
      /// Выбор литеры из списка
      procedure _Лит_Выбор(лит: char);
      begin
         self._лит[0] := 255;//Не может быть больше 127 -- индикатор присвоения
         self._РусМал_Выбор(лит);
         if self._лит[0] = 255 then // Выбора не было, если 255
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
         Writeln('Клик! ' + лит);
         // Выбрать литеру
         self._Лит_Выбор(лит);
      end;
   end;

implementation

end.