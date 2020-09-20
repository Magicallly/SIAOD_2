program var4;

{$APPTYPE CONSOLE}

uses
  windows;

type
  pt = ^elem;

  elem = record
    Numb: string[30];
    Next: pt;
    Prev: pt;
  end;

  pp = ^el;

  el = record
    Numb: string[30];
    Next: pp;
  end;

var
  n, m: integer;

Procedure Enter(var Head: pt);
var
  Curr, Pr: pt;
  i: integer;
begin
  Writeln('Введите количество номеров для ввода');
  Readln(n);
  New(Head);
  Curr := Head;
  Curr^.Next := nil;

  for i := 1 to n do
  begin
    New(Curr^.Next);
    Pr := Curr;
    Curr := Curr^.Next;
    Curr^.Prev := Pr;
    Readln(Curr^.Numb);
    Curr^.Next := nil;
  end;
  Readln;
end;

procedure Output(Head: pt);
var
  Curr: pt;
  i: integer;
begin
  Writeln('Ваши введенные номера(в обратном порядке)');
  Curr := Head;
  Curr := Curr^.Next;
  while Curr^.Next <> nil do
  begin
    Curr := Curr^.Next;
  end;
  for i := 1 to n do
  begin

    Writeln(Curr^.Numb);
    Curr := Curr^.Prev;
  end;
  Readln;
end;

procedure Rewrit(Head1: pt; var Head2: pp);
var
  c: pt;
  Curr: pp;
  i: integer;
begin
  New(Head2);
  Curr := Head2;
  Curr^.Next := nil;
  c := Head1^.Next;
  for i := 1 to n do
  begin
    if Length(c^.Numb) = 7 then
    begin
      New(Curr^.Next);
      Curr := Curr^.Next;
      Curr^.Numb := c^.Numb;
      Curr^.Next := nil;

      inc(m);
    end;
    c := c^.Next;
  end;
end;

procedure sort(Head: pp);
var
  Curr, Previous: pp;
  i: integer;
  temp: string;
begin
  Previous := Head;
  while Previous^.Next <> nil do
  begin

    Previous := Previous^.Next;
    Curr := Previous;
    while Curr^.Next <> nil do
    begin
      Curr := Curr^.Next;
      if Curr^.Numb < Previous^.Numb then
      begin

        temp := Previous^.Numb;
        Previous^.Numb := Curr^.Numb;
        Curr^.Numb := temp;
      end;

    end;

  end;
end;

procedure outout(Head: pp);
var
  Curr: pp;
  i: integer;
begin
  Writeln('Семизначные номера');
  Curr := Head;
  Curr := Curr^.Next;
  for i := 1 to m do
  begin
    Writeln(Curr^.Numb);
    Curr := Curr^.Next;
  end;
  Readln;
end;

var
  Head1: pt;
  Head2: pp;

begin
  setConsoleCP(1251);
  m := 0;
  setConsoleOutputCP(1251);
  Enter(Head1);
  if n <> 0 then
  begin
    Output(Head1);
    Rewrit(Head1, Head2);
    sort(Head2);
    outout(Head2);
  end;
  Readln;

end.
