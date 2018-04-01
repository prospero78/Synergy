unit Font8x8;
{ Модуль содержит русский (+английский шрифт, потом) размером 8х8.
   Сделано в форме массива, каждая буква имеет символьное имя.
   Этот модуль не предназначен для компиляции в составе Font_Creator }

interface

const
   // Русские большие буквы
   ru_BigA = 0;//А
   ru_BigB = ru_BigA + 1;//Б
   ru_BigW = ru_BigB + 1;//В
   ru_BigG = ru_BigW + 1;//Г
   ru_BigD = ru_BigG + 1;//Д
   ru_BigE = ru_BigD + 1;//Е
   ru_BigE2 = ru_BigE + 1;//Ё
   ru_BigZh = ru_BigE2 + 1;//Ж
   ru_BigZ = ru_BigZh + 1;//З
   ru_BigI = ru_BigZ + 1;//И
   ru_BigJ = ru_BigI + 1;//Й
   ru_BigK = ru_BigJ + 1;//К
   ru_BigL = ru_BigK + 1;//Л
   ru_BigM = ru_BigL + 1;//М
   ru_BigN = ru_BigM + 1;//Н
   ru_BigO = ru_BigN + 1;//О
   ru_BigP = ru_BigO + 1;//П
   ru_BigR = ru_BigP + 1;//Р
   ru_BigS = ru_BigR + 1;//С
   ru_BigT = ru_BigS + 1;//Т
   ru_BigU = ru_BigT + 1;//У
   ru_BigF = ru_BigU + 1;//Ф
   ru_BigKh = ru_BigF + 1;//Х
   ru_BigTc = ru_BigKh + 1;//Ц
   ru_BigCh = ru_BigTc + 1;//Ч
   ru_BigSh = ru_BigCh + 1;//Ш
   ru_BigShh = ru_BigSh + 1;//Щ
   ru_BigHz = ru_BigShh + 1;//Ъ
   ru_BigY = ru_BigHz + 1;//Ы
   ru_BigSz = ru_BigY + 1;//Ь
   ru_BigEh = ru_BigSz + 1;//Э
   ru_BigYu = ru_BigEh + 1;//Ю
   ru_BigJa = ru_BigYu + 1;//Я
   
   // Русские маленькие буквы
   ru_SmA = ru_BigJa + 1;//А
   ru_SmB = ru_SmA + 1;//Б
   ru_SmW = ru_SmB + 1;//В
   ru_SmG = ru_SmW + 1;//Г
   ru_SmD = ru_SmG + 1;//Д
   ru_SmE = ru_SmD + 1;//Е
   ru_SmE2 = ru_SmE + 1;//Ё
   ru_SmZh = ru_SmE2 + 1;//Ж
   ru_SmZ = ru_SmZh + 1;//З
   ru_SmI = ru_SmZ + 1;//И
   ru_SmJ = ru_SmI + 1;//Й
   ru_SmK = ru_SmJ + 1;//К
   ru_SmL = ru_SmK + 1;//Л
   ru_SmM = ru_SmL + 1;//М
   ru_SmN = ru_SmM + 1;//Н
   ru_SmO = ru_SmN + 1;//О
   ru_SmP = ru_SmO + 1;//П
   ru_SmR = ru_SmP + 1;//Р
   ru_SmS = ru_SmR + 1;//С
   ru_SmT = ru_SmS + 1;//Т
   ru_SmU = ru_SmT + 1;//У
   ru_SmF = ru_SmU + 1;//Ф
   ru_SmKh = ru_SmF + 1;//Х
   ru_SmTc = ru_SmKh + 1;//Ц
   ru_SmCh = ru_SmTc + 1;//Ч
   ru_SmSh = ru_SmCh + 1;//Ш
   ru_SmShh = ru_SmSh + 1;//Щ
   ru_SmHz = ru_SmShh + 1;//Ъ
   ru_SmY = ru_SmHz + 1;//Ы
   ru_SmSz = ru_SmY + 1;//Ь
   ru_SmEh = ru_SmSz + 1;//Э
   ru_SmYu = ru_SmEh + 1;//Ю
   ru_SmJa = ru_SmYu + 1;//Я
   
   space = 0;

