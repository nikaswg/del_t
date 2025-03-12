unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, Buttons, Menus;
     type mas = array of integer;
          masf = array of Real;
type
  TForm1 = class(TForm)
    btn1: TBitBtn;
    SG: TStringGrid;
    baton1: TBitBtn;
    baton2: TBitBtn;
    baton3: TBitBtn;
    lbl1: TLabel;
    ud1: TUpDown;
    e1: TEdit;
    main: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    iN3: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N101: TMenuItem;
    N102: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    M: TMenuItem;
    Sort: TMenuItem;
    my: TMenuItem;
    Exit: TMenuItem;
    max1: TMenuItem;
    min1: TMenuItem;
    Strue: TMenuItem;
    Sreve: TMenuItem;
    mine: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    l2: TLabel;
    procedure baton1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure Float(var Key: Char);
    procedure N2Click(Sender: TObject);
    procedure iN3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure N102Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure max1Click(Sender: TObject);
    procedure min1Click(Sender: TObject);
    procedure StrueClick(Sender: TObject);
    procedure SreveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mineClick(Sender: TObject);
    procedure baton2Click(Sender: TObject);
    procedure baton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   A:mas;
   b: masf;
  n: Integer;
implementation

uses Unit2, Unit3;

function E(var A: mas;var n: Integer):boolean;
var i:longint;
begin

  n:=strtoint(Form1.E1.text);

   SetLength(A,n+1);

              for i:=1 to n do
  begin
    if Form1.SG.Cells[i,1]='' then
      begin
        MessageDlg('Заполнен не весь SG!',mtError,[MbOk],0);
        MessageDlg('Заполните!',mtError,[MbOk],0);

        E:=false;
         Exit;

      end

      else

      begin
     A[i]:=StrToInt(Form1.SG.Cells[i,1]);
      E:=true;
      end;
  end;
end;

function v(var A: masf;var n: Integer):boolean;
var i:longint;
begin

  n:=strtoint(Form1.E1.text);

   SetLength(A,n+1);

              for i:=1 to n do
  begin
    if Form1.SG.Cells[i,1]='' then
      begin
        MessageDlg('Заполнен не весь SG!',mtError,[MbOk],0);
        MessageDlg('Заполните!',mtError,[MbOk],0);

        v:=false;
         Exit;

      end

      else

      begin
     A[i]:=StrToFloat(Form1.SG.Cells[i,1]);
      v:=true;
      end;
  end;
end;


