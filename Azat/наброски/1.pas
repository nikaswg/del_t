var
  Str, old: string;
  i, j, D1, D2: integer;

const
  s1: string = 'бвгджзкйлмнпрстфхцчшщъь';

begin
  readln(Str);
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
  
  writeln('Всего слов: ', D1);
  writeln('Всего слов с удвоенной согласной: ', D2);
  
  if D1 > 0 then
    writeln('Процент слов в тексте, содержащих удвоенную согласную: ', D2 / D1 * 100:0:2)
  else
    writeln('Нет слов в тексте.');

  readln;
end.