var
   
   /// Шрифт 8х8
   f88: array[0..255, 0..6]of byte = (
      (3, 5, 9, 17, 63, 65, 65),//ru_BigA
      (126, 64, 126, 65, 65, 65, 126),//ru_BigB
      (124, 66, 68, 126, 65, 65, 126),//ru_BigW
      (127, 65, 64, 64, 64, 64, 64),//ru_BigG
      (62, 18, 18, 18, 34, 127, 65),//ru_BigD
      (127, 64, 124, 64, 64, 64, 127),//ru_BigE
      (18, 127, 64, 124, 64, 64, 127),//ru_BigE2
      (73, 42, 28, 42, 73, 73, 73),//ru_BigZh
      (62, 65, 14, 1, 1, 65, 62),//ru_BigZ
      (65, 67, 69, 73, 81, 97, 65),//ru_BigI
      (67, 76, 112, 72, 68, 66, 65),//ru_BigK
      (15, 17, 17, 17, 17, 17, 97),//ru_BigL
      (65, 99, 99, 85, 85, 73, 73),//ru_BigM
      (65, 65, 65, 127, 65, 65, 65),//ru_BigN
      (62, 65, 65, 65, 65, 65, 62),//ru_BigO
      (127, 65, 65, 65, 65, 65, 65),//ru_BigP
      (126, 65, 65, 65, 126, 64, 64),//ru_BigR
      (62, 65, 64, 64, 64, 65, 62),//ru_BigS
      (127, 8, 8, 8, 8, 8, 8),//ru_BigT
      (65, 65, 65, 63, 1, 65, 62),//ru_BigU
      (62, 73, 73, 73, 62, 8, 8),//ru_BigF
      (65, 34, 20, 8, 20, 34, 65),//ru_BigKh
      (66, 66, 66, 66, 66, 127, 1),//ru_BigTc
      (65, 65, 65, 63, 1, 1, 1),//ru_BigCh
      (73, 73, 73, 73, 73, 73, 127),//ru_BigSh
      (84, 84, 84, 84, 84, 126, 2),//ru_BigShh
      (96, 32, 32, 62, 33, 33, 62),//ru_BigHz
      (65, 65, 65, 121, 69, 69, 121),//ru_BigY
      (64, 64, 64, 126, 65, 65, 126),//ru_BigSz
      (62, 65, 1, 31, 1, 65, 62),//ru_BigEh
      (78, 81, 81, 113, 81, 81, 78),//ru_BigYu
      (63, 65, 65, 63, 9, 17, 97),//ru_BigJa
      // Русские маленькие
      (0, 28, 2, 30, 34, 34, 29),//ru_SmA
      (1, 30, 32, 62, 33, 33, 30),//ru_SmB
      (0, 30, 33, 62, 33, 33, 30),//ru_SmW
      (0, 30, 33, 6, 24, 33, 30),//ru_SmG
      (0, 14, 10, 10, 18, 63, 63),//ru_SmD
      (0, 30, 33, 63, 32, 33, 30),//ru_SmE
      (18, 30, 33, 63, 32, 33, 30),//ru_SmE2
      (0, 21, 21, 14, 21, 21, 21),//ru_SmZh
      (0, 30, 33, 14, 1, 33, 30),//ru_SmZ
      (0, 33, 35, 37, 41, 49, 33),//ru_SmI
      (0, 33, 34, 60, 34, 33, 33),//ru_SmK
      (0, 15, 17, 17, 17, 17, 33),//ru_SmL
      (0, 17, 27, 27, 31, 21, 21),//ru_SmM
      (0, 33, 33, 63, 33, 33, 33),//ru_SmN
      (0, 30, 33, 33, 33, 33, 30),//ru_SmO
      (0, 63, 33, 33, 33, 33, 33),//ru_SmP
      (0, 62, 63, 33, 62, 32, 32),//ru_SmR
      (0, 30, 33, 32, 32, 33, 30),//ru_SmS
      (0, 31, 4, 4, 4, 4, 4),//ru_SmT
      (0, 33, 33, 31, 1, 33, 30),//ru_SmU
      (0, 14, 21, 21, 21, 14, 4),//ru_SmF
      (0, 33, 18, 12, 12, 18, 33),//ru_SmKh
      (0, 34, 34, 34, 34, 31, 1),//ru_SmTc
      (0, 33, 33, 33, 31, 1, 1),//ru_SmCh
      (21, 21, 21, 21, 21, 21, 31),//ru_SmSh
      (0, 42, 42, 42, 42, 63, 1),//ru_SmShh
      (0, 48, 16, 30, 17, 17, 30),//ru_SmHz
      (0, 33, 33, 57, 37, 37, 57),//ru_SmY
      (0, 32, 32, 62, 33, 33, 62),//ru_SmSz
      (0, 30, 33, 15, 1, 33, 30),//ru_SmEh
      (0, 38, 41, 57, 41, 41, 38),//ru_SmYu
      (0, 31, 33, 33, 31, 9, 49),//ru_SmJa
      
      (0, 0, 0, 0, 0, 0, 0)//space
   
   );

implementation

begin

end. 