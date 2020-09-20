program var2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

type
  TAdr = ^TChel;
  TName= string[5];
  TChel = record
    Name: TName;
    Pred, Sled:TAdr;
  end;

var
  head, x, tmp: TAdr;
  i, k, j: integer;
  str: string;

procedure MakeList(i: integer);
var
  j:integer;
begin
  new(x);
  head:=x;
  x^.Name:='1';
  x^.Pred:=nil;
  x^.Sled:=nil;

  j:=2;
  while j<=i do
  begin
    new(x^.Sled);
    x^.Sled.Pred:=x;
    x:=x^.Sled;
    x^.Name:=IntToStr(j);
    x^.Sled:=nil;
    j:=j+1;
  end;
    x^.Sled:=head;
    head^.Pred:=x;
end;

procedure CleanList;
begin
   dispose(head);
end;

begin

 setConsoleCP(1251);

  setConsoleOutputCP(1251);
  write('Введите k = ');
  readln(k);

  i:=1;
  while i<= 64 do
  begin
    MakeList(i);
    if i=1 then
      writeln('1 Удаление ', i, ' остался')
    else
    begin
      j:=1;
      x:=head;
      str:='';
      while (x^.Pred<>head) or (x^.Sled<> head) or (x^.Sled.Sled<>head) do
      begin
        if j mod k=0 then
        begin
          str:=str+x^.Name+' ';
          tmp:=x^.Sled;
          x^.Pred.Sled:=x^.Sled;
          x^.Sled.Pred:=x^.Pred;
          if x= head then
            head:=tmp;
          x^.Pred:=nil;
          x^.Sled:=nil;
          dispose(x);
          x:=tmp;
        end
        else
          x:=x^.Sled;
        j:=j+1;
      end;

      writeln(i,' Удаление=', str, 'Остался=', head^.Name);
      writeln;
    end;
    i:=i+1;
    CleanList;
  end;


  readln;

end.
