Program Main;
Uses Crt, Compl, ComplMatrix, Vect, ComplVector, MenuSave;

Procedure Wait;
begin
  repeat until keyPressed;
  while keyPressed do ReadKey
end;


var Mode:integer;
    Ok:boolean;
begin
  Ok:=true;
  while ok do
  begin
    ClrScr;
    writeln('Многофункциональное Меню:');
    writeln('  1.Комплексные числа');
    writeln('  2.Комплексные матрицы');
    writeln('  3.Векторы');
    writeln('  4.Комплексные векторы');
    writeln('  5.Избранное');
    writeln('  0.Выход');
    write('Выведите номер операции: ');
    Readln(mode);
    
    case mode of
      1: MenuCompl;
      2: MenuComplMatrix;
      3: MenuVect;
      4: MenuComplVector;
      5: MenuSaves;
      0: Ok:=false;
     else 
      begin
        GoToXY(30, 21);
        Writeln('Повторите ввод.'); 
        GoToXY(30, 22);
        writeln('Для продолжения нажмите любую кнопку.');
        Wait;
      end;
    end;
  end;
end.