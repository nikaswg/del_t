unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    m1: TMemo;
    m2: TMemo;
    cb1: TComboBox;
    rg1: TRadioGroup;
    txt1: TStaticText;
    rb1: TRadioButton;
    rb2: TRadioButton;
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure cb1Change(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  type
    astr = array[1..128] of string;
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
  m1.SetFocus;
end;

procedure TForm1.cb1Change(Sender: TObject);
begin
   if cb1.ItemIndex=0
   then begin
     txt1.Visible:=true;
     txt1.Caption:='��� �����. ��� �����, ����� ������� ����� ����� ����� ������������ �����, �������� �� ����� ������������ �����.';
   end;
   if cb1.ItemIndex=1
   then begin
     txt1.Visible:=true;
     txt1.Caption:='��� �����. ����� � ������ ��������� ���������. ���������� �� ������ ��� ������������� �����.';
   end;
end;

procedure TForm1.rb1Click(Sender: TObject);
var
  Str, old: string;
  i, j, D1, D2: integer;
  D_g: Real;
const
  s1: string = '�����������������������qwertyuiopasdfghjklzxcvbnm';

begin
  str:=m1.Text;
  D1 := 0; // ������� ����
  D2 := 0; // ������� ���� � ��������� ���������
  old := '';

  // ��������� ������ � ����� ������ ��� ��������� ���������� �����
  Str := Str + ' ';

  for i := 1 to length(Str) do
  begin
    // ���������� ����� ����������
    if Str[i] in ['.', ',', '!', '?', ';', ':'] then
      continue;

    if Str[i] = ' ' then
    begin
      // ���� old �� ������, ������ �� ��������� �����
      if old <> '' then
      begin
        D1 := D1 + 1; // ������� �����

        // ��������� �� ��������� ���������
        for j := 1 to length(old) - 1 do
        begin
          if (old[j] = old[j + 1]) and (pos(old[j], s1) <> 0) then
          begin
            D2 := D2 + 1; // ����������� �������
            break; // ���� ����� ��������� ���������, ������� �� �����
          end;
        end;
      end;

      // ���������� old ��� ���������� �����
      old := '';
    end
    else
    begin
      // ������ � ������� ��������
      if (Str[i] >= '�') and (Str[i] <= '�') then
        Str[i] := chr(ord(Str[i]) + 32);

      old := old + Str[i]; // �������� ������� �����
    end;
  end;
  D_g:=D2 / D1 * 100;
  if D1 > 0 then
    m2.Text:='����� ����: '+IntToStr(D1)+#13#10+'����� ���� � ��������� ���������: '+InttoStr(D2)+#13#10+'������� ���� � ������, ���������� ��������� ���������: '+floattostr(D_g)+'%'
  else
    m2.Text:='��� ���� � ������.';
  txt1.Visible:=true;
  txt1.Caption:='1)	��� �����. ��� �����, ����� ������� ����� ����� ����� ������������ �����, �������� �� ����� ������������ �����.';
  cb1.ItemIndex:=0;
end;


procedure TForm1.rb2Click(Sender: TObject);
var
  s, result, word: string;
  i,j: integer;
  words: array of string;
  found: boolean;
Begin
  s:=m1.Text;
  result := '';  // �������� ������
  SetLength(words, 0);  // ������ ��� �������� ���������� ����
  i := 1;  // ������������� �������
  while i <= length(s) do
  begin
    if s[i] in ['.', ',', '!', '?', ';', ':', '-', '(', ')', '"', ''''] then
    begin
      // ���� ��������� ���� ����������, ��������� ��� � ���������
      if result <> '' then
        result := result + ' ';  // ��������� ������ ����� ������
      result := result + s[i];  // ��������� ���� ����������
      i := i + 1;  // ��������� � ���������� �������
    end
    else if s[i] <> ' ' then
    begin
      // ��������� �����
      word := '';
      while (i <= length(s)) and (s[i] <> ' ') and not (s[i] in ['.', ',', '!', '?', ';', ':', '-', '(', ')', '"', '''']) do
      begin
        word := word + s[i];
        i := i + 1;
      end;

      // ���������, ���� �� ����� ����� � �������
      found := false;

      for j := 0 to High(words) do
      begin
        if words[j] = word then
        begin
          found := true;
          break;
        end;
      end;

      // ���� ����� ���������, ��������� ��� � ��������� � ������
      if not found then
      begin
        if result <> '' then
          result := result + ' ';  // ��������� ������ ����� ����� ������
        result := result + word;    // ��������� ����� � ���������

        // ��������� ����� � ������
        SetLength(words, Length(words) + 1);
        words[High(words)] := word;
      end;
    end
    else
      i := i + 1;  // ���������� �������
  end;
    m2.Text:=result;
    txt1.Visible:=true;
    txt1.Caption:='2)	��� �����. ����� � ������ ��������� ���������. ���������� �� ������ ��� ������������� �����.';
    cb1.ItemIndex:=1;
End;

end.
