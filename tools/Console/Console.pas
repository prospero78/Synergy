﻿{ Это будет ничто иное, как консоль для Оберон-БК. Должна воспринимать
нажатия клавиш и отслеживать мышь. }
{$reference terminal.dll}
{$reference keyboard.dll}

var
   клава: тКлава;
   экран: тЭкран;

begin
   клава := new тКлава;
   экран := new тЭкран(клава.Кнп_Нажата, клава.Кнопка_Вниз);
   клава.передать := экран.Клик;
end.