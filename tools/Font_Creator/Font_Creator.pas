{$product Font_Creator} 
{$version 0.002} 
{$company KBK Techics ltd.} 
{$copyright BSD-2-Clause} 
{ +$includenamespace Клетка.pas}
{ Font_Creator -- простенькая программа для создания растровых шрифтов.
  Пока поддерживается только один размер -- 8х8 точек. }

uses GraphABC, Клетка;

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

var
   /// Массив ячеек для хрнения состояния битов
   лит: тКлетка;

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

/// Нарисовать клетку
procedure Клетка_Нарисовать(x, y: integer);
begin
   x := base_i + x * step;
   y := base_i + y * step;
   if (x > base_i) and (x < base_i + full) then
   begin
      if (y > base_i * 2) and (y < base_i * 2 + full) then
      begin
         FillRect(x - 15, y - 15, x + 15, y + 15);
         //Сетка_Рисовать;
      end;
   end;
end;

/// Обработчик нажатий мыши
procedure Мышь_Нажата(x, y, mb: integer);
begin
   Window.Title := strUtil + ' x=' + IntToStr(x) + ';   y=' + IntToStr(y) + ';';
   Brush.Color := RGB($FF, $FF, $80);
   x := (x div 30) * 30;
   y := (y div 30) * 30;
   лит.стр[x].Переключить(y);
   if лит.стр[x].тчк[y].сост then
      Клетка_Нарисовать(x,y);
end;

begin
   OnMouseDown := Мышь_Нажата;
   Экран_Настроить;
   Сетка_Рисовать;
end.