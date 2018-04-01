{$product Font_Creator} 
{$version 0.002} 
{$company KBK Techics ltd.} 
{$copyright BSD-2-Clause} 
{ +$includenamespace Клетка.pas}
{ Font_Creator -- простенькая программа для создания растровых шрифтов.
  Пока поддерживается только один размер -- 8х8 точек. }

uses GraphABC, Литера8х8, System;

const
   /// Название утилиты
   strUtil = '"Font Creator 8x"';
   /// Ширина экрана
   width = 640;
   /// Высота экрана
   hight = 480;
   /// Отступ от начала экрана
   base_i = 30;
   /// Шаг отступа
   step = 30;
   /// Полная ширина сетки
   full = step * 8;
   /// Размер одного элемента
   размер = 30;

var
   /// Массив ячеек для хрнения состояния битов
   лит: тЛит8х8;

/// Первичная настройка экрана
procedure Экран_Настроить;
begin
   Window.Title := strUtil;
   Window.Width := width;
   window.Height := hight;
   Window.Clear(clBlack);
end;

/// Нарисовать координатную сетку
procedure Сетка_Рисовать;
begin
   Brush.Color := RGB($70, $70, $70);
   Font.Name := 'Consolas';
   Font.size := 11;
   var s := '';
   var i := 30;
   // горизонтальные линии
   while i <= full + 31 do
   begin
      Line(step, base_i + i, step + full, base_i + i, Brush.Color);
      if i <= full then 
      begin
         Str(i / 30 - 1, s);
         TextOut(15, base_i + i + 5, s);
      end;
      i += step;
   end;
   var y := 30;
   
   // вертикальные линии
   while y <= full + 31 do
   begin
      Line(y, base_i + step, y, full + base_i + step, Brush.Color);
      if y <= full then 
      begin
         Str(7 - (y / 30 - 1), s);
         TextOut(y + 8, base_i, s);
      end;
      y += step;
   end;
end;

/// Обработчик нажатий мыши
procedure Мышь_Нажата(x, y, mb: integer);
begin
   Window.Title := strUtil + ' x=' + IntToStr(x) + ';   y=' + IntToStr(y) + ';';
   x := (x - base_i) div 30;
   y := (y - base_i) div 30;
   console.WriteLine('x=' + IntToStr( x));
   //Assert((x >= 0) and (x <= 7));//допустимый диапазон
   if лит.Провер(x, y) then
   begin
      лит.стр[y].Переключить(x);
   end;
end;

begin
   лит := new тЛит8х8(размер);
   OnMouseDown := Мышь_Нажата;
   Экран_Настроить;
   Сетка_Рисовать;
   лит.Рисовать;
end.