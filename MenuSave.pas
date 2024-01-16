Unit MenuSave;

Interface
  uses Crt, Compl, ComplMatrix, Vect, ComplVector;
  procedure MenuSaves;


Implementation
procedure Wait;
  begin
      repeat until KeyPressed;
      while KeyPressed do ReadKey;
  end;
  
  procedure MenuSaves;
    var Mode:integer;
        ok:boolean;
        f,w:real; 
        a,b,c: Matrix;
    begin
     ok:=true;
     while (ok) do
       begin
         clrscr;
         writeln('Выбор операции:');
         writeln('  1:Сумма матриц');
         writeln('  2:Умножение матриц');
         writeln('  3:Умнжение комплексных чисел');
         writeln('  4:Вычитания векторов');
         writeln('  5:Сложение комплекных векторов');
         writeln('  6:Вычитание комплексных векторов');
         writeln('  7:Экспонента');
         writeln('  0:Выход');
         GoToXY(0, 15); Write('Номер операции: ');
         GoToXY(0, 15); readln(Mode);
         ClrScr;
     
     case Mode of
     1: begin
          clrscr;
          Writeln('Введите первую комплексную матрицу');
          InputMatrix(10, 2, a);
          Writeln('Введите вторую комплексную матрицу');
          InputMatrix(10, 6, b);
          AddMatrix(a,b,c);
          OutputMatrix(10, 10, c);
          Wait;
        end;
     2: begin
          clrscr;
          Writeln('Введите первую комплексную матрицу');
          InputMatrix(10, 2, a);
          Writeln('Введите вторую комплексную матрицу');
          InputMatrix(10, 6, b);
          MultMatrix(a,b,c);
          OutputMatrix(10, 10, c);
          Wait;
        end;
     3: begin
            clrscr;
                var u, v, p: Complex;
                Input(u);
                Input(v);
                Mult(u, v, p);
                Output(p);
                Wait
              end; 
     4: begin
            clrscr;
                var t, y, i: Vector;
                writeln('Введите первый вектор: ');
                InputVect(t);
                writeln('Введите второй вектор: ');
                InputVect(y);
                SubVector(t, y, i);
                OutputVect(i);
                Wait
              end;
     5: begin
            clrscr;
                var u, v, p: CVector;
                writeln('Введите первый комплексный вектор: ');
                InputCVector(u);
                writeln('Введите второй комплексный вектор: ');
                InputCVector(v);
                AddCVector(u, v, p);
                OutputCVector(p);
                Wait;
              end;
     6: begin
            clrscr;
                var u, v, p: CVector;
                writeln('Введите первый комплексный вектор: ');
                InputCVector(u);
                writeln('Введите второй комплексный вектор: ');
                InputCVector(v);
                SubCVector(u, v, p);
                OutputCVector(p);
                Wait;
              end;
     7: begin
          clrscr;
          Writeln('Введите комплексную матрицу: ');
          InputMatrix(10, 2, a);
          ExpMatrix(a,c);
          OutputMatrix(10, 6, c);
          Wait;
        end;
     0: Ok:=false
     else
       begin
          clrscr;
          GoToXY(30,21);
          writeln('Ошибка! Повторите ввод...');
          Wait;
       end;
     end;
    end;
   end;
End.