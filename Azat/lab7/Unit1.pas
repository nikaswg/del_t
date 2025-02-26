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
     txt1.Caption:='Дан текст. Слова в тексте отделены одним пробелом. В конце текста точка. Определить, какой процент слов в тексте содержит удвоенную согласную.';
   end;
   if cb1.ItemIndex=1
   then begin
     txt1.Visible:=true;
     txt1.Caption:='В тексте вставить вместо одного пробела запятую и пробел, вместо двух пробелов - двоеточие и пробел, вместо трех и более пробелов тире и пробел.';
   end;
end;

procedure TForm1.rb1Click(Sender: TObject);
var
  Str, old: string;
  i, j, D1, D2: integer;
  D_g: Real;
const
  s1: string = 'бвгджзкйлмнпрстфхцчшщъьqwertyuiopasdfghjklzxcvbnm';

begin
  str:=m1.Text;
  D1 := 0; // Счетчик слов
  D2 := 0; // Счетчик слов с удвоенной согласной
  old := '';

  // Добавляем пробел в конец строки для обработки последнего слова
  Str := Str + ' ';

  for i := 1 to length(Str) do
  begin
    // Игнорируем знаки препинания
    if Str[i] in ['.', ',', '!', '?', ';', ':'] then
      continue;

    if Str[i] = ' ' then
    begin
      // Если old не пустая, значит мы закончили слово
      if old <> '' then
      begin
        D1 := D1 + 1; // Считаем слово

        // Проверяем на удвоенные согласные
        for j := 1 to length(old) - 1 do
        begin
          if (old[j] = old[j + 1]) and (pos(old[j], s1) <> 0) then
          begin
            D2 := D2 + 1; // Увеличиваем счетчик
            break; // Если нашли удвоенную согласную, выходим из цикла
          end;
        end;
      end;

      // Сбрасываем old для следующего слова
      old := '';
    end
    else
    begin
      // Привод к нижнему регистру
      if (Str[i] >= 'А') and (Str[i] <= 'Я') then
        Str[i] := chr(ord(Str[i]) + 32);

      old := old + Str[i]; // Собираем текущее слово
    end;
  end;
  D_g:=D2 / D1 * 100;
  if D1 > 0 then
    m2.Text:='Всего слов: '+IntToStr(D1)+#13#10+'Всего слов с удвоенной согласной: '+InttoStr(D2)+#13#10+'Процент слов в тексте, содержащих удвоенную согласную: '+floattostr(D_g)+'%'
  else
    m2.Text:='Нет слов в тексте.';
  txt1.Visible:=true;
  txt1.Caption:='Дан текст. Слова в тексте отделены одним пробелом. В конце текста точка. Определить, какой процент слов в тексте содержит удвоенную согласную.';
  cb1.ItemIndex:=0;
end;


procedure TForm1.rb2Click(Sender: TObject);
var
  Str, Str1: string;
  i, c: integer;
const
  s1: string = ', ';
  s2: string = ': ';
  s3: string = '- ';
Begin
  str:=m1.Text;
  Str1 := '';
  c := 0;
  for i := 1 to length(Str) do 
  begin
    if Str[i] = ' ' then 
    begin
      c := c + 1;
    end 
    else 
    begin
      if c = 1 then 
        Str1 := Str1 + s1;
      if c = 2 then 
        Str1 := Str1 + s2;
      if c >= 3 then 
        Str1 := Str1 + s3;
      c := 0;
      Str1 := Str1 + Str[i];
    end;
   end;
   m2.Text:=str1;
   txt1.Visible:=true;
   txt1.Caption:='В тексте вставить вместо одного пробела запятую и пробел, вместо двух пробелов - двоеточие и пробел, вместо трех и более пробелов тире и пробел.';
   cb1.ItemIndex:=1;
End;

end.
