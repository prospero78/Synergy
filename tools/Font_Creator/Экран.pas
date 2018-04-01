unit Экран;
{ Описание экрана программы как отдельного типа.
   Немного облегчает работу по написанию программы }
interface

uses GraphABC;

type
   тЭкран = class
   private 
      _ширина: integer = 640;
      _высота: integer = 480;
      _назв: string = '"Font Creator 8x"';
      _текст: string = '';
      procedure _Текст_Уст(текст: string);
      begin
         self._текст := текст;
         Window.Title := self._назв + self._текст;
      end;
      
      function _Текст_Получ(): string;
      begin
         result := self._назв + self._текст;
      end;
   
   public 
      property ширина: integer read _ширина;
      property высота: integer read _высота;
      property текст: string read _Текст_Получ write _Текст_Уст;
      property назв: string read _назв;
      constructor Create;
      begin
         Window.Height := self._высота;
         Window.Width := self._ширина;
         Window.Title := self._Текст_Получ;
         Window.Clear(clBlack);
      end;
   end;

implementation

end.