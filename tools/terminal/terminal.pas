library terminal;
{ Библиотека представляет из себя эмулятор терминала.
Умеет воспринимать нажатые клавиши и отображать их на экране. }

uses GraphABC, Font8x8;

/// Первоначальная настройка экрана 
procedure Начать;
begin
   Window.Title := 'Test terminal';
   Window.Height := 480;
   Window.Width := 640;
   Window.Clear(clBlack);
   // Буквы мелкие,подправим масштаб
   Coordinate.SetScale(2);
   //Установим цвет пера
   Pen.Color := clWhite;
end;

/// Процедура обработки нажатий на клавиши
procedure Клава_Клик(лит: char);
begin
   Writeln('Клик! ' + лит);
end;

begin
   OnKeyPress := Клава_Клик;
end. 