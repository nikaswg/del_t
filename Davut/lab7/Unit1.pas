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
     txt1.Caption:='��� �����. ������� ������ ������� ����� �������';
   end;
   if cb1.ItemIndex=1
   then begin
     txt1.Visible:=true;
     txt1.Caption:='��� �����. ����� � ������ ��������� ���������. ���������� �� ������ ��� ������������� �����.';
   end;
end;

procedure TForm1.rb1Click(Sender: TObject);
var
  inputText, cleanedText: string;
  i: Integer;
  inSpace: Boolean;
begin
  inputText:=m1.Text;
  cleanedText := '';
  inSpace := False;

  for i := 1 to Length(inputText) do
  begin
    if inputText[i] <> ' ' then
    begin
      cleanedText := cleanedText + inputText[i];
      inSpace := False;
    end
    else if not inSpace then
    begin
      cleanedText := cleanedText + ' ';
      inSpace := True;
    end;
  end;

  // ������� ������� � ������ � �����
  if (Length(cleanedText) > 0) and (cleanedText[1] = ' ') then
    Delete(cleanedText, 1, 1);
  
  if (Length(cleanedText) > 0) and (cleanedText[Length(cleanedText)] = ' ') then
    Delete(cleanedText, Length(cleanedText), 1);
  m2.Text:=cleanedText;
  txt1.Visible:=true;
  txt1.Caption:='��� �����. ������� ������ ������� ����� �������.';
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
    txt1.Caption:='��� �����. ����� � ������ ��������� ���������. ���������� �� ������ ��� ������������� �����.';
    cb1.ItemIndex:=1;
End;

end.
