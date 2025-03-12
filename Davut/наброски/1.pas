var
  inputText, cleanedText: string;
  i: Integer;
  inSpace: Boolean;

begin
  writeln('Введите текст:');
  readln(inputText);
  
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

  // Удаляем пробелы в начале и конце
  if (Length(cleanedText) > 0) and (cleanedText[1] = ' ') then
    Delete(cleanedText, 1, 1);
  
  if (Length(cleanedText) > 0) and (cleanedText[Length(cleanedText)] = ' ') then
    Delete(cleanedText, Length(cleanedText), 1);

  writeln('Текст без лишних пробелов:');
  writeln(cleanedText);
end.