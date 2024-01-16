unit Compl;

interface
  Uses Crt;
  type
    Complex = record Re, Im: real end;
  
  procedure Output(w: complex );
  procedure Input(var u: complex );
  procedure Add(u, v: Complex; var w: Complex );
  procedure Sub(u, v: Complex; var w: Complex);
  procedure Mult(u, v: Complex; var w: Complex );
  procedure Inv(u: complex; var w: Complex );
  procedure Divz(u, v: Complex; var w: Complex );
  procedure ExpC(z:Complex; var w:Complex);
  procedure SinC(z:Complex; var w:Complex);
  procedure CosC(z:Complex; var w:Complex); 
  procedure Zero(var u: complex );
  procedure One(var u: complex );
  procedure Prod(a: real; u: Complex; var w: Complex );
  procedure ConjCompl(U: complex; var W: complex);
  function Modul(u: complex): real;
  
  procedure MenuCompl;

implementation

  procedure Input(var u: complex);
  begin
    write('Вещественная часть: ');
    read(u.Re);
    write('Мнимая часть: ');
    read(u.Im);
  end;
  
  procedure Output(w: complex);
  begin
    if w.Im >= 0 then
      write(w.Re, '+', w.Im, 'i')
    else
      write(w.Re, w.Im, 'i');
    write;
  end;
  
  procedure Add(u, v: Complex; var w: Complex);
  begin
    w.Re := u.Re + v.Re;
    w.Im := u.Im + v.Im;
  end;
  
  procedure Sub(u, v: Complex; var w: Complex);
  begin
    w.Re := u.Re - v.Re;                                   
    w.Im := u.Im - v.Im;
  end;
  
  procedure Mult(u, v: Complex; var w: Complex);
  begin
    w.Re := u.Re * v.Re - u.Im * v.Im;
    w.Im := u.Re * v.Im + u.Im * v.Re;
  end;
  
  procedure Inv(u: complex; var w: Complex); 
  var
    Zn: real;
  begin
    Zn := sqr(u.Re) + sqr(u.Im);
    w.Re := u.re / Zn;
    w.Im := -u.Im / Zn;
  end;
  
  procedure Divz(u, v: Complex; var w: Complex); 
  var
    z: complex;
  begin
    inv(v, z);
    Mult(u, z, w);
  end;
  
  procedure ExpC(z:Complex; var w:Complex);
  const
    eps = 0.001;
  var p:Complex;
      k:integer;
  begin
       One(p); One(w); k:=0;
       while (Modul(p) >= eps) do
       begin
            k:=k+1;
            Mult(p,z,p);
            Prod(1/k,p,p);
            Add(w,p,w);
       end;
  end;
  
  procedure SinC(z:Complex; var w:Complex);
  const
    eps = 0.001;
  var p,z2:Complex;
       k:integer;
  begin
       k:=0; P:=z; w:=z; Mult(z,z,z2);
       while (Modul(p) >= eps) do
       begin
            k:=k+2;
            Mult(p,z2,p);
            Prod(-1/k/(k+1),p,p);
            Add(w,p,w);
       end;
  end;
  
  procedure CosC(z:Complex; var w:Complex); 
  const
    eps = 0.001;
  var p,z2:Complex;
       k:integer;
  begin
       k:=0; One(w); One(p); Mult(z,z,z2);
       while (Modul(p) >= eps) do
       begin
            k:=k+2;
            Mult(p,z2,p);
            Prod(-1/k/(k-1),p,p);
            Add(w,p,w);
       end;
  end;

  procedure Zero(var u: complex );
  begin
    u.Re := 0;
    u.Im := 0;
  end;
  
  procedure One(var u: complex );
  begin
    u.Re := 1;
    u.Im := 0;
  end;
  
  procedure Prod(a: real; u: Complex; var w: Complex);
  begin
    w.Re := a * u.re;
    w.Im := a * u.Im;
  end;
  
  function Modul(u: complex): real;
  begin
    Modul := sqrt(sqr(u.Re) + sqr(u.Im));
  end;
  
  procedure ConjCompl(u: Complex; var w: Complex);// Получение сопряженного к.ч.
  begin
    w.Re := u.Re;
    w.Im := -u.Im;
  end;
  
  procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;
  
  procedure MenuCompl;
    var Mode: integer;
        ok: boolean;
    begin
      ok:= true;
      while ok do
      begin
        ClrScr;
        writeln('Выбор операции:');
        writeln('  1.Сложение комплексных чисел');
        writeln('  2.Вычитание комплексных чисел');
        writeln('  3.Умножение комплексных чисел');
        writeln('  4.Деление комплексных чисел');
        writeln('  5.Экспонента комплексных чисел');
        writeln('  6.Синус комплексных чисел');
        writeln('  7.Косинус комплексных чисел');
        writeln('  8.Комплексный ноль');
        writeln('  9.Комплексная единица');
        writeln('  10.Модуль компелксного числа');
        writeln('  11.Умножение комплексного числа на вещественное');
        writeln('  0.Выход');
        GoToXY(0, 15);
        Write('Номер операции: ');
        readln(Mode);
        GoToXY(0, 15);
        Case Mode of
          1:  begin
            clrscr;
                var u, v, w: Complex;
                Input(u);
                Input(v);
                Add(u, v, w);
                Output(w);
                Wait;
              end;
           2:  begin
            clrscr;
                var u, v, w: Complex;
                Input(u);
                Input(v);
                Sub(u, v, w);
                Output(w);
                Wait
              end;    
          3:  begin
            clrscr;
                var u, v, w: Complex;
                Input(u);
                Input(v);
                Mult(u, v, w);
                Output(w);
                Wait
              end; 
          4:  begin
            clrscr;
                var u, v, w: Complex;
                Input(u);
                Input(v);
                Divz(u, v, w);
                OutPut(w);
                Wait
              end;
          5: begin
            clrscr;
                var u,w: Complex;
                Input(u);
                ExpC(u,w);
                Output(w);
                Wait;
              end;
          6:  begin
            clrscr;
                var z,w: Complex;
                Input(z);
                SinC(z,w);
                Output(w);
                Wait;
              end;
          7: begin
            clrscr;
                var z,w: Complex;
                Input(z);
                CosC(z,w);
                Output(w);
                Wait;
              end;
          8:  begin
            clrscr;
                var z: Complex;
                Zero(z);
                Output(z);
                Wait
              end;
          9:  begin
            clrscr;
                var z: Complex;
                One(z);
                Output(z);
                Wait
              end;
          10:  begin
            clrscr;
                var z: Complex;
                Input(z);
                writeln('Modul = ',Modul(z));
                Wait
              end;
          11:  begin
            clrscr;
                var z, w: Complex;
                var a: real;
                write('Введите вещественное число: ');
                read(a);
                Input(z);
                Prod(a, z, w);
                Output(w);
                Wait
              end;           
          0: begin
          Ok:= false;
          clrscr;
          end;
          else
              begin
                clrscr;
                GoToXY(40, 11);
                writeln('ОШИБКА! Введите заново!!!');
                delay(1000)
              end;
        end;
      end;
    end;

End.