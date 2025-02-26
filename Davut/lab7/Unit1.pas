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
     txt1.Caption:='Дан текст. Все слова, длина которых равна длине слова максимальной длины, заменить на слово максимальной длины.';
   end;
   if cb1.ItemIndex=1
   then begin
     txt1.Visible:=true;
     txt1.Caption:='Дан текст. Слова в тексте разделены пробелами. Вычеркнуть из текста все повторяющиеся слова.';
   end;
end;

procedure TForm1.rb1Click(Sender: TObject);
var
  text: string;
  words: array[1..100] of string; // Массив для хранения слов
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

  // Добавляем последнее слово, если оно есть
  if currentWord <> '' then
  begin
    wordCount := wordCount + 1;
    words[wordCount] := currentWord;
  end;

  // Находим максимальную длину слова
  maxLength := 0;
  for i := 1 to wordCount do
  begin
    if Length(words[i]) > maxLength then
    begin
      maxLength := Length(words[i]);
      maxLengthWord := words[i];
    end;
  end;

  // Заменяем слова максимальной длины
  for i := 1 to wordCount do
  begin
    if Length(words[i]) = maxLength then
      words[i] := maxLengthWord;
  end;

  // Выводим измененный текст
  for i := 1 to wordCount do
  begin
    result:=result+words[i]+' ';
  end;

  m2.Text:=result;
  txt1.Visible:=true;
  txt1.Caption:='1)	Дан текст. Все слова, длина которых равна длине слова максимальной длины, заменить на слово максимальной длины.';
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
  result := '';  // Итоговая строка
  SetLength(words, 0);  // Массив для хранения уникальных слов
  i := 1;  // Инициализация индекса
  while i <= length(s) do
  begin
    if s[i] in ['.', ',', '!', '?', ';', ':', '-', '(', ')', '"', ''''] then
    begin
      // Если встречаем знак препинания, добавляем его в результат
      if result <> '' then
        result := result + ' ';  // Добавляем пробел перед знаком
      result := result + s[i];  // Добавляем знак препинания
      i := i + 1;  // Переходим к следующему символу
    end
    else if s[i] <> ' ' then
    begin
      // Формируем слово
      word := '';
      while (i <= length(s)) and (s[i] <> ' ') and not (s[i] in ['.', ',', '!', '?', ';', ':', '-', '(', ')', '"', '''']) do
      begin
        word := word + s[i];
        i := i + 1;
      end;

      // Проверяем, есть ли такое слово в массиве
      found := false;

      for j := 0 to High(words) do
      begin
        if words[j] = word then
        begin
          found := true;
          break;
        end;
      end;

      // Если слово уникально, добавляем его в результат и массив
      if not found then
      begin
        if result <> '' then
          result := result + ' ';  // Добавляем пробел перед новым словом
        result := result + word;    // Добавляем слово в результат

        // Добавляем слово в массив
        SetLength(words, Length(words) + 1);
        words[High(words)] := word;
      end;
    end
    else
      i := i + 1;  // Пропускаем пробелы
  end;
    m2.Text:=result;
    txt1.Visible:=true;
    txt1.Caption:='2)	Дан текст. Слова в тексте разделены пробелами. Вычеркнуть из текста все повторяющиеся слова.';
    cb1.ItemIndex:=1;
End;

end.
