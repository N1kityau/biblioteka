Unit ComplMatrix;

Interface
  uses Crt, Compl;
  
  const n_Matrix = 2;
  
  type
      Matrix = array [1..n_Matrix, 1..n_Matrix] of Complex;
  
  Var u,v,w:Complex;
  procedure InputMatrix(h, w : integer; var a: matrix);
  procedure OutputMatrix(h, w : integer; a: matrix);
  procedure AddMatrix(a, b: matrix; var c: matrix);
  procedure MultMatrix(a, b: matrix; var c: matrix);
  procedure ProdMatrix(a:real; b:matrix; var c:matrix);
  procedure ZeroMatrix(var a:matrix);
  procedure OneMatrix(var a:matrix);
  function NormMatrix(a: matrix): real;
  procedure ExpMatrix(a: matrix; var s: matrix);
  procedure MenuComplMatrix;
  
Implementation

  procedure InputMatrix(h, w : integer; var a: matrix);
  var
    i, j: integer;
  begin
    for i:=1 to n_Matrix do
      for j:=1 to n_Matrix do
        begin
          GoToXY(j*15+h*2, i+w); read(a[i, j].Re);
          GoToXY(j*15+6+h*2, i+w); read(a[i, j].Im);
        end;
  end;
  
  procedure OutputMatrix(h, w : integer; a: matrix);
  var
    i, j: integer;
  begin
    Writeln('Ответ: ');
    for i := 1 to n_Matrix do
      for j := 1 to n_Matrix do
        begin
          GoToXY(j*15+h*2-1, i+w); write(a[i, j].Re:4:1);
          GoToXY(j*15+6+h*2-1, i+w); write(a[i, j].Im:4:1);
        end;
  end;
  
  procedure AddMatrix(a,b: matrix; var c: matrix);
  var i,j:integer;
  begin
    for i:=1 to n_Matrix do
      for j:=1 to n_Matrix do
        Add(a[i,j],b[i,j],c[i,j]);
  end;
  
  procedure MultMatrix(a,b: matrix; var c:matrix);
  var k,i,j:integer;
  p,s:complex;
  begin
    for i:=1 to n_Matrix do
      for j:=1 to n_Matrix do 
        begin
        Zero(s);
        for k:=1 to n_Matrix do
        begin
          Mult(a[i,k],b[k,j],p);
          Add(s,p,s);
        end;
        c[i,j]:=s;
      end;  
  end;
  
  function NormMatrix(a: matrix): real;
  var
    i, j: Integer;
    z, s: real;
  begin
    z := 0;
    for i := 1 to n_Matrix do                            
    begin
      s := 0;
      for j := 1 to n_Matrix do
      begin
        s := s + Modul(a[i, j]);
        if s >= z then z := s;
      end; 
    end;
    NormMatrix := z;
  end;
  
  procedure ProdMatrix(a:real; b:matrix; var c:matrix);
  	var i,j:integer;
   begin
     for i:=1 to n_Matrix do
      for j:=1 to n_Matrix do
       Prod(a,b[i,j],c[i,j]);
   end;
  
  procedure OneMatrix(var a: matrix);
  var
    i, j: integer;
  begin
    for j := 1 to n_Matrix do  
      for i := 1 to n_Matrix do                              
        Zero(a[i, j]);
    for i := 1 to n_Matrix do
      for j := 1 to n_Matrix do
        if i = j then One(a[i, j])
  end;
  
  procedure ZeroMatrix(var a:matrix);
  	var i,j:integer;
   begin
    for i:=1 to n_Matrix do
     for j:=1 to n_Matrix do 
      Zero(a[i,j])
   end;
  
  procedure ExpMatrix(a: matrix; var s: matrix);
  const
    eps = 0.001;
  var
    p: Matrix;
    k: integer;
  begin
    OneMatrix(p);
    OneMatrix(s);
    k := 0;               
    while NormMatrix(p) >= eps do 
    begin
      k := k + 1;
      MultMatrix(p, a, p);
      ProdMatrix(1 / k, p, p);
      AddMatrix(s, p, s); 
    end;
  end;
  
  procedure Wait;
  begin
      repeat until KeyPressed;
      while KeyPressed do ReadKey;
  end;
  
  procedure MenuComplMatrix;
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
         writeln('  3:Умножение матрицы на скаляр');
         writeln('  4:Нулевая матрица');
         writeln('  5:Единичная матрица');
         writeln('  6:Норма матрицы');
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
          GoToXY(42, 15);Writeln('Введите число: ');
          GoToXY(58, 15);readln(f);clrscr;
          Writeln('Введите комплексную матрицу: ');
          InputMatrix(10, 4, b);
          ProdMatrix(f,b,c);
          OutputMatrix(10, 8, c);
          Wait;
        end;
     4: begin
          clrscr;
          ZeroMatrix(a);
          OutputMatrix(10, 2, a);
          Wait;
        end;
     5: begin
          clrscr;
          OneMatrix(a);
          OutputMatrix(10, 2, a);
          Wait;
        end;
     6: begin
          clrscr;
          Writeln('Введите комплексную матрицу: ');
          InputMatrix(10, 2, a);
          w := NormMatrix(a);
          GoToXY(20, 6);writeln(w);
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
