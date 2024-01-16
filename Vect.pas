Unit Vect;

Interface
  Uses Crt;
  
  Const n_Vector = 3; 
  
  Type Vector = array[1..n_Vector] of real;
    
  procedure OutputVect(Var c: Vector);
  procedure InputVect(Var c:Vector);
  procedure AddVector(a,b:Vector; var c:Vector);
  procedure SubVector(a, b: Vector; Var c: Vector);
  procedure ProdVector(l: real; a: Vector; Var b: Vector);
  function ScalProd(a,b:Vector):real;
  procedure VectProd(a,b:Vector; Var c:Vector);
  function MixProd(a,b,c:Vector):real;
  function ModulVect(a:Vector):real;
  procedure MenuVect;


Implementation

  procedure InputVect(Var c:Vector);
  begin
      write('Введите координату a = '); read(c[1]);
      write('Введите координату b = '); read(c[2]);
      write('Введите координату c = '); read(c[3]);
  end;
  
  procedure OutputVect(var c:Vector);
  var i:integer;
  begin
    Writeln('Ответ: ');   
    write('(');
    for i:= 1 to n_Vector do
    if (i = n_Vector) then
    write(c[i],')')
    else
    write(c[i],',');
  end;
  
  procedure wait;
  begin
    repeat until keyPressed;
    while keyPressed do ReadKey
  end;
  
  procedure AddVector(a,b:Vector; var c:Vector);
  Var i:integer;
  begin
    for i:=1 to n_Vector do
    c[i]:=a[i]+b[i];
  end;
  
  procedure SubVector(a, b: Vector; Var c: Vector);
  var i: integer;
  begin
    for i:= 1 to n_Vector do
      c[i]:= a[i] - b[i];
  end;
  
  procedure ProdVector(l: real; a: Vector; Var b: Vector);
  var i: integer;
  begin
    for i:= 1 to n_Vector do b[i]:= l*a[i]
  end;
  
  function ScalProd(a,b:Vector):real;
  Var s:real; i:integer;
  begin
    s:=0;
    for i:=1 to n_Vector do
    s:= s + a[i] * b[i];
    ScalProd:= s;
  end;
  
  procedure VectProd(a,b:Vector; Var c:Vector);
  begin
    c[1]:= a[2] * b[3] - a[3] * b[2];
    c[2]:= a[3] * b[1] - a[1] * b[3];
    c[3]:= a[1] * b[2] - a[2] * b[1];
  end;

  function MixProd(a,b,c:Vector):real;
  Var x:vector;
  begin
    VectProd(a,b,x);
    MixProd:=ScalProd(x,c);
  end;

  function ModulVect(a:Vector):real;
  begin
    ModulVect:=sqrt(ScalProd(a,a));
  end;

  procedure MenuVect;
  var Ok: boolean;
  Mode: integer;
  begin
    clrscr;
    Ok:=true;
    while ok do 
    begin
      clrscr;
      writeln('Выбор операции:');
      writeln('  1: Сложение векторов');
      writeln('  2: Вычитание векторов');
      writeln('  3: Умножение вектора на скаляр');
      writeln('  4: Скалярное произведение векторов');
      writeln('  5: Векторное произведение векторов');
      writeln('  6: Смешанное произведение векторов');
      writeln('  7: Модуль вектора');
      writeln('  0: Выход');
      GoToXY(0, 15); Write('Номер операции: ');
      GoToXY(0, 15); readln(Mode);
      clrscr;
      
      case mode of  
        1:  begin
            clrscr;
                var a, b, c: Vector;
                //writeln('Введите первый вектор: ');
                InputVect(a);
                //writeln('Введите второй вектор: ');
                InputVect(b);
                AddVector(a, b, c);
                OutputVect(c);
                Wait
              end;
       2:  begin
            clrscr;
                var a, b, c: Vector;
                writeln('Введите первый вектор: ');
                InputVect(a);
                writeln('Введите второй вектор: ');
                InputVect(b);
                SubVector(a, b, c);
                OutputVect(c);
                Wait
              end;
        3:  begin
            clrscr;
                var a, b: Vector; var l: real;
                writeln('Введите первый вектор: ');
                InputVect(a);
                writeln('Введите второй вектор: ');
                InputVect(b);
                ProdVector(l, a, b);
                OutputVect(a);
                Wait
              end; 
       4:  begin
            clrscr;
                var a, b: Vector;
                writeln('Введите первый вектор: ');
                InputVect(a);
                writeln('Введите второй вектор: ');
                InputVect(b);
                ScalProd(a, b);
                writeln(ScalProd(a, b));
                Wait
              end;
        5:  begin
            clrscr;
                var a, b, c: Vector;
                writeln('Введите первый вектор: ');
                InputVect(a);
                writeln('Введите второй вектор: ');
                InputVect(b);
                VectProd(a, b, c);
                OutputVect(c);
                Wait
              end;
        6:  begin
            clrscr;
                var a, b, c: Vector;
                writeln('Введите первый вектор: ');
                InputVect(a);
                writeln('Введите второй вектор: ');
                InputVect(b);
                MixProd(a, b, c);
                OutputVect(c);
                Wait
              end;
         7:  begin
            clrscr;
                var a: Vector;
                writeln('Введите первый вектор: ');
                InputVect(a);
                ModulVect(a);
                write('Ответ: ');
                write(ModulVect(a));
                Wait
              end;
        
        0: ok:=false
           else 
           begin
            GoToXY(30, 21);
            Writeln('Ошибка! Повторите ввод.'); 
            GoToXY(30, 22);
            Writeln('Для продолжения нажмите любую клавишу.');
            Wait
           end;
        end;
      end;
    end;
end.