procedure TForm1.Float(var Key: Char);
var key1:string;i,n:integer;
begin
  n:=strtoint(e1.text);
  key1:='1234567890';
  for i:=1 to n do
  begin
    If not (Key in ['0'..'9',#8,#45]) then
    Key:=#0;
  end;
end;

{$R *.dfm}

procedure TForm1.baton1Click(Sender: TObject);
begin
  lbl1.Visible:=boolean(1);
  e1.Visible:=Boolean(1);
  ud1.Visible:=True;

end;

procedure TForm1.FormClick(Sender: TObject);
var n,i: Integer;
begin
    SG.Visible:=Boolean(1);
    SG.Options:=SG.Options+[goEditing];
    n:=strtoint(e1.Text);
    for i:=1 to n do
    begin
    SG.ColCount:=i+1;
    SG.RowCount:=2;
    end;
    l2.Visible:=True;
end;

procedure TForm1.N2Click(Sender: TObject);
  var i,j,sum,n: Integer;
begin
  n:=StrToInt(e1.Text);
  if E(A,n)=true then begin

    Form2.Show;
    Form2.lb.Caption:='Сумма всех элементов';
      sum:=0;
      for i:=1 to n do
      inc(sum,a[i]);
      Form2.e2.Text:=inttostr(sum);
    end;
end;

procedure TForm1.iN3Click(Sender: TObject);
var n,i,sum,j: integer;
begin
   n:=StrToInt(e1.Text);
  if E(A,n)=true then begin

   Form2.Show;
   Form2.lb.Caption:='Сумма всех отрицательных эл-тов:';

   for j:=1 to SG.ColCount-1 do
   A[j]:=StrToInt(SG.Cells[j,1]);
   for i:=1 to n do
   if a[i]<0 then
   Inc(sum,a[i]);
   form2.e2.Text:=IntToStr(sum);
   end;
end;

procedure TForm1.N3Click(Sender: TObject);
var n,i,j,sum: integer;
begin
  n:=StrToInt(e1.Text);
  if E(A,n)=true then begin

     Form2.Show;
     Form2.lb.Caption:='Сумма всех четных эл-тов:';
     sum:=0;
     for i:=1 to n do
     if a[i] mod 2 = 0 then
     inc(sum,A[i]);
     form2.e2.Text:=inttostr(sum);
end;
end;

procedure TForm1.N4Click(Sender: TObject);

var n,i,j,sum: integer;
  begin
    n:=StrToInt(e1.Text);
  if E(A,n)=true then begin

     Form2.Show;
     Form2.lb.Caption:='Сумма всех нечетных эл-тов:';
     sum:=0;
     for i:=1 to n do
     if a[i] mod 2 <> 0 then
     inc(sum,A[i]);
     form2.e2.Text:=inttostr(sum);
end;
end;


procedure TForm1.N5Click(Sender: TObject);
var i,j,n,sum: Integer;
begin
   n:=StrToInt(e1.Text);
  if E(A,n)=true then begin
   Form2.Show;
   Form2.lb.Caption:='Сумма всех положительных эл-тов:';
   sum:=0;
   for i:=1 to n do
   if a[i]>0 then
   Inc(sum,a[i]);
   form2.e2.Text:=IntToStr(sum);
end;
end;

procedure TForm1.N101Click(Sender: TObject);
var i,j,sum,n: integer;
begin
   n:=StrToInt(e1.Text);
  if E(A,n)=true then begin

   Form2.Show;
   Form2.lb.Caption:='Сумма эл-тов значение которых >10';
        sum:=0;
     For i:=1 to n do
     if A[i]>10 then
     inc(sum,A[i]);
     Form2.e2.Text:=IntToStr(sum);
end;
end;

procedure TForm1.N102Click(Sender: TObject);
var i,j,sum,n: integer;
begin
   n:=StrToInt(e1.Text);
  if E(A,n)=true then begin

   Form2.Show;
   Form2.lb.Caption:='Сумма эл-тов значение которых <10';
     sum:=0;
     For i:=1 to n do
     if A[i]<10 then
     inc(sum,A[i]);
     Form2.e2.Text:=IntToStr(sum);
end;
end;

procedure TForm1.N6Click(Sender: TObject);
var i,j,n,sum,srsum: integer;
begin
  n:=StrToInt(e1.Text);
  if E(A,n)=true then begin
  Form2.Show;
  Form2.Width:=1000;
  Form2.lb.Caption:='Сумма эл-тов значение которых больше сред. арифм.';
  sum:=0;
  for i:=1 to n do
  inc(sum,A[i]);
  srsum:= sum div n ;
  sum:=0;
  for i:=1 to n do
  if A[i]>srsum then
  inc(sum,A[i]);
  Form2.e2.Text:=inttostr(sum);
end;
end;

procedure TForm1.N7Click(Sender: TObject);
var
  i,j,n,srsum,sum: Integer;
begin
  n:=StrToInt(e1.Text);
  if E(A,n)=true then begin
  Form2.Show;
  Form2.Width:=1000;
  Form2.lb.Caption:='Сумма эл-тов значение которых меньше сред. арифм.';
  sum:=0;
  for i:=1 to n do
  inc(sum,A[i]);
  srsum:= sum div n ;
  sum:=0;
  for i:=1 to n do
  if A[i]<srsum then
  inc(sum,A[i]);
  Form2.e2.Text:=inttostr(sum);
end;
end;

procedure TForm1.max1Click(Sender: TObject);
var i,j,n,max,ii: Integer;
begin
  n:=StrToInt(e1.Text);
  if E(A,n)=true then begin
  Form2.Width:=1000;
  Form2.Show;
  Form2.e22.Visible:=true;
  Form2.lb.Caption:='Значение максимального эл-та вектора:';
  Form2.lb1.Visible:=true;
  Form2.lb1.Caption:='Индекс максимального эл-та в векторе:';
  max:=a[1];
  ii:=1;
  for i:=1 to n do
    if a[i]>max then
    begin
      max:=A[i];
      ii:=i;
    end;
  Form2.e2.Text:=IntToStr(max);
  Form2.e22.Text:=IntToStr(ii);
end;
end;

procedure TForm1.min1Click(Sender: TObject);
var i,j,n,max,ii: Integer;
begin
  n:=StrToInt(e1.Text);
  if E(A,n)=true then begin
  Form2.Width:=1000;
  Form2.Show;
  Form2.e22.Visible:=true;
  Form2.lb.Caption:='Значение минимального эл-та вектора:';
  Form2.lb1.Visible:=true;
  Form2.lb1.Caption:='Индекс минимально эл-та в векторе:';
  max:=a[1];
  ii:=1;
  for i:=1 to n do
    if a[i]<max then
    begin
      max:=A[i];
      ii:=i;
    end;
  Form2.e2.Text:=IntToStr(max);
  Form2.e22.Text:=IntToStr(ii);
end;
end;

procedure TForm1.StrueClick(Sender: TObject);
var i,j,n,temp,key: Integer;
begin
  n:=StrToInt(e1.Text);
  if E(A,n)=true then begin
  Form2.Show;
  Form2.Width:=1000;
  Form2.SG1.Visible:=True;
  Form2.lb.Caption:='Отсортированный вектор по возрастанию:';

    for i:=1 to n do
    begin
     Form2.SG1.ColCount:=i+1;
     Form2.SG1.RowCount:=2;
    end;
  for i := 2 to n do
    begin
      key := A[i];
      j := i;
      while (j > 1) and (A[j - 1] > key) do
        begin
          {обмен элементов}
          temp :=  A[j];
          A[j] := A[j - 1];
          A[j - 1] := temp;
          j := j - 1;
        end;
      A[j] := key;
    end;
  for j:=1 to Form2.SG1.ColCount do
  Form2.SG1.Cells[j,1]:=IntToStr(A[j]);
end;
end;

procedure TForm1.SreveClick(Sender: TObject);
var i,j,n,temp,key: Integer;
begin
  n:=StrToInt(e1.Text);
  if E(A,n)=true then begin
  Form2.Show;
  Form2.Width:=1000;
  Form2.lb.Caption:='Отсортированный вектор по убыванию:';
  Form2.SG1.Visible:=True;
    for i:=1 to n do
    begin
     Form2.SG1.ColCount:=i+1;
     Form2.SG1.RowCount:=2;
    end;
  for i := 2 to n do
    begin
      key := A[i];
      j := i;
      while (j > 1) and (A[j - 1] < key) do
        begin
          temp :=  A[j];
          A[j] := A[j - 1];
          A[j - 1] := temp;
          j := j - 1;
        end;
      A[j] := key;
    end;
  For j:=1 to Form2.SG1.ColCount do
    Form2.SG1.Cells[j,1]:=IntToStr(A[j]);
end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
   Form1.Color:=clMoneyGreen;
end;

procedure TForm1.mineClick(Sender: TObject);
var i,j,n,m,temp,im,imax: Integer;
    max,min: real;
begin
  n:=StrToInt(e1.Text);
  m:=StrToInt(e1.Text);
  if v(b,n)=true then begin
  Form3.Show;
  for i:=1 to n do
    begin
     Form3.SG1.ColCount:=i+1;
     Form3.SG1.RowCount:=2;
    end;
  for i:=1 to n do
    begin
     Form3.SG2.ColCount:=i+1;
     Form3.SG2.RowCount:=2;
    end;
    for i:=1 to n do
  Form3.SG1.Cells[i,1]:=FloatToStr(b[i]);
  max:=b[1];
  min:=b[1];
  for i:=1 to n do
  begin
    if (b[i]>max) then
      max:=b[i]
    else if b[i]<min then
      min:=b[i];
  end;
  for i:=1 to n do
    if b[i]=max then
    begin
      imax:=i;
      Break;
    end;
  for i:=imax+1 to n do
  begin
       b[i]:=b[i]*min;
  end;
  Form3.e1.Text:=FloatToStr(min);
    for i:=1 to n do
  Form3.SG2.Cells[i,1]:=FloatToStr(b[i]);

end;

end;

procedure TForm1.baton2Click(Sender: TObject);
var
f:TextFile;
s:string;
i,j,n:integer;
begin
SaveDialog1.Filter:='Текстовые файлы|*.txt|';
n:=strtoint(e1.text);
if SaveDialog1.Execute then
begin
AssignFile (f,SaveDialog1.Filename);
Rewrite(f);
writeln (f,n);
for i:=1 to n do
      writeln (f,SG.cells[j,1]);
CloseFile (f);
end;
end;

procedure TForm1.baton3Click(Sender: TObject);
var
  i,j,n:integer;
  f:TextFile;
  s:string;
begin
OpenDialog1.Filter:='Текстовые файлы|*.txt|';
if OpenDialog1.Execute and FileExists(OpenDialog1.Filename) then
begin
AssignFile (f,OpenDialog1.Filename);
Reset(f);
readln(f,n);
for i:=1 to n do
begin
  readln (f,s);
  SG.cells[1,j]:=s;
end;
CloseFile (f);
SG.Visible:=True;
e1.Text:=inttostr(n);
end;

end;


end.

