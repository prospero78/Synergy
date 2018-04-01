{$product Font_Creator} 
{$version 0.008} 
{$company KBK Techics ltd.} 
{$copyright BSD-2-Clause} 
{ Font_Creator -- простенькая программа для создания растровых шрифтов.
  Пока поддерживается только один размер -- 8х8 точек. }

uses GraphABC, Литера8х8, System, Экран;

const
   /// Размер одного элемента
   размер = 30;

var
   /// Экран программы
   экран: тЭкран;
   /// Массив ячеек для хрнения состояния битов
   лит: тЛит8х8;

/// Обработчик нажатий мыши
procedure Мышь_Нажата(x, y, mb: integer);
begin
   экран.текст := ' x=' + IntToStr(x) + ';   y=' + IntToStr(y) + ';';
   //Assert((x >= 0) and (x <= 7));//допустимый диапазон
   if лит.Провер(x, y) then
   begin
      console.WriteLine('x=' + IntToStr( x));
      лит.Переключить(x,y);
   end;
end;

begin
   экран := new тЭкран;
   лит := new тЛит8х8(размер);
   OnMouseDown := Мышь_Нажата;
   лит.Рисовать;
   лит.Оси_Рис;
end.