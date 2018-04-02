{ Это будет ничто иное, как консоль для Оберон-БК. Должна воспринимать
нажатия клавиш и отслеживать мышь. }
{$reference terminal.dll}

begin
   // Надо для правильного запуска terminal.dll
   terminal.terminal.Start;
end.