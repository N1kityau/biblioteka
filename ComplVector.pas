Unit ComplVector;

Interface
  Uses Crt, Compl;
  
  Const n_ComplVector = 3; 
  
  Type CVector = array[1..n_ComplVector] of Complex;
    
  procedure OutputCVector(var u: CVector);
  procedure InputCVector(var u:CVector);
  procedure AddCVector(u, v: CVector; var w: CVector);
  procedure SubCVector(u, v: CVector; var w: CVector);
  procedure ProdCVector(l: real; u: CVector; var w: CVector);
  procedure MultComplCVector(z: Complex; u: CVector; var w: CVector); 
  procedure ScalProdCVector(u, v: CVector; var z: Complex);
  procedure CVectorProd(u, v: CVector; var w:CVector);
  procedure MixProdCVector(u, v, w: CVector; var z: Complex);
  function ModulCVector(u:CVector):real;
  procedure MenuComplVector;

Implementation

  procedure InputCVector(var u:CVector);
  var i:integer;
  begin
      for i:=1 to n_ComplVector do
      Input(u[i]);  
  end;
  
  procedure OutputCVector(var u:CVector);
  var
    i:integer;
  begin
    Writeln('Ответ: ');
    write('(');
    for i:=1 to n_ComplVector do
      if (i = n_ComplVector) then
        begin
          Output(u[i]); write(')');
        end
      else
      begin
          Output(u[i]); write(',');
      end;
  end;
  
  procedure AddCVector(u,v:CVector; var w:CVector);
  var i:integer;
  begin
    for i:=1 to n_ComplVector do
      Add(u[i], v[i], w[i]);
  end;
  
  procedure SubCVector(u, v: CVector; var w: CVector);
  var i: integer;
  begin
    for i:= 1 to n_ComplVector do
      Sub(u[i], v[i], w[i]);
  end;
  
  procedure ProdCVector(l: real; u: CVector; var w: CVector);
  var i: integer;
  begin
    for i:= 1 to n_ComplVector do
    begin
      Prod(l, u[i], w[i]);
    end;
  end;
  
  procedure MultComplCVector(z: Complex; u: CVector; var w: CVector);
  var
    i: integer;
  begin
    for i := 1 to n_ComplVector do
    begin
      Mult(z, u[i], w[i]);
    end;
  end;
  
  procedure ScalProdCVector(u,v: CVector; var z: Complex);
  var w: Complex;
      i: integer;
  begin
    for i:=1 to n_ComplVector do
    begin
      ConjCompl(u[i], w);
      Mult(v[i], w, w);
      Add(z, w, z);
    end;
  end;
  
  procedure CVectorProd(u,v:CVector; var w:CVector);
  var
    z1, z2: Complex;
  begin
    Mult(u[2], v[3], z1); Mult(u[3], v[2], z2); Sub(z1, z2, w[1]);
    Mult(u[3], v[1], z1); Mult(u[1], v[3], z2); Sub(z1, z2, w[2]);
    Mult(u[1], v[2], z1); Mult(u[2], v[1], z2); Sub(z1, z2, w[3]);
  end;

  procedure MixProdCVector(u, v, w: CVector; var z: Complex);
  var
    x: CVector;
  begin
    CVectorProd(u, v, x);
    ScalProdCVector(x, w, z);
  end;
  
  function ModulCVector(u:CVector):real;
  var
    i: Integer;
    s:real;
  begin
    s:=0;
    for i := 1 to n_ComplVector do
    s:=s+sqr(u[i].Re) + sqr(u[i].Im);
    ModulCVector := sqrt(s);
  end;
  
  procedure Wait;
  begin
    repeat until keyPressed;
    while keyPressed do ReadKey
  end;

  procedure MenuComplVector;
  var Ok: boolean;
  Mode: integer;
  begin
    clrscr;
    Ok:=true;
    while ok do 
    begin
      clrscr;
      writeln('Выбор операции:');
      writeln('  1: Сложение комплексных векторов');
      writeln('  2: Разность комплексных векторов');
      writeln('  3: Умножение комплексного вектора на скаляр');
      writeln('  4: Умножение комплексного вектора на комплексное число');
      writeln('  5: Скалярное произведение комплексных векторов');
      writeln('  6: Векторное произведение комплексных векторов');
      writeln('  7: Смешанное произведение комплексных векторов');
      writeln('  8: Модуль комплексных векторов');
      writeln('  0: Назад');
      GoToXY(0, 15); Write('Номер операции: ');
      GoToXY(0, 15); readln(Mode);
      clrscr;
      
      case mode of  
        1:  begin
            clrscr;
                var u, v, w: CVector;
                writeln('Введите первый комплексный вектор: ');
                InputCVector(u);
                writeln('Введите второй комплексный вектор: ');
                InputCVector(v);
                AddCVector(u, v, w);
                OutputCVector(w);
                Wait;
              end;
       2:  begin
            clrscr;
                var u, v, w: CVector;
                writeln('Введите первый комплексный вектор: ');
                InputCVector(u);
                writeln('Введите второй комплексный вектор: ');
                InputCVector(v);
                SubCVector(u, v, w);
                OutputCVector(w);
                Wait;
              end;
        3:  begin
            clrscr;
                var u, w: CVector; var l: real;
                writeln('Введите комплексный вектор: ');
                InputCVector(u);
                writeln('Введите число: ');
                readln(l);
                ProdCVector(l, u, w);
                OutputCVector(w);
                Wait;
              end;
         4:  begin
             clrscr;
                 var u, w: CVector; var z: Complex;
                 writeln('Введите комплексный вектор: ');
                 InputCVector(u);
                 writeln('Введите комплексное число: ');
                 Input(z);
                 MultComplCVector(z,u,w);
                 OutputCVector(w);
                 Wait;
               end;
       5:  begin
            clrscr;
                var u, v: CVector; var z: Complex;
                writeln('Введите первый комплексный вектор: ');
                InputCVector(u);
                writeln('Введите второй комплексный вектор: ');
                InputCVector(v);
                ScalProdCVector(u, v, z);
                Output(z);
                Wait;
              end;
        6:  begin
            clrscr;
                var u, v, w: CVector;
                writeln('Введите первый комплексный вектор: ');
                InputCVector(u);
                writeln('Введите второй комплексный вектор: ');
                InputCVector(v);
                CVectorProd(u, v, w);
                OutputCVector(w);
                Wait;
              end;
        7:  begin
            clrscr;
                var u, v, w: CVector; var z: Complex;
                writeln('Введите первый комплексный вектор: ');
                InputCVector(u);
                writeln('Введите второй комплексный вектор: ');
                InputCVector(v);
                writeln('Введите третий комплексный вектор: ');
                InputCvector(w);
                MixProdCVector(u, v, w, z);
                Output(z);
                Wait;
              end;
         8:  begin
              clrscr;
                var u: CVector;
                writeln('Введите комплексный вектор:');
                InputCVector(u);
                write('Модуль равен: ',ModulCVector(u));
                Wait;
              end;
        
        0: ok:=false
           else 
           begin
            GoToXY(30, 21);
            Writeln('Ошибка! Повторите ввод.'); 
            GoToXY(30, 22);
            Writeln('Для продолжения нажмите любую клавишу.');
            Wait;
           end;
        end;
      end;
    end;
end.