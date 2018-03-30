unit Клетка;

type
   
   тТочка = class
   private 
      /// Скрытое свойство состояния
      _сост: boolean := false;
   public 
      property сост: boolean read _сост;
      /// Переключение состояния точки
      procedure Переключить;
      begin
         if self._сост then
            self._сост := false
         else
            self._сост := true;
      end;
   end;
   
   тСтрока = class
   private
      function _Число_Получ():integer;
      begin
         var sum:=0;
         for var i:=0 to 7 do
            if self.тчк[i].сост then 
               sum += (1 shl i);
         result := sum;
      end;
   public
       /// Массив точек
      тчк: array [0..7] of тТочка;
      property число:integer Read _Число_Получ;
      /// Переключает одну из точек в строке
      procedure Переключить(x: integer);
      begin
         Assert((0 <= x) and (x <= 7));
         self.тчк[x].Переключить;
      end;
   end;
   
   тКлетка = class
   public
   /// Массив строк
   стр: array [0..7] of тСтрока
   end;

begin
end. 