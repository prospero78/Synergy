{ Font_Creator -- простенькая программа для создания растровых шрифтов.
  Пока поддерживается только один размер -- 8х8 точек. }
uses GraphABC;

/// Первичная настройка экрана
procedure Экран_Настроить;
begin
   Window.Title := 'Font Creator';
   Window.Width := 640;
   window.Height := 480;
   Window.Clear(clBlack);
   Coordinate.SetMathematic;
   Coordinate.SetOrigin(0, 480);
end;

/// Нарисовать координатную сетку
procedure Сетка_Рисовать;
begin
   Brush.Color := RGB(90, 90, 90);
   Font.Name := 'Consolas';
   Font.size := 11;
   var s:='';
   var base_i := 150;
   var i := 30;
   var step := 30;
   var full := step * 8;
   // горизонтальные линии
   while i <= full + 31 do
   begin
      Line(step, base_i + i, step + full, base_i + i, Brush.Color);
      if i <= full then 
      begin
      Str(7-(i/30-1),s);
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
      Str(7-(y/30-1),s);
      TextOut(y + 5, base_i,s);
      end;
      y += step;
   end;
end;

begin
   Экран_Настроить;
   Сетка_Рисовать;
end.