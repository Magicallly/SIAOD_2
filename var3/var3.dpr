program var3;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TNumber=string[7];
  TFIO=string[20];
  TAdr= ^TAbon;
  TAbon= record
    FIO: TFIO;
    Number:TNumber;
    Next: TAdr;
  end;

var
  head, x:TAdr;
  num: TNumber;
  fio: TFIO;

procedure MakeList;
begin
  New(x);
  head:=x;
  x^.FIO:='Ivanov H.H.';
  x^.Number:='1234567';
  x^.Next:=nil;
  new(x^.Next);
  x:=x^.Next;
  x^.FIO:='Sidorov A.D.';
  x^.Number:='7862998';
  x^.Next:=nil;
  new(x^.Next);
  x:=x^.Next;
  x^.FIO:='Minoga F.F.';
  x^.Number:='7593595';
  x^.Next:=nil;
  new(x^.Next);
  x:=x^.Next;
  x^.FIO:='Ktoto Y.U.';
  x^.Number:='6666666';
  x^.Next:=nil;
  new(x^.Next);
  x:=x^.Next;
  x^.FIO:='Ffffff F.F.';
  x^.Number:='1234567';
  x^.Next:=nil;
end;

procedure CleanList;
begin
  while x<>nil do
  begin
    x:=head;
    while x^.Next<>nil do
      x:=x^.Next;
    dispose(x);
  end;

end;

procedure FindByNumber(const num: TNumber);
var
  find: TAbon;
begin
  find.FIO:='';
  find.Number:='';
  find.Next:=nil;
  x:=head;
  while x<>nil do
  begin
    if x^.Number=num then
    begin
      find:=x^;
      writeln('Number = ', find.Number, ' FIO = ', find.FIO);
    end;
    x:=x^.Next;
  end;
  if find.FIO='' then
    writeln('Number not found');
end;

procedure FindByFIO(const fio: TFIO);
var
  find: TAbon;
begin
  find.FIO:='';
  find.Number:='';
  find.Next:=nil;
  x:=head;
  while x<>nil do
  begin
    if x^.FIO=fio then
    begin
      find:=x^;
      writeln('Number = ', find.Number, ' FIO = ', find.FIO);
    end;
    x:=x^.Next;
  end;
  if find.FIO='' then
    writeln('FIO not found');
end;

begin

  MakeList;
  write('Number =');
  readln(num);
  FindByNumber(num);
  write('FIO =');
  readln(fio);
  FindByFIO(fio);


  CleanList;
  readln;
end.
