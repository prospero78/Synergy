unit Литера8х8;

uses GraphABC;

type
   
   тТочка = class
   private 
      /// Скрытое свойство состояния
      _сост: boolean := false;
      /// Размер одной точки
      _размер: integer = 10;
      /// Координаты точки
      _х_поз: integer = 0;
      _у_поз: integer = 0;
   public 
      property сост: boolean read _сост;
      constructor Create(размер, х_поз, у_поз: integer);
      begin
         self._размер := размер;
         self._х_поз := х_поз;
         self._у_поз := у_поз;
      end;
      /// Переключение состояния точки
      procedure Переключить;
      begin
         if self._сост then
         begin
            self._сост := false;
            self.Рисовать;
         end
         else
         begin
            self._сост := true;
            self.Рисовать;
         end;
      end;
      
      /// Рисует по разному (в зависимости от состояния) клетку точки
      procedure Рисовать;
      begin
         if self._сост then
         begin
            Brush.Color := RGB($FF, $FF, $80);
            FillRect(self._х_поз, self._у_поз, self._х_поз + self._размер, self._у_поз + self._размер); 
         end
         else
         begin
            Brush.Color := RGB(0, 0, 0);
            FillRect(self._х_поз, self._у_поз, self._х_поз + self._размер, self._у_поз + self._размер);
            Brush.Color := RGB($70, $70, $70);
            DrawRectangle(self._х_поз, self._у_поз, self._х_поз + self._размер, self._у_поз + self._размер);
         end;
      end;
   end;
   
   тСтрока8х = class
   private 
      /// Размер одиночной клетки
      _размер: integer = 10;
      /// Позиция строки
      _х_поз: integer = 0;
      _у_поз: integer = 0;
      /// Числовое представление строки битов
      function _Число_Получ(): integer;
      begin
         var sum := 0;
         for var i := 0 to 7 do
            if self.тчк[i].сост then 
               sum += (1 shl i);
         result := sum;
      end;
   
   public 
       /// Массив точек
      тчк: array [0..7] of тТочка;
      property число: integer read _Число_Получ;
      constructor Create(размер, х_поз, у_поз: integer);
      begin
         self._размер := размер;
         self._х_поз := х_поз;
         self._у_поз := у_поз;
         for var x := 0 to 7 do
         begin
            self.тчк[x] := new тТочка(размер, х_поз + x * self._размер, у_поз);
         end;
      end;
      /// Переключает одну из точек в строке
      procedure Переключить(x: integer);
      begin
         Assert((0 <= x) and (x <= 7));
         self.тчк[x].Переключить;
      end;
      /// Рисует строку клеток
      procedure Рисовать;
      begin
         for var x := 0 to 7 do
            self.тчк[x].Рисовать;
      end;
   end;
   
   ///Тип отображаемой литеры 8х8
   тЛит8х8 = class
   private 
      /// размер клетки
      _размер: integer = 10;
      _min: integer = 0;
      _max: integer = 7;
   public 
      /// Массив строк
      стр: array [0..7] of тСтрока8х;
      /// Начальное смещение по х
      х_смещ: integer = 50;
      /// Начальное смещение по y
      у_смещ: integer = 50;
      property min: integer read _min;
      property max: integer read _max;
      constructor Create(размер: integer);
      begin
         self._размер := размер;
         for var y := 0 to 7 do
         begin
            self.стр[y] := new тСтрока8х(размер, х_смещ, у_смещ + y * self._размер);
         end;
      end;
      /// Проверяет находятся ли x, y в допустимом диапазоне   
      function Провер(x, y: integer): boolean;
      var
         _res: boolean = False;
      begin
         if (x >= self._min) and (x <= self._max) and (y >= self._min) and (y <= self._max) then
            _res := True;
         Result := _res;
      end;
      /// Рисует литеру целиком
      procedure Рисовать;
      begin
         for var y := 0 to 7 do
            self.стр[y].Рисовать;
      end;
   end;

begin
end. 