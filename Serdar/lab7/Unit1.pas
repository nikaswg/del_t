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
  text: string;
  words: array[1..100] of string; // ������ ��� �������� ����
  maxLength, i, wordCount: Integer;
  maxLengthWord: string;
  currentWord: string;
  ch: Char;
  result: string;
begin
  Text:=m1.Text;
  wordCount := 0;
  currentWord := '';
  
  for i := 1 to Length(text) do
  begin
    ch := text[i];
    
    if (ch <> ' ') and (ch <> '.') and (ch <> ',') and (ch <> ';') and (ch <> '!') and (ch <> '?') then
      currentWord := currentWord + ch
    else
    begin
      if currentWord <> '' then
      begin
        wordCount := wordCount + 1;
        words[wordCount] := currentWord;
        currentWord := '';
      end;
    end;
  end;

  // ��������� ��������� �����, ���� ��� ����
  if currentWord <> '' then
  begin
    wordCount := wordCount + 1;
    words[wordCount] := currentWord;
  end;

  // ������� ������������ ����� �����
  maxLength := 0;
  for i := 1 to wordCount do
  begin
    if Length(words[i]) > maxLength then
    begin
      maxLength := Length(words[i]);
      maxLengthWord := words[i];
    end;
  end;

  // �������� ����� ������������ �����
  for i := 1 to wordCount do
  begin
    if Length(words[i]) = maxLength then
      words[i] := maxLengthWord;
  end;

  // ������� ���������� �����
  for i := 1 to wordCount do
  begin
    result:=result+words[i]+' ';
  end;

  m2.Text:=result;
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
