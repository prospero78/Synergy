library keyboard;
{ Библиотека отслеживает нажатие всех возможных клавиш, конвертирует их
в строки, отправляет в место, куда назначено при запуске клавиатуры }

uses GraphABC;

type
   тКлава = class
      передать: procedure(кнп: string);
      procedure Кнп_Нажата(лит: char);
      begin
         var стр := лит;
          self.передать(стр);
      end;
      
      constructor Create;
      begin
         OnKeyPress := self.Кнп_Нажата;
      end;
   end;
end.